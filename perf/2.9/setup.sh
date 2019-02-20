# set the build below and the app_detector_dir in odp.conf
build=/home/snorty/snort2/snort-2.9.12/o3

snort=$build/bin/snort
plugs=$build/lib/snort_dynamicpreprocessor
engine=$build/lib/snort_dynamicengine/libsf_engine.so

daq="--daq dump --daq-var load-mode=read-file --daq-var output=none"
args="--dynamic-preprocessor-lib-dir $plugs --dynamic-engine-lib $engine $daq -H -Q -A console:test"

runt="Run time"

