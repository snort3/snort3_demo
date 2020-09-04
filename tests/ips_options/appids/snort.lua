
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = {}

stream_tcp = {}

wizard = default_wizard

appid =
{
    app_detector_dir = '../../appid_config',
}

local_rules =
[[
alert tcp ( msg:"appid test for smtp application"; appids: "smtp"; sid:2000000; rev:4; )
]]

ips =
{
    rules = local_rules,
}

