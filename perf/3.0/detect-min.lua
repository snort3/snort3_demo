---------------------------------------------------------------------------
-- min detect: depth limited to that of data sheet perf test
---------------------------------------------------------------------------

include('inspect.lua')

stream_tcp.queue_limit = { max_segments = 655, max_bytes = 262144 }

http_inspect.request_depth = 300
http_inspect.response_depth = 500

profiler.rules = { show = true, sort = 'total_time', count = 10 }

---------------------------------------------------------------------------
-- configure detection
---------------------------------------------------------------------------

references = default_references
classifications = default_classifications

search_engine = { }
detection = { hyperscan_literals = true, pcre_override = false }

ips = { include = os.getenv('SNORT3_MIN_RULES') }

