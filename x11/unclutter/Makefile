# $OpenBSD: Makefile,v 1.16 2013/10/11 21:21:01 naddy Exp $

COMMENT=	hides idle X11 cursor

DISTNAME=	unclutter-8
REVISION=	2
CATEGORIES=	x11

MASTER_SITES=	${MASTER_SITE_XCONTRIB:=utilities/}
EXTRACT_SUFX=	.tar.Z

# Public Domain
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB=	X11 Xau Xdmcp Xext c


WRKDIST=	${WRKDIR}/unclutter
CONFIGURE_STYLE=imake

NO_TEST=	Yes

.include <bsd.port.mk>
