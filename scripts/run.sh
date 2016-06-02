#!/bin/sh

GIT_CHECKOUT=${GIT_CHECKOUT:-}

if [ -n "${GIT_CHECKOUT}" ]; then
    printf "Cloning IPMI tool sources from git\n"
    git clone http://git.code.sf.net/p/ipmitool/source ipmitool-source
fi

exec $@
