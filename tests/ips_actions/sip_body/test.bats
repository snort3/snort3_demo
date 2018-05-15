#!/usr/bin/env bats

PCAP="SIP_Eyebeam2Eyebeam_Video_Audio.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "SIP Body - basic body content match - in the body " {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

