# $OpenBSD: Makefile,v 1.16 2014/11/06 17:13:40 sthen Exp $

COMMENT=	web-based MySQL management

V=		1.2
DISTNAME=	chive_$V
PKGNAME=	${DISTNAME:S/_/-/}
REVISION=	3

CATEGORIES=	www databases

HOMEPAGE=	http://www.chive-project.com/

# Chive: GPLv3+
# Yii framework: BSD
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	http://launchpad.net/chive/1.1/$V/+download/

MODULES=	lang/php
RUN_DEPENDS=	lang/php/${MODPHP_VERSION},-pdo_mysql

NO_BUILD=	Yes
NO_TEST=	Yes
PKG_ARCH=	*

PREFIX=		${VARBASE}/www
SUBST_VARS=	INSTDIR
INSTDIR=	${TRUEPREFIX}/chive
WRKDIST=	${WRKDIR}/chive

do-install:
	${INSTALL_DATA_DIR} ${WRKINST}${INSTDIR}
	cd ${WRKSRC} && pax -rw * ${WRKINST}${INSTDIR}
	${SUBST_DATA} \
	    ${FILESDIR}/chive.conf ${WRKINST}${INSTDIR}/chive.conf.default

.include <bsd.port.mk>
