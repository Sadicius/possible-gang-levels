# Possible Gang Levels

[Discord/ Support](https://discord.gg/Gnb2S7uAdG)

## Install

Simply run the import and drag and drop the script into your standalone resource folder.

## Compatibility
QBCore, QBox.

## Notes

- Every 100xp a gang level is added

## Export Examples (Server):

#### Add Gang XP
local gangName = Player.PlayerData.gang.name
exports['possible-gang-levels']:AddGangXPForPlayer(src, gangName, 100)

## Remove Gang XP
exports['possible-gang-levels']:RemoveGangXPForPlayer(src, gangName, xpToRemove)

#### Check Gang Level
```
local gangName = Player.PlayerData.gang.name
exports['possible-gang-levels']:GetGangLevel(gangName, function(gangLevel)
    if gangLevel == 3 then
            print(('The gang level for %s is %d'):format(gangName, gangLevel))
        else
            print(('Gang level not met'):format(gangName))
        end
    end)
```

## Commands

> /SetGangXP 
- Allows Admins to set a gangs xp.
> /RemoveGangXP
- Allows Admind to remove a gang xp.
> /MyGangLevel 
- Allows players to be notified of their Gang Level.

## Dependencies
- OxLib
- OxMysql

## Support:

Join my Discord for support and roles.

https://discord.gg/5VU8MA7Tkz