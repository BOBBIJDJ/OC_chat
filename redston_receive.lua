local component = require("component")
local sides = require("sides")
local event = require("event")

local receive = event.pull
local open_port = component.modem.open
local redstone = component.redstone
local temp0, temp1, temp2, temp3, temp4, received_message

print("from what port do you want to receive data?")

local port = tonumber(io.read())

open_port(port)

while (true) do

    temp0, temp1, temp2, temp3, temp4, received_message = receive("modem")
    
    if (received_message == "call") then
        
        redstone.setOutput(sides.right, 15)

        redstone.setOutput(sides.right, 0)

    end

end