# $OpenBSD: Makefile,v 1.13 2015/01/20 10:04:15 sthen Exp $

BROKEN=		needs work on bitrig

COMMENT=	LLDP (802.1ab)/CDP/EDP/SONMP/FDP daemon and SNMP subagent

DISTNAME=	lldpd-0.7.13

SHARED_LIBS +=	lldpctl                   1.0 # 8.0

CATEGORIES=	net

HOMEPAGE=	http://vincentbernat.github.com/lldpd/

# ISC
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += c event_core event_extra pthread readline termcap

MASTER_SITES=	http://media.luffy.cx/files/lldpd/

FLAVORS=	snmp
FLAVOR?=

LIB_DEPENDS=	devel/libevent2

SEPARATE_BUILD=	Yes

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-privsep-chroot=/var/run/lldpd
CONFIGURE_ENV=		CPPFLAGS="${CPPFLAGS}" \
			LDFLAGS="${LDFLAGS}"
FAKE_FLAGS=		sysconfdir="${PREFIX}/share/examples/lldpd"

.if ${FLAVOR:Msnmp}
CONFIGURE_ARGS+=	--with-snmp
LIB_DEPENDS+=		net/net-snmp
WANTLIB += netsnmp netsnmpagent netsnmpmibs
WANTLIB += crypto kvm m perl util
.endif

CPPFLAGS+=		-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib

.include <bsd.port.mk>
