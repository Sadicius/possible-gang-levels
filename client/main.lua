RegisterNetEvent('possible-gang-level:client:AddedXP')
AddEventHandler('possible-gang-level:client:AddedXP', function(xp)
    if Config.AddXPNotification then
        lib.notify({
            title = Config.AddXPNotificationTitle,
            description = (Config.AddXPNotificationDescription):format(xp),
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
            description = (Config.RemoveXPNotificationDescription):format(xp),
            type = Config.RemoveXPNotificationType, 
            position = Config.NotificationPosition,
        })
        else if Config.Debug then
            print('RemovedXP Notification is set to false in config.lua')
        end
    end
end)

RegisterNetEvent('possible-gang-level:client:MyGangLevel')
AddEventHandler('possible-gang-level:client:MyGangLevel', function(gangLevel)
    lib.notify({
        title = Config.GangLevelNotificationTitle,
        description = (Config.GangLevelNotificationDescription):format(gangLevel),
        type = Config.GangLevelNotificationType,
        position = Config.NotificationPosition,
    })
end)

RegisterNetEvent('possible-gang-level:client:SetXPCommand')
AddEventHandler('possible-gang-level:client:SetXPCommand', function(gangName, xp)
    lib.notify({
        title = Config.SetXPCommandNotificationTitle,
        description = (Config.SetXPCommandNotificationDescription):format(xp, gangName),
        type = Config.SetXPCommandNotificationType, 
        position = Config.NotificationPosition,
    })
end)

RegisterNetEvent('possible-gang-level:client:RemoveXPCommand')
AddEventHandler('possible-gang-level:client:RemoveXPCommand', function(gangName, xp)
        lib.notify({
            title = Config.RemoveXPCommandNotificationTitle,
            description = (Config.RemoveXPCommandNotificationDescription):format(xp, gangName),
            type = Config.RemoveXPCommandNotificationType, 
            position = Config.NotificationPosition,
        })
end)