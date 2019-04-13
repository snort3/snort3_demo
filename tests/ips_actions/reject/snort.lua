

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = {}
stream_tcp = {}
http_inspect = {}

reject = { reset = "both", control = "all" }

wizard = default_wizard

local_rules =
[[
reject http ( msg:"test uri"; flow:established, to_server; http_method; content:"GET"; sid:1; )
]]

ips =
{
    rules = local_rules,
}

