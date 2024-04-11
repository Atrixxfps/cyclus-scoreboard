fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Cyclus Scripts | Atrixx#atrixxx'
description 'FiveM: scoreboard-script'
version '1.0.0'
lua54 'yes'

ui_page "HTML/index.html"
escrow_ignore {
    'config.lua',
    'client/function.lua'
}

shared_scripts {
	'config.lua'
}


client_scripts {
    'client/*'
}

server_scripts {
    'server/*'
}

files {
    'HTML/*',
    "HTML/img/*"
}