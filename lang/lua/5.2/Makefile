# $OpenBSD: Makefile,v 1.6 2014/12/10 00:44:53 sthen Exp $

VERSION=	5.2.4
PKGSPEC=	lua->=5.2,<5.3

SHARED_LIBS=	lua5.2 ${VERSION:R}

LIB_DEPENDS=	devel/readline

WANTLIB=	c m edit curses readline

SUBST_VARS+=	VERSION

CFLAGS+=	-I${LOCALBASE}/include
MAKE_FLAGS+=	LIBlua5.2_VERSION="${LIBlua5.2_VERSION}"

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/pkgconfig
	${SUBST_DATA} -c ${FILESDIR}/lua52.pc \
		${PREFIX}/lib/pkgconfig/lua52.pc


.include <bsd.port.mk>
