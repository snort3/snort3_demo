
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. '/snort_defaults.lua')

stream = { }
stream_tcp = { }

wizard = default_wizard

hash_rules =
[[
alert tcp any any -> any 8 (
    sid:3; msg:"3"; content:"For";
    sha256:"|f1412386aa8db2579aff2636cb9511cacc5fd9880ecab60c048508fbe26ee4d9|",
        length 7, relative, offset 2;
    content:"|d a|", distance 0, within 2;
)
alert tcp any any -> any 8 (
    sid:5; msg:"5"; content:"For";
    sha512:"|502b6772333c9f8ba18bf4b9cb47c81d1b931660e7a7a51d7b42ccf9179ea34e4d852466e1101249dbc3da32b121bf83427b0237dce1870e5e1a5b04db524cfb|",
        length 7, relative, offset 2;
    content:"|d a|", distance 0, within 2;
)
alert tcp any any -> any 8 (
    sid:4; msg:"4"; content:"For";
    sha256:"|ec71c288cc73d5db4d0f8f56014982f7bdff52a7a1254e669c4b02d0084cfcb0|",
        length 9, offset 56;
    content:"|d a|", distance 0, within 2;
)
alert tcp any any -> any 8 (
    sid:6; msg:"6"; content:"For";
    sha512:"|631b2b91f0f113cddec2267faf4175f8191295b1046d8d39401dbf8d54066506791a607fb86549673fc1d720580cb5839eaeee7cf76fc77c384aa1c33b6179ec|",
        length 9, offset 56;
    content:"|d a|", distance 0, within 2;
)
]]

ips = { rules = hash_rules }

search_engine = { detect_raw_tcp = true }

