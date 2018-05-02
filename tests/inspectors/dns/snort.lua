require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream_ip = { }

stream = { }

wizard = default_wizard

dns = { }

ips =
{
    enable_builtin_rules = true,
}

