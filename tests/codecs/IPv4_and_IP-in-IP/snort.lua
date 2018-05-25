require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

default_rules =
[[
alert ip ( sid:1; msg:"1"; fragoffset:0; )
]]

ips =
{
    rules = default_rules,
}



