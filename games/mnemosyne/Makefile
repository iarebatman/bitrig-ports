# $OpenBSD: Makefile,v 1.27 2015/03/14 21:05:39 bcallah Exp $

SHARED_ONLY=	Yes

COMMENT=	flash-card tool which optimises your learning process

MODPY_EGG_VERSION=2.3.2
DISTNAME=	Mnemosyne-${MODPY_EGG_VERSION}
PKGNAME=	${DISTNAME:L}
CATEGORIES=	games education

HOMEPAGE=	http://www.mnemosyne-proj.org/

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=mnemosyne-proj/}

MODULES=	lang/python

MODPY_SETUPTOOLS=yes

RUN_DEPENDS=	x11/py-qt4 \
		textproc/py-xml \
		graphics/py-Pillow \
		graphics/py-matplotlib \
		www/py-CherryPy \
		www/py-webob>=1.3.1 \
		devel/desktop-file-utils

NO_TEST=	Yes

MODPY_ADJ_FILES=	mnemosyne/pyqt_ui/mnemosyne

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/applications
	${INSTALL_DATA_DIR} ${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${WRKSRC}/mnemosyne.desktop \
		${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/pixmaps/mnemosyne.png \
		${PREFIX}/share/pixmaps

.include <bsd.port.mk>
