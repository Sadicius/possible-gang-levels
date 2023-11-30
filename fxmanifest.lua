fx_version 'cerulean'

game 'gta5'

author 'Possible'

description 'Possible Gang Levels - Add the ability for gang members to earn xp for their gang!'

version '1.0.0'

lua54 'yes'

shared_scripts {
    'shared/*',
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    'server/*',
    '@oxmysql/lib/MySQL.lua'
}

client_scripts {}
