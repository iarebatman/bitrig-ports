# $OpenBSD: Makefile,v 1.63 2015/01/19 07:14:29 afresh1 Exp $

SHARED_ONLY =	Yes

COMMENT =	unified perl interface for database access

MODULES =	cpan
DISTNAME =	DBI-1.633
CATEGORIES =	databases

HOMEPAGE =	http://dbi.perl.org/

# Perl
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += c

RUN_DEPENDS =	net/p5-PlRPC>=0.2017 \
		databases/p5-SQL-Statement>=1.400 \
		devel/p5-MLDBM

TEST_DEPENDS =	devel/p5-Test-Pod>=1.00

.include <bsd.port.mk>
