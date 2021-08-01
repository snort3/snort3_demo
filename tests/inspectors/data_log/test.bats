#!/usr/bin/env bats

PCAP="http_session_data_log.pcap"
CFG="snort.lua"
OPTION=""

@test "Log HTTP Request Data" {
    [ -f $SNORT_PLUGINS/extra/inspectors/data_log.so ] # is plugin installed?
    $snort -r $PCAP -c $CFG --plugin-path $SNORT_PLUGINS $OPTION
    diff expected data_log
}

teardown()
{
    rm -f data_log 
}

