# $OpenBSD: Makefile,v 1.8 2015/01/20 22:31:35 jturner Exp $

COMMENT =		two-factor authentication for unix systems

V =			1.9.14
PKGNAME =		login_duo-${V}
DISTNAME =		duo_unix-${V}
REVISION =		0
CATEGORIES =		sysutils

SHARED_LIBS =		duo 0.0 # 3.0

HOMEPAGE =		https://www.duosecurity.com/docs/duounix
MASTER_SITES =		https://dl.duosecurity.com/

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes

MODULES =		lang/python

WANTLIB =		c crypto ssl

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS =	--without-pam

FAKE_FLAGS =		docdir="${PREFIX}/share/doc/login_duo" \
			includedir="${PREFIX}/include/duo" \
			sbindir="${PREFIX}/sbin" \
			sysconfdir="${PREFIX}/share/examples/login_duo"

# login_duo needs to be set up and running for tests to pass
TEST_IS_INTERACTIVE =	Yes

TEST_DEPENDS =		${MODPY_RUN_DEPENDS}

pre-configure:
	${SUBST_CMD} ${WRKSRC}/login_duo/login_duo.8
	perl -pi -e 's,/usr/bin/env python,${MODPY_BIN},' ${WRKSRC}/tests/*.py

.include <bsd.port.mk>
