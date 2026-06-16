NMRadioServer = {}

NMRadioServer.PlaylistTerminalA = {}
NMRadioServer.PlaylistTerminalB = {}
NMRadioServer.PlaylistTerminalC = {}
NMRadioServer.PlaylistTerminalD = {}
NMRadioServer.PlaylistTerminalE = {}
NMRadioServer.PlaylistTerminalMTV = {}

NMRadioServer.Channels = {}

NMRadioServer.Blacklist = { "Test" }

NMRadioServer.BlacklistThemeSongs = {
	"CassetteMainTheme",
	"VinylMainTheme",
}

NMRadioServer.BlacklistTCCacheMPSongs = {
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

NMRadioServer.BlacklistHolidaySongs = {
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

NMRadioServer.prettyName = function(displayName)
	-- From True Music Jukebox written by Burryaga
	-- Example: Cassette - Michael Cassette - My Name Is Michael Cassette
	prettyName = displayName:gsub("Vinyl %-", "", 1) -- Remove first instance of the word Vinyl followed by a hyphen.
	prettyName = prettyName:gsub("Cassette %-", "", 1) -- Remove first instance of the word Cassette followed by a hyphen.
	prettyName = prettyName:gsub("Vinyl", "", 1) -- Remove first instance of the word Vinyl (if no "Vinyl -" found, this will be found).
	prettyName = prettyName:gsub("Cassette", "", 1) -- Remove first instance of the word Cassette (same as above for cassettes).
	prettyName = prettyName:gsub("^%s*(.-)%s*$", "%1") -- Remove leading and trailing whitespace.
	return prettyName --> Michael Cassette - My Name Is Michael Cassette
end

NMRadioServer.CreatePlaylist = function()
	local tempGlobalPlaylist = {}

	for k,v in pairs(GlobalMusic) do
		tempGlobalPlaylist[#tempGlobalPlaylist + 1] = k
	end

	if SandboxVars.NewMusicRadio.NMRExcludeThemeSongs then
		for k,v in pairs(NMRadioServer.BlacklistThemeSongs) do
			for index = #tempGlobalPlaylist, 1, -1 do 
				value = tempGlobalPlaylist[index]
				if value == v then 
					table.remove(tempGlobalPlaylist, index)
					break
				end
			end
		end
	end
	if SandboxVars.NewMusicRadio.NMRExcludeTCCacheMPSongs then
		for k,v in pairs(NMRadioServer.BlacklistTCCacheMPSongs) do
			for index = #tempGlobalPlaylist, 1, -1 do 
				value = tempGlobalPlaylist[index]
				if value == v then 
					table.remove(tempGlobalPlaylist, index)
					break
				end
			end
		end
	end
	if SandboxVars.NewMusicRadio.NMRExcludeHolidaySongs then
		for k,v in pairs(NMRadioServer.BlacklistHolidaySongs) do
			for index = #tempGlobalPlaylist, 1, -1 do 
				value = tempGlobalPlaylist[index]
				if value == v then 
					table.remove(tempGlobalPlaylist, index)
					break
				end
			end
		end
	end
	if NMRadioServer.Blacklist ~= nil and #NMRadioServer.Blacklist > 0 then
		for k,v in pairs(NMRadioServer.Blacklist) do
			for index = #tempGlobalPlaylist, 1, -1 do 
				value = tempGlobalPlaylist[index]
				if value == v then 
					table.remove(tempGlobalPlaylist, index)
					break
				end
			end
		end
	end

	if #tempGlobalPlaylist < 3 then
		print("NMRadio Server: created a new GlobalTrueMusic playlist but there were no music mods loaded")
	else
		print("NMRadio Server: created a new GlobalTrueMusic playlist")
	end

	return tempGlobalPlaylist
end

NMRadioServer.SendServerCommandToClients = function(command, args)
	if not isClient() and not isServer() then
		triggerEvent("OnServerCommand", "NMRadio", command, args) -- Singleplayer
	else
		sendServerCommand("NMRadio", command, args) -- Multiplayer
	end
end

NMRadioServer.Play = function(player, args)
	if NMRadioServer.PlaylistTerminalA == nil or #NMRadioServer.PlaylistTerminalA == 0 then
		NMRadioServer.PlaylistTerminalA = ModData.getOrCreate("NMRadioA")
	end
	if NMRadioServer.PlaylistTerminalB == nil or #NMRadioServer.PlaylistTerminalB == 0 then
		NMRadioServer.PlaylistTerminalB = ModData.getOrCreate("NMRadioB")
	end
	if NMRadioServer.PlaylistTerminalC == nil or #NMRadioServer.PlaylistTerminalC == 0 then
		NMRadioServer.PlaylistTerminalC = ModData.getOrCreate("NMRadioC")
	end
	if NMRadioServer.PlaylistTerminalD == nil or #NMRadioServer.PlaylistTerminalD == 0 then
		NMRadioServer.PlaylistTerminalD = ModData.getOrCreate("NMRadioD")
	end
	if NMRadioServer.PlaylistTerminalE == nil or #NMRadioServer.PlaylistTerminalE == 0 then
		NMRadioServer.PlaylistTerminalE = ModData.getOrCreate("NMRadioE")
	end
	if NMRadioServer.PlaylistTerminalMTV == nil or #NMRadioServer.PlaylistTerminalMTV == 0 then
		NMRadioServer.PlaylistTerminalMTV = ModData.getOrCreate("NMRadioMTV")
	end
	if NMRadioServer.PlaylistTerminalA == nil or #NMRadioServer.PlaylistTerminalA == 0 then
		NMRadioServer.PlaylistTerminalA = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioA", NMRadioServer.PlaylistTerminalA)
	end
	if NMRadioServer.PlaylistTerminalB == nil or #NMRadioServer.PlaylistTerminalB == 0 then
		NMRadioServer.PlaylistTerminalB = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioB", NMRadioServer.PlaylistTerminalB)
	end
	if NMRadioServer.PlaylistTerminalC == nil or #NMRadioServer.PlaylistTerminalC == 0 then
		NMRadioServer.PlaylistTerminalC = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioC", NMRadioServer.PlaylistTerminalC)
	end
	if NMRadioServer.PlaylistTerminalD == nil or #NMRadioServer.PlaylistTerminalD == 0 then
		NMRadioServer.PlaylistTerminalD = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioD", NMRadioServer.PlaylistTerminalD)
	end
	if NMRadioServer.PlaylistTerminalE == nil or #NMRadioServer.PlaylistTerminalE == 0 then
		NMRadioServer.PlaylistTerminalE = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioE", NMRadioServer.PlaylistTerminalE)
	end
	if NMRadioServer.PlaylistTerminalMTV == nil or #NMRadioServer.PlaylistTerminalMTV == 0 then
		NMRadioServer.PlaylistTerminalMTV = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioMTV", NMRadioServer.PlaylistTerminalMTV)
	end
	if not NMRadioServer.Channels[args.channel] then
		--print("NMRadio: adding channel to channel list")
		NMRadioServer.Channels[args.channel] = args.number

		if SandboxVars.NewMusicRadio.NMRRadioSongAnnouncements then
			local songName = nil
			if args.channel == SandboxVars.NewMusicRadio.NMRChannel1 then	
    				songName = NMRadioServer.PlaylistTerminalA[args.number]
			elseif args.channel == SandboxVars.NewMusicRadio.NMRChannel2 then
    				songName = NMRadioServer.PlaylistTerminalB[args.number]
			elseif args.channel == SandboxVars.NewMusicRadio.NMRChannel3 then
    				songName = NMRadioServer.PlaylistTerminalC[args.number]
			elseif args.channel == SandboxVars.NewMusicRadio.NMRChannel4 then
    				songName = NMRadioServer.PlaylistTerminalD[args.number]
			elseif args.channel == SandboxVars.NewMusicRadio.NMRChannel5 then
    				songName = NMRadioServer.PlaylistTerminalE[args.number]
			elseif args.channel == SandboxVars.NewMusicRadio.NMRMTV then
    				songName = NMRadioServer.PlaylistTerminalMTV[args.number]
			end
			local musicItem = "NewMusic." .. songName
			local displayName = getItemNameFromFullType(musicItem)
			local prettyName = NMRadioServer.prettyName(displayName)
			DynamicRadio.OnNewSong(args.channel, prettyName)
		end
	else
		--print("NMRadio: song already attached to current channel list, send it to the client")
		args.number = NMRadioServer.Channels[args.channel]
	end
	ModData.add("NMRadioChannels", NMRadioServer.Channels)
	print("NMRadio Server: Sending play to clients")
	NMRadioServer.SendServerCommandToClients("Play", args)
end

NMRadioServer.Stop = function(player, args)
	print("NMRadio Server: Sending stop to clients")
	NMRadioServer.SendServerCommandToClients("Stop", args)
end

NMRadioServer.PlayNext = function(player, args)
	if NMRadioServer.PlaylistTerminalA == nil or #NMRadioServer.PlaylistTerminalA == 0 then
		NMRadioServer.PlaylistTerminalA = ModData.getOrCreate("NMRadioA")
	end
	if NMRadioServer.PlaylistTerminalB == nil or #NMRadioServer.PlaylistTerminalB == 0 then
		NMRadioServer.PlaylistTerminalB = ModData.getOrCreate("NMRadioB")
	end
	if NMRadioServer.PlaylistTerminalC == nil or #NMRadioServer.PlaylistTerminalC == 0 then
		NMRadioServer.PlaylistTerminalC = ModData.getOrCreate("NMRadioC")
	end
	if NMRadioServer.PlaylistTerminalD == nil or #NMRadioServer.PlaylistTerminalD == 0 then
		NMRadioServer.PlaylistTerminalD = ModData.getOrCreate("NMRadioD")
	end
	if NMRadioServer.PlaylistTerminalE == nil or #NMRadioServer.PlaylistTerminalE == 0 then
		NMRadioServer.PlaylistTerminalE = ModData.getOrCreate("NMRadioE")
	end
	if NMRadioServer.PlaylistTerminalMTV == nil or #NMRadioServer.PlaylistTerminalMTV == 0 then
		NMRadioServer.PlaylistTerminalMTV = ModData.getOrCreate("NMRadioMTV")
	end
	if NMRadioServer.PlaylistTerminalA == nil or #NMRadioServer.PlaylistTerminalA == 0 then
		NMRadioServer.PlaylistTerminalA = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioA", NMRadioServer.PlaylistTerminalA)
	end
	if NMRadioServer.PlaylistTerminalB == nil or #NMRadioServer.PlaylistTerminalB == 0 then
		NMRadioServer.PlaylistTerminalB = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioB", NMRadioServer.PlaylistTerminalB)
	end
	if NMRadioServer.PlaylistTerminalC == nil or #NMRadioServer.PlaylistTerminalC == 0 then
		NMRadioServer.PlaylistTerminalC = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioC", NMRadioServer.PlaylistTerminalC)
	end
	if NMRadioServer.PlaylistTerminalD == nil or #NMRadioServer.PlaylistTerminalD == 0 then
		NMRadioServer.PlaylistTerminalD = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioD", NMRadioServer.PlaylistTerminalD)
	end
	if NMRadioServer.PlaylistTerminalE == nil or #NMRadioServer.PlaylistTerminalE == 0 then
		NMRadioServer.PlaylistTerminalE = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioE", NMRadioServer.PlaylistTerminalE)
	end
	if NMRadioServer.PlaylistTerminalMTV == nil or #NMRadioServer.PlaylistTerminalMTV == 0 then
		NMRadioServer.PlaylistTerminalMTV = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioMTV", NMRadioServer.PlaylistTerminalMTV)
	end
	NMRadioServer.Channels[args.channel] = args.number
	ModData.add("NMRadioChannels", NMRadioServer.Channels)
	print("NMRadio Server: Sending playnext to clients")
	NMRadioServer.SendServerCommandToClients("PlayNext", args)

	if SandboxVars.NewMusicRadio.NMRRadioSongAnnouncements then
		local songName = nil
		if args.channel == SandboxVars.NewMusicRadio.NMRChannel1 then	
    			songName = NMRadioServer.PlaylistTerminalA[args.number]
		elseif args.channel == SandboxVars.NewMusicRadio.NMRChannel2 then
    			songName = NMRadioServer.PlaylistTerminalB[args.number]
		elseif args.channel == SandboxVars.NewMusicRadio.NMRChannel3 then
    			songName = NMRadioServer.PlaylistTerminalC[args.number]
		elseif args.channel == SandboxVars.NewMusicRadio.NMRChannel4 then
    			songName = NMRadioServer.PlaylistTerminalD[args.number]
		elseif args.channel == SandboxVars.NewMusicRadio.NMRChannel5 then
    			songName = NMRadioServer.PlaylistTerminalE[args.number]
		elseif args.channel == SandboxVars.NewMusicRadio.NMRMTV then
    			songName = NMRadioServer.PlaylistTerminalMTV[args.number]
		end
		local musicItem = "NewMusic." .. songName
		local displayName = getItemNameFromFullType(musicItem)
		local prettyName = NMRadioServer.prettyName(displayName)
		DynamicRadio.OnNewSong(args.channel, prettyName)
	end
end

NMRadioServer.UpdatePlaylistTerminalA = function(player, args)
	if args.request == true then
		--print("NMRadio Server: Client requesting A")
		if NMRadioServer.PlaylistTerminalA == nil or #NMRadioServer.PlaylistTerminalA == 0 then
			--print("NMRadio Server: A not found, pull from moddata")
			NMRadioServer.PlaylistTerminalA = ModData.getOrCreate("NMRadioA")
		end
		if NMRadioServer.PlaylistTerminalA == nil or #NMRadioServer.PlaylistTerminalA == 0 then
			--print("NMRadio Server: A still not found, create default list")
			NMRadioServer.PlaylistTerminalA = NMRadioServer.CreatePlaylist()
		end
	else
		--print("NMRadio Server: Updating A from client")
		NMRadioServer.PlaylistTerminalA = args
	end
	ModData.add("NMRadioA", NMRadioServer.PlaylistTerminalA)
	--ModData.transmit("NMRadioA", NMRadioServer.PlaylistTerminalA)	
	print("Server: updated A send to clients")
	NMRadioServer.SendServerCommandToClients("UpdatePlaylistTerminalA", NMRadioServer.PlaylistTerminalA)
end

NMRadioServer.UpdatePlaylistTerminalB = function(player, args) 
	if args.request == true then
		--print("NMRadio Server: Client requesting B")
		if NMRadioServer.PlaylistTerminalB == nil or #NMRadioServer.PlaylistTerminalB == 0 then
			--print("NMRadio Server: B not found, pull from moddata")
			NMRadioServer.PlaylistTerminalB = ModData.getOrCreate("NMRadioB")
		end
		if NMRadioServer.PlaylistTerminalB == nil or #NMRadioServer.PlaylistTerminalB == 0 then
			--print("NMRadio Server: B still not found, create default list")
			NMRadioServer.PlaylistTerminalB = NMRadioServer.CreatePlaylist()
		end
	else
		--print("NMRadio Server: Updating B from client")
		NMRadioServer.PlaylistTerminalB = args
	end
	ModData.add("NMRadioB", NMRadioServer.PlaylistTerminalB)
	--ModData.transmit("NMRadioB", NMRadioServer.PlaylistTerminalB)
	print("NMRadio Server: updated B send to clients")
	NMRadioServer.SendServerCommandToClients("UpdatePlaylistTerminalB", NMRadioServer.PlaylistTerminalB)
end

NMRadioServer.UpdatePlaylistTerminalC = function(player, args) 
	if args.request == true then
		--print("NMRadio Server: Client requesting C")
		if NMRadioServer.PlaylistTerminalC == nil or #NMRadioServer.PlaylistTerminalC == 0 then
			--print("NMRadio Server: C not found, pull from moddata")
			NMRadioServer.PlaylistTerminalC = ModData.getOrCreate("NMRadioC")
		end
		if NMRadioServer.PlaylistTerminalC == nil or #NMRadioServer.PlaylistTerminalC == 0 then
			--print("NMRadio Server: C still not found, create default list")
			NMRadioServer.PlaylistTerminalC = NMRadioServer.CreatePlaylist()
		end
	else
		--print("NMRadio Server: Updating C from client")
		NMRadioServer.PlaylistTerminalC = args
	end
	ModData.add("NMRadioC", NMRadioServer.PlaylistTerminalC)
	--ModData.transmit("NMRadioC", NMRadioServer.PlaylistTerminalC)
	print("NMRadio Server: updated C send to clients")
	NMRadioServer.SendServerCommandToClients("UpdatePlaylistTerminalC", NMRadioServer.PlaylistTerminalC)
end

NMRadioServer.UpdatePlaylistTerminalD = function(player, args) 
	if args.request == true then
		--print("NMRadio Server: Client requesting D")
		if NMRadioServer.PlaylistTerminalD == nil or #NMRadioServer.PlaylistTerminalD == 0 then
			--print("NMRadio Server: D not found, pull from moddata")
			NMRadioServer.PlaylistTerminalD = ModData.getOrCreate("NMRadioD")
		end
		if NMRadioServer.PlaylistTerminalD == nil or #NMRadioServer.PlaylistTerminalD == 0 then
			--print("NMRadio Server: D still not found, create default list")
			NMRadioServer.PlaylistTerminalD = NMRadioServer.CreatePlaylist()
		end
	else
		--print("NMRadio Server: Updating D from client")
		NMRadioServer.PlaylistTerminalD = args
	end
	ModData.add("NMRadioD", NMRadioServer.PlaylistTerminalD)
	--ModData.transmit("NMRadioD", NMRadioServer.PlaylistTerminalD)
	print("NMRadio Server: updated D send to clients")
	NMRadioServer.SendServerCommandToClients("UpdatePlaylistTerminalD", NMRadioServer.PlaylistTerminalD)
end

NMRadioServer.UpdatePlaylistTerminalE = function(player, args) 
	if args.request == true then
		--print("NMRadio Server: Client requesting E")
		if NMRadioServer.PlaylistTerminalE == nil or #NMRadioServer.PlaylistTerminalE == 0 then
			--print("NMRadio Server: E not found, pull from moddata")
			NMRadioServer.PlaylistTerminalE = ModData.getOrCreate("NMRadioE")
		end
		if NMRadioServer.PlaylistTerminalE == nil or #NMRadioServer.PlaylistTerminalE == 0 then
			--print("NMRadio Server: E still not found, create default list")
			NMRadioServer.PlaylistTerminalE = NMRadioServer.CreatePlaylist()
		end
	else
		--print("NMRadio Server: Updating E from client")
		NMRadioServer.PlaylistTerminalE = args
	end
	ModData.add("NMRadioE", NMRadioServer.PlaylistTerminalE)
	--ModData.transmit("NMRadioE", NMRadioServer.PlaylistTerminalE)
	print("NMRadio Server: updated E send to clients")
	NMRadioServer.SendServerCommandToClients("UpdatePlaylistTerminalE", NMRadioServer.PlaylistTerminalE)
end

NMRadioServer.UpdatePlaylistTerminalMTV = function(player, args) 
	if args.request == true then
		--print("NMRadio Server: Client requesting MTV")
		if NMRadioServer.PlaylistTerminalMTV == nil or #NMRadioServer.PlaylistTerminalMTV == 0 then
			--print("NMRadio Server: MTV not found, pull from moddata")
			NMRadioServer.PlaylistTerminalMTV = ModData.getOrCreate("NMRadioMTV")
		end
		if NMRadioServer.PlaylistTerminalMTV == nil or #NMRadioServer.PlaylistTerminalMTV == 0 then
			--print("NMRadio Server: MTV still not found, create default list")
			NMRadioServer.PlaylistTerminalMTV = NMRadioServer.CreatePlaylist()
		end
	else
		--print("NMRadio Server: Updating MTV from client")
		NMRadioServer.PlaylistTerminalMTV = args
	end
	ModData.add("NMRadioMTV", NMRadioServer.PlaylistTerminalMTV)
	--ModData.transmit("NMRadioMTV", NMRadioServer.PlaylistTerminalMTV)
	print("NMRadio Server: updated MTV send to clients")
	NMRadioServer.SendServerCommandToClients("UpdatePlaylistTerminalMTV", NMRadioServer.PlaylistTerminalMTV)
end

NMRadioServer.UpdateChannels = function(player, args) 
	if args.request == true then
		--print("NMRadio Server: Client requesting channels")
		NMRadioServer.Channels = ModData.getOrCreate("NMRadioChannels")
		if NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel1] == nil or NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel1] > #NMRadioServer.PlaylistTerminalA then
			NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel1] = ZombRand(1, #NMRadioServer.PlaylistTerminalA)
		end
		if NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel2] == nil or NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel2] > #NMRadioServer.PlaylistTerminalB then
			NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel2] = ZombRand(1, #NMRadioServer.PlaylistTerminalB)
		end
		if NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel3] == nil or NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel3] > #NMRadioServer.PlaylistTerminalC then
			NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel3] = ZombRand(1, #NMRadioServer.PlaylistTerminalC)
		end
		if NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel4] == nil or NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel4] > #NMRadioServer.PlaylistTerminalD then
			NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel4] = ZombRand(1, #NMRadioServer.PlaylistTerminalD)
		end
		if NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel5] == nil or NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel5] > #NMRadioServer.PlaylistTerminalE then
			NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel5] = ZombRand(1, #NMRadioServer.PlaylistTerminalE)
		end
		if NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRMTV] == nil or NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRMTV] > #NMRadioServer.PlaylistTerminalMTV then
			NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRMTV] = ZombRand(1, #NMRadioServer.PlaylistTerminalMTV)
		end
		print("NMRadio Server: Updated channels send to clients")
		--print(SandboxVars.NewMusicRadio.NMRChannel1/1000 .. "FM: " ..  NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel1])
		--print(SandboxVars.NewMusicRadio.NMRChannel2/1000 .. "FM: " ..  NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel2])
		--print(SandboxVars.NewMusicRadio.NMRChannel3/1000 .. "FM: " ..  NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel3])
		--print(SandboxVars.NewMusicRadio.NMRChannel4/1000 .. "FM: " ..  NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel4])
		--print(SandboxVars.NewMusicRadio.NMRChannel5/1000 .. "FM: " ..  NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel5])
		ModData.add("NMRadioChannels", NMRadioServer.Channels)
		NMRadioServer.SendServerCommandToClients("UpdateChannels", NMRadioServer.Channels)
	end
