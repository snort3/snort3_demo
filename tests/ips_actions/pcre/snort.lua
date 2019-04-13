
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = { }

stream_tcp = { }

http_inspect = { }

wizard = default_wizard

local_rules =
[[
alert tcp ( msg:"PCRE with rawbytes"; flow:established, to_client; pcre:"/HTTP/R"; pcre:"/200/R"; sid:1; )
alert tcp ( msg:"PCRE without rawbytes"; flow:established, to_client; pcre:"/HTTP/R"; pcre:"/200/R"; sid:2; )
]]

ips =
{
    enable_builtin_rules = true,
    rules = local_rules,
}

suppress = {
   { gid = 129, sid = 10 },
}


