# $OpenBSD: Makefile,v 1.20 2014/11/25 22:11:04 kili Exp $

COMMENT =	Haskell cryptographic library
CATEGORIES =	security

V =		4.2.5.1
DISTNAME =	Crypto-$V
REVISION =	0
# Historically named with a lower case `c'.
PKGNAME =	hs-crypto-$V

# 3 different licenses from 3 authors: BSD, GPL, BSD-ish
PERMIT_PACKAGE_CDROM =	Yes

MODULES =		lang/ghc
MODGHC_BUILD =		cabal hackage haddock register
RUN_DEPENDS =		devel/hs-HUnit \
			devel/hs-QuickCheck>=2.4.0.1 \
			devel/hs-random
BUILD_DEPENDS =		${RUN_DEPENDS}

do-test:
.for t in HMACTest QuickTest RSATest SHA1Test SymmetricTest WordListTest
	cd ${WRKBUILD} && ./dist/build/$t/$t
.endfor

.include <bsd.port.mk>
