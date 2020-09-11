
stream = { }

stream_tcp = { }

ips = { rules = [[
alert tcp ( msg:"PCRE"; flow:established, to_client; content:"HTTP"; pcre:"/200/R"; sid:1; )
]] }

