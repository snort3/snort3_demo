#!/usr/bin/env bats

PCAP="ftp_xpwd_cmd.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Test the detection of Invalid FTP Commands" {

    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
