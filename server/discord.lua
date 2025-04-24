Discord = {}

function Discord.sendMessage(source, message, customWebhook)
    if not Config.Discord.active then return end
    
    local webhook = customWebhook or Config.Discord.webhook
    if webhook == "" then return end
    
    local _source = source
    local name = GetPlayerName(_source)
    local steam = GetPlayerIdentifier(_source, 0)
    local discord = GetPlayerIdentifier(_source, 1)
    local ip = GetPlayerEndpoint(_source)
    local user = VorpCore.getUser(_source)
    local character = user.getUsedCharacter
    
    local embeds = {
        {
            ["title"] = "Anti Cheat",
            ["type"] = "rich",
            ["description"] = message,
            ["color"] = 16711680,
            ["fields"] = {
                {
                    ["name"] = "Player",
                    ["value"] = name,
                    ["inline"] = true
                },
                {
                    ["name"] = "Steam",
                    ["value"] = steam,
                    ["inline"] = true
                },
                {
                    ["name"] = "Discord",
                    ["value"] = discord,
                    ["inline"] = true
                },
                {
                    ["name"] = "IP",
                    ["value"] = ip,
                    ["inline"] = true
                },
                {
                    ["name"] = "Character",
                    ["value"] = character.firstname .. " " .. character.lastname,
                    ["inline"] = true
                }
            },
            ["footer"] = {
                ["text"] = "BCC Anti Cheat"
            }
        }
    }
    
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        username = Config.Discord.webhookname,
        avatar_url = Config.Discord.webhookavatar,
        embeds = embeds
    }), { ['Content-Type'] = 'application/json' })
end

Discord.sendNewMessage = function (name, description, embeds, webhookurl, webhookname, webhookavatar, api)
    local wname =  Config.Discord.webhookname
    local avatar = Config.Discord.webhookavatar
    local webhook = Config.Discord.webhook

    if webhookurl ~= nil then
        webhook = webhookurl
    end

    if webhookavatar ~= nil then
        avatar = webhookavatar
    end

    if webhookname ~= nil then
        wname = webhookname
    end

    if embeds == nil then
        embeds = {{
            color = 11342935,
            title = name,
            description = description
        }}
    end

    local payload = {
        username = wname,
        avatar_url = avatar,
        type = 'rich',
        embeds = embeds
    }

    if Config.Discord.active or api == true then
        PerformHttpRequest(webhook, function(err, text, headers)end, 'POST', json.encode(payload), {
            ['Content-Type'] = 'application/json'
        })
    else
        print(name, description)
    end
end

Discord.sendMessage = function (_source, description)
    local name
    if _source then
        name = GetPlayerName(_source)
    else
        name = "Player"
    end
    Discord.sendNewMessage(name, description)
end

exports('discord',function()
    local self = {}

    self.sendMessage = function(webhookurl, webhookname, webhookavatar, name, description, embeds)
        Discord.sendNewMessage(name, description, embeds, webhookurl, webhookname, webhookavatar, true)
    end

    return self
end)
