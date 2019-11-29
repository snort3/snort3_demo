#!/usr/bin/env bats

PCAP="json.pcap"
CFG="snort.lua"
OPTIONS="-A json -k none -q"

@test "json Logger - output event in json format" {
    $snort -r $PCAP -c $CFG $OPTIONS > snort.out
    ./ipv6_norm.py expected > expected.nrm
    ./ipv6_norm.py snort.out > snort.nrm
    diff expected.nrm snort.nrm
}

teardown()
{
    rm -f snort.out *.nrm
}
