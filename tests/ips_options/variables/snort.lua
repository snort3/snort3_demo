local_rules =
[[
	alert udp any any -> $NET_VAR any ( gid: 1; sid: 1; msg: "Network variable rule" )
	alert udp any any -> any $PORT_VAR ( gid: 1; sid: 2; msg: "Port variable rule" )
]]

ips = {
	id=1,
	rules = local_rules,
	variables = 
	{
		ports = {
			PORT_VAR = 'any'
		},
		nets = {
			NET_VAR = 'any'
		}
	}
}

stream = {}
stream_udp = {}

binder = {
    { when = { src_nets = '1.1.1.1' }, use = { ips_policy = 'ips_1.lua' } },
    { when = { src_nets = '1.1.1.2' }, use = { ips_policy = 'ips_2.lua' } },
    { when = { src_nets = '1.1.1.3' }, use = { ips_policy = 'ips_3.lua' } },
    { when = { src_nets = '1.1.1.4' }, use = { ips_policy = 'ips_4.lua' } },
}


