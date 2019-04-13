
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

normalizer =
{
    tcp = { },
}

stream = { }

stream_tcp = { }

wizard = default_wizard

ips =
{
    enable_builtin_rules = true,
}

