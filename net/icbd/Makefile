# $OpenBSD: Makefile,v 1.3 2015/01/19 12:25:08 pascal Exp $

BROKEN = 		needs work on bitrig

COMMENT =		Internet Citizens Band Server

GH_ACCOUNT =		mbelop
GH_PROJECT =		icbd
GH_TAGNAME =		1.4
DISTNAME =		icbd-${GH_TAGNAME}

CATEGORIES =		net

# ISC
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB =		c event

FAKE_FLAGS =		PREFIX=${TRUEPREFIX}

NO_TEST =		Yes

.include <bsd.port.mk>
