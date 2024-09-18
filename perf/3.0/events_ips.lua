ips =
{
    rules =
    [[
        alert udp (sid:1;)
        alert udp (sid:2;)
        alert udp (sid:3;)
        alert udp (sid:4;)
        alert udp (sid:5;)
    ]]
}

alert_csv =
{
    file = false,
    fields = ''
}
