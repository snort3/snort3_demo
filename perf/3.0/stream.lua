---------------------------------------------------------------------------
-- stream: just do decode and stream processing
---------------------------------------------------------------------------


---------------------------------------------------------------------------
-- 1. configure stream
---------------------------------------------------------------------------

stream =
{
    ip_frags_only = true,
    udp_cache = { idle_timeout = 3600 },
}

stream_ip = { }
stream_icmp = { }

stream_tcp =
{
    policy = 'windows',
    session_timeout = 180,
    overlap_limit = 10,
    require_3whs = 0
}

stream_udp = { session_timeout = 3600 }

normalizer =
{
    ip4 = { base = false },
    tcp =
    {
        base = false, block = false, urp = false, pad = false,
        opts = false, req_urg = false, req_urp = false,
        rsv = false, req_urp = false,
        ips = true
    }
}

---------------------------------------------------------------------------
-- 2. configure bindings
---------------------------------------------------------------------------

wizard = default_wizard

binder =
{
    { when = { proto = 'tcp' },  use = { type = 'stream_tcp' } },
    { when = { proto = 'udp' },  use = { type = 'stream_udp' } },
}

---------------------------------------------------------------------------
-- 3. configure performance
---------------------------------------------------------------------------

latency =
{
    packet = { max_time = 1500 },
    rule = { max_time = 200 },
}

profiler = { }
profiler.modules = { sort = 'total_time' }
profiler.rules = { show = false }

---------------------------------------------------------------------------
-- 4. configure tweaks
---------------------------------------------------------------------------

include('common.lua')

