# $OpenBSD: Makefile,v 1.24 2015/03/19 20:25:26 naddy Exp $

COMMENT-main=	high dynamic range image format
COMMENT-tools=	image viewing tools for OpenEXR
COMMENT-doc=	developer documentation for OpenEXR

V=		1.6.1
DISTNAME=	openexr-$V
PKGNAME-main=	OpenEXR-$V
REVISION-main = 5
PKGNAME-tools=  OpenEXR-tools-$V
REVISION-tools= 4
PKGNAME-doc=	OpenEXR-doc-$V
REVISION-doc =	0
SHARED_LIBS=	IlmImf               4.0      # .6.0	
CATEGORIES=	graphics

HOMEPAGE=	http://www.openexr.com/

# Modified BSD license
# `name of ILM not to be used for advertizing without written agreement'
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=		${MASTER_SITE_SAVANNAH:=openexr/}

MULTI_PACKAGES= 	-main -tools -doc

WANTLIB-main=		m z Half Iex Imath IlmThread pthread
WANTLIB-main +=		c++ c++abi
LIB_DEPENDS-main=	graphics/ilmbase

WANTLIB-tools=		${WANTLIB-main} c IlmImf>=4
LIB_DEPENDS-tools=	${LIB_DEPENDS-main} graphics/openexr
PKG_ARCH-doc=		*

# Test unhappy with separate build
#SEPARATE_BUILD=	Yes

CONFIGURE_STYLE=	gnu
USE_GMAKE=		Yes

DOCDIR= 		${PREFIX}/share/doc/OpenEXR
FAKE_FLAGS+=		docdir=${DOCDIR}

post-install:
	${INSTALL_DATA} ${WRKSRC}/doc/*.pdf ${DOCDIR}

.include <bsd.port.mk>
