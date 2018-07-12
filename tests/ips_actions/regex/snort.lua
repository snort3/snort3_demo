
require('snort_config')  -- for loading

stream = { }

local_rules =
[[
    alert tcp ( sid:2; msg:"regex"; 
        regex:"^transfer-encoding\h*:\h*chunked\r$", nocase, multiline, fast_pattern; )
]]

ips = { rules = local_rules }

