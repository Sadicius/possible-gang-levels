RegisterNetEvent('possible-gang-level:client:AddedXP')
AddEventHandler('possible-gang-level:client:AddedXP', function(xp)
    if Config.AddXPNotification then
        lib.notify({
            title = Config.AddXPNotificationTitle,
            description = ('Your gang gained %d XP!'):format(xp),
            type = Config.AddXPNotificationType, 
            position = Config.NotificationPosition,
        })
        else if Config.Debug then
            print('AddXP Notification is set to false in config.lua')
        end
    end
end)

RegisterNetEvent('possible-gang-level:client:MyGangLevel')
AddEventHandler('possible-gang-level:client:MyGangLevel', function(gangLevel)
    lib.notify({
        title = Config.GangLevelNotificationTitle,
        description = ('Your gang is at Level %d!'):format(gangLevel),
        type = Config.GangLevelNotificationType,
        position = Config.NotificationPosition,
    })
end)

RegisterNetEvent('possible-gang-level:client:RemoveXPCommand')
AddEventHandler('possible-gang-level:client:RemoveXPCommand', function(gangName, xp)
        lib.notify({
            title = 'Gang XP Removed',
            description = ('You removed %d XP from gang: %s'):format(xp, gangName),
            type = 'success', 
            position = Config.NotificationPosition,
        })
end)

RegisterNetEvent('possible-gang-level:client:SetXPCommand')
AddEventHandler('possible-gang-level:client:SetXPCommand', function(gangName, xp)
    lib.notify({
        title = 'Gang XP Set',
        description = ('You set %d XP from gang: %s'):format(xp, gangName),
        type = 'success', 
        position = Config.NotificationPosition,
    })
end)