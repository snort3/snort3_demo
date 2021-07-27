#!/bin/bash

cpu=$1
policy=$2
pcap=$3

. ./setup.sh

daq="--daq dump --daq-var load-mode=read-file --daq-var output=none"

taskset -c $cpu $SNORT2_BIN/snort --dynamic-preprocessor-lib-dir $SNORT2_LIB/snort_dynamicpreprocessor --dynamic-engine-lib $SNORT2_LIB/snort_dynamicengine/libsf_engine.so -S SNORT2_RULES=$SNORT2_RULES -S SNORT_ODP=$SNORT_ODP $daq -A none -K none -Q -c $policy.conf -r $PCAP_DIR/$pcap.pcap

