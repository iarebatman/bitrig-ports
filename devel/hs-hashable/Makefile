# $OpenBSD: Makefile,v 1.9 2014/11/22 20:46:49 kili Exp $

COMMENT =		class for hashable data types

# Dependency of meta/haskell-platform.
# Please do *not* update without thinking.
DISTNAME =		hashable-1.2.2.0
CATEGORIES =		devel

# BSD3
PERMIT_PACKAGE_CDROM =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

RUN_DEPENDS =		devel/hs-text>=0.11.0.5
BUILD_DEPENDS =		${RUN_DEPENDS}

# Missing dependencies
NO_TEST =		Yes

.include <bsd.port.mk>
