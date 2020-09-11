#!/usr/bin/env bats

PCAP="rem.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "Rem IPS Option - Basic Functionality" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

