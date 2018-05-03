require('snort_config')

conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

dofile(conf_dir .. '/snort_defaults.lua')

stream = { }
stream_user = { }
http_inspect = { }

wizard = default_wizard

ips =
{
    rules = [[ alert http ( sid:2; http_uri; content:"trigger"; ) ]]
}

alert_csv =
{
    -- avoids timestamps which is current time
    fields = "pkt_num proto pkt_gen pkt_len dir src_ap dst_ap rule action"
}

