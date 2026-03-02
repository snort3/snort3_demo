
inspection = { id = 2 }

stream = { }
stream_udp = { }
sip = { }

binder =
{
    { when = { proto = 'udp', ports = '5060' }, use = { type = 'sip' } }
}

