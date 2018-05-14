require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

rewrite = { }

normalizer =
{
    tcp =
    {
        ips = true,
        ecn = 'stream',
    },
}

inspection =
{
    mode = "inline"
}

stream = { }

stream_tcp = { }

wizard = default_wizard

local_rules =
[[
rewrite tcp 10.1.1.87 any -> 10.1.1.0/24 80
(
    sid:1000002; gid:1; rev:1;
    msg:"45921 test 3 replace rule";
    content:"index.php", nocase;
    replace:"indax.php";
)
]]

ips =
{
    rules = local_rules,
}


