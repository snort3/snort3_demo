#!/usr/bin/env bats

PCAP="ftp_port_non_match_ip.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "Test the detection of FTP Bounce attacks" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

