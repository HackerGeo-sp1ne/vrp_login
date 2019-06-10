
dependencies {
	'vrp',
	'vrp_mysql'
}

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/pricedown.ttf',
	'html/logo.png',
	'html/styles.css',
	'html/scripts.js'
}

client_scripts {
	"lib/Tunnel.lua",
    "lib/Proxy.lua",
	"client.lua"
}

server_scripts { 
	"@vrp/lib/utils.lua",
	"server.lua"
}
