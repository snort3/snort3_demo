#!/usr/bin/env bats

PCAP="one_session.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "HTTP Header and HTTP Cookie - Basic functionlity" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

