# $OpenBSD: Makefile,v 1.17 2014/12/07 21:34:37 jeremy Exp $

COMMENT =	kinder, gentler I/O for Ruby

DISTNAME =	kgio-2.9.2
CATEGORIES =	devel

# LGPLv2.1/LGPLv3
PERMIT_PACKAGE_CDROM =	Yes

MODULES =	lang/ruby

CONFIGURE_STYLE =	ruby gem ext

TEST_DEPENDS =	devel/gmake

# Couple failing regress tests
do-test:
	@cd ${WRKSRC} && gmake -k test RUBY=${RUBY}

.include <bsd.port.mk>
