# $OpenBSD: Makefile,v 1.36 2015/02/19 18:18:30 espie Exp $

COMMENT =	GNU privacy guard - a free PGP replacement

DISTNAME =	gnupg-2.1.2
CATEGORIES = 	security
REVISION =	0

MASTER_SITES =	${MASTER_SITES_GNUPG:=gnupg/}

HOMEPAGE = 	http://www.gnupg.org/

# GPLv3+
PERMIT_PACKAGE_CDROM = 	Yes

WANTLIB +=		assuan bz2 c gcrypt gnutls gpg-error
WANTLIB +=		ksba npth pthread readline
WANTLIB +=		termcap usb z

EXTRACT_SUFX = 		.tar.bz2

MODULES = 		devel/gettext

FLAVORS = 		ldap
FLAVOR ?=

LIB_DEPENDS =		archivers/bzip2 \
			devel/libusb-compat \
			devel/npth \
			security/gnutls \
			security/libassuan \
			security/libgcrypt \
			security/libksba \
			net/curl \
			devel/pth \
			security/libksba \
			devel/readline

.if ${FLAVOR:Mldap}
CONFIGURE_ARGS +=	--enable-ldap
WANTLIB +=		lber ldap
LIB_DEPENDS +=		databases/openldap
.else
CONFIGURE_ARGS +=	--disable-ldap
.endif

RUN_DEPENDS = 		security/pinentry

# gpg-agent must be installed to run the regress tests
TEST_DEPENDS = 	${FULLPKGNAME}:${BUILD_PKGPATH}

USE_GMAKE = 		Yes

CONFIGURE_STYLE = 	gnu
MODGNU_CONFIG_GUESS_DIRS = ${WRKSRC}/build-aux
CONFIGURE_ENV = 	CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS += 	docdir=${LOCALBASE}/share/doc/gnupg2 \
			--enable-gpgtar \
			--with-adns=no

# Avoid conflict with gnupg-1.x
post-install:
	@mv ${PREFIX}/man/man1/gpg-zip.1 ${PREFIX}/man/man1/gpg2-zip.1
	@mv ${PREFIX}/man/man7/gnupg.7 ${PREFIX}/man/man7/gnupg2.7

.include <bsd.port.mk>
