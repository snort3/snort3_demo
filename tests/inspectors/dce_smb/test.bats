#!/usr/bin/env bats

PCAP="ip0-tcp10-smb1-dce10.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"


@test "DCE SMB with TCP/SMB/DCE segmentation verified by wizard" {
    $snort -c $CFG -r $PCAP $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

