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
    }
}
