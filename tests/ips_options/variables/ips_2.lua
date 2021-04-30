ips = {
	id=3,
	states = 
	[[
		alert ( gid:1;sid:1;enable:yes; )
        alert ( gid:1;sid:2;enable:yes; ) 
	]],
	variables = 
	{
		ports = { -- blacklist sets: alert when destination is any except for the following
			PORT_VAR = '![10, 20]'
		},
		nets = {
			NET_VAR = '![1.1.1.1, 1.1.1.2]'
		}
	}
}