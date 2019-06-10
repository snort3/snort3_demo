---------------------------------------------------------------------------
-- min detect: depth limited to that of data sheet perf test
---------------------------------------------------------------------------

dofile('inspect.lua')

stream_tcp.queue_limit = { max_segments = 655, max_bytes = 262144 }

http_inspect.request_depth = 300
http_inspect.response_depth = 500

profiler.rules = { show = true, sort = 'total_time' }

---------------------------------------------------------------------------
-- configure detection
---------------------------------------------------------------------------

references = default_references
classifications = default_classifications

search_engine = { }
detection = { }

ips = { include = os.getenv('SNORT3_RULES') }

