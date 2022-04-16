local component = require("component")
local sides = require("sides")

local connect = component.modem

while true do
    
    print("what do you want to do?")
    print("1. open")
    print("2. close")
    print("3. stop")
    print("4. reboot")
    
    local selection = tonumber(io.read())
    
    if (selection == 1) then
    
        connect.broadcast(9898, "open")
        
    elseif (selection == 2) then
    
        connect.broadcast(9898, "close")
    
    elseif (selection == 3) then
    
        connect.broadcast(9898, "stop")
    
    elseif (selection == 4) then
    
        connect.broadcast(9898, "reboot")
    
    end

end