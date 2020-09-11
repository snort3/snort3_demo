stream = { }
stream_file = { }

ips =
{
    rules = [[ alert file ( sid:1; file_data; content:"PDF-1.3"; ) ]]
}

alert_csv =
{
    -- avoids timestamps which is current time
    fields = "pkt_num proto pkt_gen pkt_len dir src_ap dst_ap rule action"
}

