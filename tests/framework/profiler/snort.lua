
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

pop =
{
    qp_decode_depth = 15,
}

wizard = default_wizard

local_rules =
[[
alert tcp ( msg:"FIRST MIME ATTACHMENT"; file_data; content:"RIFF"; content:"AVI ",distance 4,within 4; content:"strf"; sid:1; )
alert tcp ( msg:"Traffic MkI"; content:"AVI"; sid:2; )
alert tcp ( msg:"Traffic MkII"; content:"RIFF"; sid:3; )
alert tcp ( msg:"FIRST MIME ATTACHMENT"; file_data; content:"RIFF"; content:"MPG ",distance 4,within 4; content:"strf"; sid:4; )
]]

ips =
{
    enable_builtin_rules = true,
    rules = local_rules,
}

profiler =
{
    rules = { count = 2, sort = 'checks' },
    modules = { show = false },
    memory = { show = false }
}
