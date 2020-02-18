
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = { }

stream_tcp = { } 

wizard = default_wizard

http_inspect = { }
http2_inspect = { }

default_rules =
[[
alert tcp ( msg:"HTTP/2 frame header match"; http2_frame_header; content:"|00 00 25 01 25 00 00 00 0d|"; sid:1; )
alert tcp ( msg:"status code match"; http_stat_code; content:"200"; sid:2; )
alert tcp ( msg:"raw header match"; http_raw_header; content:"Apache/2.4.18"; sid:3; )
]]

ips =
{
    enable_builtin_rules = true,
    rules = default_rules,
}

suppress = 
{
   { gid = 129, sid = 9 },
   { gid = 119, sid = 19 },
}

