#!/usr/bin/env bats

PCAP="http_session_data_log.pcap"
CFG="snort.lua"
OPTION="-H -U"

@test "Log HTTP Request Data" {
    $snorty_path/bin/snort -r $PCAP -c $CFG --plugin-path $SNORT_PLUGINS $OPTION
    diff expected data_log
}

teardown()
{
    rm -f data_log 
}

