require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

local_rules =
[[
alert tcp (msg: "byte_jump - post_offset passing negative value"; content:"START"; byte_extract:1,0,myvar,relative; byte_jump:0,2, relative, post_offset -1; byte_test:1,=,45,0,relative; sid:10003;)
]]

ips =
{
    rules = local_rules,
}
