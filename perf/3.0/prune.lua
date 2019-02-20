---------------------------------------------------------------------------
-- prune: limited sessions to force LRU pruning
---------------------------------------------------------------------------

dofile('snort.lua')

stream.tcp_cache = { max_sessions = 1000 }

ips.include = 'enabled.rules'

