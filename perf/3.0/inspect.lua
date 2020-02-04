---------------------------------------------------------------------------
-- snort: this config is based on the default but tweaked to match the
-- data sheet perf test configuration
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- configure environment
---------------------------------------------------------------------------


conf_dir = os.getenv('SNORT_LUA_PATH')

if ( not conf_dir ) then
    conf_dir = '.'
end

---------------------------------------------------------------------------
-- configure defaults
---------------------------------------------------------------------------

HOME_NET = 'any'
EXTERNAL_NET = 'any'

include(conf_dir .. '/snort_defaults.lua')
include(conf_dir .. '/file_magic.lua')

---------------------------------------------------------------------------
-- configure stream
---------------------------------------------------------------------------

stream =
{
    ip_frags_only = true,
    udp_cache = { idle_timeout = 3600 },
}

stream_ip = { }

stream_tcp =
{
    policy = 'windows',
    session_timeout = 180,
    overlap_limit = 10,
    require_3whs = 0
}

stream_udp = { session_timeout = 3600 }
stream_icmp = { }

---------------------------------------------------------------------------
-- configure inspection
---------------------------------------------------------------------------

arp_spoof = { }
back_orifice = { }
dnp3 = { }
dns = { }
imap = { }
modbus = { }
pop = { }
rpc_decode = { }
sip = { }
ssh = { }
ssl = { trust_servers = true }
telnet = { }

dce_smb = { }
dce_tcp = { }
dce_udp = { }
dce_http_proxy = { }
dce_http_server = { }

http_inspect = { }
http2_inspect = { }

normalizer = { }

gtp_inspect = default_gtp

port_scan = default_low_port_scan
port_scan.alert_all = false
port_scan.memcap = 25000000

smtp = default_smtp

ftp_server = default_ftp_server
ftp_client = { }
ftp_data = { }

file_id = { file_rules = file_magic }

appid =
{
    app_detector_dir = os.getenv('SNORT_ODP')
}

---------------------------------------------------------------------------
-- configure bindings
---------------------------------------------------------------------------

wizard = default_wizard

binder =
{
    -- port bindings required for protocols without wizard support
    { when = { proto = 'udp', ports = '53', role='server' },  use = { type = 'dns' } },
    { when = { proto = 'tcp', ports = '53', role='server' },  use = { type = 'dns' } },
    { when = { proto = 'tcp', ports = '111', role='server' }, use = { type = 'rpc_decode' } },
    { when = { proto = 'tcp', ports = '502', role='server' }, use = { type = 'modbus' } },
    { when = { proto = 'tcp', ports = '2123 2152 3386', role='server' }, use = { type = 'gtp' } },

    { when = { proto = 'tcp', service = 'dcerpc' }, use = { type = 'dce_tcp' } },
    { when = { proto = 'udp', service = 'dcerpc' }, use = { type = 'dce_udp' } },

    { when = { service = 'netbios-ssn' },      use = { type = 'dce_smb' } },
    { when = { service = 'dce_http_server' },  use = { type = 'dce_http_server' } },
    { when = { service = 'dce_http_proxy' },   use = { type = 'dce_http_proxy' } },

    { when = { service = 'dnp3' },             use = { type = 'dnp3' } },
    { when = { service = 'dns' },              use = { type = 'dns' } },
    { when = { service = 'ftp' },              use = { type = 'ftp_server' } },
    { when = { service = 'ftp-data' },         use = { type = 'ftp_data' } },
    { when = { service = 'gtp' },              use = { type = 'gtp_inspect' } },
    { when = { service = 'imap' },             use = { type = 'imap' } },
    { when = { service = 'http' },             use = { type = 'http_inspect' } },
    { when = { service = 'http2' },            use = { type = 'http2_inspect' } },
    { when = { service = 'modbus' },           use = { type = 'modbus' } },
    { when = { service = 'pop3' },             use = { type = 'pop' } },
    { when = { service = 'ssh' },              use = { type = 'ssh' } },
    { when = { service = 'sip' },              use = { type = 'sip' } },
    { when = { service = 'smtp' },             use = { type = 'smtp' } },
    { when = { service = 'ssl' },              use = { type = 'ssl' } },
    { when = { service = 'sunrpc' },           use = { type = 'rpc_decode' } },
    { when = { service = 'telnet' },           use = { type = 'telnet' } },

    { use = { type = 'wizard' } }
}

include('hosts.lua')

---------------------------------------------------------------------------
-- configure performance
---------------------------------------------------------------------------

latency =
{
    packet = { max_time = 1500 },
    rule = { max_time = 200 },
}

profiler = { }
profiler.modules = { sort = 'total_time' }
profiler.rules = { show = false }

memory = { }

---------------------------------------------------------------------------
-- configure tweaks
---------------------------------------------------------------------------

include('common.lua')

