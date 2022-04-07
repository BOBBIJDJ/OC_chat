local component = require("component")
local event = require("event")

print("This program lets you broadcast, send to a specific address or receive any message\n")

local exit_check = true

while exit_check do
    
    print("what do you want to do")
    print("1. broadcast")
    print("2. send")
    print("3. receive")
    print("4. exit")

    local selection = tonumber(io.read())

    if (selection == 1) then
        
        local broadcast_exit_check = true
        local selected_port, message_tobroad, broad_verify, broad_error_choice

        repeat
            
            print("towards which port do you want to broadcast your message?")
        
            selected_port = tonumber(io.read())
        
            print("what message do you want to broadcast?")
    
            message_tobroad = io.read()
    
            broad_verify = component.modem.broadcast(selected_port, message_tobroad)
    
            if broad_verify == true then
                
                print("message broadcasted correctly\n")
    
            elseif broad_verify == false then
    
                print("there was an error")
                print("1. try again")
                print("2. back to the menu")
    
                broad_error_choice = tonumber(io.read())
        
                if broad_error_choice == 1 then
                    
                    broadcast_exit_check = false

                elseif broad_error_choice then

                    break

                end
        
            end

        until (broadcast_exit_check)

    elseif (selection == 2) then

        local sending_exit_check = true
        local selected_port, message_tosend, send_verify, send_error_choice, send_address

        repeat
            
            print("towards which address do you want to send your message?")
        
            send_address = io.read()

            print("which port?")
        
            selected_port = tonumber(io.read())
        
            print("what message do you want to send?")
    
            message_tosend = io.read()
    
            send_verify = component.modem.send(send_address, selected_port, message_tosend)
    
            if send_verify == true then
                
                print("message sent correctly\n")
    
            elseif send_verify == false then
    
                print("there was an error")
                print("1. try again")
                print("2. back to the menu")
    
                send_error_choice = tonumber(io.read())
        
                if send_error_choice == 1 then
                    
                    sending_exit_check = false

                elseif send_error_choice then

                    break

                end
        
            end

        until (sending_exit_check)

    elseif (selection == 3) then

        print("which port do you want to open to receive messages?")

        local selected_port = tonumber(io.read())

        component.modem.open(selected_port)

        local temp0, temp1, sender_address, temp3, temp4, received_message = event.pull("modem")

        print("you received: " .. "\"" .. received_message .. "\"" .. " from: " .. sender_address .. "\n")

        component.modem.close(selected_port)

    elseif (selection == 4) then

        exit_check = false
    
    end


end