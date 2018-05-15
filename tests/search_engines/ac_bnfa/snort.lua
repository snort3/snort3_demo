
require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = {}
stream_tcp = {}

wizard = default_wizard

http_inspect =
{
    max_javascript_whitespaces = 65535,
    normalize_javascript = true
}

local_rules =
[[
alert tcp ( msg:"JS NORM 1"; sid:1; file_data; content:"snort team"; )
]]

ips =
{
    enable_builtin_rules = true,
    rules = local_rules,
}

suppress = {
   { gid = 129, sid = 9 },
   { gid = 119, sid = 19 },
}

search_engine = { search_method = 'ac_bnfa' }

