require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }
stream_udp = { }
sip = { }
wizard = default_wizard

local_rules =
[[
alert udp any any -> any 5060 ( sip_header; content:"eyeBeam"; sip_method:invite; sid:2000000; )
]]

ips =
{
    enable_builtin_rules = true,
    rules = local_rules,
}

