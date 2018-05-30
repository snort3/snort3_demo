require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }
stream_tcp = { }

wizard = default_wizard

rate_filter =
{ {
    gid = 135,
    sid = 2,
    track = 'by_dst',
    count = 30,
    seconds = 0,
    new_action = 'alert',
    timeout = 1,
} }

local_rules =
[[
pass ( gid:135; sid:2; rev:1; )
pass ( gid:135; sid:3; rev:1; )
]]

ips = { rules = local_rules }

