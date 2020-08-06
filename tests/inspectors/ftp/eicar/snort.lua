dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }
stream_tcp = { }
normalizer = { }
file_id = { }

ftp_server = default_ftp_server
ftp_client = { }
ftp_data = { }

wizard = default_wizard
