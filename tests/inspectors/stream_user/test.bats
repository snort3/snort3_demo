#!/usr/bin/env bats

CFG="snort.lua"
OPTION="-A csv -q"

@test "Basic stream_user functional test" {
    $snort -c $CFG --daq hext -i get.hext $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.log
    rm -f snort.out
}