end

NMRadioServer.UpdateBlacklist = function(player, args) 
	if args.request == true then
		--print("NMRadio Server: Client requesting E")
		if NMRadioServer.Blacklist == nil or #NMRadioServer.Blacklist == 0 then
			--print("NMRadio Server: blacklist not found, pull from moddata")
			NMRadioServer.Blacklist = ModData.getOrCreate("NMRadioBlacklist")
		end
		if NMRadioServer.Blacklist == nil or #NMRadioServer.Blacklist == 0 then
			--print("NMRadio Server: blacklist still not found, nothing to send")
		end
	else
		--print("NMRadio Server: Updating blacklist from client")
		NMRadioServer.Blacklist = args
	end
	ModData.add("NMRadioBlacklist", NMRadioServer.Blacklist)
	--ModData.transmit("NMRadioBlacklist", NMRadioServer.Blacklist)
	print("NMRadio Server: updated blacklist send to clients")
	NMRadioServer.SendServerCommandToClients("UpdateBlacklist", NMRadioServer.Blacklist)
end

NMRadioServer.EjectMedia = function(player, args) 
	--print("NMRadio Server: Ejecting Media from Terminal")
	if args then
		local item = instanceItem(args.media)
		player:getInventory():AddItem(item);
		sendAddItemToContainer(player:getInventory(), item);
	end
