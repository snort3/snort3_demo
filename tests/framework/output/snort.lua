require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard = default_wizard

local_rules =
[[
alert tcp ( msg:"one of these would work"; sd_pattern:"TEST"; sid:1000001; rev:1;  )
alert tcp ( msg:"new in 2.8.6.2: second rule works"; sd_pattern:"TEST"; sid:1000002; rev:1;  )
]]

ips =
{
    obfuscate_pii = true,
    rules = local_rules
}
