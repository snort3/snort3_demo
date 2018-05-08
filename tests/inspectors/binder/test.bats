#!/usr/bin/env bats

PCAP="user_defined_method.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Test the use of Binder" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

