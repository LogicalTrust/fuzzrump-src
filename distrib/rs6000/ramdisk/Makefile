#	$NetBSD: Makefile,v 1.9 2019/02/06 07:51:20 mrg Exp $

.include <bsd.own.mk>
.include "${NETBSDSRCDIR}/distrib/common/Makefile.distrib"

IMAGE=		ramdisk.fs
IMAGESIZE=	2176k
MAKEFS_FLAGS+=	-f 15

WARNS=		1
DBG=		-Os

CRUNCHBIN=	ramdiskbin
CRUNCHGEN_FLAGS= -d "${DBG}"
LISTS=		${.CURDIR}/list # ${DISTRIBDIR}/common/list.sysinst
MTREECONF=	${DISTRIBDIR}/common/mtree.common
IMAGEENDIAN=	be
MAKEDEVTARGETS=	all
IMAGEDEPENDS=	${CRUNCHBIN} \
		dot.profile \
		${DESTDIR}/usr/mdec/boot ${DESTDIR}/usr/mdec/mkbootimage \
		${NETBSDSRCDIR}/etc/group ${NETBSDSRCDIR}/etc/master.passwd \
		${NETBSDSRCDIR}/etc/netconfig \
		${DISTRIBDIR}/common/protocols \
		${DISTRIBDIR}/common/services

SMALLPROG_INET6=1

.if ${USE_INET6} != "no"
LISTS+=		${DISTRIBDIR}/common/list.inet6
.endif

# Use stubs to eliminate some large stuff from libc
HACKSRC=	${DISTRIBDIR}/utils/libhack
.include	"${HACKSRC}/Makefile.inc"
${CRUNCHBIN}:	libhack.o

.include "${DISTRIBDIR}/common/Makefile.crunch"
.include "${DISTRIBDIR}/common/Makefile.makedev"
.include "${DISTRIBDIR}/common/Makefile.image"

release:

.include <bsd.prog.mk>
