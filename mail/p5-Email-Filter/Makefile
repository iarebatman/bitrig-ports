# $OpenBSD: Makefile,v 1.6 2014/09/03 12:51:49 benoit Exp $

COMMENT = 	library for creating easy email filters

DISTNAME =	Email-Filter-1.034
CATEGORIES =	mail

HOMEPAGE =	http://emailproject.perl.org/

# Perl
PERMIT_PACKAGE_CDROM =	Yes

MODULES =	cpan
CPAN_AUTHOR =	RJBS

RUN_DEPENDS =	devel/p5-Class-Trigger>=0.08 \
		mail/p5-Email-LocalDelivery>=0.07 \
		mail/p5-Email-Simple>=1.91 \
		devel/p5-IPC-Run>=0.77

BUILD_DEPENDS =	${RUN_DEPENDS}

MAKE_ENV =	TEST_POD=Yes

.include <bsd.port.mk>
