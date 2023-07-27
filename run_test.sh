#!/usr/bin/env bash

# Let the user specify an alternate directory to run test from
# This could be within the same source tree, or external.
TOPDIR="."
if [ -n "$1" ]
then TOPDIR="$1"
fi

if [[ -f "$TOPDIR" ]]
then TOPDIR=$(dirname "$TOPDIR")
fi

# Assume user installed to the default location ("/usr/local")
# TODO Deviation from this should pass as environment variable (`PREFIX="x/y/z" ./run_tests`).
export PREFIX="/usr/local"
export DAQ_DIR="$PREFIX/lib/daq:$PREFIX/lib/snort/daq:$PREFIX/lib/snort/daq/extra"

# global args (add any needed here for your environment)
args="-H -U"

# setup environnement
export snort="$PREFIX/bin/snort --daq-dir $DAQ_DIR $args"
export snort2lua="$PREFIX/bin/snort2lua"

export LUA_PATH=$PREFIX/include/snort/lua/\?.lua\;\;
export SNORT_LUA_PATH=$PREFIX/etc/snort/
export PATH=$PATH:$(pwd)/bin

# FIXIT: Figure out if libdaq install honors lib64 vs lib the same way as snort3 
if [ -d "${PREFIX}/lib64" ]
then LIBDIR="${PREFIX}/lib64"
else LIBDIR="${PREFIX}/lib"
fi

export PKG_CONFIG_PATH="$LIBDIR/pkgconfig:$PKG_CONFIG_PATH"
export SNORT_PLUGINS="$LIBDIR/snort/plugins"

# Find will locate all the "test.bats" files under the specified TOPDIR.
find "$TOPDIR" -name "test.bats" -type f -exec ./run_one \{} \; \
	| tee demo_result.log

# calculate stats
pass=$(grep "^ok" -c demo_result.log)
fail=$(grep "^not ok" -c demo_result.log)
skip=$(grep "ok [0-9] # skip" -c demo_result.log)
pass=$(($pass - $skip))
total=$(($pass + $fail + $skip))

printf "\n"
printf "Total = $total, Pass = $pass, Fail = $fail, Skip = $skip\n" | tee demo_summary.log

if [ $fail -ne 0 ]
then exit 1
fi
