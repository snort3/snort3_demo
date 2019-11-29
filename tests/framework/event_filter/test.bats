#!/usr/bin/env bats

PCAP="ping30.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "Event Filter - Limit" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

