
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
alert tcp ( msg:"JPG found"; flow:to_server,established; http_uri; content:".JPG"; flowbits:set,jpg.file; flowbits:noalert; sid:111111; )
alert tcp ( msg:"JPG ALERT"; flow:from_server,established; http_stat_code; content:"200"; flowbits:isset,jpg.file; flowbits:unset,jpg.file; sid:222222; )
alert tcp ( msg:"GIF found"; flow:to_server,established; http_uri; content:".GIF"; flowbits:set,gif.file; flowbits:noalert; sid:111112; )
alert tcp ( msg:"GIF ALERT"; flow:from_server,established; http_stat_code; content:"200"; flowbits:isset,gif.file; flowbits:unset,gif.file; sid:222223; )
]]

ips =
{
    enable_builtin_rules = true,
    rules = local_rules,
}



