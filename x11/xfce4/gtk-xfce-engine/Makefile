# $OpenBSD: Makefile,v 1.42 2015/03/16 20:25:58 landry Exp $

COMMENT=	Xfce4 theme engine for Gtk+2

XFCE_PROJECT=	gtk-xfce-engine

XFCE_VERSION=	3.2.0
HOMEPAGE=	http://www.xfce.org/projects/

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes

MODULES=	x11/xfce4
MODXFCE_PURGE_LA =	lib/gtk-2.0/2.10.0/engines

LIB_DEPENDS =	x11/gtk+2

WANTLIB=	X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes GL Xxf86vm drm xcb-shm \
		Xi Xinerama Xrandr Xrender atk-1.0 cairo expat fontconfig \
		freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 m pango-1.0 \
		pangocairo-1.0 pangoft2-1.0 pcre pixman-1 png z pthread-stubs pthread xcb \
		gdk_pixbuf-2.0 gthread-2.0 xcb-render ffi harfbuzz gdk-x11-2.0 gtk-x11-2.0
WANTLIB +=	c++ c++abi


.include <bsd.port.mk>
