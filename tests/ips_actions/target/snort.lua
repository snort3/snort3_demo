
conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

dofile(conf_dir .. '/snort_defaults.lua')

stream = { }

ips =
{
    rules =
    [[
        alert tcp ( sid:1; )
        alert tcp ( sid:2; target:src_ip; )
        alert tcp ( sid:3; target:dst_ip; )
    ]]
}

alert_csv = { fields = 'rule src_ap dst_ap target' }

