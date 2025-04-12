ESX = FxwSettings.ESX
FxwDev = GetCurrentResourceName()

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169,
	["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162,
	["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199,
	["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82,
	["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61,
	["N9"] = 118
}



Citizen.CreateThread(function()
	while not PlayerData or not PlayerData.job or not PlayerData.job.name do
		PlayerData = ESX.GetPlayerData()
		Wait(100)
	end
	while not NetworkIsPlayerActive(PlayerId()) do Wait(100) end
	refreshBlips()
end)






Entry = {}
JobBlips = {}
NPCList = {}
DataAddItem = {}
Processing = false
inzone = false
timer = nil
local showna = false
local DATA = FxwSettings.ProcessZone
CreateThread(function()
	while true do
		Wait(0)
		Sleep = true
		local p = PlayerPedId()
		local c = GetEntityCoords(p)
		local car = GetVehiclePedIsIn(p)
		for k, v in pairs(DATA) do
			local vd = Vdist(c, vector3(v.Position.x, v.Position.y, v.Position.z))
			local dis = v.Distant
			if v.Marker.Enable then
				if vd < 20 then
					Sleep = false
					DrawMarker(v.Marker.Id, v.Position.x, v.Position.y, v.Position.z - 1, 0, 0, 0, 0, 0, 0, v.Distant, v.Distant, v.Distant, v.Marker.R, v.Marker.G, v.Marker.B, v.Marker.Alpha, 0, 0, 0, 0, 0, 0, 0)
				end
			end
			if vd < dis then
				Sleep = false
				--print('In zone')

				if not showna then
					showna = false
					if FxwSettings.TextNotify then
						SendNuiMessage(json.encode{ 
							action = "Opentext", 
							Name = v.FxwHeader.TextNotify,
							TextPress = v.FxwHeader.TextPress,
							TextCancel = FxwSettings.KeyCancelShow,
							UrlInven = FxwSettings.UrlInventory
						})
					end
				end
					pcall(function()
						FxwSettings.FuntionShowText()
					end)
					if IsControlPressed(0, FxwSettings.KeyProcess) and not Processing then
						if not IsPedInAnyVehicle(p) then
							additem(v.Time, v.AddItem, v.RemoveItem, v.Dict, v.Anim, v.FxwHeader.TextType, v.FxwHeader.Text)

							if FxwSettings.FreezePlayer then
								FreezeEntityPosition(PlayerPedId(-1), true)
							end

							Processing = true
							Wait(500)
						else
							pcall(function()
								FxwSettings.NotifyNoProcess()
							end)
						end
					end
				if IsControlJustPressed(0, FxwSettings.KeyCancelProcess) and Processing then

					FreezeEntityPosition(PlayerPedId(-1), false)
					Processing = false
					timer = nil
					ClearPedTasks(PlayerPedId())
					Wait(500)
					SendNuiMessage(json.encode{ 
						type = "ui", 
						status = false,
						
					})
					DATA = FxwSettings.ProcessZone
				end
				if not Entry[k] then
					Entry[k] = true
					inzone = true
					timer = v.Time
				end
			else
				if Entry[k] then
					Entry[k] = false
					inzone = false
				end
			end
		end
		if Sleep then
			
			Citizen.Wait(1000)
		end
	end
end)

RegisterNetEvent(FxwDev..'UpdateCountAdd', function(DATA)
	DataAddItem = DATA
	-- print(ESX.DumpTable(DataAddItem))
end)

function additem(time, item, remove, AnimDict, Anim, texttype, textheader)
	Ta = time

	for k, v in pairs(FxwSettings.ProcessZone) do
		RequestAnimDict(v.Dict)
		TaskPlayAnim(PlayerPedId(), v.Dict, v.Anim, 2.0, -2.0, -1, 17, 0,false, false, false)
	end


	local _0x49EE2B55 = item
	local _0xCDEC4291 = remove
	for k, v in pairs(_0x49EE2B55) do 
		if not _0x49EE2B55[k].loop then 
			_0x49EE2B55[k].loop = 0 
		end 
		_0x49EE2B55[k].count = 0
	end


	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1000)
			if Processing and inzone then
				for k, v in pairs(_0xCDEC4291) do 
					_0xCDEC4291[k].count = checkHasItemcount(v.ItemName) 
				
				end
				local newPack = _0x49EE2B55
				SendNuiMessage(json.encode{
					type = "UPDATE_HUD",
					Itemlist = newPack,
					ItemlistRemove = _0xCDEC4291,
					Time = Ta,
					HeaderText = textheader,
					TextName = texttype,
					PATH = FxwSettings.EventRoute["itemsImagePath"]
				})

				SendNuiMessage(json.encode{ 
					type = "ui", 
					status = true,
					HeaderText = textheader,
					TextName = texttype,
					PATH = FxwSettings.EventRoute["itemsImagePath"]
				})

			

				if Ta > 0 then 

					Ta = Ta - 1

				else
					
					if Haveitem(remove) then
						if Haveitemfull(item) then
							
							TriggerServerEvent(FxwDev .. ":0xD10B862B", _0x49EE2B55, _0xCDEC4291)

							Ta = time
							Citizen.Wait(200)
							for k, v in pairs(_0xCDEC4291) do
								_0xCDEC4291[k].count = _0xCDEC4291[k].count + v.ItemCount
							end
							for k, v in pairs(_0x49EE2B55) do
								for a, b in pairs(DataAddItem) do
									if v.ItemName == b.Name then
										_0x49EE2B55[k].count = _0x49EE2B55[k].count + DataAddItem[a].Count
									end
								end
							end
						else
							for k, v in pairs(_0x49EE2B55) do 
								if _0x49EE2B55[k].loop then 
									_0x49EE2B55[k].loop = 0 
								end 
							end
							local newPack = _0x49EE2B55
							SendNuiMessage(json.encode{
								type = "UPDATE_HUD",
								Itemlist = newPack,
								ItemlistRemove = _0xCDEC4291,
								Time = 0,
								HeaderText = textheader,
								TextName = texttype,
								PATH = FxwSettings.EventRoute["itemsImagePath"]
								
							})
							if Processing then SendNuiMessage(json.encode{ type = "ui", status = false }) end
							Ta = time
							_0x49EE2B55 = item
							_0xCDEC4291 = remove
							Processing = false
							pcall(function()
								FxwSettings.NotifyFullItem()
							end)
							FreezeEntityPosition(PlayerPedId(-1), false)
					

							Processing = false
							ClearPedTasks(PlayerPedId())
							break
						end
					else
						for k, v in pairs(_0x49EE2B55) do if _0x49EE2B55[k].loop then _0x49EE2B55[k].loop = 0 end end
						local newPack = _0x49EE2B55
						SendNuiMessage(json.encode{
							type = "UPDATE_HUD",
							Itemlist = newPack,
							ItemlistRemove = _0xCDEC4291,
							Time = 0,
							HeaderText = textheader,
							TextName = texttype,
							PATH = FxwSettings.EventRoute["itemsImagePath"]

						})
						if Processing then SendNuiMessage(json.encode{ type = "ui", status = false }) end
						Ta = time
						_0x49EE2B55 = item
						_0xCDEC4291 = remove
						Processing = false
					
						pcall(function()
							FxwSettings.NotifyNoItem()
						end)
						FreezeEntityPosition(PlayerPedId(-1), false)
					

						Processing = false
						ClearPedTasks(PlayerPedId())
						break
					end
				end
			else
				for k, v in pairs(_0x49EE2B55) do if _0x49EE2B55[k].loop then _0x49EE2B55[k].loop = 0 end end
				local newPack =_0x49EE2B55
				SendNuiMessage(json.encode{
					type = "UPDATE_HUD",
					Itemlist = newPack,
					ItemlistRemove = _0xCDEC4291,
					Time = 0,
					HeaderText = textheader,
					TextName = texttype,
				})
				
				if Processing then SendNuiMessage(json.encode{ type = "ui", status = false }) end
				pcall(function()
					FxwSettings.NotifyZone()
				end)

				Ta = time
				_0x49EE2B55 = item
				_0xCDEC4291 = remove
				Processing = false
				ClearPedTasks(PlayerPedId())
				break
			end
		end
	end)
end

function Haveitem(data)
	local haveitem = false
	for k, v in pairs(data) do
		if CheckItem(v.ItemName, v.ItemCount) then haveitem = true
		else
			haveitem = false
			return false
		end
	end
	if haveitem then return true end
end

function Haveitemfull(data)
    if FxwSettings.UseOxInventory then
        return true -- Always allow adding items when using ox_inventory
    end
    local Haveitemfull = false
    for k, v in pairs(data) do
        if CheckItemLimit(v.ItemName) then Haveitemfull = true
        else
            Haveitemfull = false
            return false
        end
    end
    if Haveitemfull then return true end
end

function checkHasItemcount(item_name)
    local count = exports.ox_inventory:Search('count', item_name)
    return count or 0
end

function CheckItem(requestitem, requestcount)
    local count = exports.ox_inventory:Search('count', requestitem)
    return count >= tonumber(requestcount)
end

function CheckItemLimit(requestitem)
    if FxwSettings.UseOxInventory then
        return true -- Remove item limit when using ox_inventory
    else
        local item = exports.ox_inventory:Search('slots', requestitem)
        if item then
            if item.limit == -1 then
                return true
            end
            local count = exports.ox_inventory:Search('count', requestitem)
            return count < item.limit
        end
        return false
    end
end


function PlayAnimation(AnimDict, Anim)
	local ped = PlayerPedId()
	RequestAnimDict(AnimDict)
	while not HasAnimDictLoaded(AnimDict) do Citizen.Wait(0) end
	Wait(100)
	TaskPlayAnim(ped, AnimDict, Anim, 8, -8, -1, 0, 0, 0, 0, 0)
end

AddEventHandler("onResourceStop", function(resource)
	if resource == GetCurrentResourceName() then
		deleteBlips()
		for k, v in pairs(NPCList) do DeletePed(v) end
	end
end)

function deleteBlips()
	if JobBlips[1] ~= nil then
		for i = 1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end

function refreshBlips()
	local blipList = {}
	local JobBlips = {}
	for k, v in pairs(FxwSettings.ProcessZone) do
		if v.FxwBlips.Enableblip then
			table.insert(blipList, {
				coords = { v.Position.x, v.Position.y },
				text = v.FxwBlips.Textblip,
				sprite = v.FxwBlips.Spriteblip,
				color = v.FxwBlips.Colorblip,
				scale = v.FxwBlips.Scaleblip
			})
		end
	end
	for i = 1, #blipList, 1 do
		CreateBlip(blipList[i].coords, blipList[i].text, blipList[i].sprite, blipList[i].color, blipList[i].scale)
	end
end

function CreateBlip(coords, text, sprite, color, scale)
	local blip = AddBlipForCoord(table.unpack(coords))
	SetBlipSprite(blip, sprite)
	SetBlipScale(blip, scale)
	SetBlipColour(blip, color)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName"STRING"
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandSetBlipName(blip)
	table.insert(JobBlips, blip)
end

-- ---- NPC
Citizen.CreateThread(function()
	for k, v in pairs(FxwSettings.ProcessZone) do
		RequestModel(GetHashKey(v.Model))
		while not HasModelLoaded(GetHashKey(v.Model)) do Wait(1) end
		playerPed = CreatePed(4, v.Model, v.Position.x, v.Position.y, v.Position.z - 1, v.Headling, false, true)
		FreezeEntityPosition(playerPed, true)
		SetEntityInvincible(playerPed, true)
		SetBlockingOfNonTemporaryEvents(playerPed, true)
		RequestAnimDict(v.DictNPC)
		while not HasAnimDictLoaded(v.DictNPC) do Citizen.Wait(0) end
		Wait(100)
		TaskPlayAnim(playerPed, v.DictNPC, v.AnimNPC, 20, -20, -1, 1, 0, false, false, false)
		table.insert(NPCList, playerPed)
	end
end)

