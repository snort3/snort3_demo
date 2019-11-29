#!/usr/bin/env bats

PCAP="dsize.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Dsize - Teredo Multiple Encapsulation" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

