require "TCMusicDefenitions"
require "NMRSound"

NMRadio = {}

NMRadio.soundCache = {}

NMRadio.cacheSize = 50	-- number of devices to keep in cache

NMRadio.PlaylistTerminalA = {}
NMRadio.PlaylistTerminalB = {}
NMRadio.PlaylistTerminalC = {}
NMRadio.PlaylistTerminalD = {}
NMRadio.PlaylistTerminalE = {}
NMRadio.PlaylistTerminalMTV = {}

NMRadio.Channels = {}

NMRadio.SongNames = {}

NMRadio.Blacklist = { "Test" }

NMRadio.BlacklistThemeSongs = {
	"CassetteMainTheme",
	"VinylMainTheme",
}

NMRadio.BlacklistTCCacheMPSongs = {
	"CassetteACDCHighwayToHell(1979)",
	"CassetteAirSupplyMakingLoveOutOfNothingAtAll(1983)",
	"CassetteAlabamaChristmasInDixie(1985)",
	"CassetteAliceCooperPoison(1989)",
	"CassetteBeeGeesStayinAlive(1977)",
	"CassetteBlondieCallMe(1978)",
	"CassetteBlondieHeartOfGlass(1976)",
	"CassetteBobbyDarinDreamLover(1987)",
	"CassetteBonJoviLivinOnAPrayer(1986)",
	"CassetteBonJoviYouGiveLoveABadName(1986)",
	"CassetteBoneyMRasputin(1978)",
	"CassetteBonnieTylerHoldingOutForAHero(1984)",
	"CassetteBonnieTylerTotalEclipseOfTheHeart(1983)",
	"CassetteBryanAdamsIDoItForYou(1991)",
	"CassetteCharleyPrideKissAnAngelGoodMorning(1971)",
	"CassetteCyndiLauperTimeAfterTime(1983)",
	"CassetteDeadOrAliveYouSpinMeRound(1984)",
	"CassetteDepecheModePersonalJesus(1989)",
	"CassetteDollyPartonHardCandyChristmas(1982)",
	"CassetteFlattAndScruggsFoggyMountainBreakdown(1968)",
	"CassetteForeignerIWantToKnowWhatLoveIs(1984)",
	"CassetteGeorgeBensonNothingsGonnaChange(1985)",
	"CassetteIsraelKamakawiwooleOverTheRainbow(1990)",
	"CassetteJohnDenverTakeMeHomeCountryRoads(1971)",
	"CassetteJonaLewieStopTheCavalry(1978)",
	"CassetteJoseFelicianoFelizNavidad(1970)",
	"CassetteJourneyDontStopBelievin(1981)",
	"CassetteKennyLogginsDangerZone(1986)",
	"CassetteKissIWasMadeForLovinYou(1979)",
	"CassetteLindaRonstadtAndAaronNevilleDontKnowMuch(1989)",
	"CassetteMetallicaNothingElseMatters(1991)",
	"CassetteMetallicaTheUnforgiven(1991)",
	"CassetteMichaelJacksonBillieJean(1982)",
	"CassetteNirvanaSmellsLikeTeenSpirit(1991)",
	"CassettePaulEngemannPushItToTheLimit(1983)",
	"CassettePaulaAbdulStraightUp(1988)",
	"CassettePepeShadilay(1986)",
	"CassetteQueen39(1975)",
	"CassetteQueenWeAreTheChampions(1977)",
	"CassetteQueenWeWillRockYou(1977)",
	"CassetteREMLosingMyReligion(1991)",
	"CassetteRandyTravisDeeperThanTheHoller(1988)",
	"CassetteRandyTravisOldTimeChristmas(1989)",
	"CassetteScottMcKenzieSanFrancisco(1967)",
	"CassetteSnapRhythmIsADancer(1992)",
	"CassetteSurvivorEyeOfTheTiger(1982)",
	"CassetteTheB52sLoveShack(1989)",
	"CassetteTheBeatlesComeTogether(1969)",
	"CassetteTheBeatlesEleanorRigby(1966)",
	"CassetteThePoguesFairytaleOfNewYork(1987)",
	"CassetteTheTemptationsPapaWasARollingStone(1972)",
	"CassetteTheWeatherGirlsItsRainingMen(1983)",
	"CassetteTotoAfrica(1982)",
	"CassetteTotoHoldTheLine(1978)",
	"CassetteWhamLastChristmas(1984)",
	"CassetteWhitneyHoustonIWillAlwaysLoveYou(1992)",
	"VinylACDCHighwayToHell(1979)",
	"VinylAirSupplyMakingLoveOutOfNothingAtAll(1983)",
	"VinylAlabamaChristmasInDixie(1985)",
	"VinylAliceCooperPoison(1989)",
	"VinylAndyWilliamsItsTheMostWonderfulTimeOfTheYear(1963)",
	"VinylBeeGeesStayinAlive(1977)",
	"VinylBennyGoodmanThatsAPlenty(1931)",
	"VinylBillHaleyRockAroundTheClock(1955)",
	"VinylBingCrosbyIWillBeHomeForChristmas(1943)",
	"VinylBingCrosbyWhiteChristmas(1942)",
	"VinylBingCrosbyWinterWonderland(1945)",
	"VinylBlondieCallMe(1978)",
	"VinylBlondieHeartOfGlass(1976)",
	"VinylBobbyDarinBrandNewHouse(1958)",
	"VinylBobbyDarinDreamLover(1987)",
	"VinylBobbyDarinHallelujahILoveHerSo(1956)",
	"VinylBobbyHelmsJingleBellRock(1957)",
	"VinylBoneyMRasputin(1978)",
	"VinylBootsRandolphYaketySax(1963)",
	"VinylBrendaLeeRockinAroundTheChristmasTree(1958)",
	"VinylDeanMartinWalkingInAWinterWonderland(1959)",
	"VinylEarthaKittSantaBaby(1953)",
	"VinylElvisPresleyBlueChristmas(1957)",
	"VinylElvisPresleyJailhouseRock(1958)",
	"VinylEnricoCarusoUnaFurtivaLagrima(1904)",
	"VinylGeneAutryFrostyTheSnowMan(1951)",
	"VinylGuyMitchellHeartacheByTheNumbers50s(1959)",
	"VinylHankWilliamsLovesickBlues(1949)",
	"VinylJohnFaheySteelGuitarRag(1965)",
	"VinylJohnnyHortonNorthToAlaska(1965)",
	"VinylJudyGarlandHaveYourselfAMerryLittleChristmas(1944)",
	"VinylKirstenFlagstadDieWalkure(1938)",
	"VinylLightninHopkinsJackstropperBlues(1950)",
	"VinylMelCarterHoldMeThrillMeKissMe(1965)",
	"VinylNatKingColeTheChristmasSong(1961)",
	"VinylRickyNelsonTravellinMan(1961)",
	"VinylRighteousBrothersUnchainedMelody(1965)",
	"VinylRobertJohnsonWalkingBlues(1936)",
	"VinylThurlRavenscroftYoureAMeanOneMrGrinch(1966)",
}

NMRadio.BlacklistHolidaySongs = {
	"CassetteAlabamaChristmasInDixie(1985)",
	"CassetteDollyPartonHardCandyChristmas(1982)",
	"CassetteJoseFelicianoFelizNavidad(1970)",
	"CassetteRandyTravisOldTimeChristmas(1989)",
	"CassetteWhamLastChristmas(1984)",
	"VinylAlabamaChristmasInDixie(1985)",
	"VinylAndyWilliamsItsTheMostWonderfulTimeOfTheYear(1963)",
	"VinylBingCrosbyIWillBeHomeForChristmas(1943)",
	"VinylBingCrosbyWhiteChristmas(1942)",
	"VinylBingCrosbyWinterWonderland(1945)",
	"VinylBobbyHelmsJingleBellRock(1957)",
	"VinylBrendaLeeRockinAroundTheChristmasTree(1958)",
	"VinylDeanMartinWalkingInAWinterWonderland(1959)",
	"VinylEarthaKittSantaBaby(1953)",
	"VinylElvisPresleyBlueChristmas(1957)",
	"VinylGeneAutryFrostyTheSnowMan(1951)",
	"VinylJudyGarlandHaveYourselfAMerryLittleChristmas(1944)",
	"VinylNatKingColeTheChristmasSong(1961)",
	"VinylThurlRavenscroftYoureAMeanOneMrGrinch(1966)",
}

-- for checking b42 mods loaded
NMRadio.activatedMods = {}

local mods = getActivatedMods()
for i = 0, mods:size() - 1 do
    local shortId = string.match(mods:get(i), "\\(.+)$")
    NMRadio.activatedMods[shortId] = true
end

-- then if i want to test against it:
--if NMRadio.activatedMods["TheModId"] then
--    ...
--end

-------------------
-- PLAY NEW SONG --
-------------------

