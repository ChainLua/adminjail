ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- On Jail
local frozen = {}
TriggerEvent('es:addGroupCommand', 'adminjail', "mod", function(src, args, raw)

	local xPlayer = ESX.GetPlayerFromId(src)

	--if xPlayer["job"]["name"] == "police" then

		local jailPlayer = args[1]
		local jailTime = tonumber(args[2])
		local jailReason = table.concat(args, " ",3)
		local xTarget  = ESX.GetPlayerFromId(jailPlayer)

	--[[	if args[7] ~= nil then
		jailReason = args[7] .. ' ' .. args[6] .. ' ' .. args[5] .. ' ' .. args[4] .. '' .. args[3] .. ''
		elseif args[6] ~= nil then
			jailReason = args[6] .. ' ' .. args[5] .. ' ' .. args[4] .. '' .. args[3] .. ''
		elseif args[5] ~= nil then
			jailReason = args[5] .. ' ' .. args[4] .. '' .. args[3] .. ''
		elseif args[4] ~= nil then 
			jailReason = args[7] .. ' ' .. args[6] .. ' ' .. args[5] .. ' ' .. args[4] .. '' .. args[3] .. ''
		end--]]
		--if jailPlayer == src then
		if GetPlayerName(jailPlayer) ~= nil then

			if jailTime ~= nil then
				JailPlayer(jailPlayer, jailTime)

				TriggerClientEvent("esx:showNotification", src, GetPlayerName(jailPlayer) .. " Jailed for " .. jailTime .. " minutes!")
				xTarget.addInventoryItem('bread', 10)
				xTarget.addInventoryItem('water', 10)

				if args[3] ~= nil then
					GetRPName(jailPlayer, function(Firstname, Lastname)
						TriggerClientEvent('chat:addMessage', -1, {
							template = "<div style='font-size: calc(2.1vw / 1.77777);display: inline-block;line-height: calc((2.7vw / 1.77777) * 1.2); background-color:rgba(0, 0, 0, 0.5); border-radius: 7px;'><la style='padding: 5px;'><a style='padding: 5px;'>{0}</a></la></div>",
							args = { ( '^*' .. 'Admin Jail : ' .. GetPlayerName(jailPlayer) .. ' Is In The Jail For '  .. jailTime .. ' Minutes^r ' .. jailReason .. '' ) }
						})
						sendToDiscord('** ' .. GetPlayerName(jailPlayer) .. ' Is In Admin Jail | By ' .. GetPlayerName(src) .. ' For ' .. jailTime .. ' Minutes**'  )
						--TriggerClientEvent('chat:addMessage', -1, { args = { "JUDGE",  Firstname .. " " .. Lastname .. " Is now in jail for the reason: " .. args[3] }, color = { 249, 166, 0 } })
					end)
				end
			else
				TriggerClientEvent("esx:showNotification", src, "This time is invalid!")
			end
		else
			TriggerClientEvent("esx:showNotification", src, "This ID is not online!")
		end
	--else
		--TriggerClientEvent("esx:showNotification", src, "You are not an officer!")
	--end
	--else
	--	TriggerClientEvent("esx:showNotification", src, "You Cant Jail Yourself")
	--end

end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = "Admin Jail Player", params = {{name = "userid", help = "The ID of the player"}}})


TriggerEvent('es:addGroupCommand', 'unadminjail', "mod", function(src, args, raw)
	local xPlayer = ESX.GetPlayerFromId(src)
	local jailPlayer = args[1]

	if GetPlayerName(jailPlayer) ~= nil then
		UnJail(jailPlayer)
	else
		TriggerClientEvent("esx:showNotification", src, "This ID is not online!")
	end


end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = "Un Admin Jail Player", params = {{name = "userid", help = "The ID of the player"}}})

--[[RegisterCommand("unjail", function(src, args)

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer["job"]["name"] == "police" then

		local jailPlayer = args[1]

		if GetPlayerName(jailPlayer) ~= nil then
			UnJail(jailPlayer)
		else
			TriggerClientEvent("esx:showNotification", src, "This ID is not online!")
		end
	else
		TriggerClientEvent("esx:showNotification", src, "You are not an officer!")
	end
end)--]]

