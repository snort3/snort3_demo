
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

default_rules =
[[
alert ip ( msg:"Contains an IP layer";  gid:1; sid:1; )
]]

ips =
{
    rules = default_rules,
}


