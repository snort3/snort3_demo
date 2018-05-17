require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard = default_wizard

stream_udp = { }

appid =
{
    app_detector_dir = '../../appid_config',
}

local_rules =
[[
alert udp ( msg:"openAppId: test for app kerberos"; appids:"Kerberos"; sid:18761; rev:4; )
]]

ips =
{
    rules = local_rules,
}

