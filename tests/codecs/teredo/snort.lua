
stream = { }
stream_tcp = { }

local_rules =
[[
alert tcp ( sid:1; msg:"tunnel"; content:"teredo tunnel"; )
]]

ips =
{
    rules = local_rules,
    enable_builtin_rules = true
}
