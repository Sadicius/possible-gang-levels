local function CalculateMaxWeight(gangLevel)
    gangLevel = gangLevel or Config.DefaultGangLevel

    return gangLevel * Config.StashMultiplier
end


function RegisterGangStash(gangName, stashData)
    print("Registering stash for gang:", gangName)

    if gangName then
        exports['possible-gang-levels']:GetGangLevel(gangName, function(gangLevel)
            -- Check if gang level is not found, use a default value
            if not gangLevel then
                gangLevel = Config.DefaultGangLevel
                print(("Warning: Gang level not found for %s, using default level %d"):format(gangName, Config.DefaultGangLevel))
            end

            local maxWeight = CalculateMaxWeight(gangLevel)

            exports.ox_inventory:RegisterStash(
                stashData.id,
                stashData.label,
                stashData.slots,
                maxWeight,
                stashData.owner,
                stashData.groups,
                stashData.coords
            )
            if Config.Debug then
                print(("Registered stash %s for gang %s with %d slots and %d max weight"):format(stashData.id, gangName, stashData.slots, maxWeight))
            end
        end)
    else
        if Config.Debug then
            print('Error: Gang name not provided.')
        end
    end
    if Config.Debug then
    print("Stash registered successfully!")
    end
end


function RegisterAllStashes()
    for gangName, stashData in pairs(Config.Stashes) do
        if Config.Debug then
            print("Stash Data:", json.encode(stashData))
        end
       
        local group = stashData.group

        if Config.Debug then
            print("Registering stashes for group:", group)
        end
        RegisterGangStash(gangName, stashData)
    end
end


AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        RegisterAllStashes()
    end
end)
