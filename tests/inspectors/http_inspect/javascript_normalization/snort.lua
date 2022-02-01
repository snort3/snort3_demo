dir = os.getenv('SNORT_LUA_PATH')

if ( not dir ) then
    dir = ''
end

dofile(dir .. 'snort_defaults.lua')

stream = {}
stream_tcp = {}
wizard = default_wizard
http_inspect = default_http_inspect

trace = {
    modules = {
        http_inspect = {
            js_dump = 3,
            js_proc = 1
        }
    }
}

ips =
{
    rules = [[
        alert tcp any any -> any any ( msg:"Inline script"; js_data; 
            content:"var var_0000=console.log;var_0001='Hacker  ';function var_0002(){console.log(var_0003(var_0001))}";
            sid:1; )
        
        alert tcp any any -> any any ( msg:"External script"; js_data; 
            content:"function var_0000(var_0001){return `Hello ${var_0001}\nit's ${Date().toLocaleString()}`}"; 
            sid:2; )
    ]]
}