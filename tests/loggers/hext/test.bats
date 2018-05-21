#!/usr/bin/env bats

PCAP="hext.pcap"
CFG="snort.lua"
OPTIONS="-A log_hext -H -U -q"

@test "log_hext Logger - output payload suitable for daq hext" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTIONS > snort.out
    diff expected snort.out
}

teardown()
{
    rm -rf snort.out    
}
