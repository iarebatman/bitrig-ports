# $OpenBSD: Makefile,v 1.9 2014/11/17 14:54:57 sthen Exp $

BROKEN =	needs work on bitrig

COMMENT =	coroutines for perl

SHARED_ONLY =	Yes
MODULES =	cpan
DISTNAME =	Coro-6.41
CATEGORIES =	devel

# perl
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += c

BUILD_DEPENDS = ${RUN_DEPENDS}
RUN_DEPENDS = 	devel/p5-Event>=0.89 \
		devel/p5-AnyEvent>=5.00 \
		devel/p5-EV>=3.3 \
		devel/p5-common-sense \
		devel/p5-Guard>=0.5

# will use hand-made assembler on i386/amd64
# can force it to use sjlj like on other platforms, to
# check things work.

# CONFIGURE_ENV = CORO_INTERFACE=s

.include <bsd.port.mk>
