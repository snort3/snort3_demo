
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = { }

stream_tcp = { }

wizard = default_wizard

http_inspect = { }

default_rules =
[[
alert tcp ( msg:"match on GET gif"; flow:established,to_server; http_method; content:"GET"; http_uri; content:"gif"; sid:1; )
alert tcp ( msg:"http headers match"; flow:established,to_server; http_version; content:"1.1";
    http_header: field host; content: "www.walmart.com"; http_header: field accept-language; content: "en-us";
    http_header: field accept; content: "*/*"; http_header: field accept-encoding; content: "gzip";
    http_header: field user-agent; content: "Mozilla"; http_cookie; content: "com.wm.visitor"; sid:2; )
alert tcp ( msg:"raw_body should not match header"; flow:established,to_client; http_raw_body; content:"Expires:"; sid:3; )
alert tcp ( msg:"raw_header should match header"; flow:established,to_client; http_raw_header; content:"Expires:"; sid:4; )
alert tcp ( msg:"response headers match"; flow:established,to_client; http_stat_msg; content:"OK";
    http_header: field date; http_header: field server; content: "Microsoft-IIS"; http_stat_code; content:"200";
    http_header: field Last-Modified; content:"Mar"; http_header: field Etag;
    http_header: field Accept-Ranges; content:"bytes"; http_header: field content-Length; content:"738";
    http_header: field Cache-Control; content:"max-age=7200"; http_header: field Content-Type; content: "image/gif";
    sid:5; )
alert tcp ( msg:"raw body match"; flow:established,to_client; http_raw_body; content:"GIF89aQ"; sid:6; )
alert tcp ( msg:"file data match"; flow:established,to_client; file_data; content:"k!@"; sid:7; )
]]

ips =
{
    enable_builtin_rules = true,
    rules = default_rules,
}

suppress = 
{
   { gid = 129, sid = 9 },
   { gid = 119, sid = 19 },
}

