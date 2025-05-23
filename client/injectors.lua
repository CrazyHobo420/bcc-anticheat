local list

function retrieveResources()
    list = {}
    for i = 0, GetNumResources() - 1 do
        list[GetResourceByFindIndex(i)] = true
    end
end

if Config.ResourceInject.active then    
    AddEventHandler("onResourceListRefresh", retrieveResources)

    -- Check to make sure the client and server have the same resources
    RegisterNetEvent("ac:checkresources", function(cresources)
        local _source = source       
        for i, cr in ipairs(cresources) do
            if not list[cr] then
                HandleAntiCheatAction(_source, Config.ResourceInject, Config.ResourceInject.lang.reason)
                break
            end
        end
    end)

    retrieveResources()
end
