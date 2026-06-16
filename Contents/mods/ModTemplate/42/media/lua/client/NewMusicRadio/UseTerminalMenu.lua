require "NMRadio"

UseTerminalMenu = {}

UseTerminalMenu.doBuildMenu = function(player, context, worldobjects)
	local Terminal = nil
	local X = nil
	local Y = nil
	local Z = nil

	for _,object in ipairs(worldobjects) do
		local square = object:getSquare()

		if not square then
			return
		end

		X = square:getX()
		Y = square:getY()
		Z = square:getZ()

		for i=1,square:getObjects():size() do
			local thisObject = square:getObjects():get(i-1)
			
			if thisObject:getSprite() then
				local properties = thisObject:getSprite():getProperties()
				local spr = thisObject:getSprite():getName()  

				if properties == nil then
					return
				end

				local customName = nil
				local groupName = nil

				if properties:has("CustomName") then
					customName = properties:get("CustomName")
				end

				if properties:has("GroupName") then
					groupName = properties:get("GroupName")
				end
			
				if customName == "Terminal" and groupName == "Security" then				
					Terminal = thisObject
					Terminal:getModData()

					if not Terminal:getModData()['StationControl'] then
						Terminal:getModData()['StationControl'] = 0
					end

					if not Terminal:getContainer() and ((X == 4833 and Y == 6277 and Z == 0) or (X == 4834 and Y == 6277 and Z == 0) or (X == 4832 and Y == 6279 and Z == 0) or (X == 4837 and Y == 6278 and Z == 0) or (X == 4837 and Y == 6279 and Z == 0) or 
						Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRChannel1 or Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRChannel2 or
						Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRChannel3 or Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRChannel4 or
						Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRChannel5 or Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRMTV) then

						local index = Terminal:getObjectIndex()
						local stationControl = Terminal:getModData()['StationControl']
               					sledgeDestroy(Terminal)
						Terminal:getSquare():transmitRemoveItemFromSquare(Terminal)            

                				Terminal = IsoThumpable.new(getCell(), square, spr, false, ISWoodenContainer:new(spr, nil))  
                				Terminal:setIsContainer(true)
                				Terminal:getContainer():setType("securityterminal")
                				Terminal:getContainer():setCapacity(50)
						Terminal:getModData()['StationControl'] = stationControl

                				--square:AddTileObject(Terminal, index)
						--square:transmitAddObjectToSquare(Terminal, Terminal:getObjectIndex())
						square:transmitAddObjectToSquare(Terminal, index)
						square:transmitModdata()

						local tempGlobalPlaylist = {}
						for k,v in pairs(GlobalMusic) do
    							tempGlobalPlaylist[#tempGlobalPlaylist + 1] = k
						end

						local maxMusic = SandboxVars.NewMusicRadio.NMRMusicTerminalFilledAmount

						if maxMusic == 6 then
							maxMusic = 0
							Terminal:getModData()['LoadedCapacity'] = 0
						elseif maxMusic == 5 then
							maxMusic = ZombRand(1,111)
							Terminal:getModData()['LoadedCapacity'] = ZombRand(1,111)
						elseif maxMusic == 4 then
							maxMusic = ZombRand(75,111)
							Terminal:getModData()['LoadedCapacity'] = ZombRand(75,111)
						elseif maxMusic == 3 then
							maxMusic = ZombRand(25,75)
							Terminal:getModData()['LoadedCapacity'] = ZombRand(25,75)
						elseif maxMusic == 2 then
							maxMusic = ZombRand(10,25)
							Terminal:getModData()['LoadedCapacity'] = ZombRand(10,25)
						elseif maxMusic == 1 then
							maxMusic = ZombRand(1,10)
							Terminal:getModData()['LoadedCapacity'] = ZombRand(1,10)
						end
				
						local canEject = SandboxVars.NewMusicRadio.NMRTerminalEjectsMusic
						if not canEject then
							Terminal:getModData()['LoadedCapacity'] = 0
						end
						Terminal:transmitModData()

						local musicItems = 0
						while musicItems < maxMusic do
							local musicItem = "NewMusic." .. tempGlobalPlaylist[ZombRand(1, #tempGlobalPlaylist+1)]
							local addItem = Terminal:getItemContainer():AddItem(musicItem)
							if isClient() then
								Terminal:getItemContainer():addItemOnServer(addItem)
							end
							musicItems = musicItems + 1
						end
					end
					break
				end
			end 
		end 
	end

	if not Terminal then 
		return 
	end

	if not Terminal:getModData()['LoadedCapacity'] then
		Terminal:getModData()['LoadedCapacity'] = 0
	end

	if (X == 4833 and Y == 6277 and Z == 0) or Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRChannel1 then
		if Terminal:getModData()['StationControl'] == 0 then
			Terminal:getModData()['StationControl'] = SandboxVars.NewMusicRadio.NMRChannel1
		end
		context:addOption(SandboxVars.NewMusicRadio.NMRChannel1/1000 .. "FM: " .. NMRadio.translation.update,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "UpdateA",
				  nil)
		context:addOption(SandboxVars.NewMusicRadio.NMRChannel1/1000 .. "FM: " .. NMRadio.translation.revert,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "RevertA",
				  nil)
	elseif (X == 4834 and Y == 6277 and Z == 0) or Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRChannel2 then
		if Terminal:getModData()['StationControl'] == 0 then
			Terminal:getModData()['StationControl'] = SandboxVars.NewMusicRadio.NMRChannel2
		end
		context:addOption(SandboxVars.NewMusicRadio.NMRChannel2/1000 .. "FM: " .. NMRadio.translation.update,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "UpdateB",
				  nil)
		context:addOption(SandboxVars.NewMusicRadio.NMRChannel2/1000 .. "FM: " .. NMRadio.translation.revert,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "RevertB",
				  nil)
	elseif (X == 4837 and Y == 6278 and Z == 0) or Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRChannel3 then
		if Terminal:getModData()['StationControl'] == 0 then
			Terminal:getModData()['StationControl'] = SandboxVars.NewMusicRadio.NMRChannel3
		end
		context:addOption(SandboxVars.NewMusicRadio.NMRChannel3/1000 .. "FM: " .. NMRadio.translation.update,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "UpdateC",
				  nil)
		context:addOption(SandboxVars.NewMusicRadio.NMRChannel3/1000 .. "FM: " .. NMRadio.translation.revert,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "RevertC",
				  nil)
	elseif (X == 4837 and Y == 6279 and Z == 0) or Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRChannel4 then
		if Terminal:getModData()['StationControl'] == 0 then
			Terminal:getModData()['StationControl'] = SandboxVars.NewMusicRadio.NMRChannel4
		end
		context:addOption(SandboxVars.NewMusicRadio.NMRChannel4/1000 .. "FM: " .. NMRadio.translation.update,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "UpdateD",
				  nil)
		context:addOption(SandboxVars.NewMusicRadio.NMRChannel4/1000 .. "FM: " .. NMRadio.translation.revert,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "RevertD",
				  nil)
	elseif (X == 4832 and Y == 6279 and Z == 0) or Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRChannel5 then
		if Terminal:getModData()['StationControl'] == 0 then
			Terminal:getModData()['StationControl'] = SandboxVars.NewMusicRadio.NMRChannel5
		end
		context:addOption(SandboxVars.NewMusicRadio.NMRChannel5/1000 .. "FM: " .. NMRadio.translation.update,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "UpdateE",
				  nil)
		context:addOption(SandboxVars.NewMusicRadio.NMRChannel5/1000 .. "FM: " .. NMRadio.translation.revert,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "RevertE",
				  nil)
	elseif Terminal:getModData()['StationControl'] == SandboxVars.NewMusicRadio.NMRMTV then
		context:addOption(SandboxVars.NewMusicRadio.NMRMTV .. "TV: " .. NMRadio.translation.update,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "UpdateMTV",
				  nil)
		context:addOption(SandboxVars.NewMusicRadio.NMRMTV .. "TV: " .. NMRadio.translation.revert,
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "RevertMTV",
				  nil)
	end

	if PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRterminalEject"):getValue() and Terminal:getModData()['LoadedCapacity'] > 0 and Terminal:getModData()['StationControl'] ~= 0 then
		local contextMenu2 = context:addOption(NMRadio.translation.ejectmedia)
		local subContext2 = ISContextMenu:getNew(context)
		context:addSubMenu(contextMenu2, subContext2)

		local tempGlobalPlaylist = {}
		for k,v in pairs(GlobalMusic) do
			tempGlobalPlaylist[#tempGlobalPlaylist + 1] = "NewMusic." .. k
		end

		for k,v in pairs(tempGlobalPlaylist) do
			subContext2:addOption(getItemNameFromFullType(v),
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "Eject",
				  v)
		end
	elseif Terminal:getModData()['LoadedCapacity'] > 0 and Terminal:getModData()['StationControl'] ~= 0 then
		local contextMenu2 = context:addOption(NMRadio.translation.ejectmedia .. " (reactivate in mod options)")
	elseif Terminal:getModData()['StationControl'] ~= 0 then
		local contextMenu2 = context:addOption(NMRadio.translation.ejectmedia .. " (Empty)")
	end

	if (getCore():getDebug() or isAdmin()) then
		local contextMenu = nil
		local subContext = nil

		contextMenu = context:addOption("NMRadio Admin Menu")
		subContext = ISContextMenu:getNew(context)
		context:addSubMenu(contextMenu, subContext)

		subContext:addOption("Disconnect Terminal",
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "Disconnect",
				  nil)
		subContext:addOption("Set Terminal To " .. SandboxVars.NewMusicRadio.NMRChannel1/1000 .. "FM",
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "SetTerminalA",
				  nil)
		subContext:addOption("Set Terminal To " .. SandboxVars.NewMusicRadio.NMRChannel2/1000 .. "FM",
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "SetTerminalB",
				  nil)
		subContext:addOption("Set Terminal To " .. SandboxVars.NewMusicRadio.NMRChannel3/1000 .. "FM",
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "SetTerminalC",
				  nil)
		subContext:addOption("Set Terminal To " .. SandboxVars.NewMusicRadio.NMRChannel4/1000 .. "FM",
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "SetTerminalD",
				  nil)
		subContext:addOption("Set Terminal To " .. SandboxVars.NewMusicRadio.NMRChannel5/1000 .. "FM",
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "SetTerminalE",
				  nil)
		if SandboxVars.NewMusicRadio.ActivateNMRMTV then
			subContext:addOption("Set Terminal To " .. SandboxVars.NewMusicRadio.NMRMTV .. "TV",
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "SetTerminalMTV",
				  nil)
		end
		subContext:addOption("Empty Terminal Media",
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "EmptyCapacity",
				  nil)
		subContext:addOption("Reset Terminal Media Capacity [Currently: " .. Terminal:getModData()['LoadedCapacity'] .. " of 111]",
				  worldobjects,
				  UseTerminalMenu.onUseTerminal,
				  getSpecificPlayer(player),
				  Terminal,
				  "ReloadCapacity",
				  nil)

		if PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRterminalBlacklist"):getValue() then
			local contextMenu3 = subContext:addOption("Globally Blacklist Song: ")
			local subContext3 = ISContextMenu:getNew(subContext)
			context:addSubMenu(contextMenu3, subContext3)

			local tempGlobalPlaylistBlacklist = {}
			for k,v in pairs(GlobalMusic) do
				tempGlobalPlaylistBlacklist[#tempGlobalPlaylistBlacklist + 1] = k
			end

			if SandboxVars.NewMusicRadio.NMRExcludeThemeSongs then
				for k,v in pairs(NMRadio.BlacklistThemeSongs) do
					for index = #tempGlobalPlaylistBlacklist, 1, -1 do 
						value = tempGlobalPlaylistBlacklist[index]
						if value == v then 
							table.remove(tempGlobalPlaylistBlacklist, index)
							break
						end
					end
				end
			end
			if SandboxVars.NewMusicRadio.NMRExcludeTCCacheMPSongs then
				for k,v in pairs(NMRadio.BlacklistTCCacheMPSongs) do
					for index = #tempGlobalPlaylistBlacklist, 1, -1 do 
						value = tempGlobalPlaylistBlacklist[index]
						if value == v then 
							table.remove(tempGlobalPlaylistBlacklist, index)
							break
						end
					end
				end
			end
			if SandboxVars.NewMusicRadio.NMRExcludeHolidaySongs then
				for k,v in pairs(NMRadio.BlacklistHolidaySongs) do
					for index = #tempGlobalPlaylistBlacklist, 1, -1 do 
						value = tempGlobalPlaylistBlacklist[index]
						if value == v then 
							table.remove(tempGlobalPlaylistBlacklist, index)
							break
						end
					end
				end
			end
			if NMRadio.Blacklist ~= nil and #NMRadio.Blacklist > 0 then
				for k,v in pairs(NMRadio.Blacklist) do
					for index = #tempGlobalPlaylistBlacklist, 1, -1 do 
						value = tempGlobalPlaylistBlacklist[index]
						if value == v then 
							table.remove(tempGlobalPlaylistBlacklist, index)
							break
						end
					end
				end
			end

			for k,v in pairs(tempGlobalPlaylistBlacklist) do
				subContext3:addOption(getItemNameFromFullType("NewMusic." .. v),
				  	worldobjects,
				  	UseTerminalMenu.onUseTerminal,
				  	getSpecificPlayer(player),
				  	Terminal,
				  	"Blacklist",
				  	v)
			end

			local contextMenu4 = subContext:addOption("Remove Globally Blacklisted Song: ")
			local subContext4 = ISContextMenu:getNew(subContext)
			context:addSubMenu(contextMenu4, subContext4)

			if NMRadio.Blacklist ~= nil and #NMRadio.Blacklist > 0 then
				local tempBlacklist = {}
				for k,v in pairs(NMRadio.Blacklist) do
					if v ~= "Test" then
						tempBlacklist[#tempBlacklist + 1] = v
					end
				end

				for k,v in pairs(tempBlacklist) do
					subContext4:addOption(getItemNameFromFullType("NewMusic." .. v),
					  	worldobjects,
					  	UseTerminalMenu.onUseTerminal,
					  	getSpecificPlayer(player),
				  		Terminal,
				  		"RemoveBlacklist",
				  		v)
				end
			end
		else
			local contextMenu3 = subContext:addOption("Globally Blacklist Song: (reactivate in mod options)")
			local contextMenu4 = subContext:addOption("Remove Globally Blacklisted Song: (reactivate in mod options)")
		end
	end
end

UseTerminalMenu.getFrontSquare = function(square, facing)
	local value = nil
	
	if facing == "S" then
		value = square:getS()
	elseif facing == "E" then
		value = square:getE()
	elseif facing == "W" then
		value = square:getW()
	elseif facing == "N" then
		value = square:getN()
	end
	
	return value
end

UseTerminalMenu.getFacing = function(properties, square)

	local facing = nil

	if properties:has("Facing") then
		facing = properties:get("Facing")
	end

	if square:getE() and facing == "E" then
		facing = "E"
	elseif square:getS() and facing == "S" then
		facing = "S" 
	elseif square:getW() and facing == "W" then
		facing = "W"
	elseif square:getN() and facing == "N" then
		facing = "N"
	else 
		facing = nil
	end

	return facing
end

UseTerminalMenu.walkToFront = function(thisPlayer, Terminal)
	local spriteName = Terminal:getSprite():getName()
	if not spriteName then
		return false
	end

	local properties = Terminal:getSprite():getProperties()
	local facing = UseTerminalMenu.getFacing(properties, Terminal:getSquare())
	if facing == nil then
		thisPlayer:Say(NMRadio.translation.sayaccessblocked)
		return false
	end
	
	local frontSquare = UseTerminalMenu.getFrontSquare(Terminal:getSquare(), facing)
	local turn = UseTerminalMenu.getFrontSquare(frontSquare, facing)
	
	if not frontSquare then
		return false
	end

	local terminalSquare = Terminal:getSquare()

	if AdjacentFreeTileFinder.privTrySquare(terminalSquare, frontSquare) then
		ISTimedActionQueue.add(ISWalkToTimedAction:new(thisPlayer, frontSquare))
		if turn then
			thisPlayer:faceLocation(terminalSquare:getX(), terminalSquare:getY())
		end
		return true
	end

	return false
end

UseTerminalMenu.onUseTerminal = function(worldobjects, player, terminal, MyChoice, music)
	if (not UseTerminalMenu.walkToFront(player, terminal) and terminal:getContainer()) then 
		return 
	end

	local square = terminal:getSquare()

	if not ((SandboxVars.AllowExteriorGenerator and square:haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier and square:isOutside() == false)) then
		player:Say(NMRadio.translation.sayneedsgenerator)
		return
	end

	if MyChoice == "RevertA" then
		square:playSound("LightSwitch")
		NMRadio.PlaylistTerminalA = NMRadio.CreatePlaylist()
		if isClient() then
			sendClientCommand("NMRadio", "UpdatePlaylistTerminalA", NMRadio.PlaylistTerminalA)
		end
		ModData.add("NMRadioA", NMRadio.PlaylistTerminalA)
		--ModData.transmit("NMRadioA", NMRadio.PlaylistTerminalA)
		local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalA+1)
		if isClient() then
			local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRChannel1, number = songNumber}	
			sendClientCommand("NMRadio", "PlayNext", args)
		else
			NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRChannel1)
		end
	elseif MyChoice == "RevertB" then
		square:playSound("LightSwitch")
		NMRadio.PlaylistTerminalB = NMRadio.CreatePlaylist()
		if isClient() then
			sendClientCommand("NMRadio", "UpdatePlaylistTerminalB", NMRadio.PlaylistTerminalB)
		end
		ModData.add("NMRadioB", NMRadio.PlaylistTerminalB)
		--ModData.transmit("NMRadioB", NMRadio.PlaylistTerminalB)	
		local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalB+1)
		if isClient() then
			local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRChannel2, number = songNumber}	
			sendClientCommand("NMRadio", "PlayNext", args)
		else
			NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRChannel2)
		end
	elseif MyChoice == "RevertC" then
		square:playSound("LightSwitch")
		NMRadio.PlaylistTerminalC = NMRadio.CreatePlaylist()
		if isClient() then
			sendClientCommand("NMRadio", "UpdatePlaylistTerminalC", NMRadio.PlaylistTerminalC)
		end
		ModData.add("NMRadioC", NMRadio.PlaylistTerminalC)
		--ModData.transmit("NMRadioC", NMRadio.PlaylistTerminalC)	
		local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalC+1)
		if isClient() then
			local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRChannel3, number = songNumber}	
			sendClientCommand("NMRadio", "PlayNext", args)
		else
			NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRChannel3)
		end
	elseif MyChoice == "RevertD" then
		square:playSound("LightSwitch")
		NMRadio.PlaylistTerminalD = NMRadio.CreatePlaylist()
		if isClient() then
			sendClientCommand("NMRadio", "UpdatePlaylistTerminalD", NMRadio.PlaylistTerminalD)
		end
		ModData.add("NMRadioD", NMRadio.PlaylistTerminalD)
		--ModData.transmit("NMRadioD", NMRadio.PlaylistTerminalD)	
		local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalD+1)
		if isClient() then
			local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRChannel4, number = songNumber}	
			sendClientCommand("NMRadio", "PlayNext", args)
		else
			NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRChannel4)
		end
	elseif MyChoice == "RevertE" then
		square:playSound("LightSwitch")
		NMRadio.PlaylistTerminalE = NMRadio.CreatePlaylist()
		if isClient() then
			sendClientCommand("NMRadio", "UpdatePlaylistTerminalE", NMRadio.PlaylistTerminalE)
		end
		ModData.add("NMRadioE", NMRadio.PlaylistTerminalE)
		--ModData.transmit("NMRadioE", NMRadio.PlaylistTerminalE)	
		local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalE+1)
		if isClient() then
			local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRChannel5, number = songNumber}	
			sendClientCommand("NMRadio", "PlayNext", args)
		else
			NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRChannel5)
		end
	elseif MyChoice == "RevertMTV" then
		square:playSound("LightSwitch")
		NMRadio.PlaylistTerminalMTV = NMRadio.CreatePlaylist()
		if isClient() then
			sendClientCommand("NMRadio", "UpdatePlaylistTerminalMTV", NMRadio.PlaylistTerminalMTV)
		end
		ModData.add("NMRadioMTV", NMRadio.PlaylistTerminalMTV)
		--ModData.transmit("NMRadioMTV", NMRadio.PlaylistTerminalMTV)	
		local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalMTV+1)
		if isClient() then
			local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRMTV, number = songNumber}	
			sendClientCommand("NMRadio", "PlayNext", args)
		else
			NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRMTV)
		end
	elseif MyChoice == "UpdateA" or MyChoice == "UpdateB" or MyChoice == "UpdateC" or MyChoice == "UpdateD" or MyChoice == "UpdateE" or MyChoice == "UpdateMTV" then
		square:playSound("LightSwitch")
		local terminalItems = nil

		if terminal:getContainer() then
			terminalItems = terminal:getItemContainer():getItems()
		end

		if terminalItems:size() == 0 then
			player:Say("There are no items in this terminal.")
			return
		end

		if MyChoice == "UpdateA" then
			NMRadio.PlaylistTerminalA = {}
			for i=0, terminalItems:size()-1 do
				local item = terminalItems:get(i)
				NMRadio.PlaylistTerminalA[#NMRadio.PlaylistTerminalA + 1] = item:getType()
			end
			ModData.add("NMRadioA", NMRadio.PlaylistTerminalA)
			local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalA+1)
			if isClient() then
				--ModData.transmit("NMRadioA", NMRadio.PlaylistTerminalA)
				sendClientCommand("NMRadio", "UpdatePlaylistTerminalA", NMRadio.PlaylistTerminalA)
				local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRChannel1, number = songNumber}	
				sendClientCommand("NMRadio", "PlayNext", args)
				print("NMRadio Client: Transmitting A to server")
			else
				NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRChannel1)
			end
		elseif MyChoice == "UpdateB" then
			NMRadio.PlaylistTerminalB = {}
			for i=0, terminalItems:size()-1 do
				local item = terminalItems:get(i)
				NMRadio.PlaylistTerminalB[#NMRadio.PlaylistTerminalB + 1] = item:getType()
			end
			ModData.add("NMRadioB", NMRadio.PlaylistTerminalB)
			local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalB+1)
			if isClient() then
				--ModData.transmit("NMRadioB", NMRadio.PlaylistTerminalB)
				sendClientCommand("NMRadio", "UpdatePlaylistTerminalB", NMRadio.PlaylistTerminalB)
				local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRChannel2, number = songNumber}	
				sendClientCommand("NMRadio", "PlayNext", args)
				print("NMRadio Client: Transmitting B to server")
			else
				NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRChannel2)
			end
		elseif MyChoice == "UpdateC" then
			NMRadio.PlaylistTerminalC = {}
			for i=0, terminalItems:size()-1 do
				local item = terminalItems:get(i)
				NMRadio.PlaylistTerminalC[#NMRadio.PlaylistTerminalC + 1] = item:getType()
			end
			ModData.add("NMRadioC", NMRadio.PlaylistTerminalC)
			local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalC+1)
			if isClient() then
				--ModData.transmit("NMRadioC", NMRadio.PlaylistTerminalC)
				sendClientCommand("NMRadio", "UpdatePlaylistTerminalC", NMRadio.PlaylistTerminalC)
				local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRChannel3, number = songNumber}	
				sendClientCommand("NMRadio", "PlayNext", args)
				print("NMRadio Client: Transmitting C to server")
			else
				NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRChannel3)
			end
		elseif MyChoice == "UpdateD" then
			NMRadio.PlaylistTerminalD = {}
			for i=0, terminalItems:size()-1 do
				local item = terminalItems:get(i)
				NMRadio.PlaylistTerminalD[#NMRadio.PlaylistTerminalD + 1] = item:getType()
			end
			ModData.add("NMRadioD", NMRadio.PlaylistTerminalD)
			local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalD+1)
			if isClient() then
				--ModData.transmit("NMRadioD", NMRadio.PlaylistTerminalD)
				sendClientCommand("NMRadio", "UpdatePlaylistTerminalD", NMRadio.PlaylistTerminalD)
				local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRChannel4, number = songNumber}	
				sendClientCommand("NMRadio", "PlayNext", args)
				print("NMRadio Client: Transmitting D to server")
			else
				NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRChannel4)
			end
		elseif MyChoice == "UpdateE" then
			NMRadio.PlaylistTerminalE = {}
			for i=0, terminalItems:size()-1 do
				local item = terminalItems:get(i)
				NMRadio.PlaylistTerminalE[#NMRadio.PlaylistTerminalE + 1] = item:getType()
			end
			ModData.add("NMRadioE", NMRadio.PlaylistTerminalE)
			local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalE+1)
			if isClient() then
				--ModData.transmit("NMRadioE", NMRadio.PlaylistTerminalE)
				sendClientCommand("NMRadio", "UpdatePlaylistTerminalE", NMRadio.PlaylistTerminalE)
				local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRChannel5, number = songNumber}	
				sendClientCommand("NMRadio", "PlayNext", args)
				print("NMRadio Client: Transmitting E to server")
			else
				NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRChannel5)
			end
		elseif MyChoice == "UpdateMTV" then
			NMRadio.PlaylistTerminalMTV = {}
			for i=0, terminalItems:size()-1 do
				local item = terminalItems:get(i)
				NMRadio.PlaylistTerminalMTV[#NMRadio.PlaylistTerminalMTV + 1] = item:getType()
			end
			ModData.add("NMRadioMTV", NMRadio.PlaylistTerminalMTV)
			local songNumber = ZombRand(1, #NMRadio.PlaylistTerminalMTV+1)
			if isClient() then
				--ModData.transmit("NMRadioMTV", NMRadio.PlaylistTerminalMTV)
				sendClientCommand("NMRadio", "UpdatePlaylistTerminalMTV", NMRadio.PlaylistTerminalMTV)
				local args = {x = terminal:getX(), y = terminal:getY(), z = terminal:getZ(), channel = SandboxVars.NewMusicRadio.NMRMTV, number = songNumber}	
				sendClientCommand("NMRadio", "PlayNext", args)
				print("NMRadio Client: Transmitting MTV to server")
			else
				NMRadio.UpdateSoundCache(songNumber, SandboxVars.NewMusicRadio.NMRMTV)
			end
		end
	elseif MyChoice == "Disconnect" then
		terminal:getModData()['StationControl'] = 0
		terminal:transmitModData()
	elseif MyChoice == "SetTerminalA" then
		terminal:getModData()['StationControl'] = SandboxVars.NewMusicRadio.NMRChannel1
		terminal:transmitModData()
	elseif MyChoice == "SetTerminalB" then
		terminal:getModData()['StationControl'] = SandboxVars.NewMusicRadio.NMRChannel2
		terminal:transmitModData()
	elseif MyChoice == "SetTerminalC" then
		terminal:getModData()['StationControl'] = SandboxVars.NewMusicRadio.NMRChannel3
		terminal:transmitModData()
	elseif MyChoice == "SetTerminalD" then
		terminal:getModData()['StationControl'] = SandboxVars.NewMusicRadio.NMRChannel4
		terminal:transmitModData()
	elseif MyChoice == "SetTerminalE" then
		terminal:getModData()['StationControl'] = SandboxVars.NewMusicRadio.NMRChannel5
		terminal:transmitModData()
	elseif MyChoice == "SetTerminalMTV" then
		terminal:getModData()['StationControl'] = SandboxVars.NewMusicRadio.NMRMTV
		terminal:transmitModData()
	elseif MyChoice == "ReloadCapacity" then
		terminal:getModData()['LoadedCapacity'] = 111
		terminal:transmitModData()
	elseif MyChoice == "EmptyCapacity" then
		terminal:getModData()['LoadedCapacity'] = 0
		terminal:transmitModData()
	elseif MyChoice == "Eject" then
		terminal:getModData()['LoadedCapacity'] = terminal:getModData()['LoadedCapacity'] - 1
		terminal:transmitModData()
		square:playSound("TCBoombox_stop")
		if isClient() then
			sendClientCommand("NMRadio", "EjectMedia", {media = music})
		else
			player:getInventory():AddItem(music)
		end
	elseif MyChoice == "Blacklist" then
		local found = false
		if NMRadio.Blacklist ~= nil and #NMRadio.Blacklist > 0 then
			for index = #NMRadio.Blacklist, 1, -1 do 
				value = NMRadio.Blacklist[index]
				if value == music then
					found = true
				end
			end
    		end 
		if found == false then
			if NMRadio.Blacklist == nil then
				NMRadio.Blacklist = { "Test" }
			end
    			table.insert(NMRadio.Blacklist, 1, music)
		end
		ModData.add("NMRadioBlacklist", NMRadio.Blacklist)
		if isClient() then
			--ModData.transmit("NMRadioBlacklist", NMRadio.Blacklist)
			sendClientCommand("NMRadio", "UpdateBlacklist", NMRadio.Blacklist)
			print("NMRadio Client: Transmitting blacklist to server")
		end
	elseif MyChoice == "RemoveBlacklist" then
		if NMRadio.Blacklist ~= nil and #NMRadio.Blacklist > 0 then
			for index = #NMRadio.Blacklist, 1, -1 do 
				value = NMRadio.Blacklist[index]
				if value == music then
					table.remove(NMRadio.Blacklist, index)
				end
			end
    		end 
		ModData.add("NMRadioBlacklist", NMRadio.Blacklist)
		if isClient() then
			--ModData.transmit("NMRadioBlacklist", NMRadio.Blacklist)
			sendClientCommand("NMRadio", "UpdateBlacklist", NMRadio.Blacklist)
			print("NMRadio Client: Transmitting blacklist to server")
		end
	end
end

Events.OnPreFillWorldObjectContextMenu.Add(UseTerminalMenu.doBuildMenu)