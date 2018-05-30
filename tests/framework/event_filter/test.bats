#!/usr/bin/env bats

PCAP="ping30.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Event Filter - Limit" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

