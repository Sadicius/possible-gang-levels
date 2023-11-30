RegisterNetEvent('possible-gang-level:client:MyGangLevel')
AddEventHandler('possible-gang-level:client:MyGangLevel', function(gangLevel)
    lib.notify({
        title = Config.GangLevelNotificationTitle,
        description = ('Your gang is at Level %d!'):format(gangLevel),
        type = Config.GangLevelNotificationType,
        position = Config.NotificationPosition,
    })
end)