ESX = FxwSettings.ESX

FxwDev = GetCurrentResourceName()


RegisterNetEvent(FxwDev..':0xD10B862B')
AddEventHandler(FxwDev..':0xD10B862B', function(item, remove)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then return end

    local DataItem = {}

    for k, v in pairs(item) do
        if not v.ItemName or not v.ItemCount then
            print("^1[ERROR] Invalid item data: ", json.encode(v))
            return
        end

        if FxwSettings.UseOxInventory then
            if math.random(0, 100) <= v.Percent then
                if exports.ox_inventory:CanCarryItem(_source, v.ItemName, v.ItemCount) then
                    exports.ox_inventory:AddItem(_source, v.ItemName, v.ItemCount)
                    local itemnameLabel = v.Text
                    DiscordSend(v.ItemName, itemnameLabel, v.ItemCount)
                    table.insert(DataItem, { Name = v.ItemName, Count = v.ItemCount })
                else
                    FxwSettings.NotifyWeightFull(xPlayer)
                end
            end
        else
            local A = xPlayer.getInventoryItem(v.ItemName)
            local itemnameLabel = v.Text
            local B = v.ItemCount

            if FxwSettings.Extended then
                if xPlayer.canCarryItem(A.name, B) then
                    if math.random(0, 100) <= v.Percent then
                        xPlayer.addInventoryItem(A.name, B)
                        DiscordSend(A.name, itemnameLabel, B)
                        table.insert(DataItem, { Name = A.name, Count = B })
                    end
                else
                    FxwSettings.NotifyWeightFull(xPlayer)
                end
            else
                if A.limit == -1 or (A.count + B) <= A.limit then
                    if math.random(0, 100) <= v.Percent then
                        xPlayer.addInventoryItem(A.name, B)
                        DiscordSend(A.name, itemnameLabel, B)
                        table.insert(DataItem, { Name = A.name, Count = B })
                    end
                else
                    print("^3[INFO] Item limit reached for", A.name)
                end
            end
        end
    end

    for k, v in pairs(remove) do
        if v.ItemName and v.ItemCount then
            if FxwSettings.UseOxInventory then
                exports.ox_inventory:RemoveItem(_source, v.ItemName, v.ItemCount)
            else
                xPlayer.removeInventoryItem(v.ItemName, v.ItemCount)
            end
        else
            print("^1[ERROR] Invalid remove data: ", json.encode(v))
        end
    end

    TriggerClientEvent(FxwDev..'UpdateCountAdd', _source, DataItem)
end)

DiscordSend = function(iname, itemnameLebel, icount)
    local Playername = GetPlayerName(source)

    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer == nil then
        return false
    end
    local discordId = GetDiscordID(playerId)
    local playerIp = GetPlayerEndpoint(playerId)
    if not discordId then
        discordId = "N/A"
        discordName = "N/A"
    else
        discordId = string.gsub(discordId, "discord:", "")
        discordName = "<@" .. discordId .. ">"
    end
    if not playerIp then
        playerIp = "N/A"
    end
    local desc = ("**Name**: `%s`\n**Identifier**: `%s`\n**Discord**: %s\n**Discord ID**: `%s`\n**IP Address**: `%s`"):format(Playername, xPlayer.identifier, discordName, discordId, playerIp)

    PerformHttpRequest(FxwSettings.Webhook.DiscordAPI.log, function(err, text, headers) end, 'POST', json.encode({
        username = FxwSettings.Webhook.DiscordAPI.Discordbotname,
        avatar_url = FxwSettings.Webhook.DiscordAPI.Discordlogo,
        content = '',

        embeds = {
            {
                color = 16777215,
                title = ("Received `%s` (`%s`) amount `%s` from a post"):format(iname, itemnameLabel, icount),
                description = desc,
                footer = {
                    text = " Fxw - Developer "..os.date("%d/%m/%Y - %H:%M:%S", os.time()).."",
                }

            }
        }
    }), { ['Content-Type'] = 'application/json' })
end

function GetDiscordID(src)
    local discordId = nil
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            discordId = v
            break
        end
    end
    if discordId == nil or discordId:sub(1, 8) ~= "discord:" then
        return false
    end
    return discordId
end


PerformHttpRequest("https://api.ipify.org/", function (err, text, headers)
    if text ~= "127.0.0.1" then
        Wait(10000)
       CheckingIp = false

        print('^0[ ^3 CATX - Auto Process ^0 ] ^2Checking IP ...^0')
		print('^0[ ^3 CATX - Auto Process ^0 ] Your IP has not been successfully validated!^0')
		print('^0[ ^3 CATX - Auto Process ^0 ] ^2Closing Server^0')
        Wait(12000)
        os.exit(-1)
    else
		print('^0[ ^3 CATX - Auto Process ^0 ] ^2Checking IP ...^0')
		print('^0[ ^3 CATX - Auto Process ^0 ] Your IP has been successfully validated!^0')
		print('^0[ ^3 CATX - Auto Process ^0 ] ^2Enjoy your server!^0')

       CheckingIp = true
    end
end)