# $OpenBSD: Makefile,v 1.119 2015/03/16 09:52:13 czarkoff Exp $

CATEGORIES=		geo
COMMENT=		geographic location of OpenBSD developers

DISTNAME=		openbsd-developers-1.0
REVISION=		114
DISTFILES=
HOMEPAGE=		http://www.openbsd.org/

NO_BUILD=		Yes
NO_TEST=		Yes

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/markers
	${INSTALL_DATA} ${FILESDIR}/OpenBSD ${PREFIX}/share/markers

where-am-i:
	@echo "$$(sysctl -n hw.sensors.nmea0.angle0 | cut -d' ' -f1)\t\t$$(sysctl -n hw.sensors.nmea0.angle1 | cut -d' ' -f1)\t\t\"$$(whoami)\"\\t\t#$$(finger $$(whoami) | head -1 | cut -d\: -f3-)"

PERMIT_PACKAGE_CDROM=	Yes

.include <bsd.port.mk>
