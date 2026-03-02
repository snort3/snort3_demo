
default_rules =
[[
alert ip ( msg:"Contains an IP layer";  gid:1; sid:1; )
]]

ips =
{
    rules = default_rules,
}

