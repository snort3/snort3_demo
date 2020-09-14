
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard = default_wizard

dnp3 = { }

local_rules =
[[
alert tcp any any -> any any ( msg:"Alert using dnp3_data"; dnp3_data; content:"|02 32 01 07 01 eb|"; sid:1; rev:1; )
alert tcp any any -> any any ( msg:"Alert using dnp3_func"; dnp3_func:unsolicited_response; sid:2; rev:1;)
alert tcp any any -> any any ( msg:"Alert using dnp3_ind"; dnp3_ind:"device_restart"; sid:3; rev:1; )
alert tcp any any -> any any ( msg:"Alert using dnp3_obg"; dnp3_obj:group 50 , var 1; sid:4; rev:1;)
]]

ips =
{
    rules = local_rules,
}

