
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard = default_wizard

http_inspect = { }

default_rules =
[[
alert tcp ( msg:"File_Data_Matched"; file_data; pcre:"/XML Heap Corruption/iR"; sid:11111; )
]]

ips =
{
    enable_builtin_rules = true,
    rules = default_rules,
}

suppress = 
{
   { gid = 129, sid = 10 },
}

file_id = 
{
    rules_file = dir .. '/file_magic.rules',
    trace_type = true,
    trace_signature = true,
    trace_stream = true,
}

file_policy = 
{
    enable_type = true,
    enable_signature = true,
    enable_capture = true,
    rules =
    {
      {  when = { file_type_id = 288 }, use = { verdict = 'log', enable_file_signature = true } },
      {  when = { sha256 = "6F26E721FDB1AAFD29B41BCF90196DEE3A5412550615A856DAE8E3634BCE9F7A" }, use = { verdict = 'block'} },
   }
}

file_log = { log_pkt_time = true, log_sys_time = false }
