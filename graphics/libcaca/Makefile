# $OpenBSD: Makefile,v 1.28 2014/01/15 22:57:44 bcallah Exp $

COMMENT=		color ascii art library

DISTNAME=		libcaca-0.99.beta18
PKGNAME=		libcaca-0.99.18
REVISION=		1
SHARED_LIBS +=  caca           1.1               # .0.99
CATEGORIES=		graphics

HOMEPAGE=		http://caca.zoy.org/wiki/libcaca

# LGPLv2.1/Do What The Fuck You Want To Public License
PERMIT_PACKAGE_CDROM=   Yes

WANTLIB=		c ncursesw m z

MASTER_SITES=		http://caca.zoy.org/files/libcaca/ \
			http://distfiles.nl/

FLAVORS=		no_x11
FLAVOR?=

.if ${FLAVOR:Mno_x11}
CONFIGURE_ARGS+=	--disable-x11 \
			--disable-imlib2
.else
LIB_DEPENDS =    	graphics/imlib2
WANTLIB +=		X11 Xext freetype xcb Imlib2>=1
.endif

CONFIGURE_STYLE= 	gnu
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/.auto
CONFIGURE_ARGS+=	--disable-doc \
			--disable-slang \
			--disable-ruby \
			--disable-java \
			--disable-csharp \
			--disable-cxx \
			--disable-zzuf \
			--disable-cppunit

# Tests are bogus: assume gmake, assume Windows.
NO_TEST =		Yes

.include <bsd.port.mk>
