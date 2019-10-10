
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = { }

stream_tcp = { } 

wizard = default_wizard

http2_inspect = { }

default_rules =
[[
alert tcp ( msg:"HTTP/2 frame header match"; http2_frame_header; content:"|00 00 0c 04 00 00 00 00 00|"; sid:1; )
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

