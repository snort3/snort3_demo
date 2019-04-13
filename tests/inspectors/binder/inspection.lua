
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

sip = { }
stream = { }
stream_udp = { }
binder =
{
    { when = { proto = 'udp', ports = '5060' }, use = { type = 'sip' } }
}
