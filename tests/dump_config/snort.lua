normalizer = { tcp = { ips = true } }

default_wizard =
{
    spells =
    {
        { service = 'imap', proto = 'tcp', client_first = false,
          to_client = { '** OK', '** BYE', '** PREAUTH' } },

        { service = 'smtp', proto = 'tcp', client_first = true,
          to_server = { 'HELO', 'EHLO' },
          to_client = { '220*SMTP', '220*MAIL' } },
    },
    hexes =
    {
        { service = 'dnp3', proto = 'tcp', client_first = true,
          to_server = { '|05 64|' }, to_client = { '|05 64|' } },

        { service = 'ssl', proto = 'tcp', client_first = true,
          to_server = { '|16 03|' }, to_client = { '|16 03|' } },
    }
}

file_log = { }

file_magic =
{
    {
        id = 273,
        type = 'EICAR',
        msg = 'Standard Anti-Virus Test File',
        rev = 1,
        magic = { { content = '| 58 35 4F 21 50 25 |', offset = 0 } }
    }
}

local_file_policy =
{
    { when = { file_type_id = 273 },
      use = { verdict = "reset", enable_file_type = true } }
}

file_id =
{
    file_rules = file_magic,
    file_policy = local_file_policy
}

stream_tcp =
{
    show_rebuilt_packets = true,
    no_ack = true,
    small_segments = { count = 0, maximum_size = 0 }
}

http_inspect = {}

ips = { enable_builtin_rules = true }

wizard = default_wizard

gtp_msg =
{
    { type = 1, name = "echo_request" },
    { type = 2, name = "echo_response" },
    { type = 3, name = "version_not_supported" },
    { type = 4, name = "node_alive_request" },
    { type = 5, name = "node_alive_response" },
    { type = 6, name = "redirection_request" },
    { type = 7, name = "redirection_response" },
}

gtp_info =
{
    { type = 1, name = "cause", length = 2 },
    { type = 2, name = "imsi", length = 9 },
    { type = 3, name = "rai", length = 7 },
    { type = 4, name = "tlli", length = 5 },
    { type = 5, name = "p_tmsi", length = 5 },
    { type = 6, name = "qos", length = 4 },
}

gtp_inspect =
{
    { version = 0, messages = gtp_msg, infos = gtp_info },
}

binder =
{
    { when = { ports = '80' },
      use = { type = 'http_inspect' } },
    { when = { ports = '2123 3386', },
      use = { type = 'gtp_inspect' } },
    { when = { },
      use = { type = 'stream_tcp' } },
}

trace =
{
    modules = { all = 1 }
}
