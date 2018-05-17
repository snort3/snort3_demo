require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

binder =
{   
    {   
        when =
        {   
            service = 'imap',
            proto = 'tcp',
            ports = [[ 143  ]],
        },
        use =
        {   
            type = 'stream_tcp',
        },
    },
    {   
        when =
        {   
            proto = 'tcp',
            ports = '143',
        },
        use =
        {   
            type = 'imap',
        },
    },
}

imap =
{
    bitenc_decode_depth = 15,
}

local_rules =
[[
alert tcp ( msg:"Should Alert - first 7bit part of multi-part message"; flow:established; file_data; content:"This is a multi",distance 0,within 15; sid:1; )
alert tcp ( msg:"Should Not Alert - second 7bit part of multi-part message"; flow:established; file_data; content:"This is a multi-",distance 0,within 16; sid:2; )
]]

ips =
{
    rules = local_rules,
}

