function DynamicRadio.OnNewSong(channel, prettyName)
	--print(channel .. ": " .. prettyName)
    	if not DynamicRadio.valid then
        	return
    	end

	local gt = getGameTime()
    	local radio = getZomboidRadio()

	for k,v in ipairs(DynamicRadio.scripts) do
        	if DynamicRadio.cache[v.channelUUID] and v.channelUUID == tostring(channel) then
            		v.OnNewSong(DynamicRadio.cache[v.channelUUID], gt, radio, prettyName)
    		end
	end
end

function DynamicRadio.OnEveryTenMinutes()
    	if not DynamicRadio.valid then
        	return
    	end

	local gt = getGameTime()
    	local radio = getZomboidRadio()

	--print(getGameTime():getMinutes() .. " minutes")

	if getGameTime():getMinutes() < 10 then
   		for k,v in ipairs(DynamicRadio.scripts) do
        		if DynamicRadio.cache[v.channelUUID] and v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRChannel1) or v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRChannel2) or v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRChannel3) or v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRChannel4) or v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRChannel5) or (v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRMTV) and SandboxVars.NewMusicRadio.ActivateNMRMTV) then
				if SandboxVars.NewMusicRadio.NMRRadioWeatherBroadcast or SandboxVars.NewMusicRadio.NMRRadioHordeNightBroadcast then
					--print(v.channelUUID .. ": weather or horde night broadcast on - one hour")
            				v.OnEveryHour(DynamicRadio.cache[v.channelUUID], gt, radio)
				else
					--print(v.channelUUID .. ": weather and horde night broadcast off - ten mins")
					v.OnEveryTenMinutes(DynamicRadio.cache[v.channelUUID], gt, radio)
				end
        		end
    		end
	else
    		for k,v in ipairs(DynamicRadio.scripts) do
        		if DynamicRadio.cache[v.channelUUID] and v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRChannel1) or v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRChannel2) or v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRChannel3) or v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRChannel4) or v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRChannel5) or (v.channelUUID == tostring(SandboxVars.NewMusicRadio.NMRMTV) and SandboxVars.NewMusicRadio.ActivateNMRMTV) then
				--print(v.channelUUID .. ": beyond hour - ten mins")
            			v.OnEveryTenMinutes(DynamicRadio.cache[v.channelUUID], gt, radio)
        		end
    		end
	end
end

Events.EveryTenMinutes.Add(DynamicRadio.OnEveryTenMinutes)

