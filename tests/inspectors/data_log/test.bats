#!/usr/bin/env bats

PCAP="http_session_data_log.pcap"
CFG="snort.lua"
OPTION="-H -U"

@test "Log HTTP Request Data" {
    [ -f $SNORT_PLUGINS/snort_extra/inspectors/data_log.so ] # is plugin installed?
    $snort -r $PCAP -c $CFG --plugin-path $SNORT_PLUGINS $OPTION
    diff expected data_log
}

teardown()
{
    rm -f data_log 
}

