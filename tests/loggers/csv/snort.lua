
conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

dofile(conf_dir .. '/snort_defaults.lua')
dofile(conf_dir .. '/file_magic.lua')

stream = { }
stream_tcp = { }
http_inspect = { }
wizard = default_wizard

references = default_references
classifications = default_classifications

alert_csv =
{
    fields =
    [[
        action class b64_data dir dst_addr dst_ap dst_port eth_dst eth_len eth_src eth_type
        gid icmp_code icmp_id icmp_seq icmp_type iface ip_id ip_len msg mpls pkt_gen pkt_len
        pkt_num priority proto rev rule seconds service sid src_addr src_ap src_port target
        tcp_ack tcp_flags tcp_len tcp_seq tcp_win timestamp tos ttl udp_len vlan 
    ]]
}

local_rules = [[
alert icmp ( msg:"MALWARE-CNC Win.Trojan.Yoddos outbound indicator"; itype:8; icode:0; content:"YYYYYYYYYYYYYYYYYYYYYYYYYYYY"; metadata:policy balanced-ips drop,policy security-ips drop; reference:url,www.virustotal.com/file-scan/report.html?id=a7f97ed5c064b038279dbd02554c7e555d97f67b601b94bfc556a50a41dae137-1304614426; classtype:trojan-activity; sid:19769; rev:6; )
alert http ( sid:1; file_data; content:"lorem", nocase; )
]]

ips = {
    rules = local_rules
}

