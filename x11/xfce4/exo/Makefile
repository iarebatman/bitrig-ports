# $OpenBSD: Makefile,v 1.48 2015/03/17 08:10:14 landry Exp $

COMMENT=	Xfce4 extension library

XFCE_VERSION=	0.10.4
XFCE_PROJECT=	exo

SHARED_LIBS=	exo-1		0.2

HOMEPAGE=	http://www.xfce.org/projects

# GPLv2/LGPLv2
PERMIT_PACKAGE_CDROM=	Yes

MODULES=	x11/xfce4
MODXFCE_DESKTOP_FILE=	Yes
MODXFCE_ICON_CACHE=	Yes

CONFIGURE_ENV=	ac_cv_header_sys_ucred_h=yes \
		ac_cv_header_sys_mount_h=yes

BUILD_DEPENDS=	www/p5-URI
# used by helper exo-compose-mail-1
RUN_DEPENDS=	www/p5-URI
LIB_DEPENDS=	x11/xfce4/libxfce4ui>=4.10.0 \
		x11/xfce4/libxfce4util>=4.10.0

FAKE_FLAGS=	defaultsdir=${PREFIX}/share/examples/exo

WANTLIB=	ICE SM X11 Xcomposite Xcursor Xdamage Xext \
		Xfixes Xi Xinerama Xrandr Xrender atk-1.0 c cairo expat \
		fontconfig freetype gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glib-2.0 \
		gmodule-2.0 gobject-2.0 gthread-2.0 gtk-x11-2.0 xcb-util xfce4ui-1\
		m pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre pixman-1 \
		png pthread z pthread-stubs xcb X11-xcb startup-notification-1 \
		xcb-render xfce4util xcb-shm ffi harfbuzz graphite2
WANTLIB +=	c++ c++abi

.include <bsd.port.mk>
