# $OpenBSD: Makefile,v 1.6 2014/11/18 02:49:39 bentley Exp $

COMMENT =		convert POD data to mdoc input

DISTNAME =		pod2mdoc-0.1

CATEGORIES =		textproc

HOMEPAGE =		http://mdocml.bsd.lv/pod2mdoc/

# ISC
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += c

MASTER_SITES =		http://mdocml.bsd.lv/pod2mdoc/snapshots/
EXTRACT_SUFX =		.tgz

MAKE_FLAGS =		CC="${CC}" \
			CFLAGS="${CFLAGS}"

NO_TEST =		Yes

ALL_TARGET =		pod2mdoc

do-install:
	${INSTALL_PROGRAM} ${WRKDIST}/pod2mdoc ${PREFIX}/bin
	${INSTALL_MAN} ${WRKDIST}/pod2mdoc.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
