--> @  ███████╗██╗░░██╗░██╗░░░░░░░██╗ ░░░░░░ ██████╗░███████╗██╗░░░██╗███████╗██╗░░░░░░█████╗░██████╗░███████╗██████╗░ @ <--
--> @  ██╔════╝╚██╗██╔╝░██║░░██╗░░██║ ░░░░░░ ██╔══██╗██╔════╝██║░░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗██╔════╝██╔══██╗ @ <--
--> @  █████╗░░░╚███╔╝░░╚██╗████╗██╔╝ █████╗ ██║░░██║█████╗░░╚██╗░██╔╝█████╗░░██║░░░░░██║░░██║██████╔╝█████╗░░██████╔╝ @ <--
--> @  ██╔══╝░░░██╔██╗░░░████╔═████║░ ╚════╝ ██║░░██║██╔══╝░░░╚████╔╝░██╔══╝░░██║░░░░░██║░░██║██╔═══╝░██╔══╝░░██╔══██╗ @ <--
--> @  ██║░░░░░██╔╝╚██╗░░╚██╔╝░╚██╔╝░ ░░░░░░ ██████╔╝███████╗░░╚██╔╝░░███████╗███████╗╚█████╔╝██║░░░░░███████╗██║░░██║ @ <--
--> @  ╚═╝░░░░░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░ ░░░░░░ ╚═════╝░╚══════╝░░░╚═╝░░░╚══════╝╚══════╝░╚════╝░╚═╝░░░░░╚══════╝╚═╝░░╚═╝ @ <--

--[[

    --> @ 💬 Export from Fxw.xyz => discord:[ !🧠fxwppyps.exe || https://discord.gg/NDDujt4hrT ] 

    --> @ ☕ Thank You For Your Support. 

]]--


FxwSettings.NotifyFullItem = function()  
    lib.notify({
        title = "Inventory Full",
        description = "Your inventory is full!",
        type = "error",
        duration = 3000
    })
end

FxwSettings.NotifyWeightFull = function(xPlayer)  
    xPlayer.triggerEvent("ox_lib:notify", {
        title = "Bag Full",
        description = "Your bag is full!",
        type = "error",
        duration = 3000
    })
end

FxwSettings.NotifyNoItem = function()  
    lib.notify({
        title = "No Item",
        description = "You don't have the required item!",
        type = "error",
        duration = 3000
    })
end

FxwSettings.NotifyZone = function()  
    lib.notify({
        title = "Process",
        description = "You have Cancelled the Processing!",
        type = "error",
        duration = 3000
    })
end

FxwSettings.NotifyNoProcess = function()  
    lib.notify({
        title = "Processing Not Allowed",
        description = "You cannot process items while in a vehicle!",
        type = "error",
        duration = 3000
    })
end
