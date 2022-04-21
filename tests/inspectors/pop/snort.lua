
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard = default_wizard

pop =
{
    b64_decode_depth = -1,
    qp_decode_depth = 0,
    bitenc_decode_depth = 0,
    uu_decode_depth = 0,
}

local_rules =
[[
alert tcp ( msg:"ALERT"; file_data; content:"<html",within 10; sid:1; gid:1; )
alert ( msg:"POP_B64_DECODING_FAILED"; sid:4; gid:142; rev:1; )
]]

ips =
{
    rules = local_rules,
}

