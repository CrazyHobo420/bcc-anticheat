-- Credit: Badger -- Updated by Hobo
if Config.Keys.active then
    Citizen.CreateThread(function()
        while true do
            Wait(0);
            local blacklistedKeys = Config.Keys.list;

            for i = 1, #blacklistedKeys do
                local keyCombo = blacklistedKeys[i][1];
                local keyStr = blacklistedKeys[i][2];

                if #keyCombo == 1 then
                    local key1 = keyCombo[1];
                    if IsControlJustReleased(0, key1) then
                        print("Key violation detected: " .. keyStr) -- Debug log
                        TriggerServerEvent("ac:kick", Config.Keys.lang.kickreason .. ': ' .. keyStr, Config.Keys)
                    end
                elseif #keyCombo == 2 then
                    local key1 = keyCombo[1];
                    local key2 = keyCombo[2];
                    if IsControlPressed(0, key1) and IsControlPressed(0, key2) then
                        print("Key combination violation detected: " .. keyStr) -- Debug log
                        TriggerServerEvent("ac:kick", Config.Keys.lang.kickreason .. ': ' .. keyStr, Config.Keys)
                        Wait(20000); -- Wait 20 seconds
                    end
                elseif #keyCombo == 3 then
                    local key1 = keyCombo[1];
                    local key2 = keyCombo[2];
                    local key3 = keyCombo[3];
                    if IsControlPressed(0, key1) and IsControlPressed(0, key2) and IsControlPressed(0, key3) then
                        print("Three-key combination violation detected: " .. keyStr) -- Debug log
                        TriggerServerEvent("ac:kick", Config.Keys.lang.kickreason .. ': ' .. keyStr, Config.Keys)
                    end
                    Wait(20000); -- Wait 20 seconds
                
                    local key1 = keyCombo[1];
                    local key2 = keyCombo[2];
                    local key3 = keyCombo[3];
                    local key4 = keyCombo[4];
                    if IsControlPressed(0, key1) and IsControlPressed(0, key2) and IsControlPressed(0, key3) and IsControlPressed(0, key4) then
                        print("Four-key combination violation detected: " .. keyStr) -- Debug log
                        TriggerServerEvent("ac:kick", Config.Keys.lang.kickreason .. ': ' .. keyStr, Config.Keys)
                    end
                    Wait(20000); -- Wait 20 seconds
                end
            end
        end
    end)
end


