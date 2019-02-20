---------------------------------------------------------------------------
-- all: test for all rules with unlimited depths
---------------------------------------------------------------------------

dofile('snort.lua')

http_inspect.request_depth = -1
http_inspect.response_depth = -1

ips.include = 'all.rules'

