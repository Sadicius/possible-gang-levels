Config = {}

Config.Debug = false -- Set to true if you want to see debug messages in the consoles (primary server console)
----------------------------------------------------------------
-- Notifications
----------------------------------------------------------------
Config.NotificationPosition = 'top' -- ox_lib notify positions

Config.GangLevelNotificationTitle = 'Gang Level' -- Title of the notification when a player uses /myganglevel
Config.GangLevelNotificationDescription = 'Your gang is at Level %d!' -- Description of the notification when a player uses /myganglevel *do not edit %d and %s they print xp and gang name
Config.GangLevelNotificationType = 'info' -- Type of the notification when a gang levels up. values: 'info', 'success', 'error', 'warning'

Config.AddXPNotification = true -- Set to true if you want to see a notification when a player loses XP
Config.AddXPNotificationTitle = 'Gained XP!' -- Title of the notification when a player loses XP
Config.AddXPNotificationDescription = 'Your gang gained %d XP!' -- Description of the notification when a player loses XP  *do not edit %d and %s they print xp and gang name
Config.AddXPNotificationType ='success' -- Type of the notification when a player loses XP. values: 'info', 'success', 'error', 'warning'

Config.RemoveXPNotification = true -- Set to true if you want to see a notification when a player loses XP
Config.RemoveXPNotificationTitle = 'Lost XP!' -- Title of the notification when a player loses XP
Config.RemoveXPNotificationDescription = 'Your gang lost %d XP!' -- Description of the notification when a player loses XP
Config.RemoveXPNotificationType ='error' -- Type of the notification when a player loses XP. values: 'info', 'success', 'error', 'warning'

Config.SetXPCommandNotificationTitle = 'Gang XP Set'                  -- Title of the notification when a player uses /setgangxp
Config.SetXPCommandNotificationDescription = 'You set %d XP from gang: %s' -- Description of the notification when a player uses /setgangxp  *do not edit %d and %s they print xp and gang name
Config.SetXPCommandNotificationType = 'success'  -- Type of the notification when a player uses /setgangxp. values: 'info', 'success', 'error', 'warning'

Config.RemoveXPCommandNotificationTitle = 'Gang XP Removed'                  -- Title of the notification when a player uses /removegangxp
Config.RemoveXPCommandNotificationDescription = 'You removed %d XP from gang: %s'  -- Description of the notification when a player uses /removegangxp *do not edit %d and %s they print xp and gang name
Config.RemoveXPCommandNotificationType = 'success'  -- Type of the notification when a player uses /removegangxp. values: 'info', 'success', 'error', 'warning'
---------------------------------------------------------------
-- Commands
----------------------------------------------------------------
Config.SetXPCommand = 'setgangxp'         -- Command to set gang XP for a player
Config.SetXPCommandHelp = 'Set gang XP for a player' -- Help text for /setgangxp
Config.RemoveXPCommand = 'removegangxp'              -- Command to remove gang XP for a player
Config.RemoveXPCommandHelp = 'Remove gang XP for a player' -- Help text for /removegangxp
Config.MyGangLevelCommand = 'myganglevel'                  -- Command to check your gang level
Config.MyGangLevelCommandHelp = 'Check your gang level'    -- Help text for /myganglevel
---------------------------------------------------------------
-- Stashes
----------------------------------------------------------------
Config.DefaultGangLevel = 1 -- Default gang level
Config.StashMultiplier = 1000 -- Multiplier for stash weight based on gang level
Config.Stashes = {
    ballas = {
        coords = vec3(-1.19, -1811.71, 25.35),
        radius = 1.0,
        slots = 100,
        label = 'Ballas Stash',
        owner = false,
        id = 'ballas',
        group = 'ballas',
        groups = {
            ['ballas'] = 0
        }
    },
    vagos = {
        coords = vec3(328.31, -2000.47, 24.21),
        radius = 1.0,
        slots = 100,
        label = 'Vagos Stash',
        owner = false,
        id = 'vagos',
        group = 'vagos',
        groups = {
            ['vagos'] = 0
        }
    },
    -- Add gangs as needed
}
---------------------------------------------------------------
-- Shops
----------------------------------------------------------------
Config.Shops = {
    ballas = {
        zoneCoords = vec3(-3.46, -1826.15, 29.15),
        zoneRadius = 3.0,
    },
    vagos = {
        zoneCoords = vec3(335.69, -1987.51, 24.21),
        zoneRadius = 3.0,
    },
    -- Add gangs as needed
}

Config.ShopItems = {
    item1 = {
        label = 'Phone',
        price = 100,
        requiredGangLevel = 450,
    },
    item2 = {
        label = 'Lockpick',
        price = 150,
        requiredGangLevel = 500,
    },
    -- Add items as needed
}

Config.ShopNotEnoughCashNotificationTitle = 'Insufficient Cash'                                             -- Title of the notification when a player doesn't have enough cash
Config.ShopNotEnoughCashNotificationDescription = 'You do not have enough cash to purchase this item.'