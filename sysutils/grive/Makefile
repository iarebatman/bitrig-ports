# $OpenBSD: Makefile,v 1.2 2015/03/16 21:40:57 landry Exp $

BROKEN = 	needs work on bitrig

BROKEN-hppa =	no atomic ops
COMMENT =	third-party client for Google Drive

VERSION =	0.3.1-pre
DISTNAME =	grive-${VERSION}
PKGNAME =	grive-${VERSION:S/-pre//}

CATEGORIES =	sysutils

HOMEPAGE =	http://www.lbreda.com/grive

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += boost_filesystem-mt boost_program_options-mt boost_system-mt
WANTLIB += boost_unit_test_framework-mt c curl expat gcrypt gpg-error
WANTLIB += iberty json-c m pthread yajl z

GH_ACCOUNT =	linwiz
GH_PROJECT =	grive
GH_COMMIT =	ba8766416ed4d4fc957d0a62c168763c4bc5bac8

MODULES =	devel/cmake \
		gcc4

MODGCC4_LANGS =	c++
MODGCC4_ARCHS =	*

LIB_DEPENDS =	devel/boost \
		devel/json-c \
		devel/libyajl \
		net/curl \
		security/libgcrypt

CXXFLAGS += -I${LOCALBASE}/include

.include <bsd.port.mk>
