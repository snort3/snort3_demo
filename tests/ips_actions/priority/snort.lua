require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard = default_wizard

smtp =
{
    b64_decode_depth = -1,
    qp_decode_depth = -1,
    bitenc_decode_depth = -1,
    uu_decode_depth = -1,
}

local_rules =
[[
alert tcp any any -> any 25 ( msg:"Lorem Ipsum?"; flow:established,to_server; file_data; content:"sollicitudin",nocase; sid:42000009; rev:1; priority:1; )
]]

ips =
{
    rules = local_rules,
}

