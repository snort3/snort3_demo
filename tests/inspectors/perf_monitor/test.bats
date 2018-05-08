#!/usr/bin/env bats

PCAP="plustest.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Perf Monitor - Populate DAQ Stats" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION 
    diff expected perf_monitor_base.txt
}

teardown()
{
    rm -f perf_monitor_base.txt
}

