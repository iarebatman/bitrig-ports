# $OpenBSD: Makefile,v 1.5 2013/03/11 11:41:28 espie Exp $

COMMENT =		retrieves syskey and extract hashes

DISTNAME =		samdump2-3.0.0
REVISION =		0
CATEGORIES =		security

HOMEPAGE =		http://ophcrack.sourceforge.net/

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB =		c ssl crypto

MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=ophcrack/}

EXTRACT_SUFX =		.tar.bz2

MAKE_FLAGS =		CC="${CC}" CFLAGS="${CFLAGS}"

USE_GMAKE =		Yes

NO_TEST =		Yes

pre-configure:
	${SUBST_CMD} ${WRKSRC}/Makefile
                
do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/samdump2 ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/samdump2.1     ${PREFIX}/man/man1
                
.include <bsd.port.mk>
