# $OpenBSD: Makefile,v 1.9 2015/01/22 20:26:43 naddy Exp $

COMMENT=	client to perform simple tasks with a POP3/IMAP server

DISTNAME=	poppy-4.01
REVISION=	1
CATEGORIES=	mail

HOMEPAGE=	http://www.cnpbagwell.com/projects.html

PERMIT_PACKAGE_CDROM=   Yes

MASTER_SITES=	http://www.cnpbagwell.com/

CONFIGURE_STYLE= perl

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/poppy ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/spamkill ${PREFIX}/bin
	${INSTALL_MAN}	${WRKSRC}/poppy.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
