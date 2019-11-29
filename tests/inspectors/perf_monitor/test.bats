#!/usr/bin/env bats

PCAP="plustest.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none --daq-batch-size=1"

@test "Perf Monitor - Populate DAQ Stats" {
    $snort -r $PCAP -c $CFG $OPTION
    diff expected perf_monitor_base.txt
}

teardown()
{
    rm -f perf_monitor_base.txt
}

