require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream_ip = { }

stream = { }

stream_tcp = { }

wizard =
{
    curses = {'dce_smb'},
}

dce_smb =
{
    policy = 'Win7',
}

local_rules =
[[
alert tcp any any -> any 445 ( msg:"NetShareEnumAll alert"; flow:to_server,established; dce_iface:uuid 4b324fc8-1670-01d3-1278-5a47bf6ee188,version =3; dce_opnum:"15"; dce_stub_data; content:"|01 00 00 00 09 00 00 00 00 00 00 00 09 00 00 00 5c 00 5c 00 53 00 45 00 52 00 56 00 45 00 52 00 00 00 00 00 02 00 00 00 02 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 ff ff ff ff 00 00 00 00|",distance 0; sid:1; )
]]

ips =
{
    rules = local_rules,
}



