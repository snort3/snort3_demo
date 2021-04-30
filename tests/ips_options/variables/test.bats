#!/usr/bin/env bats

PCAP="test.pcap"
CFG="snort.lua"
OPTION=" -q -A csv -k none"

@test "Custom Variables" {
    $snort -r $PCAP -c $CFG $OPTION | cut -d, -f2- > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

