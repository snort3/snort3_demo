require('snort_config')

TEST_NET = [[1.1.1.1 2.2.2.2]]
TEST_PORTS = [[80,8080]]

conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

dofile(conf_dir .. '/snort_defaults.lua')
dofile(conf_dir .. '/file_magic.lua')

stream = { }
stream_icmp = { }
stream_tcp = { }
stream_udp = { }

wizard = default_wizard

local_rules = 
[[
alert icmp (msg:LOGGER"; sid:4)
alert tcp (msg:"LOGGER"; sid:3)
react udp ( msg:"ACTIVE UDP TEST"; sid:1;)
react tcp ( msg:"ACTIVE TCP TEST"; sid:2;)
]]

ips = 
{ 
    enable_builtin_rules = true, 
    rules = local_rules,
}

react = { }

log_codecs = { file = true ,msg = true}
unified2 = { }
log_pcap = { }
alert_full = { file = true }
