# $OpenBSD: Makefile,v 1.5 2015/01/09 17:15:29 sthen Exp $

COMMENT =	CLI tools to manage music collections

MODPY_EGG_VERSION = 1.3.10
DISTNAME =	beets-${MODPY_EGG_VERSION}
REVISION =	0
CATEGORIES =	audio

HOMEPAGE =	http://beets.radbox.org/

# MIT
PERMIT_PACKAGE_CDROM =  Yes

MASTER_SITES =	${MASTER_SITE_PYPI:=b/beets/}

MODULES =	lang/python
MODPY_SETUPTOOLS = Yes
NO_TEST =	Yes
USE_GROFF =	Yes

RUN_DEPENDS =	audio/py-discogs-client>=2.0.2 \
		audio/py-musicbrainzngs \
		audio/py-last \
		audio/py-mutagen \
		devel/py-algorithm-munkres \
		devel/py-enum34 \
		textproc/py-unidecode \
		textproc/py-yaml \
		www/py-requests

post-install:
	${INSTALL_MAN} ${WRKSRC}/man/beet.1 ${PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/man/beetsconfig.5 ${PREFIX}/man/man5

.include <bsd.port.mk>
