# $OpenBSD: Makefile,v 1.17 2014/11/22 20:59:42 kili Exp $

COMMENT =		fast combinator parsing for bytestrings

# Dependency of meta/haskell-platform.
# Please do *not* update without thinking.
DISTNAME =		attoparsec-0.10.4.0
REVISION =		0
CATEGORIES =		textproc

# BSD3
PERMIT_PACKAGE_CDROM =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

RUN_DEPENDS =		devel/hs-text>=0.11.1.5
BUILD_DEPENDS =		${RUN_DEPENDS}

# When built with --enable-tests, haddock fails.
NO_TEST =		Yes

.include <bsd.port.mk>
