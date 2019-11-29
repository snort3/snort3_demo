#!/usr/bin/env bats

PCAP="csv.pcap"
CFG="snort.lua"
OPTIONS="-q -A csv -U -H -k none"

@test "CSV Logger - output event in csv format" {
    $snort -r $PCAP -c $CFG $OPTIONS > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
