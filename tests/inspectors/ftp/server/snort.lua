
dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = '.'
end

dofile(dir .. '/snort_defaults.lua')

stream = { }

stream_tcp = { }

stream_ip = { }

ftp_server =
{
    ftp_cmds = [[ USER PASS ACCT CWD SDUP SMNT QUIT REIN PORT PASV TYPE STRU
        MODE RETR STOR STOU APPE ALLO REST RNFR RNTO ABOR DELE RMD MKD PWD
        LIST NLST SITE SYST STAT HELP NOOP AUTH ADAT PROT PBSZ CONF ENC FEAT
        OPTS CEL CMD MACB MDTM REST SIZE MLST MLSD EPSV MACB XCWD XCUP
        XMKD XRMD TEST CLNT UTF8 ]],
    chk_str_fmt = 'USER PASS RNFR RNTO SITE MKD',
    cmd_validity =
    {
        {
            command = 'CWD',
            length = 200,
        },
        {
            command = 'MODE',
            format = '< char ASBCZ >',
        },
        {
            command = 'MDTM',
            format = '< [ date nnnnnnnnnnnnnn[.n[n[n]]] ] string >',
        },
    },
}

ftp_client = { }

ftp_data = { }

wizard = default_wizard

ips =
{
    enable_builtin_rules = true,
}

