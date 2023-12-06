local playerGangLevel = 0

function UpdatePlayerGangLevel(gangName)
    TriggerServerEvent('possible-gang-levels:GetGangLevel', gangName)
end

function capitalizeFirstLetter(str)
    return str:gsub("^%l", string.upper)
end

RegisterNetEvent('possible-gang-levels:SetPlayerGangLevel')
AddEventHandler('possible-gang-levels:SetPlayerGangLevel', function(gangLevel)
    playerGangLevel = gangLevel
    if Config.Debug then
        print(('Set player gang level to %d'):format(playerGangLevel))
    end
    -- Update the context after receiving the player's gang level
    for gangName, _ in pairs(Config.Shops) do
        lib.registerContext({
            id = gangName .. '_shop_menu',
            title = '' .. capitalizeFirstLetter(gangName) .. ' Shop',
            options = GenerateShopMenuOptions(playerGangLevel),
        })
    end
end)

function GenerateShopMenuOptions(playerGangLevel)
    local options = {}

    for itemName, itemData in pairs(Config.ShopItems) do
        local gangLevelRequired = itemData.requiredGangLevel or 0
        if Config.Debug then
            print('Item:', itemName, 'Gang Level Required:', gangLevelRequired)
            print('Player Gang Level in shop menu:', playerGangLevel)
        end
        local itemLabel = itemData.label
        local isDisabled = playerGangLevel <= gangLevelRequired

        local option = {
            title = itemData.label,
            description = ('Price: $%d\nRequired Gang Level: %s'):format(itemData.price or 0, gangLevelRequired and gangLevelRequired or 'N/A'),
            onSelect = function()
                if Config.Debug then
                    print(('Item: %s, Gang Level Required: %d'):format(itemLabel, gangLevelRequired))
                end
                TriggerServerEvent('possible-gang-levels:purchaseItem', itemLabel)
            end,
            disabled = isDisabled,
        }

        table.insert(options, option)
    end

    return options
end

CreateThread(function()
    for gangName, shopData in pairs(Config.Shops) do
        if Config.Debug then
            print("Processing gang:", gangName)
        end

        exports.ox_target:addSphereZone({
            coords = shopData.zoneCoords,
            radius = shopData.zoneRadius,
            debug = Config.Debug,
            options = {
                {
                    label = '' .. capitalizeFirstLetter(gangName) .. ' Shop',
                    icon = 'fas fa-shopping-cart',
                    distance = 2.0,
                    groups = gangName,
                    onSelect = function()
                        if Config.Debug then
                            print("Attempting to open shop menu for gang:", gangName)
                        end
                        UpdatePlayerGangLevel(gangName)
                        lib.showContext(gangName .. '_shop_menu')
                    end
                }
            }
        })
    end
end)

RegisterNetEvent('possible-gang-levels:client:NotEnoughCash')
AddEventHandler('possible-gang-levels:client:NotEnoughCash', function(xp)
    lib.notify({
        title = Config.ShopNotEnoughCashNotificationTitle,
        description = Config.ShopNotEnoughCashNotificationTitle,
        type = 'error',
        position = Config.NotificationPosition,
    })
end)
