Cache = {}

Seed.Init()

if Settings.RandomSettings then
	Seed.AddSpoiler("RANDOM SETTINGS:")
	
	Settings.MissionOrderType = math.random(3)
	Seed.AddSpoiler("MissionOrderType|" .. Settings.MissionOrderType)
	
	Settings.HintType = math.random(3)
	Seed.AddSpoiler("HintType|" .. Settings.MissionOrderType)
	
	Settings.RemoveUnluckyCards = math.random(2) == 1
	Seed.AddSpoiler("RemoveUnluckyCards|" .. tostring(Settings.RemoveUnluckyCards))
	
	Settings.RandomCardLocations = math.random(2) == 1
	Seed.AddSpoiler("RandomCardLocations|" .. tostring(Settings.RandomCardLocations))
	
	Settings.BanCars = math.random(2) == 1
	Seed.AddSpoiler("BanCars|" .. tostring(Settings.BanCars))
	Settings.BannedCars = "fone_v,smith_v,cHears" --TODO: Randomise
	
	Settings.PriceMultiplier = math.random(10, 1000) / 100
	Seed.AddSpoiler("PriceMultiplier|" .. Settings.PriceMultiplier)
	
	Settings.RandomBasePrice = math.random(2) == 1
	Seed.AddSpoiler("RandomBasePrice|" .. tostring(Settings.RandomBasePrice))
	
	for i=1,7 do
		Settings["CanGetMissionRewardsL" .. i] = math.random(2) == 1
		Seed.AddSpoiler("CanGetMissionRewardsL" .. i .. "|" .. tostring(Settings["CanGetMissionRewardsL" .. i]))
		
		Settings["CanGetRaceRewardsL" .. i] = math.random(2) == 1
		Seed.AddSpoiler("CanGetRaceRewardsL" .. i .. "|" .. tostring(Settings["CanGetRaceRewardsL" .. i]))
		
		Settings["CanGetBonusRewardsL" .. i] = math.random(2) == 1
		Seed.AddSpoiler("CanGetBonusRewardsL" .. i .. "|" .. tostring(Settings["CanGetBonusRewardsL" .. i]))
		
		Settings["CanGetNPCRewardsL" .. i] = math.random(2) == 1
		Seed.AddSpoiler("CanGetNPCRewardsL" .. i .. "|" .. tostring(Settings["CanGetNPCRewardsL" .. i]))
		
		Settings["CanGetGilRewardsL" .. i] = math.random(2) == 1
		Seed.AddSpoiler("CanGetGilRewardsL" .. i .. "|" .. tostring(Settings["CanGetGilRewardsL" .. i]))
	end
	
	Seed.AddSpoiler("")
end

CompletedMissions = {}
for i=1,7 do
	CompletedMissions[i] = {}
end

if Settings.MissionOrderType == 2 then
	MissionOrder = {
		{7, 6, 5, 4, 3, 2, 1},
		{7, 6, 5, 4, 3, 2, 1},
		{7, 6, 5, 4, 3, 2, 1},
		{7, 6, 5, 4, 3, 2, 1},
		{7, 6, 5, 4, 3, 2, 1},
		{7, 6, 5, 4, 3, 2, 1},
		{4, 3, 2, 1, 5, 6, 7},
	}
elseif Settings.MissionOrderType == 3 then
	MissionOrder = {}
	
	for i=1,7 do
		MissionOrder[i] = {}
		local AvailableMissions = {}
		for j=1,(i == 7 and 4 or 7) do
			AvailableMissions[j] = j
		end
		for j=1,#AvailableMissions do
			local NextMissionIdx = math.random(#AvailableMissions)
			MissionOrder[i][j] = AvailableMissions[NextMissionIdx]
			table.remove(AvailableMissions, NextMissionIdx)
		end
	end
	
	for i=5,7 do
		MissionOrder[7][i] = i
	end
else
	MissionOrder = {}
	for i=1,7 do
		MissionOrder[i] = {1,2,3,4,5,6,7}
	end
end