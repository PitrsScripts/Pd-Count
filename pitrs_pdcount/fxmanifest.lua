fx_version 'cerulean'
game 'gta5'

author 'Pitrs'
description 'PD Count Menu'
version '1.0.0'

shared_script 'config.lua'

client_scripts {
    '@ox_lib/init.lua',
    'client.lua'
}

server_scripts {
    '@ox_lib/init.lua',
    'server.lua'
}

lua54 'yes'
