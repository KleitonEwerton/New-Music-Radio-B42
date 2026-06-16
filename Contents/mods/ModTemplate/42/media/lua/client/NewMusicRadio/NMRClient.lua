NMRadioClient = {}

NMRadioClient.PlaylistTerminalA = {}
NMRadioClient.PlaylistTerminalB = {}
NMRadioClient.PlaylistTerminalC = {}
NMRadioClient.PlaylistTerminalD = {}
NMRadioClient.PlaylistTerminalE = {}
NMRadioClient.PlaylistTerminalMTV = {}

NMRadioClient.Channels = {}

NMRadioClient.Blacklist = {}

NMRadioClient.FindRadio = function(args)
	if not args then
		return
	end

    	local radio = nil
	local square = getSquare(args.x, args.y, args.z)
    
    	-- Radio Device: Portable/HAM radio or vehicle radio
	if square then
        	for i = 0, square:getObjects():size()-1 do
        		local item = square:getObjects():get(i)

            		-- Portable/HAM radio or television
            		--if instanceof(item, "IsoRadio") and item:getDeviceData() ~= nil then
 			if (instanceof(item, "IsoRadio") or instanceof(item, "IsoTelevision")) and item:getDeviceData() ~= nil then
                		radio = item
                		break
            		end

            		-- Vehicle radio
            		if instanceof(item, "IsoObject") then
               			local vehicle = square:getVehicleContainer()
                		if vehicle then
                    			local part = vehicle:getPartById("Radio");
                    			if part and part:getDeviceData() then
                      				radio = part
                      				break
                    			end
                		end
			end
            	end
        end

	return radio
end

NMRadioClient.Stop = function(args)
	if not args then
		return
	end

	print("NMRadio Client: Received stop command at " .. args.x .. " " .. args.y .. " " .. args.z)

	if #NMRadio.soundCache > 0 then
		for index = #NMRadio.soundCache, 1, -1 do 
			t = NMRadio.soundCache[index]  
			if t.x == args.x and t.y == args.y and t.z == args.z then
				t.sound:setVolume(0)
				t.muted = true
                		NMRadio.updateVolume(t)
				t.sound:stop()
				table.remove(NMRadio.soundCache, index)
			end
		end
	end
end

NMRadioClient.Play = function(args)
	if not args then
		return
	end

	NMRadio.Channels[args.channel] = args.number

	print("NMRadio Client: Received play command")

	local radio = nil

	if #NMRadio.soundCache > 0 then
		for _,t in ipairs(NMRadio.soundCache) do
			if t.x == args.x and t.y == args.y and t.z == args.z then
				radio = t.device
			end
		end	
	end	

	if radio == nil then
		radio = NMRadioClient.FindRadio(args)
	end

	if radio == nil then
		return
	end

	print("NMRadio Client: Play " .. args.number)
	NMRadio.PlaySound(args.number, radio)
end

NMRadioClient.PlayNext = function(args)
	if not args then
		return
	end

	NMRadio.Channels[args.channel] = args.number

	print("NMRadio Client: Received playnext command")

	if #NMRadio.soundCache > 0 then
		--print("NMRadio Client: Soundcache updating channel: " .. args.channel)
		NMRadio.UpdateSoundCache(args.number, args.channel)
	end

	local radio = nil

	if #NMRadio.soundCache > 0 then
		for _,t in ipairs(NMRadio.soundCache) do
			if t.x == args.x and t.y == args.y and t.z == args.z then
				radio = t.device
			end
		end	
	end	

	if radio == nil then
		radio = NMRadioClient.FindRadio(args)
	end

	if radio == nil then
		return
	end

	--print("NMRadio Client: Playnext on new radio: " .. args.number)
	NMRadio.PlaySound(args.number, radio)
end

NMRadioClient.UpdatePlaylistTerminalA = function(args)
	print("NMRadio Client: getting update for A")
	NMRadioClient.PlaylistTerminalA = args
	ModData.add("NMRadioA", NMRadioClient.PlaylistTerminalA)
end

NMRadioClient.UpdatePlaylistTerminalB = function(args)
	print("NMRadio Client: getting update for B")
	NMRadioClient.PlaylistTerminalB = args
	ModData.add("NMRadioB", NMRadioClient.PlaylistTerminalB)
end

NMRadioClient.UpdatePlaylistTerminalC = function(args)
	print("NMRadio Client: getting update for C")
	NMRadioClient.PlaylistTerminalC = args
	ModData.add("NMRadioC", NMRadioClient.PlaylistTerminalC)
