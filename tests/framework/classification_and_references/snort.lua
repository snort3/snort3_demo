
conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

dofile(conf_dir .. '/snort_defaults.lua')

stream = { }
stream_udp = { }
sip = { }

wizard = default_wizard

references = default_references
classifications = default_classifications

local_rules = 
[[
alert udp $EXTERNAL_NET any -> $HOME_NET 5060 ( msg:"PROTOCOL-VOIP Digium Asterisk invite malformed SDP denial of service attempt"; flow:to_server; sip_method:invite; sip_header; content:"INVITE",depth 6,nocase; content:"INVITE",distance 0,nocase; sip_body; content:"c=IN IP",nocase; content:"c=IN IP",distance 0,nocase; byte_test:10,>,255,1,relative,string,dec; service:sip; reference:bugtraq,23031; reference:cve,2007-1561; classtype:attempted-dos; sid:23966; rev:4; )

alert udp $EXTERNAL_NET any -> $HOME_NET 5060 ( msg:"invite"; flow:to_server; sip_method:invite; sip_header; content:"INVITE"; )
]]

ips = 
{ 
    enable_builtin_rules = true,
}

