local component = require("component")
local sides = require("sides")
local event = require("event")
local computer = require("computer")

local redstone = component.redstone
local receive = event.pull
local temp0, temp1, temp2, temp3, temp4, received_message
local connect = component.modem
local reboot = computer.shutdown

connect.open(9898)

while true do
    
    temp0, temp1, temp2, temp3, temp4, received_message = receive(1, "modem")

    if (received_message == "open") then
        
        redstone.setOutput(sides.back, 15)

        print("door opened")

    elseif (received_message == "close") then
        
        redstone.setOutput(sides.back, 0)

        print("door closed")

    elseif (received_message == "stop") then

        break

    elseif (received_message == "reboot") then

        reboot(true)

    end

end