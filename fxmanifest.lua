shared_script '@catnyan/ai_module_fg-obfuscated.lua'
shared_script '@catnyan/shared_fg-obfuscated.lua'
--> @  ███████╗██╗░░██╗░██╗░░░░░░░██╗ ░░░░░░ ██████╗░███████╗██╗░░░██╗███████╗██╗░░░░░░█████╗░██████╗░███████╗██████╗░ @ <--
--> @  ██╔════╝╚██╗██╔╝░██║░░██╗░░██║ ░░░░░░ ██╔══██╗██╔════╝██║░░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗██╔════╝██╔══██╗ @ <--
--> @  █████╗░░░╚███╔╝░░╚██╗████╗██╔╝ █████╗ ██║░░██║█████╗░░╚██╗░██╔╝█████╗░░██║░░░░░██║░░██║██████╔╝█████╗░░██████╔╝ @ <--
--> @  ██╔══╝░░░██╔██╗░░░████╔═████║░ ╚════╝ ██║░░██║██╔══╝░░░╚████╔╝░██╔══╝░░██║░░░░░██║░░██║██╔═══╝░██╔══╝░░██╔══██╗ @ <--
--> @  ██║░░░░░██╔╝╚██╗░░╚██╔╝░╚██╔╝░ ░░░░░░ ██████╔╝███████╗░░╚██╔╝░░███████╗███████╗╚█████╔╝██║░░░░░███████╗██║░░██║ @ <--
--> @  ╚═╝░░░░░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░ ░░░░░░ ╚═════╝░╚══════╝░░░╚═╝░░░╚══════╝╚══════╝░╚════╝░╚═╝░░░░░╚══════╝╚═╝░░╚═╝ @ <--

--[[

    --> @ 💬 Export from Fxw - Developer => discord:[ !🧠 fxwppyps.exe || https://discord.gg/NDDujt4hrT ] 

    --> @ ☕ Thank You For Your Support. 

]]--

fx_version 'adamant'
game 'gta5'

ui_page "Interface/CssCode/Code.html"
lua54 'yes'
shared_script {
	"@ox_lib/init.lua",
	'Settings/FxwSettings.Item.lua',
	'Settings/FxwSettings.Notify.lua',
}

client_scripts {
	'CodeLua/CodeCl.lua',
}

server_scripts {
	'CodeLua/CodeSv.lua',
}

files {
	'Interface/CssCode/Code.html',
	'Interface/JsCode/*.js',
	'Interface/CssCode/*.css',
	'Interface/Sound/*.ogg',
	'Interface/Sound/*.wav',
	'Interface/Sound/*.mp3',
}