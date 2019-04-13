
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream_ip = { }

stream = { }

stream_tcp = { }

wizard =
{
    curses = {'dce_tcp'},
}

dce_tcp =
{
    policy = 'Win7',
}

