dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

http_inspect =
{
    response_depth = -1,
    ignore_unreserved = 'something',
    bad_characters = '0xa 0xd 0x0 0x23 0x24 0x25 0x26 0x27 0x28 0x29'
}

stream = { }
stream_ip_1 = { }
stream_tcp = { }
stream_udp = { }

normalizer =
{
    tcp = { ips = true }
}

gtp_inspect = default_gtp
wizard = default_wizard

binder =
{
    {
        when =
        {
            service = 'http'
        },
        use =
        {
            type = 'http_inspect'
        }
    },
    {
        when =
        {
            service = 'ftp',
            proto = 'tcp',
            ports = [[ 21 23 25 42 53 80 110 111 135 136 137 139 143 445 513
                514 1433 1521 2401 3306 ]]
        },
        use =
        {
            type = 'stream_tcp'
        }
    },
    {
        when =
        {
            service = 'dns',
            proto = 'tcp',
            ports = [[ 21 23 25 42 53 80 110 111 135 136 137 139 143 445 513
                514 1433 1521 2401 3306 ]]
        },
        use =
        {
            type = 'stream_tcp'
        }
    },
    {
        when =
        {
            proto = 'udp'
        },
        use =
        {
            type = 'stream_udp'
        }
    },
    {
        when =
        {
            proto = 'udp',
            ports = '2123 3386 2152'
        },
        use =
        {
            type = 'gtp_inspect'
        }
    },
    {
        when =
        {
            proto = 'ip',
            nets = '10.1.47.0/24 172.16.8.0/24'
        },
        use =
        {
            type = 'stream_ip',
            name = 'stream_ip_1'
        }
    },
    {
        use =
        {
            type = 'wizard'
        }
    }
}

data_log =
{
    key = 'http_request_header_event',
    limit = 100
}

domain_filter =
{
    hosts = 'localhost packettracker.com',
    file = 'hosts.txt'
}
