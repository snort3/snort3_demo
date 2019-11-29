#!/usr/bin/env bats

PCAP="flowbits-jpg-gif.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Flowbits - Group feature" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