end

NMRadioServer.SetStat = function(player, args) 
	--print("NMRadio Server: Changing player stats")
	if args then
		local stat = args.stat
		local amount = args.amount
		if stat == "BOREDOM" then
			player:getStats():set(CharacterStat.BOREDOM, amount)
		elseif stat == "UNHAPPINESS" then
			player:getStats():set(CharacterStat.UNHAPPINESS, amount)
		end
	end
end

NMRadioServer.OnClientCommand = function(module, command, player, args)
    	if not (module == "NMRadio" and NMRadioServer[command]) then
		return
	end
	--print("NMRadio Server: Getting a " .. command .. " from a client.")
	NMRadioServer[command](player, args)
end

Events.OnClientCommand.Add(NMRadioServer.OnClientCommand)

NMRadioServer.OnReceiveGlobalModData = function(module, args)
	if not args then
		return
	end
	
    	if module == "NMRadioA" then
		NMRadioServer.PlaylistTerminalA = args
		ModData.add("NMRadioA", NMRadioServer.PlaylistTerminalA)
		ModData.transmit("NMRadioA", NMRadioServer.PlaylistTerminalA)	
	elseif module == "NMRadioB" then
		NMRadioServer.PlaylistTerminalB = args
		ModData.add("NMRadioB", NMRadioServer.PlaylistTerminalB)
		ModData.transmit("NMRadioB", NMRadioServer.PlaylistTerminalB)	
	elseif module == "NMRadioC" then
		NMRadioServer.PlaylistTerminalC = args
		ModData.add("NMRadioC", NMRadioServer.PlaylistTerminalC)
		ModData.transmit("NMRadioC", NMRadioServer.PlaylistTerminalC)
	elseif module == "NMRadioD" then
		NMRadioServer.PlaylistTerminalD = args
		ModData.add("NMRadioD", NMRadioServer.PlaylistTerminalD)
		ModData.transmit("NMRadioD", NMRadioServer.PlaylistTerminalD)
	elseif module == "NMRadioE" then
		NMRadioServer.PlaylistTerminalE = args
		ModData.add("NMRadioE", NMRadioServer.PlaylistTerminalE)
		ModData.transmit("NMRadioE", NMRadioServer.PlaylistTerminalE)	
	elseif module == "NMRadioMTV" then
		NMRadioServer.PlaylistTerminalMTV = args
		ModData.add("NMRadioMTV", NMRadioServer.PlaylistTerminalMTV)
		ModData.transmit("NMRadioMTV", NMRadioServer.PlaylistTerminalMTV)	
	elseif module == "NMRadioBlacklist" then
		NMRadioServer.Blacklist = args
		ModData.add("NMRadioBlacklist", NMRadioServer.Blacklist)
		ModData.transmit("NMRadioBlacklist", NMRadioServer.Blacklist)	
	end
