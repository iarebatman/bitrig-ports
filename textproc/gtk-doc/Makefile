# $OpenBSD: Makefile,v 1.45 2014/07/18 09:26:52 ajacoutot Exp $

COMMENT=		GTK C code documentation system

GNOME_VERSION=		1.21
GNOME_PROJECT=		gtk-doc
REVISION=		0

CATEGORIES= 	   	textproc devel

HOMEPAGE=		http://www.gtk.org/gtk-doc/

# GPLv3 - GFDLv1.1
PERMIT_PACKAGE_CDROM=	Yes

MODULES=		x11/gnome \
			lang/python

MODPY_RUNDEP=		No
MODGNOME_TOOLS=		docbook yelp

CONFIGURE_STYLE=	gnu
MODGNU_CONFIG_GUESS_DIRS =	${WRKSRC}/build-aux
CONFIGURE_ARGS=		--with-highlight=source-highlight
CONFIGURE_ENV=		ac_cv_path_DBLATEX= \
			ac_cv_path_FOP=

# only files under tests/ are compiled but not installed
PKG_ARCH=		*

# glib2 needed to build regression tests
BUILD_DEPENDS=		devel/glib2 \
			textproc/openjade \
			textproc/source-highlight

RUN_DEPENDS=		textproc/docbook-xsl \
			textproc/openjade \
			textproc/source-highlight

.include <bsd.port.mk>
