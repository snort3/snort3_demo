#!/usr/bin/env bats

PCAP="pop.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Profiler - Limit Output Count" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    run ./compare_profile.sh
}

teardown()
{
    rm -f snort.out normalized.out
}