RegisterServerEvent("adminjail:jailPlayer")
AddEventHandler("adminjail:jailPlayer", function(targetSrc, jailTime, jailReason)
	local src = source
	local targetSrc = tonumber(targetSrc)

	JailPlayer(targetSrc, jailTime)

	GetRPName(targetSrc, function(Firstname, Lastname)
		TriggerClientEvent('chat:addMessage', -1, { args = { "JUDGE",  Firstname .. " " .. Lastname .. " Is now in jail for the reason: " .. jailReason }, color = { 249, 166, 0 } })
	end)

	TriggerClientEvent("esx:showNotification", src, GetPlayerName(targetSrc) .. " Jailed for " .. jailTime .. " minutes!")
end)

RegisterServerEvent("adminjail:msg")
AddEventHandler("adminjail:msg", function(targetSrc, jailTime, jailReason)
	local src = source
	local targetSrc = tonumber(targetSrc)

	JailPlayer(targetSrc, jailTime)

	GetRPName(targetSrc, function(Firstname, Lastname)

		TriggerClientEvent('chat:addMessage', -1, { args = { "JUDGE",  Firstname .. " " .. Lastname .. " Is now in jail for the reason: " .. jailReason }, color = { 249, 166, 0 } })
	end)

	TriggerClientEvent("esx:showNotification", src, GetPlayerName(targetSrc) .. " Jailed for " .. jailTime .. " minutes!")
end)


RegisterServerEvent("adminjail:unJailPlayer")
AddEventHandler("adminjail:unJailPlayer", function(targetIdentifier)
	local src = source
	local xPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)

	if xPlayer ~= nil then
		UnJail(xPlayer.source)
	else
		MySQL.Async.execute(
			"UPDATE users SET adminjail = @newJailTime WHERE identifier = @identifier",
			{
				['@identifier'] = targetIdentifier,
				['@newJailTime'] = 0
			}
		)
	end

	TriggerClientEvent("esx:showNotification", src, xPlayer.name .. " Unjailed!")
end)

RegisterServerEvent("adminjail:givefood")
AddEventHandler("adminjail:givefood", function(target)
--	local source = target
	local xPlayer  = ESX.GetPlayerFromId(source)
	XPlayer.addInventoryItem('bread', 10)
	XPlayer.addInventoryItem('water', 10)

end)

RegisterServerEvent("adminjail:updateJailTime")
AddEventHandler("adminjail:updateJailTime", function(newJailTime)
	local src = source

	EditJailTime(src, newJailTime)
end)

RegisterServerEvent("adminjail:prisonWorkReward")
AddEventHandler("adminjail:prisonWorkReward", function()
	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)

	xPlayer.addMoney(math.random(13, 21))

	TriggerClientEvent("esx:showNotification", src, "Thanks, here you have som cash for food!")
end)

function JailPlayer(jailPlayer, jailTime)
	TriggerClientEvent("adminjail:jailPlayer", jailPlayer, jailTime)

	EditJailTime(jailPlayer, jailTime)
end

function UnJail(jailPlayer)
	TriggerClientEvent("adminjail:unJailPlayer", jailPlayer)

	EditJailTime(jailPlayer, 0)
end

function EditJailTime(source, jailTime)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier

	MySQL.Async.execute(
       "UPDATE users SET adminjail = @newJailTime WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newJailTime'] = tonumber(jailTime)
		}
	)
end

function GetRPName(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier

	MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		data(result[1].firstname, result[1].lastname)

	end)
end

ESX.RegisterServerCallback("adminjail:retrieveJailedPlayers", function(source, cb)
	
	local jailedPersons = {}

	MySQL.Async.fetchAll("SELECT firstname, lastname, adminjail, identifier FROM users WHERE jail > @jail", { ["@jail"] = 0 }, function(result)

		for i = 1, #result, 1 do
			table.insert(jailedPersons, { name = result[i].firstname .. " " .. result[i].lastname, jailTime = result[i].adminjail, identifier = result[i].identifier })
		end

		cb(jailedPersons)
	end)
end)

ESX.RegisterServerCallback("adminjail:retrieveJailTime", function(source, cb)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT adminjail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		local JailTime = tonumber(result[1].adminjail)

		if JailTime > 0 then

			cb(true, JailTime)
		else
			cb(false, 0)
		end

	end)
end)

function sendToDiscord(message)
	local DiscordWebHook = Config.Discord
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end