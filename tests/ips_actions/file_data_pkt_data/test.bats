#!/usr/bin/env bats

PCAP="shiz.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Pkt Data and File Data - Basic Functionality" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

