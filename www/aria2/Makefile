# $OpenBSD: Makefile,v 1.31 2015/03/16 14:08:58 gonzalo Exp $

BROKEN-alpha =	MetalinkParserStateV4Impl.cc:219:1: internal compiler error: Segmentation fault
COMMENT =		lightweight multi-protocol & multi-source download utility
DISTNAME =		aria2-1.18.9
CATEGORIES =		www
HOMEPAGE =		http://aria2.sourceforge.net/

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=aria2/}

MODULES =		devel/gettext

LIB_DEPENDS =		net/libcares

BUILD_DEPENDS =		devel/m4 \
			devel/cppunit

TEST_DEPENDS =		${BUILD_DEPENDS}

WANTLIB += c cares crypto expat m sqlite3 ssl z
WANTLIB += c++ c++abi pthread

CONFIGURE_STYLE =	gnu
MODGNU_CONFIG_GUESS_DIRS =	${WRKSRC} \
				${WRKSRC}/deps/wslay
CONFIGURE_ENV =		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"

CONFIGURE_ARGS +=	--with-sqlite3 \
			--with-libz \
			--with-libcares \
			--with-libexpat \
			--with-openssl \
			--without-gnutls \
			--without-libxml2

.include <bsd.port.mk>
