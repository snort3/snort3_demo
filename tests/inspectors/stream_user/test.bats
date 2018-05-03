#!/usr/bin/env bats

CFG="snort.lua"
OPTION="-A csv -k none -U -H"

@test "Basic stream_user functional test" {
    $snorty_path/bin/snort -c $CFG --daq-dir $SNORT_DAQS --daq hext -i get.hext $OPTION | grep user > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out    
}

