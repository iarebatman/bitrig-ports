# $OpenBSD: Makefile,v 1.26 2013/10/11 21:21:07 naddy Exp $

COMMENT=	simple logout button

DISTNAME=	xlogout-1.1
REVISION=	4
CATEGORIES=	x11

# BSD-like, badly worded
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB=	ICE SM X11 Xau Xaw Xdmcp Xext Xmu Xpm Xt c 

MASTER_SITES=	ftp://ftp.tu-darmstadt.de/pub/X11/other/
EXTRACT_SUFX=	.tar.Z

WRKDIST=	${WRKDIR}/xlogout
CONFIGURE_STYLE= imake

NO_TEST=	Yes

.include <bsd.port.mk>
