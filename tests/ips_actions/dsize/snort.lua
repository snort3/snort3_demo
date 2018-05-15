require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

local_rules =
[[
alert udp ( msg:"Big dsize -- badly decoded packet!"; sid:1; dsize:>1000; )
alert udp ( msg:"Small dsize -- properly decoded packet!"; sid:2; dsize:<1000; )
]]

ips =
{
    rules = local_rules,
}

