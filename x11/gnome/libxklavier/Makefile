# $OpenBSD: Makefile,v 1.50 2015/03/16 18:07:58 naddy Exp $

COMMENT=		utility library for XKB

GNOME_PROJECT=		libxklavier
GNOME_VERSION=		5.3
REVISION=		1

SHARED_LIBS +=  xklavier             17.0     # .19.0

HOMEPAGE=		http://www.freedesktop.org/wiki/Software/LibXklavier

# LGPLv2
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += X11 Xext Xi ffi glib-2.0 gobject-2.0 gthread-2.0 m
WANTLIB += pcre xcb xkbfile xml2 z pthread

MODULES=		devel/gettext \
			x11/gnome

MODGNOME_TOOLS +=	gobject-introspection
BUILD_DEPENDS=		devel/iso-codes
RUN_DEPENDS=		devel/iso-codes
LIB_DEPENDS=		devel/glib2 \
			textproc/libxml

CONFIGURE_ARGS+=	--with-xkb-base="${X11BASE}/share/X11/xkb/" \
			--with-xkb-bin-base="${X11BASE}/bin/" \
			--with-xmodmap-base="/usr/share/xmodmap"
MODGNOME_CPPFLAGS=	-I${X11BASE}/include
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/build-aux

.include <bsd.port.mk>