function DynamicRadio.CheckChannelList(_scriptManager)
	--print("NMRadio Server: Add Channel List")
	local modData = getGameTime():getModData()

    	if modData.dynamicRadio then
		for index = #modData.dynamicRadio, 1, -1 do 
			t = modData.dynamicRadio[index] 
			if t.name == "New Music Radio" or t.name == "New Music MTV" then
				if t.uuid ~= tostring(SandboxVars.NewMusicRadio.NMRChannel1) and t.uuid ~= tostring(SandboxVars.NewMusicRadio.NMRChannel2) and t.uuid ~= tostring(SandboxVars.NewMusicRadio.NMRChannel3) and t.uuid ~= tostring(SandboxVars.NewMusicRadio.NMRChannel4) and t.uuid ~= tostring(SandboxVars.NewMusicRadio.NMRChannel5) and t.uuid ~= tostring(SandboxVars.NewMusicRadio.NMRMTV) then
					print("NMRadio Server: Removing Moddata and Channel for " .. t.uuid)
					_scriptManager:RemoveChannel(t.uuid)
					table.remove(modData.dynamicRadio, index)
				end
			end
		end
	end

	local TMR1 = false
	local TMR2 = false
	local TMR3 = false
	local TMR4 = false
	local TMR5 = false
	local TMRMTV = false
	for index = #DynamicRadio.channels, 1, -1 do 
		t = DynamicRadio.channels[index]  
		if t.name == "New Music Radio" and t.uuid == tostring(SandboxVars.NewMusicRadio.NMRChannel1) then
			TMR1 = true
		end
		if t.name == "New Music Radio" and t.uuid == tostring(SandboxVars.NewMusicRadio.NMRChannel2) then
			TMR2 = true
		end
		if t.name == "New Music Radio" and t.uuid == tostring(SandboxVars.NewMusicRadio.NMRChannel3) then
			TMR3 = true
		end
		if t.name == "New Music Radio" and t.uuid == tostring(SandboxVars.NewMusicRadio.NMRChannel4) then
			TMR4 = true
		end
		if t.name == "New Music Radio" and t.uuid == tostring(SandboxVars.NewMusicRadio.NMRChannel5) then
			TMR5 = true
		end
		if t.name == "New Music MTV" and t.uuid == tostring(SandboxVars.NewMusicRadio.NMRMTV) then
			TMRMTV = true
		end
	end

	if not TMR1 then 
		New = {}
        	New.name = "New Music Radio"
        	New.freq = {SandboxVars.NewMusicRadio.NMRChannel1, SandboxVars.NewMusicRadio.NMRChannel1}
        	New.category = "Radio"
        	New.uuid = tostring(SandboxVars.NewMusicRadio.NMRChannel1)
        	New.register = true
        	New.airCounterMultiplier = 1.0
		print("NMRadio Server: Adding New NMRadio Channel: " .. New.uuid)
		table.insert(DynamicRadio.channels, 1, New)
		NMRadioChannel1.channelUUID = tostring(SandboxVars.NewMusicRadio.NMRChannel1)
	end
	if not TMR2 then 
		New = {}
        	New.name = "New Music Radio"
        	New.freq = {SandboxVars.NewMusicRadio.NMRChannel2, SandboxVars.NewMusicRadio.NMRChannel2}
        	New.category = "Radio"
        	New.uuid = tostring(SandboxVars.NewMusicRadio.NMRChannel2)
        	New.register = true
        	New.airCounterMultiplier = 1.0
		print("NMRadio Server: Adding New NMRadio Channel: " .. New.uuid)
		table.insert(DynamicRadio.channels, 1, New)
		NMRadioChannel2.channelUUID = tostring(SandboxVars.NewMusicRadio.NMRChannel2)
	end
	if not TMR3 then 
		New = {}
        	New.name = "New Music Radio"
        	New.freq = {SandboxVars.NewMusicRadio.NMRChannel3, SandboxVars.NewMusicRadio.NMRChannel3}
        	New.category = "Radio"
        	New.uuid = tostring(SandboxVars.NewMusicRadio.NMRChannel3)
        	New.register = true
        	New.airCounterMultiplier = 1.0
		print("NMRadio Server: Adding New NMRadio Channel: " .. New.uuid)
		table.insert(DynamicRadio.channels, 1, New)
		NMRadioChannel3.channelUUID = tostring(SandboxVars.NewMusicRadio.NMRChannel3)
	end
	if not TMR4 then 
		New = {}
        	New.name = "New Music Radio"
        	New.freq = {SandboxVars.NewMusicRadio.NMRChannel4, SandboxVars.NewMusicRadio.NMRChannel4}
        	New.category = "Radio"
        	New.uuid = tostring(SandboxVars.NewMusicRadio.NMRChannel4)
        	New.register = true
        	New.airCounterMultiplier = 1.0
		print("NMRadio Server: Adding New NMRadio Channel: " .. New.uuid)
		table.insert(DynamicRadio.channels, 1, New)
		NMRadioChannel4.channelUUID = tostring(SandboxVars.NewMusicRadio.NMRChannel4)
	end
	if not TMR5 then 
		New = {}
        	New.name = "New Music Radio"
        	New.freq = {SandboxVars.NewMusicRadio.NMRChannel5, SandboxVars.NewMusicRadio.NMRChannel5}
        	New.category = "Radio"
        	New.uuid = tostring(SandboxVars.NewMusicRadio.NMRChannel5)
        	New.register = true
        	New.airCounterMultiplier = 1.0
		print("NMRadio Server: Adding New NMRadio Channel: " .. New.uuid)
		table.insert(DynamicRadio.channels, 1, New)
		NMRadioChannel5.channelUUID = tostring(SandboxVars.NewMusicRadio.NMRChannel5)
	end
	if not TMRMTV and SandboxVars.NewMusicRadio.ActivateNMRMTV then 
		New = {}
        	New.name = "New Music MTV"
        	New.freq = {SandboxVars.NewMusicRadio.NMRMTV, SandboxVars.NewMusicRadio.NMRMTV}
        	New.category = "Television"
        	New.uuid = tostring(SandboxVars.NewMusicRadio.NMRMTV)
        	New.register = true
        	New.airCounterMultiplier = 1.0
		print("NMRadio Server: Adding New NMRadio MTV Channel: " .. New.uuid)
		table.insert(DynamicRadio.channels, 1, New)
		NMRadioMTV.channelUUID = tostring(SandboxVars.NewMusicRadio.NMRMTV)
	end
