json = require("json")

read = function(path)
    local f = assert(io.open(path, "r"))
    local content = f:read("*all")
    f:close()
    return content
end

_G = json.parse(read("dump1.json"))
