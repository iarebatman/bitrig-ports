# $OpenBSD: Makefile,v 1.3 2015/03/15 10:58:15 kili Exp $

COMMENT =		creates DjVu files from PDF files

DISTNAME =		pdf2djvu-0.7.19

CATEGORIES =		graphics

HOMEPAGE =		http://jwilk.net/software/pdf2djvu

# GPLv2+
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += GraphicsMagick GraphicsMagick++ c djvulibre m poppler
WANTLIB += pthread xml2 xslt z
WANTLIB += c++ c++abi

MASTER_SITES =		https://bitbucket.org/jwilk/pdf2djvu/downloads/

EXTRACT_SUFX =		.tar.xz

# https://code.google.com/p/pdf2djvu/wiki/BuildDepends
MODULES =		devel/gettext
LIB_DEPENDS =		graphics/GraphicsMagick \
			textproc/libxslt \
			print/poppler \
			graphics/djvulibre
TEST_DEPENDS =		devel/py-nose

# Weird things like "API specificationu[3]d for details"
USE_GROFF =		Yes

USE_GMAKE =		Yes
CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS +=	--disable-openmp \
			--disable-rpath
CONFIGURE_ENV =		LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib" \
			CPPFLAGS="-I${LOCALBASE}/include -I${X11BASE}/include"

TEST_TARGET = test

WRKDIST =		${WRKDIR}/${PKGNAME}

.include <bsd.port.mk>
