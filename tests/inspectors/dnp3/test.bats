#!/usr/bin/env bats

PCAP="dnp3_missed_matched_contents.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "DNP3 Inspector - Missed Matched Contents" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

