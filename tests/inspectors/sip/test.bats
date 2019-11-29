#!/usr/bin/env bats

PCAP="SIP_Eyebeam2Eyebeam_Video_Audio.pcap"
CFG="snort.lua"
OPTION="-q -A csv -U -H -k none"

@test "SIP Inspector content length match" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
