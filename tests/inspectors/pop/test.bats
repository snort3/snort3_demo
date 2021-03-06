#!/usr/bin/env bats

PCAP="split_pop_boundary.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -s 3992"

@test "POP Inspector - Stateful Boundary Search" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
