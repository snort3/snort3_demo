ips =
{
    rules =
    [[
        alert tcp any any -> any any ( msg: "ALERT_TCP"; gid: 1001; sid: 1000001 )
        alert udp any any -> any any ( msg: "ALERT_UDP"; gid: 1002; sid: 1000002 )
    ]]
}

stream = { }

stream_tcp = { }

stream_udp = { }

wizard =
{
    hexes =
    {
        { service = "foobar", to_server = { "pkt 1" } }
    }
}

binder =
{
    { use = { type = "wizard" } }
}

trace =
{
    output = "stdout",

    ntuple = true,

    modules =
    {
        snort = { inspector_manager = 1 },
        wizard = { all = 1 }
    },

    constraints =
    {
        ip_proto = 17 -- UDP
    }
}

