# $OpenBSD: Makefile,v 1.111 2015/02/17 01:28:52 brad Exp $

COMMENT=	audio/video converter and streamer

V=		20150412
DISTNAME=	ffmpeg-git-${V}
PKGNAME=	ffmpeg-${V}
REVISION=	0
CATEGORIES=	graphics multimedia
MASTER_SITES=	http://comstyle.com/source/
EXTRACT_SUFX=	.tar.xz

SHARED_LIBS=	avcodec		21.1 \
		avdevice	9.0 \
		avfilter	7.0 \
		avformat	19.1 \
		avresample	1.0 \
		avutil		12.1 \
		postproc	16.0 \
		swresample	1.1 \
		swscale		6.0

HOMEPAGE=	http://ffmpeg.org/

# LGPLv2.1 and GPLv2
PERMIT_PACKAGE_CDROM=	patents
PERMIT_PACKAGE_FTP=	Yes

WANTLIB=	SDL X11 Xext Xfixes Xv bz2 c crypto gsm m mp3lame opus pthread \
		schroedinger-1.0 sndio speex ssl theoradec theoraenc vorbis \
		vorbisenc vpx>=5 x264 xvidcore z

BUILD_DEPENDS=	textproc/texi2html
.if ${MACHINE_ARCH} == "amd64"
BUILD_DEPENDS+=	devel/yasm
.endif

LIB_DEPENDS=	archivers/bzip2 \
		audio/lame \
		audio/libvorbis \
		audio/opus \
		audio/speex \
		audio/gsm \
		devel/sdl \
		multimedia/libtheora \
		multimedia/libvpx>=1.3.0 \
		multimedia/schroedinger \
		multimedia/x264 \
		multimedia/xvidcore

# inter-library dependencies for the current configuration
LIBavdevice_EXTRALIBS=-L${X11BASE}/lib -lX11 -lXext -lXfixes -lXv -lsndio
LIBavfilter_EXTRALIBS=
LIBavformat_EXTRALIBS=-L${LOCALBASE}/lib -lbz2 -lssl -lcrypto -pthread
LIBavresample_EXTRALIBS=
LIBavutil_EXTRALIBS=-lm -pthread
LIBpostproc_EXTRALIBS=
LIBswresample_EXTRALIBS=-lm
LIBswscale_EXTRALIBS=-lm

# configure wants a directory it can execute files in 
WRKTMP=		${WRKDIR}/tmp

FFMPEG_ARCH=	${MACHINE_ARCH}

# x265 only builds on archs with working builtin 32-bit atomics
.if ${MACHINE_ARCH} == "alpha" || ${MACHINE_ARCH} == "amd64" || ${MACHINE_ARCH} == "i386" || ${MACHINE_ARCH} == "powerpc" || ${MACHINE_ARCH} == "sparc64"
LIB_DEPENDS+=	multimedia/x265>=1.5
WANTLIB+=	x265>=2
CONFIGURE_ARGS+=	--enable-libx265
CONFIGURE_ENV+=		LIBavcodec_REQUIRES="libavutil libswresample opus schroedinger-1.0 speex theoraenc vpx x264 x265"
LIBavcodec_EXTRALIBS=-L${LOCALBASE}/lib -lgsm -lmp3lame -lopus -lschroedinger-1.0 -lspeex -ltheoradec -ltheoraenc -lvorbis -lvorbisenc -lvpx -lx264 -lx265 -lxvidcore -lz -pthread
.else
CONFIGURE_ENV+=		LIBavcodec_REQUIRES="libavutil libswresample opus schroedinger-1.0 speex theoraenc vpx x264"
LIBavcodec_EXTRALIBS=-L${LOCALBASE}/lib -lgsm -lmp3lame -lopus -lschroedinger-1.0 -lspeex -ltheoradec -ltheoraenc -lvorbis -lvorbisenc -lvpx -lx264 -lxvidcore -lz -pthread
.endif

OPTFLAGS=	${CFLAGS}

# until the system headers are fixed properly.
OPTFLAGS+=	-Wno-redundant-decls

USE_GMAKE=	Yes
CONFIGURE_STYLE= simple
CONFIGURE_ARGS+= ${CONFIGURE_SHARED} \
		--arch=${FFMPEG_ARCH} \
		--cc=${CC} \
		--disable-altivec \
		--disable-armv5te \
		--disable-armv6 \
		--disable-armv6t2 \
		--disable-debug \
		--disable-iconv \
		--disable-indev=jack \
		--disable-indev=oss \
		--disable-lzma \
		--disable-mips32r2 \
		--disable-mipsdspr1 \
		--disable-mipsdspr2 \
		--disable-outdev=oss \
		--disable-outdev=sdl \
		--enable-avresample \
		--enable-gpl \
		--enable-libgsm \
		--enable-libmp3lame \
		--enable-libopus \
		--enable-libschroedinger \
		--enable-libspeex \
		--enable-libtheora \
		--enable-libvorbis \
		--enable-libvpx \
		--enable-libx264 \
		--enable-libxvid \
		--enable-nonfree \
		--enable-openssl \
		--enable-pic \
		--enable-x11grab \
		--extra-cflags="-I${LOCALBASE}/include -I${X11BASE}/include" \
		--extra-libs="-L${LOCALBASE}/lib -L${X11BASE}/lib" \
		--mandir=${PREFIX}/man \
		--optflags="${OPTFLAGS}"