end

Events.OnReceiveGlobalModData.Add(NMRadioServer.OnReceiveGlobalModData)

NMRadioServer.OnServerStarted = function() 
	NMRadioServer.OldPlaylistGlobal = ModData.getOrCreate("NMRadioOldPlaylistGlobal")
	NMRadioServer.PlaylistGlobal = {}
	for k,v in pairs(GlobalMusic) do
		NMRadioServer.PlaylistGlobal[#NMRadioServer.PlaylistGlobal + 1] = k
	end
	if #NMRadioServer.OldPlaylistGlobal == #NMRadioServer.PlaylistGlobal then
		print("NMRadioServer: The current global music list matches old list. Old: " .. #NMRadioServer.OldPlaylistGlobal .. " New: " .. #NMRadioServer.PlaylistGlobal)
	else
		print("NMRadioServer: The current global music list doesn't match the old list. Old: " .. #NMRadioServer.OldPlaylistGlobal .. " New: " .. #NMRadioServer.PlaylistGlobal .. " Reverting all stations for the update.")
		ModData.add("NMRadioOldPlaylistGlobal", NMRadioServer.PlaylistGlobal)
		NMRadioServer.PlaylistTerminalA = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioA", NMRadioServer.PlaylistTerminalA)
		NMRadioServer.PlaylistTerminalB = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioB", NMRadioServer.PlaylistTerminalB)
		NMRadioServer.PlaylistTerminalC = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioC", NMRadioServer.PlaylistTerminalC)
		NMRadioServer.PlaylistTerminalD = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioD", NMRadioServer.PlaylistTerminalD)
		NMRadioServer.PlaylistTerminalE = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioE", NMRadioServer.PlaylistTerminalE)
		NMRadioServer.PlaylistTerminalMTV = NMRadioServer.CreatePlaylist()
		ModData.add("NMRadioMTV", NMRadioServer.PlaylistTerminalMTV)
		NMRadioServer.Channels = ModData.getOrCreate("NMRadioChannels")
		NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel1] = ZombRand(1, #NMRadioServer.PlaylistTerminalA)
		NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel2] = ZombRand(1, #NMRadioServer.PlaylistTerminalB)
		NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel3] = ZombRand(1, #NMRadioServer.PlaylistTerminalC)
		NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel4] = ZombRand(1, #NMRadioServer.PlaylistTerminalD)
		NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRChannel5] = ZombRand(1, #NMRadioServer.PlaylistTerminalE)
		NMRadioServer.Channels[SandboxVars.NewMusicRadio.NMRMTV] = ZombRand(1, #NMRadioServer.PlaylistTerminalMTV)
		ModData.add("NMRadioChannels", NMRadioServer.Channels)
	end
end

Events.OnServerStarted.Add(NMRadioServer.OnServerStarted)

return NMRadioServer