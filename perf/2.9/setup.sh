# export or set SNORT2_BUILD, SNORT2_*_RULES, SNORT_PCAPS, and SNORT_ODP below

[ -d "$SNORT2_BUILD" ] || SNORT2_BUILD=/home/snorty/snort2/snort-2.9.15/o3

[ -e "$SNORT2_MIN_RULES" ] || SNORT2_MIN_RULES=test.rules
[ -e "$SNORT2_MAX_RULES" ] || SNORT2_MAX_RULES=test.rules

[ -d "$SNORT_PCAPS" ] || SNORT_PCAPS=/home/snorty/ramdisk
[ -d "$SNORT_ODP" ] || SNORT_ODP="/home/snorty"

snort=$SNORT2_BUILD/bin/snort
plugs=$SNORT2_BUILD/lib/snort_dynamicpreprocessor
engine=$SNORT2_BUILD/lib/snort_dynamicengine/libsf_engine.so

confs="decode stream inspect detect-min detect-max"
daq="--daq dump --daq-var load-mode=read-file --daq-var output=none"
args="--dynamic-preprocessor-lib-dir $plugs --dynamic-engine-lib $engine $daq -H -A none -K none -Q"
vars="-S MIN_RULES=$SNORT2_MIN_RULES -S MAX_RULES=$SNORT2_MAX_RULES -S SNORT_ODP=$SNORT_ODP"
runt="Run time"

