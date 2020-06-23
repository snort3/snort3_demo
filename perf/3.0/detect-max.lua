---------------------------------------------------------------------------
-- max detect: unlimited depth
---------------------------------------------------------------------------

include('inspect.lua')

stream_tcp.queue_limit = { max_segments = 0, max_bytes = 0 }

http_inspect.request_depth = -1
http_inspect.response_depth = -1

profiler.rules = { show = true, sort = 'total_time', count = 25 }

---------------------------------------------------------------------------
-- configure detection
---------------------------------------------------------------------------

references = default_references
classifications = default_classifications

search_engine = { detect_raw_tcp = true }

ips = { include = os.getenv('SNORT3_MAX_RULES') }

---------------------------------------------------------------------------
-- configure hyperscan if available
---------------------------------------------------------------------------

detection = { }

--detection.hyperscan_literals = true
--detection.pcre_to_regex = true