NMRadio.PlaySound = function(number, device)
	if not number or not device then
		return
	end

    	local sound = nil
	local deviceData = device:getDeviceData()
    	local t = NMRadio.getData(deviceData)

    	if t then
        	sound = t.sound
    	else
        	sound = NMRSound:new()
    	end

    	if deviceData:isInventoryDevice() then
        	sound:set3D(false)
        	sound:setVolumeModifier(0.6)
    	elseif deviceData:isIsoDevice() then
        	sound:setPosAtObject(device)
        	sound:setVolumeModifier(0.4)
    	elseif deviceData:isVehicleDevice() then
        	local vehiclePart = deviceData:getParent()
        	if vehiclePart then
            		local vehicle = vehiclePart:getVehicle()
            		if vehicle then
                		sound:setEmitter(vehicle:getEmitter()) -- use car's emitter, car radios don't have one
                		if vehicle == getPlayer():getVehicle() then -- player is in the car
                    			sound:set3D(false)
                    			sound:setVolumeModifier(0.8)
                		elseif not NMRadio.VehicleWindowsIntact(vehicle) then
                    			sound:set3D(true)
                    			sound:setVolumeModifier(0.4)
				else
                    			sound:set3D(true)
                    			sound:setVolumeModifier(0.2)
                		end
            		end
        	end
    	end

    	sound:setVolume(deviceData:getDeviceVolume())

	if isClient() then
		if NMRadioClient.PlaylistTerminalA ~= nil and #NMRadioClient.PlaylistTerminalA > 0 then
			--print("Client: getting A from client list")
			NMRadio.PlaylistTerminalA = NMRadioClient.PlaylistTerminalA
		end
		if NMRadioClient.PlaylistTerminalB ~= nil and #NMRadioClient.PlaylistTerminalB > 0 then
			--print("Client: getting B from client list")
			NMRadio.PlaylistTerminalB = NMRadioClient.PlaylistTerminalB
		end
		if NMRadioClient.PlaylistTerminalC ~= nil and #NMRadioClient.PlaylistTerminalC > 0 then
			--print("Client: getting C from client list")
			NMRadio.PlaylistTerminalC = NMRadioClient.PlaylistTerminalC
		end
		if NMRadioClient.PlaylistTerminalD ~= nil and #NMRadioClient.PlaylistTerminalD > 0 then
			--print("Client: getting D from client list")
			NMRadio.PlaylistTerminalD = NMRadioClient.PlaylistTerminalD
		end
		if NMRadioClient.PlaylistTerminalE ~= nil and #NMRadioClient.PlaylistTerminalE > 0 then
			--print("Client: getting E from client list")
			NMRadio.PlaylistTerminalE = NMRadioClient.PlaylistTerminalE
		end
		if NMRadioClient.PlaylistTerminalMTV ~= nil and #NMRadioClient.PlaylistTerminalMTV > 0 then
			--print("Client: getting MTV from client list")
			NMRadio.PlaylistTerminalMTV = NMRadioClient.PlaylistTerminalMTV
		end
		if NMRadioClient.Blacklist ~= nil and #NMRadioClient.Blacklist > 0 then
			--print("Client: getting blacklist from client list")
			NMRadio.Blacklist = NMRadioClient.Blacklist
		end
	end

	if NMRadio.PlaylistTerminalA == nil or #NMRadio.PlaylistTerminalA == 0 then
		--print("Client: A not found in client list, pull from local moddata")
		NMRadio.PlaylistTerminalA = ModData.getOrCreate("NMRadioA")
	end
	if NMRadio.PlaylistTerminalB == nil or #NMRadio.PlaylistTerminalB == 0 then
		--print("Client: B not found in client list, pull from local moddata")
		NMRadio.PlaylistTerminalB = ModData.getOrCreate("NMRadioB")
	end
	if NMRadio.PlaylistTerminalC == nil or #NMRadio.PlaylistTerminalC == 0 then
		--print("Client: C not found in client list, pull from local moddata")
		NMRadio.PlaylistTerminalC = ModData.getOrCreate("NMRadioC")
	end
	if NMRadio.PlaylistTerminalD == nil or #NMRadio.PlaylistTerminalD == 0 then
		--print("Client: D not found in client list, pull from local moddata")
		NMRadio.PlaylistTerminalD = ModData.getOrCreate("NMRadioD")
	end
	if NMRadio.PlaylistTerminalE == nil or #NMRadio.PlaylistTerminalE == 0 then
		--print("Client: E not found in client list, pull from local moddata")
		NMRadio.PlaylistTerminalE = ModData.getOrCreate("NMRadioE")
	end
	if NMRadio.PlaylistTerminalMTV == nil or #NMRadio.PlaylistTerminalMTV == 0 then
		--print("Client: MTV not found in client list, pull from local moddata")
		NMRadio.PlaylistTerminalMTV = ModData.getOrCreate("NMRadioMTV")
	end
	if NMRadio.Blacklist == nil or #NMRadio.Blacklist == 0 then
		--print("Client: Blacklist not found in client list, pull from local moddata")
		NMRadio.Blacklist = ModData.getOrCreate("NMRadioBlacklist")
	end

	if NMRadio.PlaylistTerminalA == nil or #NMRadio.PlaylistTerminalA == 0 then
		--print("Client: A not found in moddata, create default list")
		NMRadio.PlaylistTerminalA = NMRadio.CreatePlaylist()
	end
	if NMRadio.PlaylistTerminalB == nil or #NMRadio.PlaylistTerminalB == 0 then
		--print("Client: B not found in moddata, create default list")
		NMRadio.PlaylistTerminalB = NMRadio.CreatePlaylist()
	end
	if NMRadio.PlaylistTerminalC == nil or #NMRadio.PlaylistTerminalC == 0 then
		--print("Client: C not found in moddata, create default list")
		NMRadio.PlaylistTerminalC = NMRadio.CreatePlaylist()
	end
	if NMRadio.PlaylistTerminalD == nil or #NMRadio.PlaylistTerminalD == 0 then
		--print("Client: D not found in moddata, create default list")
		NMRadio.PlaylistTerminalD = NMRadio.CreatePlaylist()
	end
	if NMRadio.PlaylistTerminalE == nil or #NMRadio.PlaylistTerminalE == 0 then
		--print("Client: E not found in moddata, create default list")
		NMRadio.PlaylistTerminalE = NMRadio.CreatePlaylist()
	end
	if NMRadio.PlaylistTerminalMTV == nil or #NMRadio.PlaylistTerminalMTV == 0 then
		--print("Client: MTV not found in moddata, create default list")
		NMRadio.PlaylistTerminalMTV = NMRadio.CreatePlaylist()
	end

	if NMRadio.Blacklist == nil or #NMRadio.Blacklist == 0 then
		--print("Client: Blacklist not found in moddata, nothing to load")
	end

	local songName = nil

	if deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 then	
		if #NMRadio.PlaylistTerminalA == 0 then
			print("NMRadio: Error processing requested song, playlist A empty")
			return
		else
    			songName = NMRadio.PlaylistTerminalA[number]
		end
	elseif deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 then
		if #NMRadio.PlaylistTerminalB == 0 then
			print("NMRadio: Error processing requested song, playlist B empty")
			return
		else
    			songName = NMRadio.PlaylistTerminalB[number]
		end
	elseif deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 then
		if #NMRadio.PlaylistTerminalC == 0 then
			print("NMRadio: Error processing requested song, playlist C empty")
			return
		else
    			songName = NMRadio.PlaylistTerminalC[number]
		end
	elseif deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 then
		if #NMRadio.PlaylistTerminalD == 0 then
			print("NMRadio: Error processing requested song, playlist D empty")
			return
		else
    			songName = NMRadio.PlaylistTerminalD[number]
		end
	elseif deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 then
		if #NMRadio.PlaylistTerminalE == 0 then
			print("NMRadio: Error processing requested song, playlist E empty")
			return
		else
    			songName = NMRadio.PlaylistTerminalE[number]
		end
	elseif deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV then
		if #NMRadio.PlaylistTerminalMTV == 0 then
			print("NMRadio: Error processing requested song, playlist MTV empty")
			return
		else
    			songName = NMRadio.PlaylistTerminalMTV[number]
		end
	else
		return
	end

	NMRadio.Channels[deviceData:getChannel()] = number

	if songName == nil then
		print("NMRadio: Error processing requested song")
		return
	else
		local musicItem = "NewMusic." .. songName
		local displayName = getItemNameFromFullType(musicItem)
		local prettyName = NMRadio.prettyName(displayName)
		if deviceData:getChannel() > 1000 then
			print("NMRadio Channel " .. deviceData:getChannel()/1000 .. "FM: Playing song[" .. number .. "] " .. prettyName)
		else
			print("NMRadio MTV " .. deviceData:getChannel() .. "TV: Playing song[" .. number .. "] " .. prettyName)
		end
		if PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRenableRDSDeviceText"):getValue() and SandboxVars.NewMusicRadio.NMRRadioSongAnnouncements and not isClient() then 
			DynamicRadio.OnNewSong(deviceData:getChannel(), prettyName)
		end
		if not PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRstopMusic"):getValue() then
			sound:play(songName)
		end
	end

	local position = NMRadio.whereAreYou(device)

    	t = t or {}
    	t.device = device
    	t.deviceData = deviceData
    	t.channel = deviceData:getChannel()
    	t.sound = sound
	t.muted = false
	t.x = position.x
	t.y = position.y
	t.z = position.z

    	tickCounter2 = 200

	--print("X: " .. t.x .. " Y: " .. t.y .. " Z: " .. t.z)
	--print("Sound Cache Counter before clean: " .. #NMRadio.soundCache)

	if #NMRadio.soundCache > 0 then
		for index,x in ipairs(NMRadio.soundCache) do
			if x.device == device then
				table.remove(NMRadio.soundCache, index)
			end
		end
	end

    	table.insert( NMRadio.soundCache, 1, t )
    	if #NMRadio.soundCache > NMRadio.cacheSize then
        	for i = NMRadio.cacheSize+1, #NMRadio.soundCache do
            		table.remove(NMRadio.soundCache, i)
        	end
    	end

	print("NMRadio: Soundcache counter after new sound: [" .. #NMRadio.soundCache .. "/" .. NMRadio.cacheSize .. "]")

    	return t
end

--------------------------
-- START ON DEVICE TEXT --
--------------------------

function NMRadio.OnDeviceText(guid, interactCodes, x, y, z, line, device)
    	local radio = nil
	local square = getSquare(x, y, z)
    
    	-- Radio Device: Portable/HAM radio or vehicle radio
	if square then
        	for i = 0, square:getObjects():size()-1 do
        		local item = square:getObjects():get(i)

            		-- Portable/HAM radio or Television
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

    	if radio == nil and device == nil then
       		return
    	elseif radio == nil then
		radio = device
	end

	local deviceData = radio:getDeviceData()

	if not deviceData:getIsTurnedOn() then
		return
	end

	if deviceData:getDeviceName() == "ValuTech PortaDisc" then
		return
	end

	local radioX = deviceData:getParent():getX()
	local radioY = deviceData:getParent():getY()
	local radioZ = deviceData:getParent():getZ()
	local radioDist = math.sqrt((getPlayer():getX() - radioX) ^ 2 + (getPlayer():getY() - radioY) ^ 2 + (getPlayer():getZ() - radioZ) ^ 2)

	if radioDist > 75 then
		return
	end

	local radioChannel = radio:getDeviceData():getChannel()

	if not radioChannel then
		return
	end

	if not (radioChannel == SandboxVars.NewMusicRadio.NMRChannel1 or radioChannel == SandboxVars.NewMusicRadio.NMRChannel2 or radioChannel == SandboxVars.NewMusicRadio.NMRChannel3 or radioChannel == SandboxVars.NewMusicRadio.NMRChannel4 or radioChannel == SandboxVars.NewMusicRadio.NMRChannel5 or radioChannel == SandboxVars.NewMusicRadio.NMRMTV) then
		return
	end

	if SandboxVars.NewMusicRadio.NMRRadioMoods and line == "[img=music]" then
		local currentUnhappiness = getPlayer():getStats():get(CharacterStat.UNHAPPINESS)
		local currentBoredom = getPlayer():getStats():get(CharacterStat.BOREDOM)
		if currentUnhappiness > 0 then
			local newUnhappiness = math.max(0, currentUnhappiness - 2)
			if isClient() then
				sendClientCommand("NMRadio", "SetStat", {stat = "UNHAPPINESS", amount = newUnhappiness})
			else
				getPlayer():getStats():set(CharacterStat.UNHAPPINESS, newUnhappiness)
			end
		end
		if currentBoredom > 0 then
			local newBoredom = math.max(0, currentBoredom - 2)
			if isClient() then
				sendClientCommand("NMRadio", "SetStat", {stat = "BOREDOM", amount = newBoredom})
			else
				getPlayer():getStats():set(CharacterStat.BOREDOM, newBoredom)
			end
		end
	end

	for index,t in ipairs(NMRadio.soundCache) do  
		if t.device == radio then
			if NMRadio.isPlaying(t) then
				return
			end
		end
	end

	--print("Activated Radio at x: " .. radioX .. " y: " .. radioY .. " z: " .. radioZ)

	local songNumber = NMRadio.ChooseSong(radioChannel)
	if isClient() and not deviceData:isInventoryDevice() then
		local args = {x = radioX, y = radioY, z = radioZ, channel = radioChannel, number = songNumber}
		sendClientCommand("NMRadio", "Play", args)
	else
		if not NMRadio.Channels[radioChannel] then 
			NMRadio.Channels[radioChannel] = songNumber
			NMRadio.PlaySound(songNumber, radio)
		else
			NMRadio.PlaySound(NMRadio.Channels[radioChannel], radio)
		end
	end
end

Events.OnDeviceText.Add(NMRadio.OnDeviceText)

-----------------------------
-- UPDATE RADIO SOUNDCACHE --
-----------------------------

NMRadio.UpdateSoundCache = function(number, channel)
	if not number or not channel then
		return
	end

	NMRadio.Channels[channel] = number

	if #NMRadio.soundCache < 1 then
		return
	end

	for index,t in ipairs(NMRadio.soundCache) do  
		local deviceData = t.device:getDeviceData()
		if deviceData:getChannel() == channel then
			NMRadio.PlaySound(number, t.device)
			--print(channel .. " " .. number)
		end
	end
end

---------------------------
-- INTERACTION OVERRIDES --
---------------------------

-- Thank you Albion for this automatic preset limit adjuster 
local index = __classmetatables[DevicePresets.class].__index

local old_addPreset = index.addPreset
index.addPreset = function(self, ...)
    	local maxPresets = self:getMaxPresets()
    	if self:getPresets():size() >= maxPresets then
        	self:setMaxPresets(maxPresets + 1)
    	end
    	old_addPreset(self, ...)
end

NMRadio.AddOverrides = function()
    	local NMRRWMChannelTV_readPresets = RWMChannelTV.readPresets
    	function RWMChannelTV:readPresets()
    		if self.deviceData and self.deviceData:getDevicePresets() and self.deviceData:getDevicePresets():getPresets() then
			local detectedMPTV = false
			local detectedTMMTV = false
			local detectedEmergencyTV = false
        		self.presets = self.deviceData:getDevicePresets():getPresets()
        		for i = 0, self.presets:size()-1 do
            			local p = self.presets:get(i)
            			self:addComboOption(p:getFrequency(), p:getName())
				--print("Freq: " .. tostring(p:getFrequency()) .. " Name: " .. tostring(p:getName()))
				if p:getName() == "Monty Python TV 24/7" then
					detectedMPTV = true
				end
				if p:getName() == "New Music MTV" then
					detectedTMMTV = true
				end
				if p:getName() == "Emergency TV Station" then
					detectedEmergencyTV = true
				end
        		end
			if not detectedMPTV and NMRadio.activatedMods["MontyPythonTV"] then
				self.deviceData:getDevicePresets():addPreset("Monty Python TV 24/7", 222)
			end
			if not detectedTMMTV and SandboxVars.NewMusicRadio.ActivateNMRMTV then
				self.deviceData:getDevicePresets():addPreset("New Music MTV", SandboxVars.NewMusicRadio.NMRMTV)
			end
			if not detectedEmergencyTV and NMRadio.activatedMods["EmergencyTVChannel"] then
				self.deviceData:getDevicePresets():addPreset("Emergency TV Station", 300)
			end
		end
        	NMRRWMChannelTV_readPresets(self)
	end

    	local NMRRWMChannel_doAddPresetButton = RWMChannel.doAddPresetButton
    	function RWMChannel:doAddPresetButton()
		if self.presets and self.deviceData and self.deviceData:getDevicePresets() then
        		if self.presets:size() >= self.deviceData:getDevicePresets():getMaxPresets() then
				self.deviceData:getDevicePresets():setMaxPresets(self.deviceData:getDevicePresets():getMaxPresets() + 1)
			end
		end
        	NMRRWMChannel_doAddPresetButton(self)
	end

    	local NMRRadioAction_performToggleOnOff = ISRadioAction.performToggleOnOff
    	function ISRadioAction:performToggleOnOff()
        	NMRRadioAction_performToggleOnOff(self)
        	local t = NMRadio.getData(self.deviceData)
        	if t then
			if t.deviceData:getIsTurnedOn() and t.deviceData:getChannel() == t.channel and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
                		t.muted = false
            		else
                		t.muted = true -- mute sound instead of stopping it, so we can turn it back on
            		end
            		NMRadio.updateVolume(t)
        	elseif self.deviceData:getIsTurnedOn() and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
			if self.deviceData:getDeviceName() == "ValuTech PortaDisc" then
				return
			end
			local songNumber = NMRadio.ChooseSong(self.deviceData:getChannel())
			if isClient() and not self.deviceData:isInventoryDevice() then
				local position = NMRadio.whereAreYou(self.deviceData:getParent())
				local x = position.x
				local y = position.y
				local z = position.z
				local args = {x = x, y = y, z = z, channel = self.deviceData:getChannel(), number = songNumber}
				sendClientCommand("NMRadio", "Play", args)
			else
				if NMRadio.Channels[self.deviceData:getChannel()] > 0 then
					NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
				else
					NMRadio.Channels[self.deviceData:getChannel()] = songNumber
					NMRadio.PlaySound(songNumber, self.deviceData:getParent())
				end
			end
		end
    	end
    
    	local NMRRadioAction_performSetChannel = ISRadioAction.performSetChannel
    	function ISRadioAction:performSetChannel()
		local oldChannel = self.deviceData:getChannel()
		--print("old channel: " .. oldChannel)
		local x = NMRadio.getData(self.deviceData)
		if self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV then
			if x then
                		x.muted = true -- mute sound instead of stopping it, so we can turn it back on
            			NMRadio.updateVolume(x)
			end
		end
        	NMRRadioAction_performSetChannel(self)
		local newChannel = self.deviceData:getChannel()
		--print("new channel: " .. newChannel)
		local songNumber = NMRadio.ChooseSong(self.deviceData:getChannel())
        	local t = NMRadio.getData(self.deviceData)
		if not isClient() and not isServer() and oldChannel == newChannel and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
			--print("push to the next song")
			if t then
				NMRadio.UpdateSoundCache(songNumber, self.deviceData:getChannel())
				return
			else
				NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
				return
			end
		elseif isClient() and (SandboxVars.NewMusicRadio.NMRAllowSkipOnServer or getCore():getDebug() or isAdmin()) and not isServer() and oldChannel == newChannel and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
			print("push to the next song on servers")
			if t then
				local args = {x = t.x, y = t.y, z = t.z, channel = t.deviceData:getChannel(), number = songNumber}
				sendClientCommand("NMRadio", "PlayNext", args)
			end
		elseif t then
			if t.deviceData:getIsTurnedOn() and t.deviceData:getChannel() == t.channel and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
                		t.muted = false
			elseif t.deviceData:getIsTurnedOn() and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
                		t.muted = false
				if isClient() and not self.deviceData:isInventoryDevice() then
					local position = NMRadio.whereAreYou(self.deviceData:getParent())
					local x = position.x
					local y = position.y
					local z = position.z
					local args = {x = x, y = y, z = z, channel = self.deviceData:getChannel(), number = songNumber}
					sendClientCommand("NMRadio", "Play", args)
				else
					NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
				end
            		else
                		t.muted = true -- mute sound instead of stopping it, so we can turn it back on
 	           	end
            		NMRadio.updateVolume(t)
		elseif self.deviceData:getIsTurnedOn() and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
			if isClient() and not self.deviceData:isInventoryDevice() then
				local position = NMRadio.whereAreYou(self.deviceData:getParent())
				local x = position.x
				local y = position.y
				local z = position.z
				local args = {x = x, y = y, z = z, channel = self.deviceData:getChannel(), number = songNumber}
				sendClientCommand("NMRadio", "Play", args)
			else
				NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
			end
		end
    	end
    
    	local NMRRadioAction_performSetVolume = ISRadioAction.performSetVolume
    	function ISRadioAction:performSetVolume()
        	if self:isValidSetVolume() then
            		NMRRadioAction_performSetVolume(self)
            		local t = NMRadio.getData(self.deviceData)
            		if t then
                		NMRadio.updateVolume(t)
           		end
        	end
    	end

    	local NMREnterVehicle_perform = ISEnterVehicle.perform
    	function ISEnterVehicle:perform()
        	NMREnterVehicle_perform(self)
		if self.character:getVehicle() then
        		local t = NMRadio.getEmitter(self.character:getVehicle():getEmitter())
        		if t then
            			t.sound:setVolumeModifier(0.8)
            			t.sound:set3D(false)
            			NMRadio.updateVolume(t)
			end
		else
			print("NMRadio: vehicle not found due to mod interaction. Unable to update sound emitter in the vehicle.")
        	end
    	end
    
    	local NMRExitVehicle_perform = ISExitVehicle.perform
    	function ISExitVehicle:perform()
		if self.character:getVehicle() then
        		local t = NMRadio.getEmitter(self.character:getVehicle():getEmitter())
        		if t then
				t.x = self.character:getVehicle():getX()
				t.y = self.character:getVehicle():getY()
				t.z = self.character:getVehicle():getZ()
				if not NMRadio.VehicleWindowsIntact(self.character:getVehicle()) then
            				t.sound:setVolumeModifier(0.4)
            				t.sound:set3D(true)
            				NMRadio.updateVolume(t)
				else
            				t.sound:setVolumeModifier(0.2)
            				t.sound:set3D(true)
            				NMRadio.updateVolume(t)
				end
			end
		else
			print("NMRadio: vehicle not found due to mod interaction. Unable to update sound emitter in the vehicle.")
        	end
        	NMRExitVehicle_perform(self)
    	end

	local NMRRadioWindow_update = ISRadioWindow.update
	function ISRadioWindow:update()
  		ISCollapsableWindow.update(self)
		local maxDist = 5
    		--if not isClient() and self:getIsVisible() then -- might be an issue
    		if self:getIsVisible() then
        		if self.deviceType and self.device and self.player and self.deviceData then
            			if self.deviceType=="InventoryItem" then
					if self.device:isInPlayerInventory() then
						return
					else
						self:close()
         	           			return
					end
            			elseif self.deviceType == "IsoObject" or self.deviceType == "VehiclePart" then
					if self.device:getSquare() then
						local distanceToRadio = math.sqrt((self.player:getX() - self.device:getX()) ^ 2 + (self.player:getY() - self.device:getY()) ^ 2 + (self.player:getZ() - self.device:getZ()) ^ 2)
        		        		if distanceToRadio > maxDist then
							self:close()
        		            			return
						end
					end
           		     	end
        		end
		end
		NMRRadioWindow_update(self)
	end

	local NMRRWMGeneral_setInfoLines = RWMGeneral.setInfoLines
	function RWMGeneral:setInfoLines()
		NMRRWMGeneral_setInfoLines(self)
		--print("general decoration")
		if self.deviceData and PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRenableRDS"):getValue() then
			if not self.deviceData:getIsTelevision() then
				local channel = self.deviceData:getChannel()
				if self.deviceData:getIsTurnedOn() and (channel == SandboxVars.NewMusicRadio.NMRChannel1 or channel == SandboxVars.NewMusicRadio.NMRChannel2 or channel == SandboxVars.NewMusicRadio.NMRChannel3 or channel == SandboxVars.NewMusicRadio.NMRChannel4 or channel == SandboxVars.NewMusicRadio.NMRChannel5 or channel == SandboxVars.NewMusicRadio.NMRMTV) then
					local songName = nil
					if channel == SandboxVars.NewMusicRadio.NMRChannel1 then	
				    		songName = NMRadio.PlaylistTerminalA[NMRadio.Channels[channel]]
						--print("A: " .. NMRadio.PlaylistTerminalA[NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel1]])
					elseif channel == SandboxVars.NewMusicRadio.NMRChannel2 then
				    		songName = NMRadio.PlaylistTerminalB[NMRadio.Channels[channel]]
						--print("B: " .. NMRadio.PlaylistTerminalB[NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel2]])
					elseif channel == SandboxVars.NewMusicRadio.NMRChannel3 then
				    		songName = NMRadio.PlaylistTerminalC[NMRadio.Channels[channel]]
						--print("C: " .. NMRadio.PlaylistTerminalC[NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel3]])
					elseif channel == SandboxVars.NewMusicRadio.NMRChannel4 then
				    		songName = NMRadio.PlaylistTerminalD[NMRadio.Channels[channel]]
						--print("D: " .. NMRadio.PlaylistTerminalD[NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel4]])
					elseif channel == SandboxVars.NewMusicRadio.NMRChannel5 then
				    		songName = NMRadio.PlaylistTerminalE[NMRadio.Channels[channel]]
						--print("E: " .. NMRadio.PlaylistTerminalE[NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel5]])
					elseif channel == SandboxVars.NewMusicRadio.NMRMTV then
				    		songName = NMRadio.PlaylistTerminalMTV[NMRadio.Channels[channel]]
						--print("MTV: " .. NMRadio.PlaylistTerminalMTV[NMRadio.Channels[SandboxVars.NewMusicRadio.NMRMTV]])
					end
					if songName then
						NMRadio.SongNames[channel] = songName

						local musicItem = "NewMusic." .. songName
						local displayName = getItemNameFromFullType(musicItem)
						local prettyName = NMRadio.prettyName(displayName)
						local lineCount = 0

						--print(channel/1000 .. "FM: " .. prettyName)

						self:addInfoLine("RDS: ", "Now Playing...")
						for pieces in string.gmatch(prettyName, "[^%-]+") do
							for parts in string.gmatch(pieces, "[^%(]+") do
								for ends in string.gmatch(parts, "[^%)]+") do
									local stringNumb = string.len(ends)
									if stringNumb < 30 then
										local result = (NMRadio.getWrappedText(ends, self.width - 20, UIFont.Small)):split("\n")
										stringNumb = string.len(result[1])
										local line1 = string.sub(result[1],1,(stringNumb/2))
										local line2 = string.sub(result[1],((stringNumb/2)+1),stringNumb)
										self:addInfoLine(line1, line2)
										lineCount = lineCount + 1					
									else
										local result = (NMRadio.getWrappedText(ends, self.width - 20, UIFont.Small)):split("\n")
										local halfString1 = result[1]
										local halfStringNumb1 = string.len(halfString1)
										local line1 = string.sub(halfString1,1,(halfStringNumb1/2))
										local line2 = string.sub(halfString1,((halfStringNumb1/2)+1),halfStringNumb1)
										self:addInfoLine(line1, line2)
										lineCount = lineCount + 1

										local halfString2 = result[2]
										if halfString2 ~= nil then
											local halfStringNumb2 = string.len(halfString2)
											local line3 = string.sub(halfString2,1,(halfStringNumb2/2))
											local line4 = string.sub(halfString2,((halfStringNumb2/2)+1),halfStringNumb2)
											self:addInfoLine(line3, line4)
											lineCount = lineCount + 1
										end
									end
								end
							end
						end
						
						while lineCount < 4 do
							self:addInfoLine("", "")
							lineCount = lineCount + 1
						end
					elseif NMRadio.SongNames[channel] ~= nil then
						songName = NMRadio.SongNames[channel]

						local musicItem = "NewMusic." .. songName
						local displayName = getItemNameFromFullType(musicItem)
						local prettyName = NMRadio.prettyName(displayName)
						local lineCount = 0

						--print(channel/1000 .. "FM: " .. prettyName)

						self:addInfoLine("RDS: ", "Now Playing...")
						for pieces in string.gmatch(prettyName, "[^%-]+") do
							for parts in string.gmatch(pieces, "[^%(]+") do
								for ends in string.gmatch(parts, "[^%)]+") do
									local stringNumb = string.len(ends)
									if stringNumb < 30 then
										local result = (NMRadio.getWrappedText(ends, self.width - 20, UIFont.Small)):split("\n")
										stringNumb = string.len(result[1])
										local line1 = string.sub(result[1],1,(stringNumb/2))
										local line2 = string.sub(result[1],((stringNumb/2)+1),stringNumb)
										self:addInfoLine(line1, line2)
										lineCount = lineCount + 1					
									else
										local result = (NMRadio.getWrappedText(ends, self.width - 20, UIFont.Small)):split("\n")
										local halfString1 = result[1]
										local halfStringNumb1 = string.len(halfString1)
										local line1 = string.sub(halfString1,1,(halfStringNumb1/2))
										local line2 = string.sub(halfString1,((halfStringNumb1/2)+1),halfStringNumb1)
										self:addInfoLine(line1, line2)
										lineCount = lineCount + 1

										local halfString2 = result[2]
										if halfString2 ~= nil then
											local halfStringNumb2 = string.len(halfString2)
											local line3 = string.sub(halfString2,1,(halfStringNumb2/2))
											local line4 = string.sub(halfString2,((halfStringNumb2/2)+1),halfStringNumb2)
											self:addInfoLine(line3, line4)
											lineCount = lineCount + 1
										end
									end
								end
							end
						end

						while lineCount < 4 do
							self:addInfoLine("", "")
							lineCount = lineCount + 1
						end
					else
						self:addInfoLine("RDS: ", "No Data...")
						self:addInfoLine("", "")
						self:addInfoLine("", "")
						self:addInfoLine("", "")
						self:addInfoLine("", "")
					end
				else
					self:addInfoLine("RDS: ", "No Data...")
					self:addInfoLine("", "")
					self:addInfoLine("", "")
					self:addInfoLine("", "")
					self:addInfoLine("", "")
				end
				--self:addInfoLine("123456789101112", "211101987654321")
			end
		end
	end

	local NMRRWMGeneral_update = RWMGeneral.update
	function RWMGeneral:update()
		NMRRWMGeneral_update(self)
		--print("update decoration")
		if self.deviceData then
			if not self.deviceData:getIsTelevision() then
				local channel = self.deviceData:getChannel()
				if self.deviceData:getIsTurnedOn() and (channel == SandboxVars.NewMusicRadio.NMRChannel1 or channel == SandboxVars.NewMusicRadio.NMRChannel2 or channel == SandboxVars.NewMusicRadio.NMRChannel3 or channel == SandboxVars.NewMusicRadio.NMRChannel4 or channel == SandboxVars.NewMusicRadio.NMRChannel5 or channel == SandboxVars.NewMusicRadio.NMRMTV) then
					--print("Force update")
					ISPanel.update(self)
					self:setInfoLines()
				end
			end
		end
	end

	local NMRRWMGeneral_render = RWMGeneral.render
	function RWMGeneral:render()
    		self.ronin = true
    		self.headerLinesRemaining = 6
    		NMRRWMGeneral_render(self)
    		self.ronin = nil
	end

	local NMRRWMGeneral_drawText = RWMGeneral.drawText
	function RWMGeneral:drawText(text, x, y, r, g, b, a, font)
    		if self.headerLinesRemaining == 0 then
        		x = self.width / 2
    		end
    
    		if NMRRWMGeneral_drawText then  
        		NMRRWMGeneral_drawText(self, text, x, y, r, g, b, a, font)
    		else
        		ISUIElement.drawText(self, text, x, y, r, g, b, a, font)
    		end

    		if self.ronin and self.headerLinesRemaining > 0 then
        		self.headerLinesRemaining = self.headerLinesRemaining - 1
    		end
	end

	local NMRRWMGeneral_drawTextRight = RWMGeneral.drawTextRight
	function RWMGeneral:drawTextRight(text, x, y, r, g, b, a, font)
    		if self.headerLinesRemaining == 0 then
        		x = self.width / 2
    		end
    
    		if NMRRWMGeneral_drawTextRight then  
        		NMRRWMGeneral_drawTextRight(self, text, x, y, r, g, b, a, font)
   		else
        		ISUIElement.drawTextRight(self, text, x, y, r, g, b, a, font)
    		end
	end

	local NMRDropWorldItemAction_perform = ISDropWorldItemAction.perform
	function ISDropWorldItemAction:perform()
		if isClient() then
			if instanceof(self.item, "Radio") then
				local deviceData = self.item:getDeviceData()
				if deviceData then
 		       	   		local t = NMRadio.getData(deviceData)
					local args = {}
            				if t then
                				args = {x = t.x, y = t.y, z = t.z}
						--print("getting position from t: " .. args.x .. " " .. args.y .. " " .. args.z)
					else
						local position = NMRadio.whereAreYou(self.item)
						local x = position.x
						local y = position.y
						local z = position.z
                				args = {x = x, y = y, z = z}
						--print("getting position from where are you: " .. args.x .. " " .. args.y .. " " .. args.z)
					end
					--print("NMRadio: Sending stop command to server: " .. args.x .. " " .. args.y .. " " .. args.z)
					if (args.x + args.y + args.z) ~= 0 then
						sendClientCommand("NMRadio", "Stop", args)
					end
				end
			end
		end

		NMRDropWorldItemAction_perform(self)
	end

	local NMRInventoryTransferAction_perform = ISInventoryTransferAction.perform
	function ISInventoryTransferAction:perform()
		if isClient() then
			local ignore = false
			if self.srcContainer == self.character:getInventory() and self.destContainer:isInCharacterInventory(self.character) then
				ignore = true
			elseif self.destContainer == self.character:getInventory() and self.srcContainer:isInCharacterInventory(self.character) then
				ignore = true
			elseif self.srcContainer:isInCharacterInventory(self.character) and self.destContainer:isInCharacterInventory(self.character) then
				ignore = true
			end

			if not ignore and instanceof(self.item, "Radio") then
				local deviceData = self.item:getDeviceData()
				if deviceData then
 		       	   		local t = NMRadio.getData(deviceData)
					local args = {}
            				if t then
                				args = {x = t.x, y = t.y, z = t.z}
						--print("getting position from t: " .. args.x .. " " .. args.y .. " " .. args.z)
					else
						local position = NMRadio.whereAreYou(self.item)
						local x = position.x
						local y = position.y
						local z = position.z
                				args = {x = x, y = y, z = z}
						--print("getting position from where are you: " .. args.x .. " " .. args.y .. " " .. args.z)
					end
					--print("NMRadio: Sending stop command to server: " .. args.x .. " " .. args.y .. " " .. args.z)
					if (args.x + args.y + args.z) ~= 0 then
						sendClientCommand("NMRadio", "Stop", args)
					end
				end
			end
		end

		NMRInventoryTransferAction_perform(self)
	end

	local NMRGrabItemAction_transferItem = ISGrabItemAction.transferItem
	function ISGrabItemAction:transferItem(item)
		if isClient() then
			if instanceof(item:getItem(), "Radio") then
				local deviceData = item:getItem():getDeviceData()
				if deviceData then
 		       	   		local t = NMRadio.getData(deviceData)
					local args = {}
            				if t then
                				args = {x = t.x, y = t.y, z = t.z}
						--print("getting position from t: " .. args.x .. " " .. args.y .. " " .. args.z)
					else
						local position = NMRadio.whereAreYou(item:getItem())
						local x = position.x
						local y = position.y
						local z = position.z
                				args = {x = x, y = y, z = z}
						--print("getting position from where are you: " .. args.x .. " " .. args.y .. " " .. args.z)
					end
					print("NMRadio: Sending stop command to server: " .. args.x .. " " .. args.y .. " " .. args.z)
					if (args.x + args.y + args.z) ~= 0 then
						sendClientCommand("NMRadio", "Stop", args)
					end
				end
			end
		end

		NMRGrabItemAction_transferItem(self, item)
	end

	local NMRGrabItemAction_perform = ISGrabItemAction.perform
	function ISGrabItemAction:perform()
		if isClient() then
			local queuedItem = table.remove(self.queueList, 1);
			if queuedItem ~= nil then
				for i,item in ipairs(queuedItem.items) do
					self.item = item
					if not self:isValid() then
						self.queueList = {}
						break
					end

					if instanceof(item:getItem(), "Radio") then
						local square = item:getItem():getWorldItem():getSquare()
						local obj = nil
						for i=0, square:getObjects():size()-1 do
							local tObj = square:getObjects():get(i)
							if instanceof(tObj, "IsoRadio") then
								if tObj:getModData().RadioItemID == item:getItem():getID() then
									obj = tObj
									break
								end
							end
						end
						if obj ~= nil then
							local deviceData = obj:getDeviceData();
							if deviceData then
 		       		   				local t = NMRadio.getData(deviceData)
								local args = {}
 	           						if t then
        	        						args = {x = t.x, y = t.y, z = t.z}
									--print("getting position from t: " .. args.x .. " " .. args.y .. " " .. args.z)
								else
									local position = NMRadio.whereAreYou(item:getItem())
									local x = position.x
									local y = position.y
									local z = position.z
                							args = {x = x, y = y, z = z}
									--print("getting position from where are you: " .. args.x .. " " .. args.y .. " " .. args.z)
								end
								print("NMRadio: Sending stop command to server: " .. args.x .. " " .. args.y .. " " .. args.z)
								if (args.x + args.y + args.z) ~= 0 then
									sendClientCommand("NMRadio", "Stop", args)
								end
							end
						end
					end
				end
			end
		end

		NMRGrabItemAction_perform(self)
	end

	local NMRMoveableSpriteProps_pickUpMoveableInternal = ISMoveableSpriteProps.pickUpMoveableInternal
	function ISMoveableSpriteProps:pickUpMoveableInternal(character, square, object, sprInstance, spriteName, createItem, rotating)
		if isClient() then
			if object and instanceof(object, "IsoRadio") then
				local deviceData = object:getDeviceData()
              	    		if deviceData and square then
					local args = {x = square:getX(), y = square:getY(), z = square:getZ()}
					--print("NMRadio: Sending stop command to server: " .. args.x .. " " .. args.y .. " " .. args.z)
					if (args.x + args.y + args.z) ~= 0 then
						sendClientCommand("NMRadio", "Stop", args)
					end
				end
                  	end
		end

		return NMRMoveableSpriteProps_pickUpMoveableInternal(self, character, square, object, sprInstance, spriteName, createItem, rotating)
	end

	if NMRadio.activatedMods["TVRadio_ReInvented"] then
	    	local NMRRWMMergedRadio_doTuneInButton = RWMMergedRadio.doTuneInButton
		function RWMMergedRadio:doTuneInButton(button)
			local oldChannel = self.deviceData:getChannel()
			--print("old channel: " .. oldChannel)
			local x = NMRadio.getData(self.deviceData)
			if self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV then
				if x then
                			x.muted = true -- mute sound instead of stopping it, so we can turn it back on
            				NMRadio.updateVolume(x)
				end
			end
        		NMRRWMMergedRadio_doTuneInButton(self, button)
			local newChannel = self.deviceData:getChannel()
			--print("new channel: " .. newChannel)
			local songNumber = NMRadio.ChooseSong(self.deviceData:getChannel())
	        	local t = NMRadio.getData(self.deviceData)
			if not isClient() and not isServer() and oldChannel == newChannel and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
				--print("push to the next song")
				if t then
					NMRadio.UpdateSoundCache(songNumber, self.deviceData:getChannel())
					return
				else
					NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
					return
				end
			elseif t then
				if t.deviceData:getIsTurnedOn() and t.deviceData:getChannel() == t.channel and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
                			t.muted = false
				elseif t.deviceData:getIsTurnedOn() and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
        	        		t.muted = false
					if isClient() and not self.deviceData:isInventoryDevice() then
						local position = NMRadio.whereAreYou(self.deviceData:getParent())
						local x = position.x
						local y = position.y
						local z = position.z
						local args = {x = x, y = y, z = z, channel = self.deviceData:getChannel(), number = songNumber}
						sendClientCommand("NMRadio", "Play", args)
					else
						NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
					end
        	    		else
                			t.muted = true -- mute sound instead of stopping it, so we can turn it back on
 	           		end
	            		NMRadio.updateVolume(t)
			elseif self.deviceData:getIsTurnedOn() and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
				if isClient() and not self.deviceData:isInventoryDevice() then
					local position = NMRadio.whereAreYou(self.deviceData:getParent())
					local x = position.x
					local y = position.y
					local z = position.z
					local args = {x = x, y = y, z = z, channel = self.deviceData:getChannel(), number = songNumber}
					sendClientCommand("NMRadio", "Play", args)
				else
					NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
				end
			end
	    	end

	    	local NMRRWMMergedWalkieTalkie_doTuneInButton = RWMMergedWalkieTalkie.doTuneInButton
		function RWMMergedWalkieTalkie:doTuneInButton(button)
			local oldChannel = self.deviceData:getChannel()
			--print("old channel: " .. oldChannel)
			local x = NMRadio.getData(self.deviceData)
			if self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV then
				if x then
                			x.muted = true -- mute sound instead of stopping it, so we can turn it back on
	            			NMRadio.updateVolume(x)
				end
			end
	        	NMRRWMMergedWalkieTalkie_doTuneInButton(self, button)
			local newChannel = self.deviceData:getChannel()
			--print("new channel: " .. newChannel)
			local songNumber = NMRadio.ChooseSong(self.deviceData:getChannel())
        		local t = NMRadio.getData(self.deviceData)
			if not isClient() and not isServer() and oldChannel == newChannel and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
				--print("push to the next song")
				if t then
					NMRadio.UpdateSoundCache(songNumber, self.deviceData:getChannel())
					return
				else
					NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
					return
				end
			elseif t then
				if t.deviceData:getIsTurnedOn() and t.deviceData:getChannel() == t.channel and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
                			t.muted = false
				elseif t.deviceData:getIsTurnedOn() and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
        	        		t.muted = false
					if isClient() and not self.deviceData:isInventoryDevice() then
						local position = NMRadio.whereAreYou(self.deviceData:getParent())
						local x = position.x
						local y = position.y
						local z = position.z
						local args = {x = x, y = y, z = z, channel = self.deviceData:getChannel(), number = songNumber}
						sendClientCommand("NMRadio", "Play", args)
					else
						NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
					end
        	    		else
                			t.muted = true -- mute sound instead of stopping it, so we can turn it back on
 	           		end
	            		NMRadio.updateVolume(t)
			elseif self.deviceData:getIsTurnedOn() and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
				if isClient() and not self.deviceData:isInventoryDevice() then
					local position = NMRadio.whereAreYou(self.deviceData:getParent())
					local x = position.x
					local y = position.y
					local z = position.z
					local args = {x = x, y = y, z = z, channel = self.deviceData:getChannel(), number = songNumber}
					sendClientCommand("NMRadio", "Play", args)
				else
					NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
				end
			end
	    	end

	    	local NMRRWMMergedCarRadio_doTuneInButton = RWMMergedCarRadio.doTuneInButton
		function RWMMergedCarRadio:doTuneInButton(button)
			local oldChannel = self.deviceData:getChannel()
			--print("old channel: " .. oldChannel)
			local x = NMRadio.getData(self.deviceData)
			if self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV then
				if x then
                			x.muted = true -- mute sound instead of stopping it, so we can turn it back on
	            			NMRadio.updateVolume(x)
				end
			end
	        	NMRRWMMergedCarRadio_doTuneInButton(self, button)
			local newChannel = self.deviceData:getChannel()
			--print("new channel: " .. newChannel)
			local songNumber = NMRadio.ChooseSong(self.deviceData:getChannel())
        		local t = NMRadio.getData(self.deviceData)
			if not isClient() and not isServer() and oldChannel == newChannel and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
				--print("push to the next song")
				if t then
					NMRadio.UpdateSoundCache(songNumber, self.deviceData:getChannel())
					return
				else
					NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
					return
				end
			elseif t then
				if t.deviceData:getIsTurnedOn() and t.deviceData:getChannel() == t.channel and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
                			t.muted = false
				elseif t.deviceData:getIsTurnedOn() and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
        	        		t.muted = false
					if isClient() and not self.deviceData:isInventoryDevice() then
						local position = NMRadio.whereAreYou(self.deviceData:getParent())
						local x = position.x
						local y = position.y
						local z = position.z
						local args = {x = x, y = y, z = z, channel = self.deviceData:getChannel(), number = songNumber}
						sendClientCommand("NMRadio", "Play", args)
					else
						NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
					end
        	    		else
                			t.muted = true -- mute sound instead of stopping it, so we can turn it back on
 	           		end
	            		NMRadio.updateVolume(t)
			elseif self.deviceData:getIsTurnedOn() and (self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or self.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
				if isClient() and not self.deviceData:isInventoryDevice() then
					local position = NMRadio.whereAreYou(self.deviceData:getParent())
					local x = position.x
					local y = position.y
					local z = position.z
					local args = {x = x, y = y, z = z, channel = self.deviceData:getChannel(), number = songNumber}
					sendClientCommand("NMRadio", "Play", args)
				else
					NMRadio.PlaySound(NMRadio.Channels[self.deviceData:getChannel()], self.deviceData:getParent())
				end
			end
	    	end

	    	local NMRRWMMergedTV_doTuneInButton = RWMMergedTV.doTuneInButton
		function RWMMergedTV:doTuneInButton(button)
			if self.deviceData and self.deviceData:getDevicePresets() and self.deviceData:getDevicePresets():getPresets() then
				local detectedMPTV = false
				local detectedTMMTV = false
				local detectedEmergencyTV = false
        			self.presets = self.deviceData:getDevicePresets():getPresets()
        			for i = 0, self.presets:size()-1 do
	            			local p = self.presets:get(i)
            				--self:addComboOption(p:getFrequency(), p:getName())
					--print("Freq: " .. tostring(p:getFrequency()) .. " Name: " .. tostring(p:getName()))
					if p:getName() == "Monty Python TV 24/7" then
						detectedMPTV = true
					end
					if p:getName() == "New Music MTV" then
						detectedTMMTV = true
					end
					if p:getName() == "Emergency TV Station" then
						detectedEmergencyTV = true
					end
        			end
				if not detectedMPTV and NMRadio.activatedMods["MontyPythonTV"] then
					self.deviceData:getDevicePresets():addPreset("Monty Python TV 24/7", 222)
				end
				if not detectedTMMTV and SandboxVars.NewMusicRadio.ActivateNMRMTV then
					self.deviceData:getDevicePresets():addPreset("New Music MTV", SandboxVars.NewMusicRadio.NMRMTV)
				end
				if not detectedEmergencyTV and NMRadio.activatedMods["EmergencyTVChannel"] then
					self.deviceData:getDevicePresets():addPreset("Emergency TV Station", 300)
				end
			end
			self.channels = self.deviceData:getDevicePresets():getPresets()
			self.channelMax = self.channels:size()-1
	        	NMRRWMMergedTV_doTuneInButton(self, button)
	    	end

	    	local NMRRWMMergedRadio_doAddPreset = RWMMergedRadio.doAddPreset
		function RWMMergedRadio:doAddPreset()
    			local p = self.presetsList
			if self.deviceData:getDevicePresets():getMaxPresets() < 20 then
				self.deviceData:getDevicePresets():setMaxPresets(20)
    			elseif #p.frequency >= self.deviceData:getDevicePresets():getMaxPresets() then
        			self.deviceData:getDevicePresets():setMaxPresets(self.deviceData:getDevicePresets():getMaxPresets() + 1)
    			end
	        	NMRRWMMergedRadio_doAddPreset(self)
			self.presets = self.deviceData:getDevicePresets():getPresets()
		end

	    	local NMRRWMMergedHAM_doAddPreset = RWMMergedHAM.doAddPreset
		function RWMMergedHAM:doAddPreset()
    			local p = self.presetsList
			if self.deviceData:getDevicePresets():getMaxPresets() < 20 then
				self.deviceData:getDevicePresets():setMaxPresets(20)
    			elseif #p.frequency >= self.deviceData:getDevicePresets():getMaxPresets() then
        			self.deviceData:getDevicePresets():setMaxPresets(self.deviceData:getDevicePresets():getMaxPresets() + 1)
    			end
	        	NMRRWMMergedHAM_doAddPreset(self)
			self.presets = self.deviceData:getDevicePresets():getPresets()
		end

	    	local NMRRWMMergedWalkieTalkie_doAddPreset = RWMMergedWalkieTalkie.doAddPreset
		function RWMMergedWalkieTalkie:doAddPreset()
    			local p = self.presetsList
			if self.deviceData:getDevicePresets():getMaxPresets() < 20 then
				self.deviceData:getDevicePresets():setMaxPresets(20)
    			elseif #p.frequency >= self.deviceData:getDevicePresets():getMaxPresets() then
        			self.deviceData:getDevicePresets():setMaxPresets(self.deviceData:getDevicePresets():getMaxPresets() + 1)
    			end
	        	NMRRWMMergedWalkieTalkie_doAddPreset(self)
			self.presets = self.deviceData:getDevicePresets():getPresets()
		end

	    	local NMRRWMMergedCarRadio_doAddPreset = RWMMergedCarRadio.doAddPreset
		function RWMMergedCarRadio:doAddPreset()
    			local p = self.presetsList
			if self.deviceData:getDevicePresets():getMaxPresets() < 20 then
				self.deviceData:getDevicePresets():setMaxPresets(20)
    			elseif #p.frequency >= self.deviceData:getDevicePresets():getMaxPresets() then
        			self.deviceData:getDevicePresets():setMaxPresets(self.deviceData:getDevicePresets():getMaxPresets() + 1)
    			end
	        	NMRRWMMergedCarRadio_doAddPreset(self)
			self.presets = self.deviceData:getDevicePresets():getPresets()
		end
	end
end

Events.OnGameStart.Add(NMRadio.AddOverrides)

-------------------------------------------
-- ADJUST SOUNDS BASED ON DISTANCE/STATE --
-------------------------------------------

local minRange = 5
local maxRange = 75 --50
local p = nil
local X = 0
local Y = 0
local Z = 0
local dropoffRange = 0
local volumeModifier = 0
local distanceToRadio = 0
local finalVolume = 0
local tickCounter1 = 0
local tickCounter2 = 0
local tickCounter3 = 0
local syncPlaylistRequest = true

function NMRadio.adjustSounds()
        p = getPlayer()
        X = p:getX()
        Y = p:getY()
        Z = p:getZ()

    	-- TODO: tickrates depend on framerate. find something time-based instead
    	if tickCounter2 < 1000 then 
        	tickCounter2=tickCounter2+1
    	else
		local TMRRadiosAttractZombies = SandboxVars.NewMusicRadio.NMRRadiosAttractZombies 
        	--attract zombies
		if TMRRadiosAttractZombies then
	        	for _,t in ipairs(NMRadio.soundCache) do
        	    		if NMRadio.isPlaying(t) and t.device ~= nil and t.device == t.deviceData:getParent() then
                			local range = t.deviceData:getDeviceVolume() * t.sound.volumeModifier*2.5 * maxRange
					if t.deviceData:isVehicleDevice() then
						--print("call zombies to car")
						local vehicle = t.deviceData:getParent():getVehicle()
						if NMRadio.VehicleWindowsIntact(vehicle) then
							addSound(vehicle, t.x, t.y, t.x, range/4, range/2)
						else
							addSound(vehicle, t.x, t.y, t.z, range, range)
						end
					elseif t.deviceData:isInventoryDevice() then
						if t.device:getContainer() then
							if t.device:getContainer():getType() == "none" and t.deviceData:getHeadphoneType() == -1 then
								--print("call zombies to player without headphones")
								addSound(p, t.x, t.y, t.z, range/4, range/2)
							elseif t.device:getContainer():getType() ~= "none" then
								--print("call zombies to container")
								addSound(container, t.x, t.y, t.z, range/4, range/2)
							end
						end
                			elseif t.device:getSquare() then
						--print("call zombies to world radio")
                    				addSound(t.device, t.x, t.y, t.z, range, range)
					end
                		end
            		end
        	end
        	tickCounter2 = 0
    	end
    	if tickCounter1 < 5 then 
		tickCounter1=tickCounter1+1 
		return 
	end
    	tickCounter1 = 0

	if syncPlaylistRequest == true then
		if isClient() then
			NMRadioClient.UpdatePlaylistFromServer()
		else
			NMRadio.OldPlaylistGlobal = ModData.getOrCreate("NMRadioOldPlaylistGlobal")
			NMRadio.PlaylistGlobal = {}
			for k,v in pairs(GlobalMusic) do
				NMRadio.PlaylistGlobal[#NMRadio.PlaylistGlobal + 1] = k
			end
			if #NMRadio.OldPlaylistGlobal == #NMRadio.PlaylistGlobal then
				print("NMRadio: The current global music list matches old list. Old: " .. #NMRadio.OldPlaylistGlobal .. " New: " .. #NMRadio.PlaylistGlobal)
				NMRadio.Channels = ModData.getOrCreate("NMRadioChannels")
				if NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel1] == nil then
					NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel1] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRChannel1)
				end
				if NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel2] == nil then
					NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel2] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRChannel2)
				end
				if NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel3] == nil then
					NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel3] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRChannel3)
				end
				if NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel4] == nil then
					NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel4] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRChannel4)
				end
				if NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel5] == nil then
					NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel5] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRChannel5)
				end
				if NMRadio.Channels[SandboxVars.NewMusicRadio.NMRMTV] == nil then
					NMRadio.Channels[SandboxVars.NewMusicRadio.NMRMTV] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRMTV)
				end
				ModData.add("NMRadioChannels", NMRadio.Channels)
			else
				print("NMRadio: The current global music list doesn't match the old list. Old: " .. #NMRadio.OldPlaylistGlobal .. " New: " .. #NMRadio.PlaylistGlobal .. " Reverting all stations for the update.")
				ModData.add("NMRadioOldPlaylistGlobal", NMRadio.PlaylistGlobal)
				NMRadio.PlaylistTerminalA = NMRadio.CreatePlaylist()
				ModData.add("NMRadioA", NMRadio.PlaylistTerminalA)
				NMRadio.PlaylistTerminalB = NMRadio.CreatePlaylist()
				ModData.add("NMRadioB", NMRadio.PlaylistTerminalB)
				NMRadio.PlaylistTerminalC = NMRadio.CreatePlaylist()
				ModData.add("NMRadioC", NMRadio.PlaylistTerminalC)
				NMRadio.PlaylistTerminalD = NMRadio.CreatePlaylist()
				ModData.add("NMRadioD", NMRadio.PlaylistTerminalD)
				NMRadio.PlaylistTerminalE = NMRadio.CreatePlaylist()
				ModData.add("NMRadioE", NMRadio.PlaylistTerminalE)
				NMRadio.PlaylistTerminalMTV = NMRadio.CreatePlaylist()
				ModData.add("NMRadioMTV", NMRadio.PlaylistTerminalMTV)
				NMRadio.Channels = ModData.getOrCreate("NMRadioChannels")
				NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel1] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRChannel1)
				NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel2] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRChannel2)
				NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel3] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRChannel3)
				NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel4] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRChannel4)
				NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel5] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRChannel5)
				NMRadio.Channels[SandboxVars.NewMusicRadio.NMRMTV] = NMRadio.ChooseSong(SandboxVars.NewMusicRadio.NMRMTV)
				ModData.add("NMRadioChannels", NMRadio.Channels)
			end
			--print(SandboxVars.NewMusicRadio.NMRChannel1/1000 .. "FM: " ..  NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel1])
			--print(SandboxVars.NewMusicRadio.NMRChannel2/1000 .. "FM: " ..  NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel2])
			--print(SandboxVars.NewMusicRadio.NMRChannel3/1000 .. "FM: " ..  NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel3])
			--print(SandboxVars.NewMusicRadio.NMRChannel4/1000 .. "FM: " ..  NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel4])
			--print(SandboxVars.NewMusicRadio.NMRChannel5/1000 .. "FM: " ..  NMRadio.Channels[SandboxVars.NewMusicRadio.NMRChannel5])
			--print(SandboxVars.NewMusicRadio.NMRMTV .. "TV: " ..  NMRadio.Channels[SandboxVars.NewMusicRadio.NMRMTV])
		end
		syncPlaylistRequest = false
	end

	-- check status of soundcache for emitters leaving the distance check, reversed to pull broken bits out
	for index = #NMRadio.soundCache, 1, -1 do 
		t = NMRadio.soundCache[index]  
		if t.device ~= t.deviceData:getParent() then 
               		t.device = t.deviceData:getParent() 
		end
		local position = NMRadio.whereAreYou(t.device, index)
		if (position.x + position.y + position.z) ~= 0 then
			t.x = position.x
			t.y = position.y
			t.z = position.z
		end
		if t.device == nil then
			t.sound:setVolume(0)
			t.muted = true
    	         	NMRadio.updateVolume(t)
			t.sound:stop()
			table.remove(NMRadio.soundCache, index)
			--print("turned off due to lost device")
		elseif isClient() and t.device:getDeviceData():getParent():getSquare() == nil then
			t.sound:setVolume(0)
			t.muted = true
    	        	NMRadio.updateVolume(t)
			t.sound:stop()
			table.remove(NMRadio.soundCache, index)
			--print("stopping sound due to loss of parent")
		elseif not t.deviceData:isInventoryDevice() and getSquare(t.x, t.y, t.z) == nil then
			t.sound:setVolume(0)
			t.muted = true
    	        	NMRadio.updateVolume(t)
			t.sound:stop()
			table.remove(NMRadio.soundCache, index)
			--print("stopping sound in container due to loss of square")
		elseif not t.deviceData:isInventoryDevice() and not (t.deviceData:isVehicleDevice() and p:getVehicle()) then
			distanceToRadio = math.sqrt((X - t.x) ^ 2 + (Y - t.y) ^ 2 + (Z - t.z) ^ 2)
			if distanceToRadio > 75 then
				t.sound:setVolume(0)
				t.muted = true
    	         		NMRadio.updateVolume(t)
				t.sound:stop()
				table.remove(NMRadio.soundCache, index)
				--print("turned off due to distance: " .. distanceToRadio)
			end
		elseif t.deviceData:isInventoryDevice() then
			if t.device:getContainer() and t.device:getContainer():getType() ~= "none" then
				distanceToRadio = math.sqrt((X - t.x) ^ 2 + (Y - t.y) ^ 2 + (Z - t.z) ^ 2)
				if distanceToRadio > 75 then
					t.sound:setVolume(0)
					t.muted = true
     	        	 		NMRadio.updateVolume(t)
					t.sound:stop()
					table.remove(NMRadio.soundCache, index)
					--print("in container turned off due to distance: " .. distanceToRadio)
				end
			end
		end
	end

    	highestVolume = 0

    	for index,t in ipairs(NMRadio.soundCache) do   
        	-- sync states     
        	if t.sound and t.sound:isPlaying() then
            		if not t.deviceData:getIsTurnedOn() and not t.muted then
                		t.muted = true
				--print("muted by tick, was not turned on")
            		end
			if not t.muted and not (t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
                		t.muted = true
				--print("muted by tick, was not on valid NMRadio channel")
			end
			if PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRthreeDoff"):getValue() then
             			t.sound:set3D(false)
			elseif t.device.isInPlayerInventory and t.device:isInPlayerInventory() then
             			t.sound:set3D(false)
			elseif t.deviceData:isVehicleDevice() and p:getVehicle() and t.deviceData:getParent():getVehicle() == p:getVehicle() then
           			t.sound:set3D(false)
               		else
               			t.sound:setPos(t.x, t.y, t.z)
				t.sound:set3D(true)
               		end
                	NMRadio.updateVolume(t)
        	end

        	--adjust volume based on distance
        	if NMRadio.isPlaying(t) or (t.deviceData:getParent() ~= nil and t.deviceData:getIsTurnedOn()) then
    			if not t.muted then
        			t.sound:setVolume(t.deviceData:getDeviceVolume())
				if PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRmuteMusic"):getValue() then
					t.sound:setVolume(0)
            			elseif t.deviceData:isInventoryDevice() then
                			highestVolume = 1
				elseif t.deviceData:isVehicleDevice() and p:getVehicle() and t.deviceData:getParent():getVehicle() == p:getVehicle() then
           				highestVolume = 1
				else
                			distanceToRadio = math.sqrt((X - t.x) ^ 2 + (Y - t.y) ^ 2 + (Z - t.z) ^ 2)
                			if distanceToRadio < maxRange then
						local environmentModifier = 1
						if PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRthreeDoff"):getValue() then
							environmentModifier = environmentModifier * 0.9
							if PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRaltThreeD"):getValue() then
								if Z == t.z then
									--print("on the same floor")
								else
									if Z > t.z then
										environmentModifier = environmentModifier * (1 - ((Z - t.z) * 0.15))
									else
										environmentModifier = environmentModifier * (1 - ((t.z - Z) * 0.15))
									end
									if environmentModifier < 0 then 
										environmentModifier = 0
									end
								end
								if p:getVehicle() then
									if not NMRadio.VehicleWindowsIntact(p:getVehicle()) then
										environmentModifier = environmentModifier * 0.9
									else
										environmentModifier = environmentModifier * 0.6
									end
								end
								if p:getSquare() and getSquare(t.x, t.y, t.z) then
									if p:getSquare():isOutside() and getSquare(t.x, t.y, t.z):isOutside() then
										--print("both outside")
									elseif p:getSquare():getBuilding() and getSquare(t.x, t.y, t.z):getBuilding() and p:getSquare():getBuilding() == getSquare(t.x, t.y, t.z):getBuilding() then
										if p:getSquare():getRoom() and getSquare(t.x, t.y, t.z):getRoom() and p:getSquare():getRoom() == getSquare(t.x, t.y, t.z):getRoom() then
											--print("both in same room")
										else
											environmentModifier = environmentModifier * 0.85
										end
									elseif p:getSquare():getBuilding() and getSquare(t.x, t.y, t.z):getBuilding() then
									environmentModifier = environmentModifier * 0.55
									elseif p:getSquare():getBuilding() or getSquare(t.x, t.y, t.z):getBuilding() then
										environmentModifier = environmentModifier * 0.7
									end
								end
							end
						end
						local sliderModifier = PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRvolumeSlider"):getValue() / 10
						--print("Total Environment Modifier: " .. environmentModifier)
                   				dropoffRange = (maxRange-minRange)*0.2 + t.deviceData:getDeviceVolume() * t.sound.volumeModifier*2.5 * (maxRange-minRange)*0.8
                    				volumeModifier = ((minRange + dropoffRange - distanceToRadio) / dropoffRange) * environmentModifier * sliderModifier
                    				if volumeModifier < 0 then 
							volumeModifier = 0 
						end
						--print("Distance: " .. distanceToRadio)
						--print("Total Volume Modifier: " .. volumeModifier)
 	                   			t.sound:setVolume(t.deviceData:getDeviceVolume() * volumeModifier)
        	            			finalVolume = t.deviceData:getDeviceVolume() * t.sound.volumeModifier * volumeModifier
                	    			if finalVolume > highestVolume then 
							highestVolume = finalVolume 
						end
             		      		end
            			end
			end
			-- check to see if the next song needs to play
			if not NMRadio.isPlaying(t) and tickCounter3 > 25 and not PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRstopMusic"):getValue() and (t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
				tickCounter3 = 0
				print("NMRadio: Song ended play another")
				local songNumber = NMRadio.ChooseSong(t.deviceData:getChannel())
				if isClient() then
					local args = {x = t.x, y = t.y, z = t.z, channel = t.deviceData:getChannel(), number = songNumber}
					sendClientCommand("NMRadio", "PlayNext", args)
				else
					NMRadio.UpdateSoundCache(songNumber, t.deviceData:getChannel())
				end
			elseif not NMRadio.isPlaying(t) and (t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel1 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel2 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel3 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel4 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRChannel5 or t.deviceData:getChannel() == SandboxVars.NewMusicRadio.NMRMTV) then
				tickCounter3 = tickCounter3 + 1
			end
        	end
    	end

    	--adjust Zomboid music volume
    	local optionsVolume = getCore():getOptionMusicVolume()/10
    	local optionsVolumeModified = optionsVolume - optionsVolume*highestVolume*10
    	if optionsVolumeModified < 0 then 
		optionsVolumeModified = 0 
	end
    	getSoundManager():setMusicVolume(optionsVolumeModified)
end

Events.OnTick.Add(NMRadio.adjustSounds)

NMRadio.OnMainMenuEnter = function()
    	--reset Zomboid music volume again
    	getSoundManager():setMusicVolume( getCore():getOptionMusicVolume()/10 )
end

Events.OnMainMenuEnter.Add( NMRadio.OnMainMenuEnter )

-------------
-- VARIOUS --
-------------

local vehicleWindows = {
    	"Windshield",
    	"WindshieldRear",
    	"WindowFrontLeft", 
    	"WindowFrontRight", 
    	"WindowMiddleLeft", 
    	"WindowMiddleRight", 
    	"WindowRearLeft", 
    	"WindowRearRight"
}

NMRadio.VehicleWindowsIntact = function(vehicle)
    	for k,v in ipairs(vehicleWindows) do
        	local vehiclePart = vehicle:getPartById(v)
        	if vehiclePart and (not vehiclePart:getInventoryItem() or (vehiclePart:getWindow() and vehiclePart:getWindow():isOpen())) then
            		return false
        	end
   	 end

    	return true
end

NMRadio.updateVolume = function(t)
    	if not t.muted then
        	t.sound:setVolume(t.deviceData:getDeviceVolume())
    	else
        	t.sound:setVolume(0)
    	end
end

NMRadio.isPlaying = function(t)
    	if not t.deviceData:getIsTurnedOn() then 
		return false 
	end
    	if t.muted then 
		return false 
	end
    	if t.sound and t.sound:isPlaying() then 
		return true 
	end
    	return false
end

NMRadio.getData = function(deviceData)
    	for _,t in ipairs(NMRadio.soundCache) do
        	if t.deviceData == deviceData then
            		return t
        	end
    	end
end

NMRadio.getEmitter = function(emitter)
    	for _,t in ipairs(NMRadio.soundCache) do
        	if t.sound.emitter == emitter then
            		return t
        	end
    	end
end

NMRadio.whereAreYou = function(device, index)
	local remove = nil
	local x = nil
	local y = nil
	local z = nil
	local deviceData = device.getDeviceData and device:getDeviceData() or nil

	if not device or not deviceData then
		return
	end

	-- if the radio is part of a vehicle
	if deviceData.isVehicleDevice and deviceData:isVehicleDevice() then
		x = deviceData:getParent():getVehicle():getX()
		y = deviceData:getParent():getVehicle():getY()
		z = deviceData:getParent():getVehicle():getZ()
		--print("location from vehicle")
	end

	-- if the radio is in the player inventory which includes primary and secondary hands and in bags
	if not x and device.isInPlayerInventory and device:isInPlayerInventory() then
		x = getPlayer():getX()
		y = getPlayer():getY()
		z = getPlayer():getZ()
		--print("location from player")
	end

	-- if the radio is in a square on on it's own
	if not x and device.getSquare and device:getSquare() then
		x = device:getX()
		y = device:getY()
		z = device:getZ()
		--print("location from self - has square uses direct getx")
	end
	if not x and device.getSquare and device:getSquare() then
		x = device:getSquare():getX()
		y = device:getSquare():getY()
		z = device:getSquare():getZ()
		--print("location from square - has square uses direct getx through square")
	end

	-- if the radio is in a container like a crate but not a bag on the ground
	if not x and deviceData:isInventoryDevice() then
		if device.getContainer and device:getContainer() and device.getOutermostContainer and device:getOutermostContainer() then
			if device:getOutermostContainer():isVehiclePart() and device:getOutermostContainer():getVehicle() then
				x = device:getOutermostContainer():getVehicle():getX()
				y = device:getOutermostContainer():getVehicle():getY()
				z = device:getOutermostContainer():getVehicle():getZ()
				--print("location from vehicle container")
			elseif device:getOutermostContainer():isCorpse() then
				x = device:getOutermostContainer():getSquare():getX()
				y = device:getOutermostContainer():getSquare():getY()
				z = device:getOutermostContainer():getSquare():getZ()
				--print("location from corpse container")
			elseif device:getOutermostContainer():getParent() then
				if device:getOutermostContainer():getParent():getX() then
					x = t.device:getOutermostContainer():getParent():getX()
					y = t.device:getOutermostContainer():getParent():getY()
					z = t.device:getOutermostContainer():getParent():getZ()
					--print("location from container with a parent")
				end
			elseif device:getOutermostContainer():getSquare() and device:getOutermostContainer():getSquare():getX() then
				x = t.device:getOutermostContainer():getSquare():getX()
				y = t.device:getOutermostContainer():getSquare():getY()
				z = t.device:getOutermostContainer():getSquare():getZ()
				--print("location from container with a square")
			end
		end
	end	

	if not x then
		local t = NMRadio.getData(deviceData)
		if t then 
			x = t.x
			y = t.y
			z = t.z
			--print("unable to get a new location, defaulted to last known location")
		else
			x = 0
			y = 0
			z = 0
			--print("unable to get a new location, defaulted zeros")
		end
	end

	--if x and y and z then
	--	--print("new location: " .. x .. " " .. y .. " " .. z)
	--end
	return {x = x, y = y, z = z}
end

NMRadio.ChooseSong = function(channel)
	if not channel then
		return
	end

	local lastSongNumber = NMRadio.Channels[channel]
	local songNumber = nil

	if channel == SandboxVars.NewMusicRadio.NMRChannel1 then 
		if isClient() then
			--print("Client choosesong: looking for playlist")
			if NMRadioClient.PlaylistTerminalA ~= nil and #NMRadioClient.PlaylistTerminalA > 0 then
				--print("Client choosesong: pulling A from client playlist")
				NMRadio.PlaylistTerminalA = NMRadioClient.PlaylistTerminalA
			end
		end
		if NMRadioClient.PlaylistTerminalA == nil or #NMRadio.PlaylistTerminalA == 0 then
			--print("Client choosesong: looking for playlist A in moddata")
			NMRadio.PlaylistTerminalA = ModData.getOrCreate("NMRadioA")
		end
		if NMRadioClient.PlaylistTerminalA == nil or #NMRadio.PlaylistTerminalA == 0 then
			--print("Client choosesong: unable to find playlist A creating new list")
			NMRadio.PlaylistTerminalA = NMRadio.CreatePlaylist()
		end
		songNumber = ZombRand(1, #NMRadio.PlaylistTerminalA + 1)
		if songNumber == lastSongNumber and #NMRadio.PlaylistTerminalA > 1 then
			while songNumber == lastSongNumber do
				songNumber = ZombRand(1, #NMRadio.PlaylistTerminalA + 1)
			end
		end
	elseif channel == SandboxVars.NewMusicRadio.NMRChannel2 then 
		if isClient() then
			--print("Client choosesong: looking for playlist")
			if NMRadioClient.PlaylistTerminalB ~= nil and #NMRadioClient.PlaylistTerminalB > 0 then
				--print("Client choosesong: pulling B from client playlist")
				NMRadio.PlaylistTerminalB = NMRadioClient.PlaylistTerminalB
			end
		end
		if NMRadioClient.PlaylistTerminalB == nil or #NMRadio.PlaylistTerminalB == 0 then
			--print("Client choosesong: looking for playlist B in moddata")
			NMRadio.PlaylistTerminalB = ModData.getOrCreate("NMRadioB")
		end
		if NMRadioClient.PlaylistTerminalB == nil or #NMRadio.PlaylistTerminalB == 0 then
			--print("Client choosesong: unable to find playlist B creating new list")
			NMRadio.PlaylistTerminalB = NMRadio.CreatePlaylist()
		end
		songNumber = ZombRand(1, #NMRadio.PlaylistTerminalB + 1)
		if songNumber == lastSongNumber and #NMRadio.PlaylistTerminalB > 1 then
			while songNumber == lastSongNumber do
				songNumber = ZombRand(1, #NMRadio.PlaylistTerminalB + 1)
			end
		end
	elseif channel == SandboxVars.NewMusicRadio.NMRChannel3 then 
		if isClient() then
			--print("Client choosesong: looking for playlist")
			if NMRadioClient.PlaylistTerminalC ~= nil and #NMRadioClient.PlaylistTerminalC > 0 then
				--print("Client choosesong: pulling C from client playlist")
				NMRadio.PlaylistTerminalC = NMRadioClient.PlaylistTerminalC
			end
		end
		if NMRadioClient.PlaylistTerminalC == nil or #NMRadio.PlaylistTerminalC == 0 then
			--print("Client choosesong: looking for playlist C in moddata")
			NMRadio.PlaylistTerminalC = ModData.getOrCreate("NMRadioC")
		end
		if NMRadioClient.PlaylistTerminalC == nil or #NMRadio.PlaylistTerminalC == 0 then
			--print("Client choosesong: unable to find playlist C creating new list")
			NMRadio.PlaylistTerminalC = NMRadio.CreatePlaylist()
		end
		songNumber = ZombRand(1, #NMRadio.PlaylistTerminalC + 1)
		if songNumber == lastSongNumber and #NMRadio.PlaylistTerminalC > 1 then
			while songNumber == lastSongNumber do
				songNumber = ZombRand(1, #NMRadio.PlaylistTerminalC + 1)
			end
		end
	elseif channel == SandboxVars.NewMusicRadio.NMRChannel4 then 
		if isClient() then
			--print("Client choosesong: looking for playlist")
			if NMRadioClient.PlaylistTerminalD ~= nil and #NMRadioClient.PlaylistTerminalD > 0 then
				--print("Client choosesong: pulling D from client playlist")
				NMRadio.PlaylistTerminalD = NMRadioClient.PlaylistTerminalD
			end
		end
		if NMRadioClient.PlaylistTerminalD == nil or #NMRadio.PlaylistTerminalD == 0 then
			--print("Client choosesong: looking for playlist D in moddata")
			NMRadio.PlaylistTerminalD = ModData.getOrCreate("NMRadioD")
		end
		if NMRadioClient.PlaylistTerminalD == nil or #NMRadio.PlaylistTerminalD == 0 then
			--print("Client choosesong: unable to find playlist D creating new list")
			NMRadio.PlaylistTerminalD = NMRadio.CreatePlaylist()
		end
		songNumber = ZombRand(1, #NMRadio.PlaylistTerminalD + 1)
		if songNumber == lastSongNumber and #NMRadio.PlaylistTerminalD > 1 then
			while songNumber == lastSongNumber do
				songNumber = ZombRand(1, #NMRadio.PlaylistTerminalD + 1)
			end
		end
	elseif channel == SandboxVars.NewMusicRadio.NMRChannel5 then 
		if isClient() then
			--print("Client choosesong: looking for playlist")
			if NMRadioClient.PlaylistTerminalE ~= nil and #NMRadioClient.PlaylistTerminalE > 0 then
				--print("Client choosesong: pulling E from client playlist")
				NMRadio.PlaylistTerminalE = NMRadioClient.PlaylistTerminalE
			end
		end
		if NMRadioClient.PlaylistTerminalE == nil or #NMRadio.PlaylistTerminalE == 0 then
			--print("Client choosesong: looking for playlist E in moddata")
			NMRadio.PlaylistTerminalE = ModData.getOrCreate("NMRadioE")
		end
		if NMRadioClient.PlaylistTerminalE == nil or #NMRadio.PlaylistTerminalE == 0 then
			--print("Client choosesong: unable to find playlist E creating new list")
			NMRadio.PlaylistTerminalE = NMRadio.CreatePlaylist()
		end
		songNumber = ZombRand(1, #NMRadio.PlaylistTerminalE + 1)
		if songNumber == lastSongNumber and #NMRadio.PlaylistTerminalE > 1 then
			while songNumber == lastSongNumber do
				songNumber = ZombRand(1, #NMRadio.PlaylistTerminalE + 1)
			end
		end
	elseif channel == SandboxVars.NewMusicRadio.NMRMTV then 
		if isClient() then
			--print("Client choosesong: looking for playlist")
			if NMRadioClient.PlaylistTerminalMTV ~= nil and #NMRadioClient.PlaylistTerminalMTV > 0 then
				--print("Client choosesong: pulling MTV from client playlist")
				NMRadio.PlaylistTerminalMTV = NMRadioClient.PlaylistTerminalMTV
			end
		end
		if NMRadioClient.PlaylistTerminalMTV == nil or #NMRadio.PlaylistTerminalMTV == 0 then
			--print("Client choosesong: looking for playlist MTV in moddata")
			NMRadio.PlaylistTerminalMTV = ModData.getOrCreate("NMRadioMTV")
		end
		if NMRadioClient.PlaylistTerminalMTV == nil or #NMRadio.PlaylistTerminalMTV == 0 then
			--print("Client choosesong: unable to find playlist MTV creating new list")
			NMRadio.PlaylistTerminalMTV = NMRadio.CreatePlaylist()
		end
		songNumber = ZombRand(1, #NMRadio.PlaylistTerminalMTV + 1)
		if songNumber == lastSongNumber and #NMRadio.PlaylistTerminalMTV > 1 then
			while songNumber == lastSongNumber do
				songNumber = ZombRand(1, #NMRadio.PlaylistTerminalMTV + 1)
			end
		end
	end
	
	return songNumber
end

NMRadio.CreatePlaylist = function()
	local tempGlobalPlaylist = {}

	for k,v in pairs(GlobalMusic) do
		tempGlobalPlaylist[#tempGlobalPlaylist + 1] = k
	end

	if SandboxVars.NewMusicRadio.NMRExcludeThemeSongs then
		for k,v in pairs(NMRadio.BlacklistThemeSongs) do
			for index = #tempGlobalPlaylist, 1, -1 do 
				value = tempGlobalPlaylist[index]
				if value == v then 
					--print("Removing Theme Song: " .. v)
					table.remove(tempGlobalPlaylist, index)
					break
				end
			end
		end
	end
	if SandboxVars.NewMusicRadio.NMRExcludeTCCacheMPSongs then
		for k,v in pairs(NMRadio.BlacklistTCCacheMPSongs) do
			for index = #tempGlobalPlaylist, 1, -1 do 
				value = tempGlobalPlaylist[index]
				if value == v then 
					--print("Removing TCCache Song: " .. v)
					table.remove(tempGlobalPlaylist, index)
					break
				end
			end
		end
	end
	if SandboxVars.NewMusicRadio.NMRExcludeHolidaySongs then
		for k,v in pairs(NMRadio.BlacklistHolidaySongs) do
			for index = #tempGlobalPlaylist, 1, -1 do 
				value = tempGlobalPlaylist[index]
				if value == v then 
					--print("Removing Holiday Song: " .. v)
					table.remove(tempGlobalPlaylist, index)
					break
				end
			end
		end
	end
	if NMRadio.Blacklist ~= nil and #NMRadio.Blacklist > 0 then
		for k,v in pairs(NMRadio.Blacklist) do
			for index = #tempGlobalPlaylist, 1, -1 do 
				value = tempGlobalPlaylist[index]
				if value == v then 
					--print("Removing Blacklist: " .. v)
					table.remove(tempGlobalPlaylist, index)
					break
				end
			end
		end
	end

	if #tempGlobalPlaylist < 1 then
		print("NMRadio: created a new GlobalTrueMusic playlist but there were no music mods loaded")
	else
		print("NMRadio: created a new GlobalTrueMusic playlist")
	end

	return tempGlobalPlaylist
end

local String = string

function String:trim()
    return self:match("^%s*(.-)%s*$")
end

function String:words()
    return self:gmatch("[^%s]+")
end

NMRadio.prettyName = function(displayName)
	-- From True Music Jukebox written by Burryaga
	-- Example: Cassette - Michael Cassette - My Name Is Michael Cassette
	prettyName = displayName:gsub("Vinyl %-", "", 1) -- Remove first instance of the word Vinyl followed by a hyphen.
	prettyName = prettyName:gsub("Cassette %-", "", 1) -- Remove first instance of the word Cassette followed by a hyphen.
	prettyName = prettyName:gsub("Vinyl", "", 1) -- Remove first instance of the word Vinyl (if no "Vinyl -" found, this will be found).
	prettyName = prettyName:gsub("Cassette", "", 1) -- Remove first instance of the word Cassette (same as above for cassettes).
	prettyName = prettyName:gsub("^%s*(.-)%s*$", "%1") -- Remove leading and trailing whitespace.
	return prettyName --> Michael Cassette - My Name Is Michael Cassette
end

NMRadio.getWrappedText = function(message, limit, fontSize)
	-- Written by Burryaga
    local result = ""
    local width = 0

    local line = ""
    local length = 0

    local lines = 0

    for word in message:words() do

        local dummy = line .. word .. " "

        if getTextManager():MeasureStringX(fontSize, dummy) > limit then
            local length = getTextManager():MeasureStringX(fontSize, line:trim())
            result = result .. line:trim() .. "\n"
            line = word .. " "
            if length > width then width = length end
            lines = lines + 1
        else
            line = dummy
        end

    end

    -- Add the final line.
    result = result .. line:trim()
    
    lines = lines + 1

    length = getTextManager():MeasureStringX(fontSize, line:trim())

    if length > width then width = length end

    return result, width, lines
end

NMRadio.translation = {
	update = getText("UI_NewMusicRadio_update"),
	revert = getText("UI_NewMusicRadio_revert"),
	ejectmedia = getText("UI_NewMusicRadio_ejectmedia"),
	sayaccessblocked = getText("UI_NewMusicRadio_sayaccessblocked"),
	sayneedsgenerator = getText("UI_NewMusicRadio_sayneedsgenerator")
}

NMRadio.config = {
	TMRmuteMusic = nil,
	TMRstopMusic = nil,
	TMRenableRDS = nil,
	TMRenableRDSDeviceText = nil,
	TMRthreeDoff = nil,
	TMRaltThreeD = nil,
	TMRterminalEject = nil,
	TMRterminalBlacklist = nil,
	TMRvolumeSlider = nil,
}

NMRadio.loadConfigOptions = function()
	local options = PZAPI.ModOptions:create("NewMusicRadio", "New Music Radio Options")
	NMRadio.config.TMRmuteMusic = options:addTickBox("NMRmuteMusic", getText("UI_options_NewMusicRadio_NMRmuteMusic"), false, getText("UI_options_NewMusicRadio_NMRmuteMusic_tooltip"))
	NMRadio.config.TMRstopMusic = options:addTickBox("NMRstopMusic", getText("UI_options_NewMusicRadio_NMRstopMusic"), false, getText("UI_options_NewMusicRadio_NMRstopMusic_tooltip"))
	NMRadio.config.TMRenableRDS = options:addTickBox("NMRenableRDS", getText("UI_options_NewMusicRadio_NMRenableRDS"), true, getText("UI_options_NewMusicRadio_NMRenableRDS_tooltip"))
	NMRadio.config.TMRenableRDSDeviceText = options:addTickBox("NMRenableRDSDeviceText", getText("UI_options_NewMusicRadio_NMRenableRDSDeviceText"), true, getText("UI_options_NewMusicRadio_NMRenableRDSDeviceText_tooltip"))
	NMRadio.config.TMRthreeDoff = options:addTickBox("NMRthreeDoff", getText("UI_options_NewMusicRadio_NMRthreeDoff"), false, getText("UI_options_NewMusicRadio_NMRthreeDoff_tooltip"))
	NMRadio.config.TMRaltThreeD = options:addTickBox("NMRaltThreeD", getText("UI_options_NewMusicRadio_NMRaltThreeD"), false, getText("UI_options_NewMusicRadio_NMRaltThreeD_tooltip"))
	NMRadio.config.TMRterminalEject = options:addTickBox("NMRterminalEject", getText("UI_options_NewMusicRadio_NMRterminalEject"), true, getText("UI_options_NewMusicRadio_NMRterminalEject_tooltip"))
	NMRadio.config.TMRterminalBlacklist = options:addTickBox("NMRterminalBlacklist", getText("UI_options_NewMusicRadio_NMRterminalBlacklist"), true, getText("UI_options_NewMusicRadio_NMRterminalBlacklist_tooltip"))
	NMRadio.config.TMRvolumeSlider = options:addSlider("NMRvolumeSlider", getText("UI_options_NewMusicRadio_NMRvolumeSlider"), 0, 11, 1, 10, getText("UI_options_NewMusicRadio_NMRvolumeSlider_tooltip"))
end

-- modoptions examples to pull the data out
-- PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRmuteMusic"):getValue()
-- PZAPI.ModOptions:getOptions("NewMusicRadio"):getOption("NMRterminalEject"):getValue()

NMRadio.loadConfigOptions()

NMRadio.RadioSprites = {
	"appliances_radio_01_0",
	"appliances_radio_01_1",
	"appliances_radio_01_2",
	"appliances_radio_01_3",
	"appliances_radio_01_4",
	"appliances_radio_01_5",
	"appliances_radio_01_6",
	"appliances_radio_01_7",
	"appliances_radio_01_8",
	"appliances_radio_01_9",
	"appliances_radio_01_10",
	"appliances_radio_01_11",
	"appliances_radio_01_12",
	"appliances_radio_01_13",
	"appliances_radio_01_14",
	"appliances_radio_01_15",
	"appliances_radio_01_16",
	"appliances_radio_01_17",
	"appliances_radio_01_18",
	"appliances_radio_01_19"
}

NMRadio.mapLoadingRadios = function(radio)
	local deviceData = radio:getDeviceData()

	if not deviceData:getIsTurnedOn() then
		return
	end

	if deviceData:getDeviceName() == "ValuTech PortaDisc" then
		return
	end

	local radioChannel = radio:getDeviceData():getChannel()

	if not radioChannel then
		return
	end

	if not (radioChannel == SandboxVars.NewMusicRadio.NMRChannel1 or radioChannel == SandboxVars.NewMusicRadio.NMRChannel2 or radioChannel == SandboxVars.NewMusicRadio.NMRChannel3 or radioChannel == SandboxVars.NewMusicRadio.NMRChannel4 or radioChannel == SandboxVars.NewMusicRadio.NMRChannel5 or radioChannel == SandboxVars.NewMusicRadio.NMRMTV) then
		return
	end

	for index,t in ipairs(NMRadio.soundCache) do  
		if t.device == radio then
			if NMRadio.isPlaying(t) then
				return
			end
		end
	end

	local radioX = deviceData:getParent():getX()
	local radioY = deviceData:getParent():getY()
	local radioZ = deviceData:getParent():getZ()
	--print("Activated Radio via maploadwithsprite at x: " .. radioX .. " y: " .. radioY .. " z: " .. radioZ)

	local songNumber = NMRadio.ChooseSong(radioChannel)
	if isClient() and not deviceData:isInventoryDevice() then
		local args = {x = radioX, y = radioY, z = radioZ, channel = radioChannel, number = songNumber}
		sendClientCommand("NMRadio", "Play", args)
	else
		if not NMRadio.Channels[radioChannel] then 
			NMRadio.Channels[radioChannel] = songNumber
			NMRadio.PlaySound(songNumber, radio)
		else
			NMRadio.PlaySound(NMRadio.Channels[radioChannel], radio)
		end
	end
end

MapObjects.OnLoadWithSprite(NMRadio.RadioSprites, NMRadio.mapLoadingRadios, 5)