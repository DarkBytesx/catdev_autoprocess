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

FxwSettings = {}
FxwSettings.ESX = exports["es_extended"]:getSharedObject()                      --> @ nil
FxwSettings.Extended = true                                                    --> @ false = Limit | true = Weight
FxwSettings.FreezePlayer = false                                                --> @ เปิด | ปิด ล็อคขาตอนโพเสท
FxwSettings.TextNotify = false                                                   --> @ เปิด | ปิด เเจ้งเตือน Text
FxwSettings.UseOxInventory = true
FxwSettings.KeyProcess = 38                                                     --> @ ปุ่มกดเพื่อ โพเสท
FxwSettings.KeyCancelProcess = 44                                               --> @ ปุ่มกด Cancel โพเสท
FxwSettings.KeyCancelShow = 'Q'                                                 --> @ ปุ่มกด Cancel ที่จะเเสดงใน UserInterface (UI)

FxwSettings.EventRoute = {
	['itemsImagePath'] = 'nui://ox_inventory/web/images/',		-- ตำแหน่งของรูป Items
}


local Front = {                                                                 --> @ ฟอนต์ Blips
    'font4thai',  -- Index (1)                                                    
    'Kanit',      -- Index (2)                                                    
    'Sarabun',    -- Index (3)                                                   
    'Mitr',       -- Index (4)                                                  
}

FxwSettings.Webhook = {
    DiscordAPI = { --> @ Webhook
		log = "", --> @ Webhook URL
		Discordlogo = 'https://media.discordapp.net/attachments/1340152257408143400/1340538373282074694/azure.png?ex=67b2b926&is=67b167a6&hm=714a5fc2f957fbc5f8671c484f081d5bcd99a85142278fd741d67a2e3eb14d37&=&format=webp&quality=lossless&width=676&height=676', -- Link URL Logo
		Discordbotname = 'Azure Auto Process' --> @ Botname
	} 
}

FxwSettings.FuntionShowText = function()  --> @ Show Text
    TriggerEvent('esx:showHelpNotification', 'กด ~INPUT_CONTEXT~ เพื่อโพสต์')

end

