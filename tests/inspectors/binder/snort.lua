require("snort_config")

dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

binder =
{
    { when = { nets = "10.0.0.0/8" }, use = { ips_policy = "ips.lua" } },
    { when = { nets = "10.0.0.0/8" }, use = { inspection_policy = "inspection.lua" } },
}
