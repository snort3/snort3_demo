
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')
dofile('./magic.lua')

stream = {}

stream_tcp =
{
    policy = 'first',
    session_timeout = 180,
}

normalizer = 
{
   tcp = 
   {
       ips = true,
   },
}

ftp_server = default_ftp_server

ftp_client =
{
    bounce = true,
}

ftp_data = {}

wizard = default_wizard

file_id = 
{
    enable_type = true,
    enable_signature = true,
    file_rules = magics,
    trace_type = true,
    trace_signature = true,
    trace_stream = true,
    file_policy = 
    {
       {  when = { sha256 = "9C72F9CC6DA7AB242C7B794C5E0C8B031728D461B923924AFE78D5A79C276CDE" }, use = { verdict = 'block'} },
    }
}

file_log = { log_pkt_time = true, log_sys_time = false }

