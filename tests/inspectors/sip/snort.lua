
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_udp = { }

wizard = default_wizard

sip =
{
    max_content_len = 100,
}

ips =
{
    enable_builtin_rules = true,
}
