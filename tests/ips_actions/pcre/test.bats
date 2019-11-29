#!/usr/bin/env bats

PCAP="http.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "PCRE - relative start of subject" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

