# $OpenBSD: Makefile,v 1.29 2015/03/16 18:07:47 naddy Exp $

COMMENT=		high-performance 2D graphics library

GNOME_PROJECT=		libart_lgpl
GNOME_VERSION=		2.3.21
PKGNAME=		libart-${VERSION}
REVISION=		1

SHARED_LIBS +=	art_lgpl_2           5.20     # .5.20

CATEGORIES=		graphics

HOMEPAGE=		http://www.levien.com/libart/

# LGPL
PERMIT_PACKAGE_CDROM=	Yes

EXTRACT_SUFX=		.tar.bz2

WANTLIB=		m

MODULES=		x11/gnome

CONFIGURE_STYLE= 	gnu

.include <bsd.port.mk>
