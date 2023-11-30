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