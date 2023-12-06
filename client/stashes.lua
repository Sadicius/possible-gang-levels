CreateThread(function()
    for gangName, stashData in pairs(Config.Stashes) do
        if Config.Debug then
            print("Processing gang:", gangName) 
        end
        exports.ox_target:addSphereZone({
            coords = stashData.coords,
            radius = stashData.radius,
            debug = Config.Debug,
            options = {
                {
                    label = stashData.label,
                    icon = 'fas fa-hand',
                    distance = 1.5,
                    onSelect = function()
                        if Config.Debug then
                            print("Attempting to open stash:", stashData.id)
                        end
                        
                        local inventoryType = 'stash'
                        local inventoryData = { id = stashData.id }

                        exports.ox_inventory:openInventory(inventoryType, inventoryData)
                    end
                }
            }
        })
    end
end)
