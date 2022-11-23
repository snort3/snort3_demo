dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

include(dir .. '/snort_defaults.lua')

stream = { }
stream_tcp = { }
http_inspect = { }
wizard = default_wizard
