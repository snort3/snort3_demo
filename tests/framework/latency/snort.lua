
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

latency =
{
    packet =
    {
        action = 'alert',
        max_time = 1,
        fastpath = true
    }
}

local_rules =
[[
alert icmp (
    msg:"Ping"; sid:1;
    content:"1234567"; content:"1234"; content:"56",distance 0,within 2; content:"7",distance 0,within 1;
    pcre:"/1.+7/smi"; itype:8;
    )

alert icmp (
    msg:"Pong"; sid:2;
    content:"1234567"; content:"1234"; content:"56",distance 0,within 2; content:"7",distance 0,within 1;
    pcre:"/1.+7/smi"; itype:0;
    )
]]

ips =
{
    rules = local_rules,
    enable_builtin_rules = true
}
