if Config.XSS.active then
    AddEventHandler("playerConnecting", function (name, kickreason, deferrals)
        deferrals.defer()

        local _source = source
        local cname = string.gsub(name, "%s+", "")
        deferrals.update(Config.XSS.lang.update)

        if string.find(cname, "<" or ">") then
            deferrals.done(Config.XSS.lang.kick)
            CancelEvent()
            -- For connecting players, we need to handle the action differently
            if Config.XSS.action == "kick" then
                Discord.sendMessage(_source, Config.Discord.lang.kick .. Config.XSS.lang.reason, Config.XSS.webhook)
            elseif Config.XSS.action == "warn" then
                Discord.sendMessage(_source, Config.Discord.lang.warn .. Config.XSS.lang.reason, Config.XSS.webhook)
            else
                Discord.sendMessage(_source, Config.Discord.lang.log .. Config.XSS.lang.reason, Config.XSS.webhook)
            end
        else
            deferrals.done()
        end
    end)
end
