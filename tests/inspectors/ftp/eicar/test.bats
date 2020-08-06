#!/usr/bin/env bats

PCAP="ftp_active_get_eicar.pcap"
CFG="snort.lua"
OPTION="-q -A csv -R eicar.rules"
@test "active FTP eicar detection" {

    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
