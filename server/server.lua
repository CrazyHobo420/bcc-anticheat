VorpCore = {}
TriggerEvent("getCore", function(core)
    VorpCore = core
end)

-- Function to handle anti-cheat actions
function HandleAntiCheatAction(source, config, reason)
    local _source = source
    local action = config.action or "kick"
    local webhook = config.webhook or ""
    
    -- Always log to Discord if webhook is configured
    if webhook ~= "" then
        local message = ""
        if action == "kick" then
            message = Config.Discord.lang.kick .. reason
        else
            message = Config.Discord.lang.warn .. reason
        end
        Discord.sendMessage(_source, message, webhook)
    end
    
    -- Handle the action
    if action == "kick" then
        DropPlayer(_source, Config.Discord.lang.kick .. reason)
    elseif action == "warn" then
        TriggerClientEvent("vorp:TipRight", _source, reason, 5000)
    end
end

RegisterServerEvent("ac:kick")
AddEventHandler("ac:kick", function(reason, config)
    local _source = source
    HandleAntiCheatAction(_source, config, reason)
end)
