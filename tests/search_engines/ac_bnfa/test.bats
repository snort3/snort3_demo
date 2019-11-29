#!/usr/bin/env bats

PCAP="ac_bnfa.pcap"
CFG="snort.lua"
OPTION="-q -A csv -U -H -k none"

@test "ac_bnfa search method" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
