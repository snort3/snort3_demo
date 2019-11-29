#!/usr/bin/env bats

PCAP="digium.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "Classification and Reference" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

