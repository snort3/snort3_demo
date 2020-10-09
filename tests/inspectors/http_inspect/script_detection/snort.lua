HOME_NET = 'any'
EXTERNAL_NET = 'any'

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

default_rules =
[[
block tcp any any -> any any ( flow:established,to_client; file_data; content:"tricky"; sid:1; rev:1; )
]]

http_inspect =
{
    script_detection = true
}

event_queue =
{
    log = 16,
    max_queue = 16
}

search_engine =
{
    max_queue_events = 16,
}

normalizer =
{
    tcp =
    {
        ips = true,
    }
}

stream = {}

stream_tcp = {}

wizard = default_wizard

ips =
{
    enable_builtin_rules = true,
    rules = default_rules
}

