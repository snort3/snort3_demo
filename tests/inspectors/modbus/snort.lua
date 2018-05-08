require("snort_config")

stream = { }
stream_tcp = { }
modbus = { }
--wizard = default_wizard

binder =
{
    { when = { proto = 'tcp', ports = '502' }, use = { type = 'modbus' }, },
}

local_rules =
[[
alert tcp ( msg:"Should Alert"; modbus_data; content:"Modbus", distance 0; sid:1; )
]]

ips = { rules = local_rules, }

