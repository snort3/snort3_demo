require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

event_filter =
{
    {
        gid = 1,
        sid = 1,
        type = 'threshold',
        track = 'by_src',
        count = 3,
        seconds = 10,
    },
}

local_rules =
[[
alert icmp 10.4.10.182 any -> 10.4.35.11 any ( msg:"ping"; sid:1; )
]]

ips =
{
    rules = local_rules,
}

