
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

ips = { 
	enable_builtin_rules = true,
}