
stream = { }
stream_tcp = { }
iec104 = { }

binder =
{
    { when = { proto = 'tcp', ports = '2404' }, use = { type = 'iec104' }, },
}

trace =
{
    modules = { iec104 = { all = 1 } }
}

local_rules =
[[
alert tcp (msg:"PROTOCOL-SCADA IEC104 APCI Type U";content:"|68|", depth 1;iec104_apci_type:U;sid:1000000;)
alert tcp (msg:"PROTOCOL-SCADA IEC104 APCI Type S";content:"|68|", depth 1;iec104_apci_type:S;sid:1000001;)
alert tcp (msg:"PROTOCOL-SCADA IEC104 APCI Type I";content:"|68|", depth 1;iec104_apci_type:I;sid:1000002;)
]]

ips = { 
	rules = local_rules,
	enable_builtin_rules = true,
}