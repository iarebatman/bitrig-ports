# $OpenBSD: Makefile,v 1.17 2013/10/26 23:55:37 jeremy Exp $

COMMENT=	Ruby library to create XML markup and data structures

DISTNAME=	builder-3.0.0
REVISION =	2
CATEGORIES=	textproc

# MIT
PERMIT_PACKAGE_CDROM=	Yes

MODULES=	lang/ruby

CONFIGURE_STYLE=ruby gem

MODRUBY_TEST=	rake
MODRUBY_TEST_TARGET=	-I lib test_all

pre-test:
	rm ${WRKSRC}/test/test_cssbuilder.rb

.include <bsd.port.mk>
