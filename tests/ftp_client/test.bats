#!/usr/bin/env bats
# Description:

PCAP="ftp_port_non_match_ip.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Test the detection of FTP Bounce attacks" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

