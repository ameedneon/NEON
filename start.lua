sudo_Neon = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local Neon_dev = io.open("Neon_online.lua")
if Neon_dev then
Neon_on = {string.match(Neon_dev:read('*all'), "^(.*)/(%d+)")}
local neon_file = io.open("sudo.lua", 'w')
neon_file:write("token = '" ..Neon_on[1].."'\n\nsudo_add = "..Neon_on[2].."" )
neon_file:close()
https.request("https://api.telegram.org/bot"..Neon_on[1].."/sendMessage?chat_id="..Neon_on[2].."&text=Bot_Neon_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf Neon_online.lua')  
os.execute('./tg -s ./Neon.lua $@ --bot='..Neon_on[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ DONE\27[m \27[1;34m»»Now Send Sudo ID««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ DONE\27[m")
local neon_file = io.open("sudo.lua", 'w')
neon_file:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
neon_file:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./Neon.lua $@ --bot='..tokenCk)
else
print("\27[31m»»This TOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
os.execute('cd .. && rm -rf .telegram-cli')
if token and token == "TOKEN" then 
print("\27[1;34m»»Send Your Bot TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
else 
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
sudo_Neon = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('rm -rf Neon.lua')
os.execute('wget https://raw.githubusercontent.com/ameedneon/Neon/master/Neon.lua')
dofile('./Neon.lua')  
os.execute('./tg -s ./Neon.lua $@ --bot='..token)
else
print("\27[31mTOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
