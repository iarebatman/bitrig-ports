# $OpenBSD: Makefile,v 1.5 2015/03/21 13:54:17 ajacoutot Exp $

COMMENT=	LaTeX documents output generation automation tool

DISTNAME=	latexmk-443a
EXTRACT_SUFX=	.zip
REVISION=	0

CATEGORIES=	textproc print

HOMEPAGE=	http://www.phys.psu.edu/~collins/software/latexmk-jcc/

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	${HOMEPAGE}

RUN_DEPENDS=	print/texlive/base

WRKDIST=	${WRKDIR}/latexmk
NO_BUILD=	Yes
NO_TEST=	Yes
PKG_ARCH=	*

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/latexmk.pl ${PREFIX}/bin/latexmk
	${INSTALL_MAN} ${WRKSRC}/latexmk.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
