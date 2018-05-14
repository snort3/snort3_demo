require("snort_config")

udp = { enable_gtp = true }

local_rules =
[[
alert ( msg: "DECODE_GTP_MULTIPLE_ENCAPSULATION"; sid: 297; gid: 116; rev: 1; )
]]

ips = { rules = local_rules, }

