# $OpenBSD: Makefile,v 1.19 2015/01/22 17:47:51 naddy Exp $

COMMENT=	OTP and S/Key calculator for X

DISTNAME=	otpCalc-0.97
REVISION=	8
CATEGORIES=    	security

HOMEPAGE=	http://www.killa.net/infosec/otpCalc/

# GPL
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	${HOMEPAGE}

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 c cairo crypto expat
WANTLIB += fontconfig freetype gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gobject-2.0 gdk_pixbuf-2.0 gdk-x11-2.0 gtk-x11-2.0
WANTLIB += gthread-2.0 m pango-1.0 pangocairo-1.0 pangoft2-1.0
WANTLIB += pixman-1 png pthread pthread-stubs xcb xcb-render
WANTLIB += z GL xcb-shm

CONFIGURE_STYLE=gnu dest

MODULES=	devel/gettext

USE_GMAKE=	Yes
ALL_TARGET=	otpCalc otpCalc.1

LIB_DEPENDS=	x11/gtk+2

NO_TEST=	Yes

.include <bsd.port.mk>
