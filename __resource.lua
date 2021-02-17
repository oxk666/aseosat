resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'esx_aseosat'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server.lua'
}

client_scripts {
	'config.lua',
	'client.lua',
}

dependencies {
	'es_extended',
}