CONFIGURE_ENV+=	LIBavcodec_EXTRALIBS="${LIBavcodec_EXTRALIBS}" \
		LIBavdevice_EXTRALIBS="${LIBavdevice_EXTRALIBS}" \
		LIBavfilter_EXTRALIBS="${LIBavfilter_EXTRALIBS}" \
		LIBavformat_EXTRALIBS="${LIBavformat_EXTRALIBS}" \
		LIBavresample_EXTRALIBS="${LIBavresample_EXTRALIBS}" \
		LIBavutil_EXTRALIBS="${LIBavutil_EXTRALIBS}" \
		LIBpostproc_EXTRALIBS="${LIBpostproc_EXTRALIBS}" \
		LIBswresample_EXTRALIBS="${LIBswresample_EXTRALIBS}" \
		LIBswscale_EXTRALIBS="${LIBswscale_EXTRALIBS}" \
		LIBavcodec_LINKFLAGS="" \
		LIBavdevice_LINKFLAGS="-Wl,-rpath-link,${X11BASE}/lib" \
		LIBavfilter_LINKFLAGS="" \
		LIBavformat_LINKFLAGS="" \
		LIBavresample_LINKFLAGS="" \
		LIBavutil_LINKFLAGS="" \
		LIBpostproc_LINKFLAGS="" \
		LIBswresample_LINKFLAGS="" \
		LIBswscale_LINKFLAGS="" \
		LIBavdevice_REQUIRES="libavcodec libavfilter libavformat libavutil libpostproc libswresample libswscale" \
		LIBavfilter_REQUIRES="libavcodec libavformat libavresample libavutil libpostproc libswresample libswscale" \
		LIBavformat_REQUIRES="libavcodec libavutil libswresample" \
		LIBavresample_REQUIRES="libavutil" \
		LIBavutil_REQUIRES="" \
		LIBpostproc_REQUIRES="libavutil" \
		LIBswresample_REQUIRES="libavutil" \
		LIBswscale_REQUIRES="libavutil" \
		TMPDIR=${WRKTMP}

VERSION_FLAGS=	libavcodec_VERSION=${LIBavcodec_VERSION} \
		libavdevice_VERSION=${LIBavdevice_VERSION} \
		libavfilter_VERSION=${LIBavfilter_VERSION} \
		libavformat_VERSION=${LIBavformat_VERSION} \
		libavresample_VERSION=${LIBavresample_VERSION} \
		libavutil_VERSION=${LIBavutil_VERSION} \
		libpostproc_VERSION=${LIBpostproc_VERSION} \
		libswresample_VERSION=${LIBswresample_VERSION} \
		libswscale_VERSION=${LIBswscale_VERSION}

MAKE_ENV=	V=1

MAKE_FLAGS=	${VERSION_FLAGS} \
		LIBavcodec_EXTRALIBS="-lavutil -lswresample ${LIBavcodec_EXTRALIBS}" \
		LIBavdevice_EXTRALIBS="-lavcodec -lavfilter -lavformat -lavutil -lpostproc -lswresample -lswscale ${LIBavdevice_EXTRALIBS}" \
		LIBavfilter_EXTRALIBS="-lavcodec -lavformat -lavresample -lavutil -lpostproc -lswresample -lswscale ${LIBavfilter_EXTRALIBS}" \
		LIBavformat_EXTRALIBS="-lavcodec -lavutil -lswresample ${LIBavformat_EXTRALIBS}" \
		LIBavresample_EXTRALIBS="-lavutil ${LIBavresample_EXTRALIBS}" \
		LIBavutil_EXTRALIBS="${LIBavutil_EXTRALIBS}" \
		LIBpostproc_EXTRALIBS="-lavutil ${LIBpostproc_EXTRALIBS}" \
		LIBswresample_EXTRALIBS="-lavutil ${LIBswresample_EXTRALIBS}" \
		LIBswscale_EXTRALIBS="-lavutil ${LIBswscale_EXTRALIBS}"
FAKE_FLAGS=	${VERSION_FLAGS} \
		LDCONFIG=true

.ifdef DEBUG
CONFIGURE_ARGS+=--disable-stripping
.endif

ALL_TARGET=	all tools/qt-faststart
TEST_TARGET=	check

HTML_DOCS=	developer faq ffmpeg ffplay ffprobe ffserver general libavfilter

pre-configure:
	@mkdir -p ${WRKTMP}

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/ffmpeg
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/ffmpeg
	${INSTALL_PROGRAM} ${WRKBUILD}/tools/qt-faststart ${PREFIX}/bin
.for doc in ${HTML_DOCS}
	${INSTALL_DATA} ${WRKBUILD}/doc/${doc}.html ${PREFIX}/share/doc/ffmpeg
.endfor
	${INSTALL_DATA} ${WRKBUILD}/doc/ffserver.conf \
		${PREFIX}/share/examples/ffmpeg

.include <bsd.port.mk>
