# $OpenBSD: Makefile,v 1.14 2014/11/10 13:12:59 benoit Exp $

BROKEN =	needs work on bitrig

COMMENT =	simple interface to subversion's editor interface#'

DISTNAME =	SVN-Simple-0.28
CATEGORIES =	devel

CPAN_AUTHOR =	CLKAO
MODULES =	cpan

# Perl
PERMIT_PACKAGE_CDROM =	Yes

RUN_DEPENDS =	devel/subversion,-perl>=1.1.1
BUILD_DEPENDS =	${RUN_DEPENDS}

.include <bsd.port.mk>
