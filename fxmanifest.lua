fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

name 'hryzen_lib'
author 'Hryzen Studios'
version '1.0.0'
description 'Core SDK for Hryzen Studios resources — modular systems and framework bridges'

dependencies {
    '/onesync',
    'ox_lib',
}

files {
    'config.lua',
    'bridge/**/**/*.lua',
    'modules/*.lua',
    'utils/*.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    'init.lua',
}

server_scripts {
    'runtime/**/server.lua',
}
