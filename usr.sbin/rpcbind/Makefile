#	$NetBSD: Makefile,v 1.15 2019/04/24 10:27:49 roy Exp $

.include <bsd.own.mk>

USE_FORT?= yes	# network client

PROG=	rpcbind
MAN=	rpcbind.8
SRCS=	check_bound.c rpcb_stat.c rpcb_svc_4.c rpcbind.c pmap_svc.c \
	rpcb_svc.c rpcb_svc_com.c security.c warmstart.c util.c 

LIBCDIR=        ${NETBSDSRCDIR}/lib/libc
LIBCRPCDIR=     ${LIBCDIR}/rpc

CPPFLAGS+=	-I${LIBCRPCDIR} -DPORTMAP -DLIBWRAP

.if (${USE_INET6} != "no")
CPPFLAGS+=	-DINET6
.endif

.if (${USE_YP} != "no")
CPPFLAGS+=	-DYP
.endif

# Uncomment these to get any useful output from 'rpcbind -d'
# CPPFLAGS+=	-DRPCBIND_DEBUG
# CPPFLAGS+=	-DSVC_RUN_DEBUG

LDADD+= -lwrap -lutil
DPADD+= ${LIBWRAP} ${LIBUTIL}

.PATH:  ${LIBCRPCDIR}

.include <bsd.prog.mk>
