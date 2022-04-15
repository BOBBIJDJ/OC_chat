local component = require("component")
local sides = require("sides")

local redstone = component.redstone

local clock = os.clock
local function sleep(n)
    local t0 = clock()
    while clock() - t0 <= n do 
    
    end
end

redstone.setOutput(sides.back, 15)

print("door opened")

sleep(3)

redstone.setOutput(sides.back, 0)

print("door closed")