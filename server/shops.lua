local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

RegisterNetEvent('possible-gang-levels:purchaseItem')
AddEventHandler('possible-gang-levels:purchaseItem', function(itemLabel)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    if player then
        local itemData = nil

        for _, data in pairs(Config.ShopItems) do
            if data.label == itemLabel then
                itemData = data
                break
            end
        end
        
            if itemData then
                local itemPrice = itemData.price or 0
                local cashItem = ox_inventory:GetItem(src, 'cash', nil, true)
                if cashItem >= itemData.price then
                        ox_inventory:RemoveItem(src, 'cash', itemPrice)
                        ox_inventory:AddItem(src, itemData.label, 1)
                else
                    TriggerClientEvent('possible-gang-level:client:NotEnoughCash', src)
                end
            else if Config.Debug then
                print(('Item with label %s not found in shop data'):format(itemLabel))
            end
        end
    end
end)
