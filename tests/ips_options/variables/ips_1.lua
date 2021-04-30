ips = {
	id=2,
	states = 
	[[
		alert ( gid:1;sid:1;enable:yes; )
        alert ( gid:1;sid:2;enable:yes; ) 
	]],
	variables = 
	{
		ports = { -- whitelist sets: alert when destination is any of the following
			PORT_VAR = '[10, 20]'
		},
		nets = {
			NET_VAR = '[1.1.1.1, 1.1.1.2]'
		}
	}
}