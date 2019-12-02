#!/usr/bin/env bats

PCAP="myhttp.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -v -Q --daq dump --daq-var load-mode=read-file"

@test "ips react action test" {

    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
    pcap-compare.py expected.pcap inline-out.pcap
}

teardown()
{
    rm -f inline-out.* snort.out
}

