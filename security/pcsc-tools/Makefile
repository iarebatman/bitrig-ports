# $OpenBSD: Makefile,v 1.1.1.1 2015/01/08 15:08:53 sthen Exp $

COMMENT=	tools for use with PC/SC drivers, cards, readers

DISTNAME=	pcsc-tools-1.4.23

CATEGORIES=	security sysutils

HOMEPAGE=	http://ludovic.rousseau.free.fr/softwares/pcsc-tools/

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += c pcsclite pthread

MASTER_SITES=	http://ludovic.rousseau.free.fr/softwares/pcsc-tools/

# gscriptor requires p5-Gtk2, intentionally not listed as a hard dep
RUN_DEPENDS=	security/p5-Chipcard-PCSC

LIB_DEPENDS=	security/pcsc-lite

FAKE_FLAGS=	DESTDIR=${WRKINST}${PREFIX}

USE_GMAKE=	Yes

NO_TEST=	Yes

CFLAGS+=	-I${LOCALBASE}/include/PCSC

.include <bsd.port.mk>
