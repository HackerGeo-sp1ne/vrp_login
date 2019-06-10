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



local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_login")
MySQL = module("vrp_mysql", "MySQL")

MySQL.createCommand("vRP/create_account", "INSERT IGNORE INTO vrp_login(user_id, username, parola) VALUES(@user_id, @username, @parola)")
MySQL.createCommand("vRP/get_account", "SELECT * FROM vrp_login WHERE user_id = @user_id")

AddEventHandler("vRP:playerSpawn",function(source,first_spawn)
  if first_spawn then
    TriggerClientEvent("login:open", source)
  end
end)

RegisterServerEvent('login:check')
AddEventHandler('login:check', function(username,parola)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  MySQL.query("vRP/get_account", {user_id = user_id}, function(rows, affected)
    if #rows > 0 then
      if (rows[1].username == username) and (rows[1].parola == parola) then
        vRPclient.notify(player,{"~g~Te-ai conectat cu succes!"})
        TriggerClientEvent("login:close", player)
      else
        vRPclient.notify(player,{"~r~Username-ul sau parola nu corespune!"})
      end
    else
      vRPclient.notify(player,{"~r~Nu ai creat nici-un cont!"})
    end
  end)
end)

RegisterServerEvent('register:create')
AddEventHandler('register:create', function(username,parola,parola2)
	local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  if (parola == parola2) then
    if(string.len(parola) >= 5) and (string.len(parola) <= 10) then
      if not (username == parola) then
        MySQL.query("vRP/get_account", {user_id = user_id}, function(rows, affected)
          if #rows == 0 then
            vRPclient.notify(player,{"~g~Ai registrat contul cu succes!"})
            vRPclient.notify(player,{"~b~USERNAME: ~w~"..username..", ~b~PAROLA: ~w~"..parola})
            MySQL.query("vRP/create_account", {user_id = user_id, username = username, parola = parola})
          else
            vRPclient.notify(player,{"~r~Ai deja un cont! ~w~("..rows[1].username..")"})
          end
        end)
      else
        vRPclient.notify(player,{"~r~Parola trebuie sa fie diferita de username!"})
      end
    else
      vRPclient.notify(player,{"~r~Parola trebuie sa contina intre 5 si 10 caractere!"})
    end
  else
    vRPclient.notify(player,{"~r~Parolele nu corespund!"})
  end
end)