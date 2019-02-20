---------------------------------------------------------------------------
-- stream: just do decode and stream processing
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- 1. configure environment
---------------------------------------------------------------------------

require('snort_config')

conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

---------------------------------------------------------------------------
-- 2. configure defaults
---------------------------------------------------------------------------

HOME_NET = 'any'
EXTERNAL_NET = 'any'

dofile(conf_dir .. '/snort_defaults.lua')
dofile(conf_dir .. '/file_magic.lua')

---------------------------------------------------------------------------
-- 3. configure inspection
---------------------------------------------------------------------------

stream =
{
    ip_frags_only = true,
    udp_cache = { idle_timeout = 3600 },
}

stream_tcp =
{
    policy = 'windows',
    session_timeout = 180,
    overlap_limit = 10,
    queue_limit = { max_segments = 0, max_bytes = 0 },
}

stream_udp = { session_timeout = 3600 }

---------------------------------------------------------------------------
-- 4. configure bindings
---------------------------------------------------------------------------

wizard = default_wizard

binder =
{
    { when = { proto = 'tcp' },  use = { type = 'stream_tcp' } },
    { when = { proto = 'udp' },  use = { type = 'stream_udp' } },
}

---------------------------------------------------------------------------
-- 5. configure performance
---------------------------------------------------------------------------

latency =
{
    packet = { max_time = 1500 },
    rule = { max_time = 200 },
}

profiler = { rules = { count = 50, sort = 'avg_check' } }

---------------------------------------------------------------------------
-- 6. configure detection
---------------------------------------------------------------------------

search_engine = { detect_raw_tcp = false }

---------------------------------------------------------------------------
-- 9. configure tweaks
---------------------------------------------------------------------------

dofile('common.lua')

