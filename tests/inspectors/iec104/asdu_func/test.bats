#!/usr/bin/env bats

PCAP="iec104_asdu_func.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "IEC104 inspector asdu_func" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

