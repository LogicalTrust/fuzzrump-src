#!/bin/sh
# $NetBSD: mkheaderlist.sh,v 1.3 2016/02/23 11:43:04 skrll Exp $

# scan the source tree and create the headerlist file which is used by
# Makefile.nbincludes.

set -e

mklist()
{
	echo "# \$NetBSD\$"
	echo "#"
	echo '# do not edit; this file was automatically generated by:'
	echo '#	$NetBSD: mkheaderlist.sh,v 1.3 2016/02/23 11:43:04 skrll Exp $' | sed -e 's/\$//g'
	echo
	cd ../sys/arch && find . -name disklabel.h -o -name elf_machdep.h | sort
}

LIST=headerlist
rm -f ${LIST}
mklist > ${LIST}
