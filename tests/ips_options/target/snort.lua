
stream = { }

ips =
{
    rules =
    [[
        alert tcp ( sid:1; )
        alert tcp ( sid:2; target:src_ip; )
        alert tcp ( sid:3; target:dst_ip; )
    ]]
}

alert_csv = { fields = 'rule src_ap dst_ap target' }

