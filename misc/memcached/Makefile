# $OpenBSD: Makefile,v 1.28 2015/02/19 08:01:59 giovanni Exp $

COMMENT=	distributed memory object caching system

DISTNAME=	memcached-1.4.21
REVISION=	1
CATEGORIES=	misc

HOMEPAGE=	http://www.memcached.org/

# BSD
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += c event pthread

FLAVOR?=
FLAVORS=	sasl

MASTER_SITES=		http://memcached.org/files/

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=		--with-libevent=/usr \
			--disable-coverage \
			--disable-docs
TEST_TARGET=		test
TEST_DEPENDS=		devel/p5-Test-MockSleep

.if ${FLAVOR:Msasl}
CONFIGURE_ARGS+=	--enable-sasl
LIB_DEPENDS=		security/cyrus-sasl2
WANTLIB+=		sasl2
.else
CONFIGURE_ARGS+=	--disable-sasl
.endif

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/memcached
	${INSTALL_DATA} ${WRKSRC}/doc/*.txt ${PREFIX}/share/doc/memcached

.include <bsd.port.mk>
