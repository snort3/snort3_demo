dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = { }

stream_tcp = { } 

wizard = default_wizard

http_inspect = { }
http2_inspect = { }

default_rules =
[[
alert tcp ( msg:"HTTP/2 http_uri match"; http_uri; content:"darkpig",fast_pattern; sid:1;)
alert tcp ( msg:"status code match"; http_stat_code; content:"200"; sid:2; )
alert tcp ( msg:"raw header match"; http_raw_header; content:"nginx/1.16.0"; sid:3; )
alert tcp ( msg:"HTTP/2 fast pattern file data match in another stream"; flow:established,to_client; file_data; content:"EICAR",fast_pattern; metadata: service http2; sid:4; )
]]
normalizer = {}

ips =
{
    enable_builtin_rules = true,
    rules = default_rules,
}
