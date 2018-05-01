require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard = default_wizard

smtp =
{
    max_header_line_len = 70,
}

ips =
{
    enable_builtin_rules = true,
}

