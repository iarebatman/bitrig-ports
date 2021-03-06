# $OpenBSD: Makefile,v 1.48 2015/03/16 18:07:38 naddy Exp $

COMMENT=	character set conversion library

DISTNAME=	libiconv-1.14
REVISION=	3
CATEGORIES=	converters devel
MASTER_SITES=	${MASTER_SITE_GNU:=libiconv/}

SHARED_LIBS=	charset		1.1 \
		iconv		6.0

HOMEPAGE=	https://www.gnu.org/software/libiconv/

# LGPLv2 and GPLv3
PERMIT_PACKAGE_CDROM=	Yes
WANTLIB=	c

BUILD_DEPENDS=	devel/gperf

MAKE_FLAGS=	INSTALL_DATA=cp

SEPARATE_BUILD=	Yes
CONFIGURE_STYLE= gnu
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/build-aux ${WRKSRC}/libcharset/build-aux
CONFIGURE_ARGS= ${CONFIGURE_SHARED} \
		--disable-nls \
		--enable-extra-encodings \
		--enable-static
CONFIGURE_ENV=	am_cv_proto_iconv='extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);' \
		CC='${CC}'

pre-configure:
	@cd ${WRKSRC}; \
		${SETENV} ${CONFIGURE_ENV} ${MAKE} -f Makefile.devel lib/aliases.h

.include <bsd.port.mk>
