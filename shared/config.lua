Config = {}

Config.Debug = true -- Set to true if you want to see debug messages in the consoles (primary server console)
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
Config.MyGangLevelCommandHelp = 'Check your gang level' -- Help text for /myganglevel