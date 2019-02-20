---------------------------------------------------------------------------
-- hosts configuration
-- will not match traffic but required to enable associated processing
---------------------------------------------------------------------------

hosts =
{
    {
        ip = '12.34.56.78', frag_policy = 'linux', tcp_policy = 'linux',

        services =
        {
            {  proto = 'tcp', port = 22, name = 'ssh' },
            {  proto = 'tcp', port = 2300, name = 'telnet' },
        }
    }
}

