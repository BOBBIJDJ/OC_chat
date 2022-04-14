local component = require("component")
local sides = require("sides")
local event = require("event")
local computer = require("computer")

local receive = event.pull
local connect = component.modem
local redstone = component.redstone
local temp0, temp1, temp2, temp3, temp4, received_message
local reboot = computer.shutdown

local clock = os.clock
local function sleep(n)
    local t0 = clock()
    while clock() - t0 <= n do 
    
    end
end

print("what port do you want to use?")

local port = tonumber(io.read())

connect.open(port)

while (true) do

    if (redstone.getInput(sides.left) ~= 0) then

        connect.broadcast(port, "go_up")

    end
    
    temp0, temp1, temp2, temp3, temp4, received_message = receive(3, "modem")

    if (received_message == "go_down") then
        
        redstone.setOutput(sides.right, 15)

        sleep(1)

        redstone.setOutput(sides.right, 0)

    elseif (received_message == "stop") then

        return

    elseif (received_message == "reboot") then

        reboot(true)

    else

    end

end