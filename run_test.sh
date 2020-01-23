#!/usr/bin/env bash
#$1 -- directory where snort is installed
if [ $# -lt 1 ] ; then
    printf "usage: run_test.sh <snort_install_dir>"
    exit -1
fi

# global args (add any needed here for your environment)
args="-H -U"

# setup environnement
export snorty_path=$1
export snort="$snorty_path/bin/snort $args"

export LUA_PATH=$snorty_path/include/snort/lua/\?.lua\;\;
export SNORT_LUA_PATH=$snorty_path/etc/snort/
export PATH=$PATH:$(pwd)/bin

if [ -d "${snorty_path}/lib64" ]; then
    libs=${snorty_path}/lib64
else
    libs=${snorty_path}/lib
fi

export PKG_CONFIG_PATH=$libs/pkgconfig:$PKG_CONFIG_PATH
export SNORT_DAQS=$libs/snort/daqs:$libs/snort_extra/daqs
export SNORT_PLUGINS=$libs

tests=$2
[ "$tests" ] || tests=`find . -name \*.bats`

# run tests for all .bats
for t in $tests ; do
    printf "\n# $t:\n"
    pushd . &>/dev/null
    cd `dirname $t`
    bats -t .
    popd &> /dev/null
    done | tee demo_result.log

# calculate stats
pass=$(grep "^ok" -c demo_result.log)
fail=$(grep "^not ok" -c demo_result.log)
skip=$(grep "ok [0-9] # skip" -c demo_result.log)
pass=$(($pass - $skip))
total=$(($pass + $fail + $skip))

printf "\n"
printf "Total = $total, Pass = $pass, Fail = $fail, Skip = $skip\n" | tee demo_summary.log

if [ $fail -ne 0 ]; then
    exit 1;
else
    exit 0;
fi

