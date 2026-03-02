
stream = { }
stream_tcp = { }

local_rules =
[[
alert tcp ( msg:"REM ALERT"; rem:"This is a rem test"; sid:1)
]]

ips =
{
    rules = local_rules,
}

