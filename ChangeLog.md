2025-05-05: 3.7.4.0

* demo: updating line numbers for third-party mock library

2025-04-20: 3.7.3.0

* extractor: extend the configuration with DNS logging

2025-03-11: 3.7.1.0

* copyright: update year to 2025

2025-02-03: 3.6.3.0

* perf: add connection logging

2025-01-19: 3.6.2.0

* stream_tcp: update expected files to match output changes due to fix for ids asymmetric flush support

2024-12-03: 3.6.0.0

* extractor: move to Connectors api

2024-11-18: 3.5.2.0

* perf: add FTP proto to extractor test

2024-11-06: 3.5.1.0

* flow: new allowlist LRU
* stream_tcp: update expected file for change in default value for asymmetric_ids_flush_threshold

2024-10-20: 3.4.0.0

 * stream_tcp: move require_3whs to stream to avoid undesired flow creation
 * stream_tcp: update expected to include output for new asymmetric ids flush threshold config option

2024-09-24: 3.3.7.0

* perf: accomodate custom scenarios for runs

2024-07-15: 3.3.1.0

* trace: update configuration and expected due to snort3 change

2024-05-08: 3.2.0.0

* detection: fix snort -T check

2024-03-24: 3.1.83.0

* trace: replace colon with space in message headers

2024-01-16: 3.1.78.0

* copyright: update from 2023 to 2024

2023-09-25: 3.1.71.0

* smtp: support DATA\n

2023-09-10: 3.1.70.0

* host_cache: added segmented host cache

2023-05-21: 3.1.62.0

* appid: changes the test to ignore maxrss

2023-04-06: 3.1.59.0

* flow_cache: add config option prune_flows

2023-02-22: 3.1.56.0

* copyright: update for year 2023

2022-12-15: 3.1.49.0

* demo: updated tests and fix detection trace
* wizard: update config after removing client_first option

2022-12-01: 3.1.48.0

* detection: add test for Stateful Signature Evaluation feature

2022-11-17: 3.1.47.0

* http_inspect: move JavaScript Normalization test to a separate component
* inspectors: update startup_verbose expected

2022-10-20: 3.1.44.0

* http_inspect: add config option

2022-08-25: 3.1.40.0

* ChangeLog: change to md format
* gid: upper bound changed to match event_filter and rate_filter implementation limits

2022-07-28: 3.1.38.0

* config: Removed all instances of 'cap_weight' config parameter

2022-06-30: 3.1.33.0

* file_api: change configs for rule magic handling over ips

2022-05-19: 3.1.30.0

* appid: remove SMB detection from service_netbios.cc

2022-04-25: 3.1.28.0

* appid: update expected bytes_in_use count.
* appid: use custom appid_diff_bytes.sh for comparison, to skip over bytes_in_use
* ips_actions: update test to log rewrite action
* ips: change Snort 2 style metadata:service foo to Snort 3 service:foo
* ips_options: fix typo in README.
* service: fix rules to use service correctly

2022-04-07: 3.1.27.0

* search_engines: miscellaneous config updates for retired legacy search engines

2022-03-09: 3.1.25.0

* stream_tcp: update ftp/eicar test due to changes in when we do flush_queued_segments in stream_tcp

2022-02-09: 3.1.23.0

* http_inspect: add demo test for JavaScript Normalization

2022-01-25: 3.1.21.0

* copyright: Update year to 2022
* file_api: updates for file policy changes
* startup_verbose: add global inspectors section

2022-01-12: 3.1.20.0

* appid: make peg counts consistent with what is reported to external components

2021-12-15: 3.1.19.0

* http_inspect: update expected with a renamed option
* snort2lua: change tests to match the changed conversion of variable sets

2021-12-01: 3.1.18.0

* framework: update verbose output for network policy changes
* startup_verbose: update expected with http_inspect.js_norm_max_bracket_depth value

2021-10-21: 3.1.15.0

* inspector/startup_verbose: support VBA macro data extraction feature
* startup_verbose: update expected with http_inspect.js_norm_max_scope_depth option
* startup_verbose: update test with new js_normalization_depth default value

2021-10-07: 3.1.14.0

* inspectors: change js_norm_identifier_depth value in startup_verbose test

2021-09-22: 3.1.13.0

* inspectors: update filename in file event
* stream_tcp: update due to changing session_timeout default value

2021-09-08: 3.1.12.0

* stream_tcp: update due to queue limit changes

