local QBCore = exports['qb-core']:GetCoreObject()

lib.addCommand(Config.SetXPCommand, {
    help = Config.SetXPCommandHelp,
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player\'s server id',
        },
        {
            name = 'gangName',
            type = 'string',
            help = 'Name of the gang',
        },
        {
            name = 'xp',
            type = 'number',
            help = 'Amount of XP to set',
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    local targetPlayer = tonumber(args.target)
    local gangName = args.gangName
    local xp = tonumber(args.xp)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if targetPlayer and gangName and xp then
        local selectQuery = 'SELECT * FROM gangs WHERE gang_name = ?'
        local selectParams = { gangName }

        MySQL.Async.fetchAll(selectQuery, selectParams, function(result)
            if result and #result > 0 then
                local updateQuery = 'UPDATE gangs SET gang_xp = ? WHERE gang_name = ?'
                local updateParams = { xp, gangName }

                MySQL.Async.execute(updateQuery, updateParams, function(affectedRows)
                    if Config.Debug then
                        print(('Set %d XP for gang %s for player %d'):format(xp, gangName, targetPlayer))
                    end
                    TriggerClientEvent('possible-gang-level:client:SetXPCommand', src, gangName, xp)
                end)
            else
                print(('Gang %s not found'):format(gangName))
            end
        end)
    else
        print('Invalid parameters for setgangxp command')
    end
end)

lib.addCommand(Config.RemoveXPCommand, {
    help = Config.RemoveXPCommandHelp,
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player\'s server id',
        },
        {
            name = 'gangName',
            type = 'string',
            help = 'Name of the gang',
        },
        {
            name = 'xp',
            type = 'number',
            help = 'Amount of XP to remove',
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    local targetPlayer = tonumber(args.target)
    local gangName = args.gangName
    local xp = tonumber(args.xp)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if targetPlayer and gangName and xp then
        local selectQuery = 'SELECT * FROM gangs WHERE gang_name = ?'
        local selectParams = { gangName }

        MySQL.Async.fetchAll(selectQuery, selectParams, function(result)
            if result and #result > 0 then
                local currentXP = result[1].gang_xp
                local newXP = math.max(currentXP - xp, 0)  -- Ensure XP doesn't go below 0
    
                local updateQuery = 'UPDATE gangs SET gang_xp = ? WHERE gang_name = ?'
                local updateParams = { newXP, gangName }
    
                MySQL.Async.execute(updateQuery, updateParams, function(affectedRows)
                    if Config.Debug then
                        print(('Removed %d XP for gang %s for player %d'):format(xp, gangName, targetPlayer))
                    end
                    -- Pass currentXP to the CheckAndUpdateLevel function
                    if CheckAndUpdateLevel then
                        CheckAndUpdateLevel(gangName, currentXP, newXP)
                    else
                        print('CheckAndUpdateLevel function not found!')
                    end
                    TriggerClientEvent('possible-gang-level:client:RemoveXPCommand', src, gangName, xp)
                end)
            else
                print(('Gang %s not found'):format(gangName))
            end
        end)
    else
        print('Invalid parameters for removegangxp command')
    end
end)


lib.addCommand(Config.MyGangLevelCommand, {
    help = Config.MyGangLevelCommandHelp,
    restricted = false -- Allow all players to use this command
}, function(source, args, raw)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and Player.PlayerData and Player.PlayerData.gang and Player.PlayerData.gang.name then
        local gangName = Player.PlayerData.gang.name

        exports['possible-gang-levels']:GetGangLevel(gangName, function(gangLevel)
            if gangLevel then
                TriggerClientEvent('possible-gang-level:client:MyGangLevel', src, gangLevel)
            else
                print(('Gang %s not found'):format(gangName))
            end
        end)
    else
        print('Player data or gang information not found.')
    end
end)