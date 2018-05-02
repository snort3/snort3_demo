require('snort_config')

conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

dofile(conf_dir .. '/snort_defaults.lua')

stream = { }
stream_ip = { }
stream_tcp = { }

http_inspect = { }

wizard = default_wizard

data_log = { key = 'http_request_header_event', limit = 1 }

