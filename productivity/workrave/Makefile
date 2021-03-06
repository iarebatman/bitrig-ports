# $OpenBSD: Makefile,v 1.37 2013/09/27 17:49:09 ajacoutot Exp $

COMMENT=		reminder program for prevention of RSI

DISTNAME=		workrave-1.9.4
REVISION=		9
CATEGORIES=		productivity x11

HOMEPAGE=		http://www.workrave.org/

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += ICE SM X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi
WANTLIB += Xinerama Xrandr Xrender Xtst atk-1.0 atkmm-1.6 c cairo
WANTLIB += cairomm-1.0 dbus-1 dbus-glib-1 expat ffi fontconfig
WANTLIB += freetype gconf-2 gdk-x11-2.0 gdk_pixbuf-2.0 gdkmm-2.4
WANTLIB += gio-2.0 giomm-2.4 glib-2.0 glibmm-2.4 gmodule-2.0 gobject-2.0
WANTLIB += graphite2 gstreamer-0.10 gthread-2.0 gtk-x11-2.0 gtkmm-2.4
WANTLIB += harfbuzz m pango-1.0 pangocairo-1.0 pangoft2-1.0 pangomm-1.4
WANTLIB += pcre pixman-1 png pthread pthread-stubs sigc-2.0
WANTLIB += xcb xcb-render xcb-shm xml2 z
WANTLIB += c++ c++abi

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=workrave/}

BUILD_DEPENDS=		devel/py-cheetah
RUN_DEPENDS=		devel/desktop-file-utils \
			x11/gtk+2,-guic
LIB_DEPENDS=		devel/gconf2 \
			multimedia/gstreamer-0.10/core \
			x11/dbus-glib \
			x11/gtk2mm>=2.24.4

MODULES=		devel/gettext \
			lang/python \
			textproc/intltool

USE_GMAKE=		Yes

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-xml \
			--disable-pulse \
			--enable-dbus

# XXX: Disabled for now as workrave isn't ported to libpanel-applet-4.0 yet
CONFIGURE_ARGS+=	--disable-gnome
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include -I${X11BASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib"

pre-configure:
	${SUBST_CMD} ${WRKSRC}/frontend/gtkmm/src/Makefile.in \
		${WRKSRC}/frontend/gtkmm/src/gnome_applet/Makefile.in

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/workrave/sound/events
	${INSTALL_DATA} ${WRKSRC}/frontend/common/share/sounds/workrave.soundlist \
		${PREFIX}/share/examples/workrave/sound/events

.include <bsd.port.mk>
