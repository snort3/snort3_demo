include("inspect.lua")

std_connector = { }

extractor =
{
    formatting = 'csv',
    connector = 'stdout',
    protocols =
    {
        {
            service = 'http',
            on_events = 'eot',
            fields = 'ts, uid, id.orig_h, id.orig_p, id.resp_h, id.resp_p, pkt_num, tenant_id,'..
                'method, host, uri, user_agent, referrer, origin, version,'..
                'status_code, status_msg, trans_depth, request_body_len, response_body_len,'..
                'info_code, info_msg, proxied, orig_filenames, resp_filenames,'..
                'orig_mime_types, resp_mime_types'
        },
        {
            service = 'ftp',
            on_events = 'request, response, eot',
            fields = 'ts, uid, id.orig_h, id.orig_p, id.resp_h, id.resp_p, pkt_num, tenant_id,'..
                'uid, command, arg, user, reply_code, reply_msg, file_size,'..
                'data_channel.passive, data_channel.orig_h, data_channel.resp_h, data_channel.resp_p'
        },
        {
            service = 'conn',
            on_events = 'eof',
            fields = 'ts, uid, id.orig_h, id.orig_p, id.resp_h, id.resp_p, pkt_num, tenant_id,'..
                'duration, proto, service, orig_pkts, resp_pkts'
        },
        {
            service = 'dns',
            on_events = 'response',
            fields = 'ts, uid, id.orig_h, id.orig_p, id.resp_h, id.resp_p, pkt_num, tenant_id,'..
                'proto, trans_id, query, qclass, qclass_name, qtype, qtype_name,' ..
                'rcode, rcode_name, AA, TC, RD, RA, Z, answers, TTLs, rejected, auth, addl'
        },
        {
            service = 'weird',
            on_events = 'builtin',
            fields = 'ts, uid, id.orig_h, id.orig_p, id.resp_h, id.resp_p, pkt_num, tenant_id,'..
                'sid, gid, msg, proto, source'
        },
    }
}
