#!/usr/bin/env bats

PCAP="one_session.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "HTTP Header and HTTP Cookie - Basic functionlity" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

