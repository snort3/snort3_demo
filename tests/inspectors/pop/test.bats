#!/usr/bin/env bats

PCAP="split_pop_boundary.pcap"
CFG="snort.lua"
OPTION="-q -A csv -U -H -k none -s 3992"

@test "POP Inspector - Stateful Boundary Search" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
