# $OpenBSD: Makefile,v 1.27 2015/03/16 18:07:36 naddy Exp $

COMMENT=	library to handle various audio file formats

DISTNAME=	libsndfile-1.0.25
REVISION=	2
CATEGORIES=	audio
HOMEPAGE=	http://www.mega-nerd.com/libsndfile/
SHARED_LIBS +=	sndfile              3.3      # .1.25

# LGPLv2.1
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	${HOMEPAGE}files/

WANTLIB=	c m sndio FLAC ogg vorbis vorbisenc

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	${CONFIGURE_SHARED} \
		--disable-alsa \
		--disable-octave \
		--disable-sqlite
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/Cfg

LIB_DEPENDS=	audio/flac \
		audio/libogg \
		audio/libvorbis

FAKE_FLAGS=	htmldocdir=${PREFIX}/share/doc/libsndfile

.include <bsd.port.mk>
