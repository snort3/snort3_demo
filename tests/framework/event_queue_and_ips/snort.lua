
require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = { }
stream_tcp = { }

wizard = default_wizard

event_queue = { max_queue = 3, log = 3, }

output = { event_trace = { max_data = 2048 } }

default_rules =
[[
alert tcp ( sid:1; msg:"http/1.1"; content:"HTTP/1.1", depth 50; )
]]

ips = { rules = default_rules }

search_engine = { detect_raw_tcp = true }

