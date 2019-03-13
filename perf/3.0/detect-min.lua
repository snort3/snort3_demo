---------------------------------------------------------------------------
-- min detect: depth limited to that of data sheet perf test
---------------------------------------------------------------------------

dofile('inspect.lua')

stream_tcp.queue_limit = { max_segments = 655, max_bytes = 262144 }

http_inspect.request_depth = 300
http_inspect.response_depth = 500

---------------------------------------------------------------------------
-- configure detection
---------------------------------------------------------------------------

references = default_references
classifications = default_classifications

ips = { include = 'enabled.rules' }
