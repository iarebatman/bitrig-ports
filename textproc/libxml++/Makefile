# $OpenBSD: Makefile,v 1.28 2015/03/15 10:14:19 jasper Exp $

BROKEN= 	needs work on bitrig

COMMENT=	C++ wrapper for the libxml XML parser library

GNOME_VERSION=	2.38.0
GNOME_PROJECT=	libxml++
SHARED_LIBS+=	xml++-2.6	1.2 # .2.7
CATEGORIES=	textproc

HOMEPAGE=	http://libxmlplusplus.sourceforge.net/

# LGPLv2.1+
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += ffi glib-2.0 glibmm-2.4 gmodule-2.0 gobject-2.0 lzma m pcre
WANTLIB += pthread sigc-2.0 xml2 z
WANTLIB += c++ c++abi

MODULES=	devel/gettext \
		x11/gnome

LIB_DEPENDS=	devel/glib2mm \
		textproc/libxml

CONFIGURE_STYLE=gnu

FAKE_FLAGS=	docdir="${PREFIX}/share/doc/libxml++-2.6"

.include <bsd.port.mk>
