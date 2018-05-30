require('snort_config')  -- for loading

conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

dofile(conf_dir .. '/snort_defaults.lua')
dofile(conf_dir .. '/file_magic.lua')


stream = { }
stream_ip = { }
stream_icmp = { }
stream_tcp = { }

detection = {trace = 0x16}

local_rules =
[[
# byte_math * oper with content 
# first byte is "1"
alert tcp (byte_math:bytes 1,offset 0,oper *, rvalue 10, result var1,string dec;
 content:"foo", offset var1; sid:1)

# byte_math + oper with byte extract and content
# VAL = 1, byte_math = 0 + 10 
alert tcp ( byte_extract: 1, 0, VAL, string, dec; 
byte_math:bytes 1,offset VAL,oper +, rvalue 10, result var1, string dec;
 content:"foo", offset var1; sid:3)

alert tcp (content:"AAAAA"; byte_jump:2,0,relative; 
 content:"foo", within 3; sid:2)
]]

ips =
{
    rules = local_rules,
}
