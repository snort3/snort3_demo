#!/usr/bin/env bats

PCAP="javascript.pcap"
CFG="snort.lua"
OPTION="-q -A alert_fast"

@test "JavaScript Normalization" {
    $snort -c $CFG -r $PCAP $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
