local QBCore = exports['qb-core']:GetCoreObject()

exports('AddGangXPForPlayer', function(source, gangName, xp)
    UpdateGangXP(gangName, xp)
end)

function UpdateGangXP(gangName, xp)
    if Config.Debug then
        print(("Updating gang XP for gang: %s"):format(gangName))
    end

    local selectQuery = 'SELECT * FROM gangs WHERE gang_name = ?'
    local selectParams = { gangName }

    MySQL.Async.fetchAll(selectQuery, selectParams, function(result)
        if result and #result > 0 then
            local currentXP = result[1].gang_xp
            local newXP = currentXP + xp

            -- Update the XP
            local updateQuery = 'UPDATE gangs SET gang_xp = ? WHERE gang_name = ?'
            local updateParams = { newXP, gangName }

            MySQL.Async.execute(updateQuery, updateParams, function(affectedRows)
                if Config.Debug then
                    print(('Data updated successfully for gang: %s, Rows affected: %d'):format(gangName, affectedRows))
                end

                -- Check if the gang leveled up
                local newLevel = math.floor(newXP / 100) + 1

                if newLevel > result[1].gang_level then
                    -- Update the level
                    local updateLevelQuery = 'UPDATE gangs SET gang_level = ? WHERE gang_name = ?'
                    local updateLevelParams = { newLevel, gangName }

                    MySQL.Async.execute(updateLevelQuery, updateLevelParams, function(levelRowsAffected)
                        if Config.Debug then
                            print(('Gang leveled up to Level %d'):format(newLevel))
                        end
                    end)
                end
            end)
        else
            -- If the gang doesn't exist, insert a new row
            local insertQuery = 'INSERT INTO gangs (gang_name, gang_level, gang_xp) VALUES (?, 1, ?)'
            local insertParams = { gangName, xp }

            MySQL.Async.execute(insertQuery, insertParams, function(affectedRows)
                if Config.Debug then
                    print(('Data inserted successfully for gang: %s, Rows affected: %d'):format(gangName, affectedRows))
                end
            end)
        end
    end)
end

exports('GetGangLevel', function(gangName, callback)
    GetGangLevel(gangName, callback)
end)

    
function GetGangLevel(gangName, callback)
    local selectQuery = 'SELECT gang_level FROM gangs WHERE gang_name = ?'
    local selectParams = { gangName }

    MySQL.Async.fetchAll(selectQuery, selectParams, function(result)
        if result and #result > 0 then
            local gangLevel = result[1].gang_level
            callback(gangLevel)
        else
            callback(nil) -- Gang not found
        end
    end)
end

RegisterServerEvent('possible-gang-levels:GetGangLevel')
AddEventHandler('possible-gang-levels:GetGangLevel', function(gangName, callback)
    GetGangLevel(gangName, callback)
end)


lib.addCommand('SetGangXP', {
    help = 'Set gang XP for a player',
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
                end)
            else
                print(('Gang %s not found'):format(gangName))
            end
        end)
    else
        print('Invalid parameters for setgangxp command')
    end
end)


lib.addCommand('RemoveGangXP', {
    help = 'Remove gang XP for a player',
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
                end)
            else
                print(('Gang %s not found'):format(gangName))
            end
        end)
    else
        print('Invalid parameters for removegangxp command')
    end
end)


lib.addCommand('MyGangLevel', {
    help = 'Check your gang level',
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
