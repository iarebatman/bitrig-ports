# $OpenBSD: Makefile,v 1.23 2014/11/24 16:07:58 kili Exp $

COMMENT =		parser and writer for config files

DISTNAME =		ConfigFile-1.1.4
REVISION =		0
CATEGORIES =		devel sysutils
HOMEPAGE =		https://github.com/jgoerzen/configfile/wiki

# BSD3
PERMIT_PACKAGE_CDROM =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

RUN_DEPENDS +=		devel/hs-MissingH>=1.0.0 \
			devel/hs-mtl
BUILD_DEPENDS +=	${RUN_DEPENDS}

.include <bsd.port.mk>
