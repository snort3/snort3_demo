
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
alert tcp (msg:"PROTOCOL-SCADA IEC104 M_SP_NA_1 message detected";content:"|68|", depth 1;iec104_asdu_func:M_SP_NA_1;sid:1000000;)
alert tcp (msg:"PROTOCOL-SCADA IEC104 M_PS_NA_1 message detected";content:"|68|", depth 1;iec104_asdu_func:m_ps_na_1;sid:1000001;)
]]

ips = { 
	rules = local_rules,
	enable_builtin_rules = true,
}