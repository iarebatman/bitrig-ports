# $OpenBSD: Makefile,v 1.10 2014/11/04 16:57:14 landry Exp $

COMMENT =	infinite-world block sandbox game
V =		0.4.10
DISTNAME =	minetest-${V}
CATEGORIES =	games x11

HOMEPAGE =	http://www.minetest.net/

# source LGPLv2.1/ datas CC BY-SA 3.0
PERMIT_PACKAGE_CDROM =		Yes

MASTER_SITES=	https://github.com/minetest/

DISTFILES =	minetest-{minetest/archive/}${V}${EXTRACT_SUFX} \
		minetest-game-{minetest_game/archive/}${V}${EXTRACT_SUFX}

MODULES =	devel/cmake \
		devel/gettext
CONFIGURE_ARGS =	-DENABLE_GETTEXT=ON -DCUSTOM_MANDIR=${PREFIX}/man

RUN_DEPENDS=	devel/desktop-file-utils \
		x11/gtk+2,-guic
LIB_DEPENDS =	audio/openal \
		audio/libogg \
		audio/libvorbis \
		x11/irrlicht \
		net/curl

WANTLIB += GL GLU ICE Irrlicht SM X11 Xext Xxf86vm bz2 c curl jpeg m ogg openal
WANTLIB += png pthread sqlite3 vorbis vorbisfile z
WANTLIB += c++ c++abi

NO_TEST =	Yes

post-install:
	mv ${WRKDIR}/minetest_game-${V}/ \
	${PREFIX}/share/minetest/games/minetest_game
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/share/minetest/games/minetest_game

.include <bsd.port.mk>
