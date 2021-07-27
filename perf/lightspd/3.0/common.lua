---------------------------------------------------------------------------
-- common: shared configuration included at the end of other configs
---------------------------------------------------------------------------

-- change these mappings so that the first N tests use unique cores
threads =
{
  { thread = 0, cpuset = '0' },
  { thread = 1, cpuset = '1' },
  { thread = 2, cpuset = '2' },
  { thread = 3, cpuset = '3' },
  { thread = 4, cpuset = '4' },
  { thread = 5, cpuset = '5' },
  { thread = 6, cpuset = '6' },
  { thread = 7, cpuset = '7' },
  { thread = 8, cpuset = '8' },
  { thread = 9, cpuset = '9' },
  { thread = 10, cpuset = '10' },
  { thread = 11, cpuset = '11' },
  { thread = 12, cpuset = '12' },
  { thread = 13, cpuset = '13' },
  { thread = 14, cpuset = '14' },
  { thread = 15, cpuset = '15' },
}

process = { threads = threads }

snort_whitelist_append("threads")

appid = { app_detector_dir = os.getenv('SNORT_ODP') }

-- overrides
stream.ip_frags_only = true
stream.tcp_cache = { idle_timeout = 36000 }
stream.udp_cache = { idle_timeout = 36000 }

stream_ip.session_timeout = 180
stream_icmp.session_timeout = 180
stream_tcp.session_timeout = 180
stream_udp.session_timeout = 180

search_engine.search_method = os.getenv('MPSE')

perf_monitor =
{
    seconds = 300,
    packets = 0,
}

profiler = { }
memory = { }

