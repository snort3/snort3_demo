require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

ips = 
{
    rules = "alert udp any any -> any 5060 ( sid:1000001; sip_method:invite1 )",
    enable_builtin_rules = true
}
