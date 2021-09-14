Cache = {}

Seed.Init()

if Settings.RandomSettings then
	Settings.MissionOrderType = math.random(3)
	
	Settings.HintType = math.random(3)
	
	Settings.RemoveUnluckyCards = math.random(2) == 1
	
	Settings.RandomCardLocations = math.random(2) == 1
	
	Settings.BanCars = math.random(2) == 1
	Settings.BannedCars = "fone_v,smith_v,cHears" --TODO: Randomise
	
	Settings.PriceMultiplier = math.random(10, 1000) / 100
	
	Settings.RandomBasePrice = math.random(2) == 1
	
	for i=1,7 do
		Settings["CanGetMissionRewardsL" .. i] = math.random(2) == 1
		
		Settings["CanGetRaceRewardsL" .. i] = math.random(2) == 1
		
		Settings["CanGetBonusRewardsL" .. i] = math.random(2) == 1
		
		Settings["CanGetNPCRewardsL" .. i] = math.random(2) == 1
		
		Settings["CanGetGilRewardsL" .. i] = math.random(2) == 1
	end
	
	Seed.AddSpoiler("")
end

Seed.AddSpoiler("SETTINGS:")
local SettingKeys = {}
for k in pairs(Settings) do
	SettingKeys[#SettingKeys + 1] = k
end
table.sort(SettingKeys)
for i=1,#SettingKeys do
	Seed.AddSpoiler(SettingKeys[i] .. " = " .. tostring(Settings[SettingKeys[i]]))
end
Seed.AddSpoiler("")

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

UnlockPrice = 0
if Settings.PayForUnlocks then
	if Settings.RandomBasePrice then
		UnlockPrice = math.random(100, 250)
	else
		UnlockPrice = 100
	end
	UnlockPrice = UnlockPrice * Settings.PriceMultiplier
end