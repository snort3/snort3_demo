#!/usr/bin/env bats

PCAP="json.pcap"
CFG="snort.lua"
OPTIONS="-A json -H -U -k none -q"

@test "json Logger - output event in json format" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTIONS > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