2021-08-26: 3.1.11.0

* http_inspect: Update expected for js_norm_max_tmpl_nest
* sip: rename max_requestName_len to max_request_name_len for consistency
* snort2lua: remove normalizer.tcp.trim config

2021-08-11: 3.1.10.0

* build: install DAQ modules and Snort plugins in separate folders
* http_inspect: change the default value of http_inspect's request_body_app_detection config parameter to true
* inspectors: update startup_verbose expected

2021-07-28: 3.1.9.0

* perf: add LightSPD testing for 3.0 with 2.9 equivalent for comparison

2021-07-15: 3.1.8.0

* demo: add Dockerfile for ubuntu 20.10
* snort2lua: update expected

2021-06-30: 3.1.7.0

* appid: enhance service_netbios.cc to detect smb versions as webapps
* codecs: shorten IP in teredo expected due to removing REG_TEST flag
* ips_options: remove asan dependency from test
* snort2lua: remove footprint size config

2021-06-16: 3.1.6.0

* dump_config: use trace option which is available in any type of build
* startup_verbose: update for new http config option

2021-03-27: 3.1.3.0

* tests: Remove deprecated rewrite module
* tests: Update copyright
* tests: Update pcap logging test with the react rule triggered
* tests: Update test to reflect new warning when daq in unable to inject

2021-03-11: 3.1.2.0

* ftp: Update expected file due to change in snort ftp data eof handling
* http_inspect: Remove detained inspection
* iec104: Add demo tests for the new iec104 service inspector
* iec104: Add fast_pattern to example demo rules
* snort2lua: Update expected output for MPLS configuration changes
* stream_tcp: Update expected alert due to early detection upon FIN
* tests: Update for codec logging no longer truncating codec name

2020-11-16: 3.0.3 build 5

* ftp: Ftp detection across varying size segments
* rna: Change test to verify the service detected by appid

2020-10-27: 3.0.3 build 4

* actions: Use ips mode for react
* snort2lua: Update configs to a new syntax, ips variables in sub-tables
* trace: Rename n-tuple trace option

2020-10-22: 3.0.3 build 3

* actions: Use payload_injector for react
* http_inspect: Add test for script detection
* snort2lua: Update expected comments about rule_state options

2020-10-07: 3.0.3 build 2

* http_inspect: Tests for support of custom xff type headers
* inspectors: Updates for binder output changes
* rna: Update rna expected results file to match output changes due to adding rna host type
   discovery support
* snort2lua: Replace deprecated rule_state[gid:sid] with ips.states stub

2020-09-23: 3.0.3 build 1

* codecs: Remove user, move relevant test to teredo
* codecs: Update IP tests
* codecs: Update tcp and udp demo tests
* codecs: Update vlan test
* framework: Edit README for classification_and references, detection, and event_filter
* framework: Edit README.adoc for event_queue_and_ips, latency and process
* framework: Update profiler README.adoc
* http2_inspect: Update readme, cleanup snort.lua
* http_inspect: Update demo test
* inspectors: Update dnp3 test
* inspectors: Update stream_file and stream_user tests
* inspectors: Update readme files for binder, normalizer and perf monitor
* ips_actions: Update the README.adoc files for reject and replace_rewrite
* loggers: Update README docs for Snort3 demo repo
* modbus: Update snort lua and readme
* rate_filter: Update demo test
* reputation: Update terms used in tests
* snort2lua: Add test to demonstrate configs conversion
* startup_verbose: Update README with details about verbose output
* trace: Update test description and configuration
* wizard: Add tests to demonstrate spells and hexes

2020-09-13: 3.0.2 build 6

* byte_jump: Change demo to detailed breakdown
* demo: Fix readme style issues
* dump_config: Add test to demonstrate --dump-config feature
* http_inspect: Script detection
* perf: Various configuration tweaks
* rna: Add test to demo rna discovery, filtering
* tests: Fix --daq-dir usage
* tests: Move rule options to ips_options/

2020-08-12: 3.0.2 build 5

* ftp: Test eicar detection over active ftp

2020-08-06: 3.0.2 build 4

* inspectors: Remove third-party plugins
* trace: Allow traces from product-build only

2020-07-28: 3.0.2 build 3

* inspectors: Add verbose startup output test
* ips: Update syntax for setting snort variables
* trace: Add trace logger framework test

2020-07-06: 3.0.2 build 1

