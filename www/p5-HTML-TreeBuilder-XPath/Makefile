# $OpenBSD: Makefile,v 1.9 2015/01/21 14:43:33 sthen Exp $

COMMENT =	add XPath support to HTML::TreeBuilder

MODULES =	cpan
DISTNAME =	HTML-TreeBuilder-XPath-0.14
CATEGORIES =	www

REVISION =	0

# Perl
PERMIT_PACKAGE_CDROM =	Yes

RUN_DEPENDS =	textproc/p5-XML-XPathEngine>=0.12 \
		www/p5-HTML-Tree

MAKE_ENV +=	TEST_POD=1

.include <bsd.port.mk>
