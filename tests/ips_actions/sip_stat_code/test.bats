#!/usr/bin/env bats

PCAP="SIP_Eyebeam2Eyebeam_Video_Audio.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "SIP Stat Code - Basic Functionality" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

