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
            proto = 'tcp',
            ports = '139 445 1025',
        },
        use =
        {
            type = 'dce_smb',
        },
    },
}

dce_smb = { }

local_rules =
[[
alert tcp any any -> any [445,139] ( msg:"NetshareEnum client alert"; dce_iface:uuid 4b324fc8-1670-01d3-1278-5a47bf6ee188; dce_opnum:"15"; dce_stub_data; content:"1|00|9|00|2|00|.|00|1|00|6|00|8",distance 16,within 13; sid:1; )
alert tcp any [445,139] -> any any ( msg:"NetshareEnum server alert"; dce_iface:uuid 4b324fc8-1670-01d3-1278-5a47bf6ee188; dce_opnum:"15"; dce_stub_data; sid:2; )
alert ( msg:"DCE2_EVENT__SMB_DCNT_ZERO"; sid:48; gid:133; rev:1; metadata:rule-type preproc,service dcerpc; )
]]

ips =
{
    rules = local_rules,
}


