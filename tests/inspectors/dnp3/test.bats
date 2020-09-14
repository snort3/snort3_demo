#!/usr/bin/env bats

PCAP="dnp3.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "DNP3 Inspector - Detection options" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

