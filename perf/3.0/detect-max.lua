---------------------------------------------------------------------------
-- max detect: unlimited depth
---------------------------------------------------------------------------

dofile('inspect.lua')

stream_tcp.queue_limit = { max_segments = 0, max_bytes = 0 }

http_inspect.request_depth = -1
http_inspect.response_depth = -1

profiler.rules = { show = true, sort = 'avg_check' }

---------------------------------------------------------------------------
-- configure detection
---------------------------------------------------------------------------

references = default_references
classifications = default_classifications

ips = { include = 'enabled.rules' }

