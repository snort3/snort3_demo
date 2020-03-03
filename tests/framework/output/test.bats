#!/usr/bin/env bats

PCAP="output.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "Output" {

    if ! $snort -V | grep -q Hyperscan ; then
        skip "Snort not compiled with Hyperscan"
    fi

    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

