#!/usr/bin/env bats

PCAP_DIR="./pcaps"
CFG="snort.lua"

cut_output()
{
    sed -n "/^Commencing packet processing/,/^----/p" snort.out | \
    sed -e "/^All/d" | \
    sed -e "/^Commencing/d" | \
    sed -e "/^----/d" | \
    sed "s/total time:.*usec/total time: usec/" | \
    sed "s/elapsed time:.*usec/elapsed time: usec/" > tmp.out
}

@test "trace logger framework" {
    $snort -c $CFG --pcap-dir $PCAP_DIR > snort.out
    cut_output && diff expected tmp.out
}

teardown()
{
    rm -f snort.out tmp.out
}

