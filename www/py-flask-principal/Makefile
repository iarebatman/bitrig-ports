# $OpenBSD: Makefile,v 1.1.1.1 2014/11/01 20:42:02 abieber Exp $

COMMENT =		identity management for flask

MODPY_EGG_VERSION =	0.4.0
DISTNAME =		Flask-Principal-${MODPY_EGG_VERSION}
PKGNAME =		py-${DISTNAME:L}

CATEGORIES =		www

HOMEPAGE =		http://packages.python.org/Flask-Principal/

# MIT
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =		${MASTER_SITE_PYPI:=F/Flask-Principal/}

MODULES =		lang/python

RUN_DEPENDS +=		www/py-flask

MODPY_SETUPTOOLS =	Yes

.include <bsd.port.mk>
