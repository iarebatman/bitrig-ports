# $OpenBSD: Makefile,v 1.16 2015/02/16 22:57:13 naddy Exp $

BROKEN= 		needs work on bitrig

COMMENT=		forensic toolkit based on TCT

DISTNAME=		sleuthkit-3.0.1
REVISION =		2
CATEGORIES=		sysutils security

SHARED_LIBS=		tsk3 4.3

HOMEPAGE=		http://www.sleuthkit.org/

# CPLv1 & IBM & GPLv2
PERMIT_PACKAGE_CDROM=	commercial contributor must indemnify all others
PERMIT_PACKAGE_FTP=	Yes

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=sleuthkit/}

WANTLIB=		c m
WANTLIB +=		c++ c++abi pthread

CONFIGURE_STYLE=        simple

RUN_DEPENDS=		converters/p5-DateManip

NO_TEST=		Yes

pre-configure:
	@perl -pi -e "s:%%PREFIX%%:${PREFIX}:" ${WRKSRC}/man/sorter.1

.include <bsd.port.mk>
