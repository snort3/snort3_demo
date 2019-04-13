
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard = default_wizard

http_inspect = { }

default_rules =
[[
alert tcp ( msg:"raw body match"; flow:established,to_client; http_raw_body; content:"GIF89aQ"; sid:1; )
alert tcp ( msg:"raw body match"; flow:established,to_client; http_raw_body; content:"k!@"; sid:2; )
alert tcp ( msg:"raw_body should not match header"; flow:established,to_client; http_raw_body; content:"Expires:"; sid:3; )
alert tcp ( msg:"raw_header should match header"; flow:established,to_client; http_raw_header; content:"Expires:"; sid:4; )
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

