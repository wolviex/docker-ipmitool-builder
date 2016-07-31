#!/bin/sh
set -e
set -u

TMP_DIR=${TMP_DIR:-'/build'}
NEW_PWD="${TMP_DIR}/ipmitool"
rm -rf "${NEW_PWD}"
cp -r "/ipmitool-source" "${NEW_PWD}"
cd "${NEW_PWD}"
sh bootstrap || printf "Bootstrap RC: %i\n" $?
./configure --enable-intf-dummy || printf "./configure RC: %i\n" $?
MAKE_RC=0
make 2>make.err.log || MAKE_RC=$?
MAKE_INST_RC=0
make install DESTDIR=${TMP_DIR}/package-ipmitool/ 2>make.install.err.log ||\
	MAKE_INST_RC=$?

printf "### make rc: %i\n" "${MAKE_RC}"
printf "### make install rc: %i\n" "${MAKE_INST_RC}"
if [ -s make.err.log ]; then
	ENUM=$(wc -l make.err.log | cut -d' ' -f1)
	grep -v extension make.err.log > make.err.log.filtered
	if [ $ENUM -lt 10 ]; then
		printf "###\nmake errors:\n"
		cat make.err.log
	else
		printf "###\nmake contains %i lines.\n" "${ENUM}"
		printf "cat %s/make.err.log\n" "${PWD}"
	fi
fi
if [ -s make.install.err.log ]; then
	printf "###\nmake install errors:\n"
	cat make.install.err.log
fi
