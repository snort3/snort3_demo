#!/usr/bin/env bats

PCAP="service_dcerpc.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -H -U"

@test "Service IPS Option - Basic Functionality" {
    $snorty_path/bin/snort -c $CFG -r $PCAP $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

