# $OpenBSD: Makefile,v 1.19 2014/10/28 20:00:32 gonzalo Exp $

COMMENT=	extends the Net::DNS module with DNSSEC functionality

MODULES=	cpan
DISTNAME=	Net-DNS-SEC-0.20
CATEGORIES=	net security

HOMEPAGE=	http://www.net-dns.org/

# BSD-license
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES =	http://www.net-dns.org/download/

RUN_DEPENDS=	mail/p5-MIME-Base32 \
		net/p5-Net-DNS>=0.69 \
		security/p5-Digest-BubbleBabble>=0.01 \
		security/p5-Crypt-OpenSSL-RSA>=0.19 \
		security/p5-Crypt-OpenSSL-DSA>=0.10 \
		security/p5-Crypt-OpenSSL-Bignum>=0.03 \
		security/p5-Digest-SHA1

MAKE_ENV+=		TEST_POD=1

MODCPAN_EXAMPLES=	Yes
MODCPAN_EXAMPLES_DIST=	demo

.include <bsd.port.mk>
