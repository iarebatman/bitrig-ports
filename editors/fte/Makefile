# $OpenBSD: Makefile,v 1.6 2013/03/11 11:02:49 espie Exp $

COMMENT=	powerful and intuitive editor for programmers

DISTNAME=	fte-20090118
CATEGORIES=	editors devel
REVISION=	1

HOMEPAGE=	http://fte.sourceforge.net/

# GPLv2 or later / Artistic License
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB+=	X11 Xau Xdmcp Xpm c m
WANTLIB+=	c++ c++abi pthread

MASTER_SITES=	ftp://ftp.mrsserver.net/pub/distfiles/

NO_TEST=	Yes

MAKE_ENV+=	CC="${CC}" CXX="${CXX}"

post-install:
		${INSTALL_DATA_DIR} ${PREFIX}/share/doc/fte
		${INSTALL_DATA} ${WRKSRC}/doc/*.html ${PREFIX}/share/doc/fte/

.include <bsd.port.mk>
