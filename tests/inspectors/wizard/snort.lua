stream = { }

stream_tcp = { }

stream_udp = { }

wizard =
{
    spells =
    {
        { service = 'tcp', to_client = { 's2c' }, proto = 'tcp' },
        { service = 'udp', to_server = { 'c2s' }, proto = 'udp' },
        { service = 'ini', to_server = { 'hi*' },               },
    },
    hexes =
    {
        { service = 'foobar', to_server = { '|66 6f 6f 62 61 72|' } },
        { service = 'anyelf', to_server = { '????|7f|ELF?' } },
    }
}

trace =
{
    modules = { wizard = { all = 1 } }
}

binder =
{
    { use = { type = 'wizard' } }
}
