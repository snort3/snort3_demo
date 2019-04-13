
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = { }

stream_tcp = { }

http_inspect = { }

wizard = default_wizard

default_rules =
[[
alert tcp ( msg:"ZOMG!!!!"; file_data; content:"<yoshiz is ",within 11; pkt_data; content:"<yoshiz is ",depth 11; sid:6; rev:1; )
]]

ips =
{
    rules = default_rules,
}

