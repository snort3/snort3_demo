require('snort_config')

conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

dofile(conf_dir .. '/snort_defaults.lua')

stream = { }
stream_tcp = { }
http_inspect = { }
wizard = default_wizard

references = default_references
classifications = default_classifications

local_rules = [[
alert tcp ( msg:"Trigger matching content"; file_data; content:"Type: logger";)
]]

ips = {
    rules = local_rules,
} 

log_hext = { }
