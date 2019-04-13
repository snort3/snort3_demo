
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }
stream_udp = { }

sip = { }

binder =
{
    {
        when =
        {
            proto = 'udp',
            ports = '5060 5061 5600',
        },
        use =
        {
            type = 'sip',
        },
    },
}

local_rules =
[[
alert udp any any -> any 5060 ( sip_stat_code:1; sid:1000000; )
alert udp any any -> any 5060 ( sip_stat_code:100, 180; sid:2000000; )
alert udp any any -> any 5060 ( sip_stat_code:180; sid:3000000; )
]]

ips =
{   
    enable_builtin_rules = true,
    rules = local_rules,
}
