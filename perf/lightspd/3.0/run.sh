#!/bin/bash

mode=$1
mpse=$2
policy=$3
pcap=$4
lua=$5

. ./setup.sh

talos=$policy

case $policy in
    "balanced")     talos="balanced-security-and-connectivity" ;;
    "connectivity") talos="connectivity-over-security" ;;
    "maximum")      talos="maximum-detection" ;;
    "security")     talos="security-over-connectivity" ;;
esac

export MPSE=$mpse
export POLICY=$LIGHT_SPD/$talos.lua
export SNORT_ODP=$SNORT_ODP

[ "$SNORT3_DAQ" ] && daq_dir="--daq-dir $SNORT3_DAQ"

cmd=" \
$SNORT3_DIR/bin/snort --warn-all \
--plugin-path $LIGHT_SO \
$daq_dir --daq dump --daq-var output=none \
-c $policy.lua -Q \
-s 9000 -r $PCAP_DIR/$pcap.pcap --pcap-loop 1 \
-z 8 -l logs/"

[ "$lua" ] && cmd+=" --lua '$lua'"

help()
{
    echo "$0 <mode> <mpse> <policy> <pcap> [<lua-args>]"
    echo
    echo "<mode> ::= help | show | test | exec"
    echo "<mpse> ::= ac_full | hyperscan | <etc>"
    echo "<policy> ::= connectivity | balanced | security | maximum"
    echo "<pcap> ::= base name of file in $PCAP_DIR"
    echo
    echo "help: show this output"
    echo "show: output command"
    echo "test: run command with -T"
    echo "exec: run command"
}

show()
{
    echo "MPSE=$MPSE POLICY=$POLICY SNORT_ODP=$SNORT_ODP $cmd"
}

test()
{
    $cmd -T
}

exec()
{
    $cmd
}

case $mode in
    "help") help ;;
    "show") show ;;
    "test") test ;;
    "exec") exec ;;
    *) help ;;
esac

