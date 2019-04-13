
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

stream_ip = { }

telnet = { }

ftp_server = default_ftp_server

ftp_client =
{
    bounce = true,
}

ftp_data = { }

wizard = default_wizard

ips =
{
    enable_builtin_rules = true,
}

