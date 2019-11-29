#!/usr/bin/env bats

PCAP="smtp-lorem.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H -s 18050"

@test "Priority IPS Option - Basic Functionality" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

