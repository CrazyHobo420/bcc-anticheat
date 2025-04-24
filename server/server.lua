VorpCore = {}
TriggerEvent("getCore", function(core)
    VorpCore = core
    print("VORP Core initialized successfully")
end)

-- Function to handle anti-cheat actions
function HandleAntiCheatAction(source, config, reason)
    local _source = source
    local action = config.action or "kick"
    local webhook = config.webhook or ""
    
    print("Handling anti-cheat action for player " .. _source .. " with action: " .. action .. " and reason: " .. reason)
    
    -- Always log to Discord if webhook is configured
    if webhook ~= "" then
        local message = ""
        if action == "kick" then
            message = Config.Discord.lang.kick .. reason
        else
            message = Config.Discord.lang.warn .. reason
        end
        print("Sending Discord message: " .. message)
        Discord.sendMessage(_source, message, webhook)
    end
    
    -- Handle the action
    if action == "kick" then
        print("Kicking player " .. _source .. " for: " .. reason)
        DropPlayer(_source, Config.Discord.lang.kick .. reason)
    elseif action == "warn" then
        print("Warning player " .. _source .. " for: " .. reason)
        if VorpCore then
            TriggerClientEvent("vorp:TipRight", _source, reason, 5000)
        else
            print("VORP Core not initialized, using fallback warning")
            TriggerClientEvent("chat:addMessage", _source, {
                color = {255, 0, 0},
                multiline = true,
                args = {"Anti-Cheat", reason}
            })
        end
    end
end

RegisterServerEvent("ac:kick")
AddEventHandler("ac:kick", function(reason, config)
    local _source = source
    print("Received ac:kick event from player " .. _source .. " with reason: " .. reason)
    HandleAntiCheatAction(_source, config, reason)
end)
