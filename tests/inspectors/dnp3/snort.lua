require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard = default_wizard

dnp3 = { }

local_rules =
[[
alert tcp any any -> any any ( msg:"should not alert"; dnp3_data; content:"missed"; sid:1; )
alert tcp any any -> any any ( msg:"should alert"; dnp3_data; content:"matched"; sid:2; )
alert ( msg:"DNP3_REASSEMBLY_BUFFER_CLEARED"; sid:4; gid:145; rev:1; metadata:rule-type preproc; )
]]

ips =
{
    rules = local_rules,
}

