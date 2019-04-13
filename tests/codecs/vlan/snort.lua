
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

local_rules =
[[
alert icmp ( msg:"PROTOCOL-ICMP Echo Reply"; icode:0; itype:0; metadata:ruleset community; sid:99999; rev:1; )
]]

ips =
{
    rules = local_rules,
}

