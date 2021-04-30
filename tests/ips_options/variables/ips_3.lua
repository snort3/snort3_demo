ips = {
	id=4,
	states = 
	[[
		alert ( gid:1;sid:1;enable:yes; )
        alert ( gid:1;sid:2;enable:yes; ) 
	]],
	variables = 
	{
		ports = { -- individual values: alert only if destination is this ip/port
			PORT_VAR = '30'
		},
		nets = {
			NET_VAR = '1.1.1.3'
		}
	}
}