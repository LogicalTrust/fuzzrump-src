#	$NetBSD: Makefile,v 1.11 2017/05/11 04:33:14 sevan Exp $
#

PROG=	rump_allserver
MLINKS+=rump_allserver.1 rump_server.1

RUMPTOP=${.CURDIR}/../../sys/rump

.include "${RUMPTOP}/dev/Makefile.rumpdevcomp"
.include "${RUMPTOP}/fs/Makefile.rumpfscomp"
.include "${RUMPTOP}/kern/Makefile.rumpkerncomp"
.include "${RUMPTOP}/net/Makefile.rumpnetcomp"

LDADD+=	${RUMPDEVLDADD} ${RUMPFSLDADD} ${RUMPKERNLDADD} ${RUMPNETLDADD}
LDADD+= -lrumpdev -lrumpvfs -lrumpnet -lrump -lrumpuser -lrt -pthread

.include <bsd.prog.mk>
