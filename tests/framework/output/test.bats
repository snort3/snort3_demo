#!/usr/bin/env bats

PCAP="output.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Output" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

