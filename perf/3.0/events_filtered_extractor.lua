include("events_extractor.lua")

-- filter out all the events by configuring a tenant_id that won't be matched
for _, srv in ipairs(extractor.protocols) do
    srv.tenant_id = 424242
end
