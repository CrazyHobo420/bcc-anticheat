if Config.KickOnResourceStop.active then
    AddEventHandler("onResourceStop", function(resourceName)
        if resourceName == GetCurrentResourceName() then
            return
        end
        TriggerServerEvent("ac:kick", Config.KickOnResourceStop.lang.kickreason, Config.KickOnResourceStop)
    end)
end
