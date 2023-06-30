Cache = {}

local presets_on = false

if Settings.Preset1 then
	preset_number = 1
	presets_on = true
end

if Settings.Preset2 then
	preset_number = 2
	presets_on = true
end

if Settings.Preset3 then
	preset_number = 3
	presets_on = true
end

if Settings.Preset4 then
	preset_number = 4
	presets_on = true
end

if Settings.Preset5 then
	preset_number = 5
	presets_on = true
end

if Settings.Preset6 then
	preset_number = 6
	presets_on = true
end

if Settings.Preset7 then
	preset_number = 7
	presets_on = true
end

if Settings.Preset8 then
	preset_number = 8
	presets_on = true
end

if Settings.Preset9 then
	preset_number = 9
	presets_on = true
end

if presets_on then
	local SettingsFile = ReadFile("/UserData/SavedGames/Presets.cfg")
	local current_preset = false
	for line in SettingsFile:gmatch("[^\r\n]+") do
		if not(string.find(line, "%["..string.format("Preset %d", preset_number).."%]")==nil) then
			current_preset = true
		end

		if current_preset == true then
			local key, value = line:match("^(.-)=(.+)$")
			if key then
			--Based on reading mod settings by `Settings = GetSettings()`, overwrite the default values in that table
				if value == "2" and not(key=="PriceMultiplier") and not(key=="PayForUnlocksAmount") and not(key=="MissionOrderType") and not(key=="HintType") then
					Settings[key] = true
				elseif value == "1" and not(key=="PriceMultiplier") and not(key=="PayForUnlocksAmount") and not(key=="MissionOrderType") and not(key=="HintType") then
					Settings[key] = false
				elseif tonumber(value) then
					Settings[key] = tonumber(value)
				elseif value == "None" then
					Settings[key] = ""
				elseif not(key == "PresetName") then
					Settings[key] = value
				else
					print("\nUsing Preset named: "..value.."\n")
				end
			end
		end

		if not(string.find(line, "%["..string.format("Preset %d",preset_number+1).."%]")==nil) then
			current_preset = false
		end
	end
end


Seed.Init()


if Settings.RandomSettings then
	Settings.MissionOrderType = math.random(3)

	Settings.HintType = math.random(3)

	Settings.RemoveUnluckyCards = math.random(2) == 1

	Settings.RandomCardLocations = math.random(2) == 1

	Settings.BanCars = math.random(2) == 1
	Settings.BannedCars = "fone_v,smith_v,cHears" --TODO: Randomise (Do when it's a toggleable window)

	Settings.PriceMultiplier = math.random(10, 1000) / 100

	Settings.RandomBasePrice = math.random(2) == 1

	Settings.PayForUnlocks = math.random(2) == 1

	for i=1,7 do
		Settings["CanGetMissionRewardsL" .. i] = math.random(2) == 1

		Settings["CanGetRaceRewardsL" .. i] = math.random(2) == 1

		Settings["CanGetBonusRewardsL" .. i] = Settings["CanGetRaceRewardsL" .. i]

		Settings["CanGetNPCRewardsL" .. i] = math.random(2) == 1

		Settings["CanGetGilRewardsL" .. i] = Settings["CanGetNPCRewardsL" .. i]
	end

	Seed.AddSpoiler("")
end

Seed.AddSpoiler("SETTINGS:")
local SettingKeys = {}
for k in pairs(Settings) do
	SettingKeys[#SettingKeys + 1] = k
end
table.sort(SettingKeys)
local SettingsHashTbl = {}
local OmittedSettings = {
	["HideSeed"]=true
}
for i=1,#SettingKeys do
	Seed.AddSpoiler(SettingKeys[i] .. " = " .. tostring(Settings[SettingKeys[i]]))
	if not OmittedSettings[SettingKeys[i]] then
		SettingsHashTbl[#SettingsHashTbl + 1] = SettingKeys[#SettingsHashTbl + 1] .. "=" .. tostring(Settings[SettingKeys[i]])
	end
end
SettingsHash = sha1.hex(table.concat(SettingsHashTbl, "\n")):gsub("(.)...", "%1")
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
		UnlockPrice = Settings.PayForUnlocksAmount
	end
end
