#!/usr/bin/env bats

CFG="snort.lua"
CFG_NET="./conf/binding_net.conf.lua"
CFG_VLAN="./conf/binding_vlan.conf.lua"
CFG_POLICY="./conf/binding_policy.conf.lua"

@test "Snort2Lua - convert a configuration" {
    $snort2lua -c ./conf/snort.conf -s -t
    $snort -c $CFG -T
    diff expected $CFG
    diff expected.net $CFG_NET
    diff expected.vlan $CFG_VLAN
    diff expected.policy $CFG_POLICY
}

teardown()
{
    rm -f $CFG
    rm -f ./conf/*lua
    rm -f ./conf/local.rules.rules
}