FxwSettings.ProcessZone = { 
    ["Mine1"] = {                                                                --> @ หัวข้อ
        Position = {x = 307.6201, y = 2866.6089, z = 43.5511},                   --> @ ตําเเหน่ง
        Distant = 2.0,                                                          --> @ ระยะกด E เพื่อโพเสท | ความกว้างของวง Marker
        Model 		= "mp_m_waremech_01",                                       --> @ โมเดล Npc
		Headling 	= 305.4059,                                                   --> @ ทิศทางหันหน้า Npc
		DictNPC		= "anim@mp_player_intincarsalutestd@ds@",                   --> @ อนิเมชั่น
		AnimNPC		= "idle_a",                                                 --> @ อนิเมชั่น
        Dict		= "anim@gangops@facility@servers@bodysearch@",              
		Anim		= "player_search",

        Marker = {                                                              --> @ มาร์คเกอร์
            Enable = false,                                                      --> @ เปิด | ปิด มาร์คเกอร์
            Id = 1,                                                             --> @ ประเภทของ มาร์คเกอร์
            R = 255,                                                            --> @ ประเทภสี 
            G = 0,                                                              --> @ ประเทภสี 
            B = 0,                                                              --> @ ประเทภสี 
            Alpha = 40,                                                         --> @ ความโปร่งใส ของ มาร์คเกอร์ 
        },
        Time = 1,                                                               --> @ เวลาในการโพเสท
        FxwHeader = {                                                           --> @ หัวข้อ UserInterface (UI)
            TextType = "Process",                                               --> @ ชื่อหัวข้อ (จะตั้งเป็นเเบบ Process หรือ Pack ก็ได้นะครับ)
            Text = "Mining",                                                    --> @ ชื่อหัวข้อ
            TextNotify = "Stone > Washed Stone",                                      --> @ ชื่อเเจ้งเตือนมุมขวา
            TextPress = "E"                                                     --> @ ปุ่มเเจ้งเตือนมุมขวา
        },
        
        AddItem = {                                                             --> @ เเอดไอเท็ม
            {
                ItemName = "washed_rocks",                                        --> @ ชื่อไอเท็มใน Sql
                ItemCount = 5,                                                  --> @ จํานวนที่จะได้
                Text = "Washed Rocks",                                            --> @ ชื่อที่จะเเสดงใน UserInterface (UI)
                Percent = 100                                                   --> @ เปอร์เซ็นที่จะได้
            },
        },
		RemoveItem = {                                                          --> @ ลบไอเท็ม
            {
                ItemName = "stone",                                             --> @ ชื่อไอเท็มใน Sql
                ItemCount = 5,                                                  --> @ จํานวนที่จะลบ
                Text = "Stone",                                                 --> @ ชื่อที่จะเเสดงใน UserInterface (UI)
            },
        },
        FxwBlips = {                                                            --> @ บริบในเเผนที่
            Enableblip = false,                                                  --> @ เปิด | ปิด บริบในเเผนที่
            Textblip = "Stone Processing",   --> @ ชื่อบริบในเเผนที่ | ถ้าจะเลือกใช้ฟอนต์ ก็เปลี่ยนจากเลข 1 เป็นเลข Index ที่เราจะเปลี่ยนฟอนต์นะครับ
            Spriteblip = 318,                                                   --> @ ประเภทบริบ
            Colorblip = 28,                                                     --> @ สีของบริบ
            Scaleblip = 0.8,                                                    --> @ ขนาดของบริบ
        },
	},

    ["Mine2"] = {                                                                --> @ หัวข้อ
        Position = {x = 305.3802, y = 2870.6484, z = 43.5511},                   --> @ ตําเเหน่ง
        Distant = 2.0,                                                          --> @ ระยะกด E เพื่อโพเสท | ความกว้างของวง Marker
        Model 		= "mp_m_waremech_01",                                       --> @ โมเดล Npc
		Headling 	= 305.4059,                                                   --> @ ทิศทางหันหน้า Npc
		DictNPC		= "anim@mp_player_intincarsalutestd@ds@",                   --> @ อนิเมชั่น
		AnimNPC		= "idle_a",                                                 --> @ อนิเมชั่น
        Dict		= "anim@gangops@facility@servers@bodysearch@",              
		Anim		= "player_search",

        Marker = {                                                              --> @ มาร์คเกอร์
            Enable = false,                                                      --> @ เปิด | ปิด มาร์คเกอร์
            Id = 1,                                                             --> @ ประเภทของ มาร์คเกอร์
            R = 255,                                                            --> @ ประเทภสี 
            G = 0,                                                              --> @ ประเทภสี 
            B = 0,                                                              --> @ ประเทภสี 
            Alpha = 40,                                                         --> @ ความโปร่งใส ของ มาร์คเกอร์ 
        },
        Time = 1,                                                               --> @ เวลาในการโพเสท
        FxwHeader = {                                                           --> @ หัวข้อ UserInterface (UI)
            TextType = "Process",                                               --> @ ชื่อหัวข้อ (จะตั้งเป็นเเบบ Process หรือ Pack ก็ได้นะครับ)
            Text = "Mining",                                                    --> @ ชื่อหัวข้อ
            TextNotify = "PROCESS MINING",                                      --> @ ชื่อเเจ้งเตือนมุมขวา
            TextPress = "E"                                                     --> @ ปุ่มเเจ้งเตือนมุมขวา
        },
        
        AddItem = {   
            {
                ItemName = "copper", --ไอเท็มโบนัส
                ItemCount = 2, --จำนวน
                Text = "Copper", --หน่วย
                Percent = 100 --เปอร์เซน
            },                                                          --> @ เเอดไอเท็ม
            {
                ItemName = "rocks",                                        --> @ ชื่อไอเท็มใน Sql
                ItemCount = 1,                                                  --> @ จํานวนที่จะได้
                Text = "Rocks",                                            --> @ ชื่อที่จะเเสดงใน UserInterface (UI)
                Percent = 32                                                   --> @ เปอร์เซ็นที่จะได้
            }, 
            {
                ItemName = "diamond", --ไอเท็มโบนัส
                ItemCount = 1, --จำนวน
                Text = "Diamond", --หน่วย
                Percent = 5 --เปอร์เซน
            },
            {
                ItemName = "gold", --ไอเท็มโบนัส
                ItemCount =  2, --จำนวน
                Text = "Gold Bar", --หน่วย
                Percent = 32 --เปอร์เซน
            },
            {
                ItemName = "emerald", --ไอเท็มโบนัส
                ItemCount =  2, --จำนวน
                Text = "Emerald", --หน่วย
                Percent = 32 --เปอร์เซน
            },
            {
                ItemName = "iron", --ไอเท็มโบนัส
                ItemCount =  2, --จำนวน
                Text = "Iron", --หน่วย
                Percent = 32 --เปอร์เซน
            },
        },
		RemoveItem = {                                                          --> @ ลบไอเท็ม
            {
                ItemName = "washed_rocks",                                             --> @ ชื่อไอเท็มใน Sql
                ItemCount = 5,                                                  --> @ จํานวนที่จะลบ
                Text = "Washed Stone",                                                 --> @ ชื่อที่จะเเสดงใน UserInterface (UI)
            },
        },
        FxwBlips = {                                                            --> @ บริบในเเผนที่
            Enableblip = true,                                                  --> @ เปิด | ปิด บริบในเเผนที่
            Textblip = "[~g~Auto Process~w~] Mining Processing",   --> @ ชื่อบริบในเเผนที่ | ถ้าจะเลือกใช้ฟอนต์ ก็เปลี่ยนจากเลข 1 เป็นเลข Index ที่เราจะเปลี่ยนฟอนต์นะครับ
            Spriteblip = 318,                                                   --> @ ประเภทบริบ
            Colorblip = 5,                                                     --> @ สีของบริบ
            Scaleblip = 0.8,                                                    --> @ ขนาดของบริบ
        },
	},

    ["RedOxy"] = {    -- , , ,                                                              --> @ หัวข้อ
        Position = {x = -176.7600, y = 300.4683, z = 100.9232},                   --> @ ตําเเหน่ง
        Distant = 2.0,                                                          --> @ ระยะกด E เพื่อโพเสท | ความกว้างของวง Marker
        Model 		= "mp_m_waremech_01",                                       --> @ โมเดล Npc
		Headling 	= 356.5519,                                                   --> @ ทิศทางหันหน้า Npc
		DictNPC		= "anim@mp_player_intincarsalutestd@ds@",                   --> @ อนิเมชั่น
		AnimNPC		= "idle_a",                                                 --> @ อนิเมชั่น
        Dict		= "anim@gangops@facility@servers@bodysearch@",              
		Anim		= "player_search",

        Marker = {                                                              --> @ มาร์คเกอร์
            Enable = false,                                                      --> @ เปิด | ปิด มาร์คเกอร์
            Id = 1,                                                             --> @ ประเภทของ มาร์คเกอร์
            R = 255,                                                            --> @ ประเทภสี 
            G = 0,                                                              --> @ ประเทภสี 
            B = 0,                                                              --> @ ประเทภสี 
            Alpha = 40,                                                         --> @ ความโปร่งใส ของ มาร์คเกอร์ 
        },
        Time = 5,                                                               --> @ เวลาในการโพเสท
        FxwHeader = {                                                           --> @ หัวข้อ UserInterface (UI)
            TextType = "Process",                                               --> @ ชื่อหัวข้อ (จะตั้งเป็นเเบบ Process หรือ Pack ก็ได้นะครับ)
            Text = "Mining",                                                    --> @ ชื่อหัวข้อ
            TextNotify = "PROCESS MINING",                                      --> @ ชื่อเเจ้งเตือนมุมขวา
            TextPress = "E"                                                     --> @ ปุ่มเเจ้งเตือนมุมขวา
        },
        
        AddItem = {   
            {
                ItemName = "red_magic_powder", --ไอเท็มโบนัส
                ItemCount = 5, --จำนวน
                Text = "Red Magic Powder", --หน่วย
                Percent = 100 --เปอร์เซน
            },
        },
		RemoveItem = {                                                          --> @ ลบไอเท็ม
            {
                ItemName = "crystal_red",                                             --> @ ชื่อไอเท็มใน Sql
                ItemCount = 15,                                                  --> @ จํานวนที่จะลบ
                Text = "Red Crystal",                                                 --> @ ชื่อที่จะเเสดงใน UserInterface (UI)
            },
        },
        FxwBlips = {                                                            --> @ บริบในเเผนที่
            Enableblip = false,                                                  --> @ เปิด | ปิด บริบในเเผนที่
            Textblip = "[~g~Auto Process~w~] Mining Processing",   --> @ ชื่อบริบในเเผนที่ | ถ้าจะเลือกใช้ฟอนต์ ก็เปลี่ยนจากเลข 1 เป็นเลข Index ที่เราจะเปลี่ยนฟอนต์นะครับ
            Spriteblip = 318,                                                   --> @ ประเภทบริบ
            Colorblip = 5,                                                     --> @ สีของบริบ
            Scaleblip = 0.8,                                                    --> @ ขนาดของบริบ
        },
	},

    ["Matcha"] = {    -- , , ,     , , ,       , , 1                                                   --> @ หัวข้อ
        Position = {x = 100.9511, y = 11.3676, z = 67.7771},                   --> @ ตําเเหน่ง
        Distant = 2.0,                                                          --> @ ระยะกด E เพื่อโพเสท | ความกว้างของวง Marker
        Model 		= "mp_m_waremech_01",                                       --> @ โมเดล Npc
		Headling 	= 252.7386,                                                   --> @ ทิศทางหันหน้า Npc
		DictNPC		= "anim@mp_player_intincarsalutestd@ds@",                   --> @ อนิเมชั่น
		AnimNPC		= "idle_a",                                                 --> @ อนิเมชั่น
        Dict		= "anim@gangops@facility@servers@bodysearch@",              
		Anim		= "player_search",

        Marker = {                                                              --> @ มาร์คเกอร์
            Enable = false,                                                      --> @ เปิด | ปิด มาร์คเกอร์
            Id = 1,                                                             --> @ ประเภทของ มาร์คเกอร์
            R = 255,                                                            --> @ ประเทภสี 
            G = 0,                                                              --> @ ประเทภสี 
            B = 0,                                                              --> @ ประเทภสี 
            Alpha = 40,                                                         --> @ ความโปร่งใส ของ มาร์คเกอร์ 
        },
        Time = 5,                                                               --> @ เวลาในการโพเสท
        FxwHeader = {                                                           --> @ หัวข้อ UserInterface (UI)
            TextType = "Process",                                               --> @ ชื่อหัวข้อ (จะตั้งเป็นเเบบ Process หรือ Pack ก็ได้นะครับ)
            Text = "Mining",                                                    --> @ ชื่อหัวข้อ
            TextNotify = "PROCESS MINING",                                      --> @ ชื่อเเจ้งเตือนมุมขวา
            TextPress = "E"                                                     --> @ ปุ่มเเจ้งเตือนมุมขวา
        },
        
        AddItem = {   
            {
                ItemName = "greenpowder", --ไอเท็มโบนัส
                ItemCount = 5, --จำนวน
                Text = "Green Powder", --หน่วย
                Percent = 100 --เปอร์เซน
            },
        },
		RemoveItem = {                                                          --> @ ลบไอเท็ม
            {
                ItemName = "crystal_green",                                             --> @ ชื่อไอเท็มใน Sql
                ItemCount = 15,                                                  --> @ จํานวนที่จะลบ
                Text = "Green Crystal",                                                 --> @ ชื่อที่จะเเสดงใน UserInterface (UI)
            },
        },
        FxwBlips = {                                                            --> @ บริบในเเผนที่
            Enableblip = false,                                                  --> @ เปิด | ปิด บริบในเเผนที่
            Textblip = "[~g~Auto Process~w~] Mining Processing",   --> @ ชื่อบริบในเเผนที่ | ถ้าจะเลือกใช้ฟอนต์ ก็เปลี่ยนจากเลข 1 เป็นเลข Index ที่เราจะเปลี่ยนฟอนต์นะครับ
            Spriteblip = 318,                                                   --> @ ประเภทบริบ
            Colorblip = 5,                                                     --> @ สีของบริบ
            Scaleblip = 0.8,                                                    --> @ ขนาดของบริบ
        },
	},
}