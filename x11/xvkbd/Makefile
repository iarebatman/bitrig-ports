# $OpenBSD: Makefile,v 1.17 2015/02/16 22:57:14 naddy Exp $

COMMENT=		virtual keyboard for X Window System

DISTNAME=		xvkbd-3.3
REVISION=		0
CATEGORIES=		x11
HOMEPAGE=		http://homepage3.nifty.com/tsato/xvkbd/

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += ICE SM X11 Xau Xaw3d Xdmcp Xext Xmu Xpm Xt Xtst c

MASTER_SITES=		${HOMEPAGE}

LIB_DEPENDS=		x11/Xaw3d

CONFIGURE_STYLE=	imake
NO_TEST=		Yes

.include <bsd.port.mk>
