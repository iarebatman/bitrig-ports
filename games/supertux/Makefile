# $OpenBSD: Makefile,v 1.2 2014/06/21 11:54:29 jasper Exp $

COMMENT =		jump 'n' run game

DISTNAME =		supertux-0.1.3

CATEGORIES =		games

REVISION =	1

HOMEPAGE =		http://supertux.lethargik.org/

# GPLv2+
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += GL SDL SDL_image SDL_mixer X11 c m pthread z
WANTLIB += c++ c++abi

MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=supertux.berlios/}
EXTRACT_SUFX =		.tar.bz2

RUN_DEPENDS =		devel/desktop-file-utils
LIB_DEPENDS =		devel/sdl-image \
			devel/sdl-mixer

CONFIGURE_STYLE =	gnu

USE_GMAKE =		Yes

NO_TEST =		Yes

.include <bsd.port.mk>
