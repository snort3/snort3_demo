require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

suppress =
{
    {
        gid = 1,
        sid = 666,
        track = 'by_src',
        ip = '10.4.15.48',
    },
    {
        gid = 1,
        sid = 666,
        track = 'by_src',
        ip = '10.4.10.245',
    },
    {
        gid = 1,
        sid = 666,
        track = 'by_src',
        ip = '10.4.12.183',
    },
    {
        gid = 1,
        sid = 666,
        track = 'by_src',
        ip = '10.4.16.86',
    },
    {
        gid = 1,
        sid = 666,
        track = 'by_src',
        ip = '10.4.14.80',
    },
}

local_rules =
[[
alert udp any any -> 10.5.3.21 any ( msg:"dhcp req"; sid:666; )
]]

ips =
{
    rules = local_rules,
}

