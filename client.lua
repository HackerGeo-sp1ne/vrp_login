--[[
    FiveM Scripts
	The Official HackerGeo Script 
	Credits - HackerGeo
	Website - www.HackerGeo.com
	GitHub - GITHUB.com/HackerGeo-sp1ne
	Steam - SteamCommunity.com/id/HackerGeo1
	Copyright 2019 ©HackerGeo. All rights served
]]

------------------------------------------------------WARNING-----------------------------------------------------
---------------------Do not reupload/re release any part of this script without my permission---------------------
------------------------------------------------------------------------------------------------------------------



local login = false

function openGui()
  SetTimecycleModifier('hud_def_blur')
  SetNuiFocus(true, true)
  SendNUIMessage({openmenu = true})
  DisplayRadar(false)
end

function closeGui()
  SetTimecycleModifier('default')
  SetNuiFocus(false)
  SendNUIMessage({openmenu = false})
  login = false
  DisplayRadar(true)
end

RegisterNetEvent('login:open')
AddEventHandler('login:open', function()
  openGui()
  login = true
end)

RegisterNetEvent('login:close')
AddEventHandler('login:close', function()
  closeGui()
  login = false
end)

RegisterNUICallback('close', function(data, cb)
  closeGui()
  cb('ok')
end)

RegisterNUICallback('registerSubmit', function(data, cb)
  TriggerServerEvent('register:create', data.username, data.parola, data.parola2)
  cb('ok')
end)


RegisterNUICallback('loginSubmit', function(data, cb)
  TriggerServerEvent('login:check', data.username, data.parola)
  cb('ok')
end)