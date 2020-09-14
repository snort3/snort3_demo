
stream = { }
stream_tcp = { }
modbus = { }

binder =
{
    { when = { proto = 'tcp', ports = '502' }, use = { type = 'modbus' }, },
}

local_rules =
[[
alert tcp ( msg:"Should Alert"; modbus_unit: 0; modbus_func: 17; modbus_data; content:"MygloriousModbus", distance 0; sid:1; )
]]

ips = { rules = local_rules, }

