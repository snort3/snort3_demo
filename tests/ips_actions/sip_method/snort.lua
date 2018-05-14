require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }
stream_udp = { }

wizard = default_wizard

sip = { }

local_rules =
[[
alert udp ( sip_method:ack; sid:2000000; )
alert udp ( sip_method:register,invite; sid:3000000; )
]]

ips =
{
    enable_builtin_rules = true,
    rules = local_rules,
}

