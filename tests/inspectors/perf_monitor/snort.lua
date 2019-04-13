
conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

perf_monitor = 
{
    output = 'file',
    format = 'text',
    packets = 1,
    seconds = 1,
    modules = { { name = 'daq' } }
}
