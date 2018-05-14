require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = {}

stream_tcp = { }

wizard = default_wizard

http_inspect = { }

default_rules =
[[
alert tcp ( msg:"post_var"; flow:established,to_server; http_client_body; content:"fname=val"; sid:1; )
]]

ips =
{
    enable_builtin_rules = true,
    rules = default_rules,
}

suppress = {
   { gid = 119, sid = 27 },
}

