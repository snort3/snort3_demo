#!/usr/bin/env bats

PCAP="sessions_100conn_10cps_10sec.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Event Filter - Limit" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

