#!/usr/bin/env bats

PCAP="syn_syn.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "Normalizer - Alert on Normalized TCP SYN" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

