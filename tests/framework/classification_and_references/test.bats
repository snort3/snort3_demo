#!/usr/bin/env bats

PCAP="digium.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Classification and Reference" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

