
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard = default_wizard

reputation =
{
    memcap = 1,
    priority = 'allowlist',
    blocklist = 'ip.blocklist',
}

sip = { }

ips =
{
    enable_builtin_rules = true,
}
