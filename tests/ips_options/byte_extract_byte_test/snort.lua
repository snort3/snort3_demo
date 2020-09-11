
conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

dofile(conf_dir .. '/snort_defaults.lua')
dofile(conf_dir .. '/file_magic.lua')

stream = { }
stream_tcp = { }

local_rules =
[[
alert tcp ( msg:"bitmask_IT #  byte_extract with bitmask value and byte_test without bitmask value in rule"; byte_extract:4,0,VALUE,bitmask 0xFF8000; byte_test:3,<,VALUE,03)
alert tcp ( sid:1; msg:"bitmask_IT #  byte_extract with bitmask value and byte_test with bitmask value in rule. "; byte_extract:1,0,offset,bitmask 0xFF; byte_extract:1,1,value,bitmask 0x16; byte_test:1,=,value,offset,bitmask 0x16;  )
]]

ips =
{
    rules = local_rules,
}
