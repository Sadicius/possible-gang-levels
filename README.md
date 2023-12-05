# Possible Gang Levels

[Discord/ Support](https://discord.gg/Gnb2S7uAdG)

## Install

Simply run the import and drag and drop the script into your standalone resource folder.

## Compatibility
QBCore, QBox.

## Notes

- Every 100xp a gang level is added

## Export Examples (Server):

## Add Gang XP
```
local gangName = Player.PlayerData.gang.name
exports['possible-gang-levels']:AddGangXPForPlayer(src, gangName, 100)
```

## Remove Gang XP
```
exports['possible-gang-levels']:RemoveGangXPForPlayer(src, gangName, xpToRemove)
```
## Check Gang Level
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

## Stashes
The script can now handle Gang stashes, if you're using ox_inventory.

Define the stashes in the /shared/config.lua file, like the given examples. The stashes are then registered dynamically on resource start. The Gang stash size is based on the Gang level, it increases as gang level to give incentive to level up and play your server.

The feature was wrote on my lunch break and needs some proper testing, but it should work fine. If you find any issues, please let me know, I will ensure of proper testing for v1 release.

### Commands

> /setgangxp 
- Allows Admins to set a gangs xp.
> /removegangxp
- Allows Admind to remove a gang xp.
> /myganglevel 
- Allows players to be notified of their Gang Level.

## Dependencies
- OxLib
- OxMysql
- OxInventory (Optional if using Stashes)

## Support:

Join my Discord for support and roles.

https://discord.gg/5VU8MA7Tkz