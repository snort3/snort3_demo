# set build and ODP_PATH

build=/home/snorty/build/o3/install
export ODP_PATH="/home/snorty/snort3_test/tests/src/network_inspectors/appid/appid_config/"

snort=$build/bin/snort
plugs=$build/lib64

export LUA_PATH=$build/include/snort/lua/\?.lua\;\;
export SNORT_LUA_PATH=$build/etc/snort/

daq="--daq dump --daq-var load-mode=read-file --daq-var output=none"
args="--warn-all --plugin-path $plugs $daq -H -Q -A csv"

runt="seconds:"