end

NMRadioClient.UpdatePlaylistTerminalD = function(args)
	print("NMRadio Client: getting update for D")
	NMRadioClient.PlaylistTerminalD = args
	ModData.add("NMRadioD", NMRadioClient.PlaylistTerminalD)
end

NMRadioClient.UpdatePlaylistTerminalE = function(args)
	print("NMRadio Client: getting update for E")
	NMRadioClient.PlaylistTerminalE = args
	ModData.add("NMRadioE", NMRadioClient.PlaylistTerminalE)
end

NMRadioClient.UpdatePlaylistTerminalMTV = function(args)
	print("NMRadio Client: getting update for MTV")
	NMRadioClient.PlaylistTerminalMTV = args
	ModData.add("NMRadioMTV", NMRadioClient.PlaylistTerminalMTV)
end

NMRadioClient.UpdateChannels = function(args)
	print("NMRadio Client: getting update for channels")
	NMRadioClient.Channels = args
	NMRadio.Channels = args
	ModData.add("NMRadioChannels", NMRadioClient.Channels)
end

NMRadioClient.UpdateBlacklist = function(args)
	print("NMRadio Client: getting update for the blacklist")
	NMRadioClient.Blacklist = args
	NMRadio.Blacklist= args
	ModData.add("NMRadioBlacklist", NMRadioClient.Blacklist)
end

NMRadioClient.OnServerCommand = function(module, command, args)
    	if not (module == "NMRadio" and NMRadioClient[command]) then
		return
	end
	--print("NMRadio Client: Getting a " .. command .. " from the server")
        NMRadioClient[command](args)
end

Events.OnServerCommand.Add(NMRadioClient.OnServerCommand)

NMRadioClient.OnReceiveGlobalModDataClient = function(module, args)
	if not args then
		return
	end
	
    	if module == "NMRadioA" then
		NMRadioClient.PlaylistTerminalA = args
		NMRadio.PlaylistTerminalA = args
		ModData.add("NMRadioA", NMRadioClient.PlaylistTerminalA)
	elseif module == "NMRadioB" then
		NMRadioClient.PlaylistTerminalB = args
		NMRadio.PlaylistTerminalB = args
		ModData.add("NMRadioB", NMRadioClient.PlaylistTerminalB)
	elseif module == "NMRadioC" then
		NMRadioClient.PlaylistTerminalC = args
		NMRadio.PlaylistTerminalC = args
		ModData.add("NMRadioC", NMRadioClient.PlaylistTerminalC)
	elseif module == "NMRadioD" then
		NMRadioClient.PlaylistTerminalD = args
		NMRadio.PlaylistTerminalD = args
		ModData.add("NMRadioD", NMRadioClient.PlaylistTerminalD)
	elseif module == "NMRadioE" then
		NMRadioClient.PlaylistTerminalE = args
		NMRadio.PlaylistTerminalE = args
		ModData.add("NMRadioE", NMRadioClient.PlaylistTerminalE)
	elseif module == "NMRadioMTV" then
		NMRadioClient.PlaylistTerminalMTV = args
		NMRadio.PlaylistTerminalMTV = args
		ModData.add("NMRadioMTV", NMRadioClient.PlaylistTerminalMTV)
	elseif module == "NMRadioBlacklist" then
		NMRadioClient.Blacklist = args
		NMRadio.Blacklist = args
		ModData.add("NMRadioBlacklist", NMRadioClient.Blacklist)
	end
end

Events.OnReceiveGlobalModData.Add(NMRadioClient.OnReceiveGlobalModDataClient)

NMRadioClient.UpdatePlaylistFromServer = function()
	print("NMRadio Client: Sending request for terminal playlist from the server")
	sendClientCommand("NMRadio", "UpdatePlaylistTerminalA", {request = true})
	sendClientCommand("NMRadio", "UpdatePlaylistTerminalB", {request = true})
	sendClientCommand("NMRadio", "UpdatePlaylistTerminalC", {request = true})
	sendClientCommand("NMRadio", "UpdatePlaylistTerminalD", {request = true})
	sendClientCommand("NMRadio", "UpdatePlaylistTerminalE", {request = true})
	sendClientCommand("NMRadio", "UpdatePlaylistTerminalMTV", {request = true})
	sendClientCommand("NMRadio", "UpdateChannels", {request = true})
	sendClientCommand("NMRadio", "UpdateBlacklist", {request = true})
end

return NMRadioClient