# $OpenBSD: Makefile,v 1.10 2013/10/31 16:42:08 fgsch Exp $

# .libs/libmecab.so.0.0: undefined reference to `__sync_val_compare_and_swap_4'
# .libs/libmecab.so.0.0: undefined reference to `__sync_add_and_fetch_4'
BROKEN =	needs work on bitrig
BROKEN-arm =	undefined refs to __sync operations
BROKEN-hppa =	undefined refs to __sync operations
BROKEN-mips64 =	undefined refs to __sync operations

COMMENT-main =	japanese morphological analyzer engine
COMMENT-ipadic = IPA japanese dictionary for mecab

DISTNAME =	mecab-0.996
REVISION-main = 1
REVISION-ipadic = 2
PKGNAME-main =	${DISTNAME}
PKGNAME-ipadic = mecab-ipadic-2.7.0

SHARED_LIBS =	mecab	0.0 # 2.0

CATEGORIES =	japanese

HOMEPAGE =	https://code.google.com/p/mecab/

# BSD + IPADIC
PERMIT_PACKAGE_CDROM =	Yes

MULTI_PACKAGES = -main -ipadic

WANTLIB-main =	c m pthread ${MODLIBICONV_WANTLIB}
WANTLIB-main +=	c++ c++abi
WANTLIB-ipadic =

MASTER_SITES =	https://mecab.googlecode.com/files/

DISTFILES =	${DISTNAME}${EXTRACT_SUFX} \
		${PKGNAME-ipadic}-${IPADIC_VER}.tar.gz

MODULES =	converters/libiconv

LIB_DEPENDS-main = ${MODLIBICONV_LIB_DEPENDS}
RUN_DEPENDS-main = mecab-ipadic-*:japanese/mecab,-ipadic
RUN_DEPENDS-ipadic =


CONFIGURE_STYLE = gnu
CONFIGURE_ENV =	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		LIBS="-liconv"

IPADIC_VER =	20070801
IPADIC_FILES =	char.bin dicrc left-id.def matrix.bin pos-id.def \
		rewrite.def right-id.def sys.dic unk.dic

post-build:
	cd ${WRKDIR}/${PKGNAME-ipadic}-${IPADIC_VER} && \
	    ${WRKSRC}/src/mecab-dict-index -t utf-8

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/mecab
	${INSTALL_DATA} ${WRKSRC}/mecabrc ${PREFIX}/share/examples/mecab
	${INSTALL_DATA_DIR} ${PREFIX}/share/mecab/dic/ipadic
	cd ${WRKDIR}/${PKGNAME-ipadic}-${IPADIC_VER} && \
	    ${INSTALL_DATA} ${IPADIC_FILES} ${PREFIX}/share/mecab/dic/ipadic

.include <bsd.port.mk>
