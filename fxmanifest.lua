-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Trusted Development || FX-Manifest
-- ════════════════════════════════════════════════════════════════════════════════════ --

author 'GMW - Trusted Script'
description 'A simple Script that allows players to lock & unlock their cars.'
repository 'https://shop.trusted-studios.eu'
version '0.1.0'

fx_version 'cerulean'
lua54 'yes'
games { 'gta5' }

shared_scripts {
    'lib/shared/*.lua',
    'config.lua',
}

client_scripts {
    --< API >--
    'lib/client/*.lua',
    --< Files >--
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

escrow_ignore {
    'config.lua',
}