end

function DynamicRadio.ReloadRadioScripts(_scriptManager, _isNewGame)
	--print("Reloading Radio Scripts")
    	DynamicRadio.CheckChannelList(_scriptManager) -- Added for TMRadio

    	print("scriptmanager = "..tostring(_scriptManager)..", isNewGame = "..tostring(_isNewGame))
    	local gt = getGameTime()
    	local modData = gt:getModData()
    	local radio = getZomboidRadio()

    	if modData.dynamicRadio then
        	for k,v in ipairs(modData.dynamicRadio) do
	            	for k2,v2 in ipairs(DynamicRadio.channels) do
				if v2.name == "New Music Radio" or v2.name == "New Music MTV" then
        	        		if v.uuid==v2.uuid and type(v.freq)=="number" then
                	    			v2.freq = v.freq
					end
                		end
            		end
        	end
    	end

    	for k,v in ipairs(DynamicRadio.channels) do
		if v.name == "New Music Radio" or v.name == "New Music MTV" then
	        	if type(v.freq)=="number" then
        	    		--do nothing
        		elseif v.freq[1] == v.freq[2] then
            			v.freq = v.freq[1]
 	       		else
        	    		v.freq = radio:getRandomFrequency(v.freq[1], v.freq[2])
			end
        	end
    	end

    	modData.dynamicRadio = DynamicRadio.channels


    	if not DynamicRadio.channels then
        	DynamicRadio.valid = false
        	print("ERROR: loading dynamic radio failed...")
    	else
        	local dynamicChannel
        	local cat
        	for k,v in ipairs(DynamicRadio.channels) do
			if v.name == "New Music Radio" or v.name == "New Music MTV" then
	            		if v.category=="Radio" then
		                	cat = ChannelCategory.Radio
	        	    	elseif v.category=="Emergency" then
	        		        cat = ChannelCategory.Emergency
			        elseif v.category=="Television" then
        	        		cat = ChannelCategory.Television
	        	   	elseif v.category=="Military" then
                			cat = ChannelCategory.Military
	            		elseif v.category=="Amateur" then
        	        		cat = ChannelCategory.Amateur
            			elseif v.category=="Bandit" then
                			cat = ChannelCategory.Bandit
	            		else
        	        		cat = ChannelCategory.Other
            			end

	            		if v.register then
        	        		print("name = "..tostring(v.name)..", freq = "..tostring(v.freq)..", cat = "..tostring(cat)..", uuid = "..tostring(v.uuid))
                			dynamicChannel = DynamicRadioChannel.new(v.name, v.freq, cat, v.uuid)
	
        	        		if v.airCounterMultiplier and v.airCounterMultiplier >0 then
                	    			dynamicChannel:setAirCounterMultiplier(v.airCounterMultiplier)
                			end

                			_scriptManager:AddChannel(dynamicChannel,false)
	            		else
        	        		dynamicChannel = _scriptManager:getRadioChannel(v.uuid)
            			end

	           		if dynamicChannel then
        	        		DynamicRadio.cache[v.uuid] = dynamicChannel
            			else
                			print("ERROR: couldnt init dynamic channel")
				end
            		end
        	end
    	end

    	if getCore():getDebug() then
        	for k,v in pairs(DynamicRadio.cache) do
			if v.name == "New Music Radio" or v.name == "New Music MTV" then
            			print("Found radio channel: "..tostring(v:GetName())..", freq = "..tostring(k)..", freqcheck = "..tostring(v:GetFrequency())..", multi = "..tostring(v:getAirCounterMultiplier()))
			end
        	end
    	end
end

Events.OnLoadRadioScripts.Add(DynamicRadio.ReloadRadioScripts)