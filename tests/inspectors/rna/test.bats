#!/usr/bin/env bats

PCAP="subnets.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "RNA - test host and proto discovery, with filtering" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    # Only grab host cache output from "IP: " to "transport proto: .*$"
    sed -n '/IP:.*/,/transport proto: .*$/p' hosts.out > generated
    diff expected generated
}

teardown()
{
    rm -f snort.out hosts.out generated
}
