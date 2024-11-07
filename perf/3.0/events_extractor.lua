include("inspect.lua")

extractor =
{
    formatting = 'csv',
    output = 'stdout',
    protocols =
    {
        {
            service = 'http',
            on_events = 'eot',
            fields = 'ts, id.orig_h, id.orig_p, id.resp_h, id.resp_p,'..
                'method, host, uri, user_agent, referrer, origin, version,'..
                'status_code, status_msg, trans_depth'
        },
        {
            service = 'ftp',
            on_events = 'request, response, eot',
            fields = 'ts, id.orig_h, id.orig_p, id.resp_h, id.resp_p,'..
                'uid, command, arg, user, reply_code, reply_msg, file_size,'..
                'data_channel.passive, data_channel.orig_h, data_channel.resp_h, data_channel.resp_p'
        },
    }
}
