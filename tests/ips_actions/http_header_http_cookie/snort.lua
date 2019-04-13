
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard  = default_wizard

http_inspect = { }

default_rules =
[[
alert tcp ( msg:"cookie"; flow:established,to_server; http_header; content:"www.walmart.com"; http_cookie; content:"com.wm.visitor=",offset 0; http_cookie; content:"com.wm.anoncart="; sid:6; )
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

