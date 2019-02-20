---------------------------------------------------------------------------
-- max: unlimited depth
---------------------------------------------------------------------------

dofile('snort.lua')

http_inspect.request_depth = -1
http_inspect.response_depth = -1

ips.include = 'enabled.rules'

memory = { }