* ips: Updates for detection and regex
* perf: Add maxcps script (tcp_1.sh) and other tweaks
* snort_defaults.lua: Remove unused AIM_SERVERS var

2020-05-20: 3.0.1 build 4

* trace: Update config according to new format

2020-05-06: 3.0.1 build 3

* http2_inspect: Demo update to show latest capabilities

2020-04-23: 3.0.1 build 2

* ips_options: Remove unused session and flowbits group

2020-03-31: 3.0.1 build 1

* latency: Remove deprecated action option from tests
* so_rule: Updated so rule demo code to use RuleFLowData to track flow data

2020-03-25: build 270

* http2_inspect: Remove http_inspect content-length alert from expected
* udp: Delete obsolete config option enable_gtp

2020-03-12: build 269

* build: Remove ASAN from compiler options for Alpine Linux in 'tests.ips_actions.so_and_soid'
   test
* react: React now blacklists the flow after sending RST.
* tests: Adding check for hyperscan availablity
* tests: Removing sd_pattern test as it's not relevant

2020-02-21: build 268

* copyright: Update year to 2020
* gtp_inspect: Fix default port binding
* http2: Include http_inspect in snort.lua
* http2_inspect: Tests updates for transfer encoding chunked at end of decoded http1 header block
* http2_inspect: Update rules
* loggers: Update vlan logging
* normalizer: Disable all normalizations by default except for tcp.ips
* perf: Fix setup script
* perf: Update for latest default conf and tweaks
* tests: Add optional arg to run_test.sh to run a single test instead of all

2019-12-20: build 267

* python: Updates to make it work under python3
* whitespace: Convert all tabs to spaces

2019-12-04: build 266

* appid: Fix expected after adding service_cache pegs.
* perf: Show 25 rules in profile
* tests/inspectors/appid/expected_count
* tests: Promote -H -U to global args
* tests: Use $snort with optional global args

2019-11-22: build 265

* doc: Update new bat github link

2019-11-06: build 264

* pcap-compare: Adding python3 support
* run_test: Change test path during bats execution

2019-10-31: build 263

* http2_inspect: Update expected after discarding connection preface

2019-10-09: build 262

* detection: Consolidate user rules
* reputation: Blacklist test fixed to include new destination-triggered SID

2019-08-28: build 260

* host_tracker: Adding a perf scenario for host tracker
* http2_inspect: Change test for removed pkt_data buffer option

2019-08-21: build 259

* flowCache: Removing single user flow cache from expected
* http_inspect: Update expected for removing 0-byte workaround

2019-07-17: build 258

* http_inspect: Send headers to detection separate from first body section
* perf/3.0: Use --pcap-loop in lieu of -r / --pcap-list

2019-06-19: build 257

* perf/3.0: Remove rules from lua files, profile by total_time
* perf/common: Update abcip script suite
* perf: Align Snort 2 and Snort 3 environment variables and update README.
* perf: Convert to total_ticks and at most 10 rules dumped
* perf: Disable logging
* perf: Remove outdated rules
* perf: Update repeat.sh to output csv

2019-05-22: build 256

* demos: Updates for strict snaplen handling in DAQng
* perf_monitor: Use batch-size=1 for now to match pre-DAQng behavior

2019-04-17: build 253

* lua: Remove obsolete dependency on snort_config.lua
* lua: Updates for default fixups

2019-04-10: build 252

* so_rules: Add stub to expected for easier visibility
* so_rules: Provide more complete example
* so_rules: Support DAQ_INCLUDES
* so_rules: Support DAQ_INCLUDES, take 2
* so_rules: Use full rule header
* so_rules: Use pkg-config to generate the necessary CPPFLAGS

2019-03-31: build 251

* appid: Update script to handle new log message
* output: Move obfuscate_pii from the output config to ips config to reflect code changes.
* perf: Add Snort 3 vs Snort 2 perf test configs and scripts
* perf: Add tips to README
* perf: Configure consistent profiling
* perf: Convert to using exports
* perf: Fix perf_test.sh pcaps
* perf: Fixup paths
* perf: Miscellaneous updates
* perf: Overhaul and simplify suite
* perf: Tweak 3.0 paths
* react: Updating reach test case for snort3 reset change

2018-12-06: build 250

* actions: Update pcap to reflect new option on IPS reject control

2018-11-07: build 249

* run_test.sh: Added some exit codes

2018-09-26: build 248

* http_inspect: Split and inspect immediately upon reaching depth

