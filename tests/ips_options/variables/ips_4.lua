ips = {
	id=5,
	states = 
	[[
		alert ( gid:1;sid:1;enable:yes; )
        alert ( gid:1;sid:2;enable:yes; ) 
	]],
	variables = 
	{
		ports = { -- any - alert regardless of the destination ip/port
			PORT_VAR = 'any'
		},
		nets = {
			NET_VAR = 'any'
		}
	}
}