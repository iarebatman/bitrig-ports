# $OpenBSD: Makefile,v 1.12 2014/12/16 07:43:36 jasper Exp $

COMMENT=		libvirt wrapper suited for GObject-based applications

DISTNAME=		libvirt-glib-0.2.0
CATEGORIES=		devel sysutils

SHARED_LIBS +=  virt-gconfig-1.0          0.2 # 2.0
SHARED_LIBS +=  virt-glib-1.0             0.3 # 2.0
SHARED_LIBS +=  virt-gobject-1.0          0.2 # 2.0

HOMEPAGE=		http://libvirt.org/

MASTER_SITES=		ftp://libvirt.org/libvirt/glib/

# LGPLv2.1
PERMIT_PACKAGE_CDROM=   Yes

MODULES=		devel/gettext \
			lang/python \
			textproc/intltool

WANTLIB += avahi-client avahi-common crypto curl dbus-1 ffi
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 lzma
WANTLIB += gthread-2.0 hogweed idn m nettle p11-kit gnutls
WANTLIB += pcre pthread ssh2 ssl tasn1 util virt xml2 z gmp

BUILD_DEPENDS=		devel/gobject-introspection \
			lang/vala
LIB_DEPENDS=		sysutils/libvirt

USE_GMAKE=		Yes

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	${CONFIGURE_SHARED}

post-install:
	rm ${PREFIX}/lib/python${MODPY_VERSION}/site-packages/*.{a,la}

.include <bsd.port.mk>
