#!/usr/bin/env bats

PCAP="SIP_CALL_RTP_G711.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "SIP Method - background traffic with SIP calls" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

