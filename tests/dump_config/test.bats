#!/usr/bin/env bats

ORIG_CFG="snort.lua"
LOAD_CFG="load.lua"

DUMP1="dump1.json"
DUMP2="dump2.json"

@test "dump a configuration" {
    $snort -c $ORIG_CFG --dump-config="top" > $DUMP1
    $snort -c $LOAD_CFG --dump-config="top" > $DUMP2
    diff -q $DUMP1 $DUMP2
}

teardown()
{
    rm -f $DUMP1 $DUMP2
}

