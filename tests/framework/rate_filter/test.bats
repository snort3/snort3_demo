#!/usr/bin/env bats

PCAP="sessions_100conn_10cps_10sec.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "Rate Filter - Limit" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

