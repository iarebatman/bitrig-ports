
COMMENT =		yet another NBD (Network Block Device) server program

DISTNAME =		xnbd-0.3.0
CATEGORIES =		sysutils

SHARED_LIBS +=		xnbd_internal 0.0

HOMEPAGE =		https://bitbucket.org/hirofuchi/xnbd/

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes

#WANTLIB =		assl>=6 c clog crypto curl edit event_core expat \
#			exude>=2 ncurses pthread shrink>=2 sqlite3 ssl util \
#			xmlsd>=3

EXTRACT_SUFX =		.tar.bz2
MASTER_SITES =		https://bitbucket.org/hirofuchi/xnbd/downloads/

USE_GMAKE=		Yes
CONFIGURE_STYLE=	gnu

.include <bsd.port.mk>
