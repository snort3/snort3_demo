
include(os.getenv('POLICY'))

dofile('common.lua')

-- overrides
stream_tcp.require_3whs = 0
search_engine.detect_raw_tcp = true

