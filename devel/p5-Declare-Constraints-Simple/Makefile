# $OpenBSD: Makefile,v 1.8 2015/01/22 13:13:58 sthen Exp $

COMMENT=	declarative validation of data structures

DISTNAME=	Declare-Constraints-Simple-0.03
REVISION=	1

CATEGORIES=	devel

# perl
PERMIT_PACKAGE_CDROM=	Yes

CPAN_AUTHOR=	PHAYLON

MODULES=	cpan
BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	devel/p5-Carp-Clan \
		devel/p5-Class-Inspector \
		devel/p5-aliased

MAKE_ENV=	TEST_POD=Yes

.include <bsd.port.mk>
