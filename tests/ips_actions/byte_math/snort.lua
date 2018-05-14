require('snort_config')  -- for loading

conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

dofile(conf_dir .. '/snort_defaults.lua')

wizard = default_wizard

local_rules =
[[
alert tcp ( sid:1; msg:"byte_math_valid";
byte_math:oper + , rvalue 10, offset 10, relative, result var, endian big, bytes 1, bitmask 0x12;
content:"|74 63 6c 61|"; byte_test:1, >, var, 16; )
]]

ips =
{
    rules = local_rules,
}
