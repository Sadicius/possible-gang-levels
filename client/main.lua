RegisterNetEvent('possible-gang-level:client:MyGangLevel')
AddEventHandler('possible-gang-level:client:MyGangLevel', function(gangLevel)
    lib.notify({
        title = Config.GangLevelNotificationTitle,
        description = ('Your gang is at Level %d!'):format(gangLevel),
        type = Config.GangLevelNotificationType,
        position = Config.NotificationPosition,
    })
end)

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

RegisterNetEvent('possible-gang-level:client:RemovedXP')
AddEventHandler('possible-gang-level:client:RemovedXP', function(xp)
    if Config.RemoveXPNotification then
        lib.notify({
            title = Config.RemoveXPNotificationTitle,
            description = ('Your gang lost %d XP!'):format(xp),
            type = Config.RemoveXPNotificationType, 
            position = Config.NotificationPosition,
        })
    else if Config.Debug then
        print('RemovedX PNotification is set to false in config.lua')
    end
    end
end)

