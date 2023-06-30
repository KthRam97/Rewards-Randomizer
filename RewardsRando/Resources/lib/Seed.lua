-- Credits: EnAppelsin (https://github.com/EnAppelsin/SHARCarRandomiser/blob/2d3a5a2d677836a28cd8e79a520cacbb4e559076/Randomiser/Resources/lib/Seed.lua)
Seed = {}
Seed.Spoiler = {}

Seed._bs = { [0] =
	'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
	'Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f',
	'g','h','%','j','k','&','m','n','o','p','q','r','s','t','u','v',
	'w','x','y','z','0','$','2','3','4','5','6','7','8','9','+','/',
}

-- Inverse lookup for base64
Seed._bsi = {}
for i=0,#Seed._bs do
	Seed._bsi[string.byte(Seed._bs[i])] = i
end

function Seed.Base64(s)
	return base64(s, Seed._bs):sub(1, -2)
end

function Seed.Base64dec(s)
	return base64dec(s .. "=", Seed._bs, Seed._bsi)
end

local function ChooseLevelAndMission(Possible, IsCar)
	local PossibleValues = {}
	for i=1,#Possible do
		for j=1,#Possible[i] do
			if Possible[i][j] and (j < 12 or IsCar) and ((i ~= 7 and j ~= 7) or IsCar) then
				PossibleValues[#PossibleValues + 1] = {i,j}
			end
		end
	end
	if #PossibleValues == 0 then
		return
	end
	local value = PossibleValues[math.random(#PossibleValues)]
	return value[1], value[2]
end


function Seed.Generate()
	local InvalidCount = 0
	::RestartGenerator::
	if InvalidCount > 1000 then
		Alert("Unfortunately, a working reward order couldn't be generated in over 1000 attempts with this seed and settings. The game will now exit.")
		os.exit()
	end
	--[[
		SR1			8
		SR2			9
		SR3			10
		BM			11
		NPC Car		12
		Gil Car 1	13
		Gil Car 2	14
	]]
	local PossibleMissions = {}
	for i=1,7 do
		PossibleMissions[i] = {}
		if Settings["CanGetMissionRewardsL" .. i] then
			for j=1,7 do
				PossibleMissions[i][j] = true
			end
		end
		if Settings["CanGetRaceRewardsL" .. i] then
			for j=8,10 do
				PossibleMissions[i][j] = true
			end
		end
		if Settings["CanGetBonusRewardsL" .. i] then
			PossibleMissions[i][11] = true
		end
		if Settings["CanGetNPCRewardsL" .. i] then
			PossibleMissions[i][12] = true
		end
		if Settings["CanGetGilRewardsL" .. i] then
			for j=13,14 do
				PossibleMissions[i][j] = true
			end
		end
	end
	PossibleMissions[7][7] = true
	local RemainingRewards = {}
	for i=1,#Rewards do
		RemainingRewards[i] = Rewards[i]
	end

	local RestrictionLocations = {}
	MissionRewards = {}
	for i=1,7 do
		MissionRewards[i] = {}
	end

	if Settings.RandomRestrictions then

		RestrictionNames = {}
		CustomRestrictions = {
		{false, false, false, false, false, false, false}, -- Level 1
		{false, false, false, false, false, false, false}, -- Level 2
		{false, false, false, false, false, false, false}, -- Level 3
		{false, false, false, false, false, false, false}, -- Level 4
		{false, false, false, false, false, false, false}, -- Level 5
		{false, false, false, false, false, false, false}, -- Level 6
		{false, false, false, false, false, false, false} -- Level 7
		}

		Restrictions = {
		{{}, {}, {}, {}, {}, {}, {}}, -- Level 1
		{{}, {}, {}, {}, {}, {}, {}}, -- Level 2
		{{}, {}, {}, {}, {}, {}, {}}, -- Level 3
		{{}, {}, {}, {}, {}, {}, {}}, -- Level 4
		{{}, {}, {}, {}, {}, {}, {}}, -- Level 5
		{{}, {}, {}, {}, {}, {}, {}}, -- Level 6
		{{}, {}, {}, {}, {}, {}, {}} -- Level 7
		}


		while #RestrictionNames < 13 do
			restriction = Rewards[math.random(#Rewards)]

			if #RestrictionNames <= 2 then
				if not Cars[restriction] then
					if restriction:sub(1,1) == "h" then
						if restriction == "h_scuzzy" or restriction == "h_evil" or restriction == "h_donut" then
							i = 7
						else
							i = 1
						end
					elseif restriction:sub(1,1) == "b" then
						if restriction == "b_tall" or restriction == "b_football" or restriction == "b_ninja" then
							i = 2
						else
							i = 6
						end
					elseif restriction:sub(1,1) == "l" then
						i = 3
					elseif restriction:sub(1,1) == "m" then
						i = 4
					elseif restriction:sub(1,1) == "a" then
						i = 5
					else
						Alert("You have a custom costume mod enabled. Unfortunately Random Forced Purchaseables does not support custom costumes. Please turn off any custom costume mods and try again")
						os.exit()
					end
				else
					i = 7
				end

				if i == 7 then
					j = 7

					if not CustomRestrictions[i][j] then
						CustomRestrictions[i][j] = {}
					end
					name = RewardNames[restriction]
					CustomRestrictions[i][j][#CustomRestrictions[i][j] + 1] = {restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
					Restrictions[i][j][#Restrictions[i][j] + 1] = restriction
					RestrictionNames[#RestrictionNames + 1] = restriction
				end

			else
				duplicate = false
				for i=1,#RestrictionNames do
					if RestrictionNames[i] == restriction then
						duplicate = true
					end
				end

				if not duplicate then

					if not Cars[restriction] then
						if restriction:sub(1,1) == "h" then
							if restriction == "h_scuzzy" or restriction == "h_evil" or restriction == "h_donut" then
								i = 7
							else
								i = 1
							end
						elseif restriction:sub(1,1) == "b" then
							if restriction == "b_tall" or restriction == "b_football" or restriction == "b_ninja" then
								i = 2
							else
								i = 6
							end
						elseif restriction:sub(1,1) == "l" then
							i = 3
						elseif restriction:sub(1,1) == "m" then
							i = 4
						elseif restriction:sub(1,1) == "a" then
							i = 5
						else
							Alert("You have a custom costume mod enabled. Unfortunately Random Forced Purchaseables does not support custom costumes. Please turn off any custom costume mods and try again")
							os.exit()
						end
					else
						i = math.random(7)
					end

					if i == 7 then
						j = math.random(6)
					else
						j = math.random(7)
					end

					if not CustomRestrictions[i][j] then
						CustomRestrictions[i][j] = {}
					end
					name = RewardNames[restriction]
					CustomRestrictions[i][j][#CustomRestrictions[i][j] + 1] = {restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
					Restrictions[i][j][#Restrictions[i][j] + 1] = restriction
					RestrictionNames[#RestrictionNames + 1] = restriction
				end
			end
		end
	end

	local RestrictionItems = {}
	for i=1,#Restrictions do
		for j=1,#Restrictions[i] do
			local MissionRestrictions = Restrictions[i][j]
			for k=1,#MissionRestrictions do
				local level, mission = ChooseLevelAndMission(PossibleMissions, Cars[MissionRestrictions[k]])
				if not level then
					InvalidCount = InvalidCount + 1
					goto RestartGenerator
				end
				MissionRewards[level][mission] = MissionRestrictions[k]
				RestrictionLocations[#RestrictionLocations + 1] = {MissionRestrictions[k],"L" .. level .. "M" .. mission}
				PossibleMissions[level][mission] = false
				RestrictionItems[#RestrictionItems + 1] = MissionRestrictions[k]
				for l=1,#RemainingRewards do
					if RemainingRewards[l] == MissionRestrictions[k] then
						table.remove(RemainingRewards, l)
						break
					end
				end
			end
		end
	end

	if not Seed.CheckSoftlock() then
		InvalidCount = InvalidCount + 1
		goto RestartGenerator
	end

	for k=14,1,-1 do
		for j=#PossibleMissions,1,-1 do
			if PossibleMissions[j][k] then
				local RewardIdx = math.random(#RemainingRewards)
				if k >= 12 or (j == 7 and k == 7) then
					while not Cars[RemainingRewards[RewardIdx]] do
						RewardIdx = math.random(#RemainingRewards)
					end
				end
				MissionRewards[j][k] = RemainingRewards[RewardIdx]
				table.remove(RemainingRewards, RewardIdx)
				if #RemainingRewards == 0 then
					print("Re-filling the rewards table - may cause duplicte rewards")
					for i=1,#Rewards do
						IsRestriction = false
						-- Checks if current reward is a forced purchaseable
						for j=1,#RestrictionItems do
							if RestrictionItems[j] == Rewards[i] then
								IsRestriction = true
							end
						end
						-- Readd to table only if it isn't a forced purchaseable (prevents doubling up of these items)
						if not(IsRestriction) then
							RemainingRewards[i] = Rewards[i]
						end
					end
				end
				PossibleMissions[j][k] = false
			end
		end
	end

	Seed.AddSpoiler("RESTRICTIONS:")
	for i=1,#RestrictionLocations do
		Seed.AddSpoiler(RestrictionLocations[i][1] .. "|" .. RestrictionLocations[i][2])
	end
	Seed.AddSpoiler("")

	Seed.AddSpoiler("REWARDS:")
	for i=1,7 do
		for j=1,14 do
			if MissionRewards[i][j] then
				Seed.AddSpoiler("L" .. i .. "M" .. j .. "|" .. MissionRewards[i][j] .. "|" .. RewardNames[MissionRewards[i][j]])
			end
		end
	end
	Seed.AddSpoiler("")

	return InvalidCount
end

function Seed.CheckSoftlock()
	if not MissionRewards then
		print("Seed.Generate() hasn't yet been called.")
		return
	end

	local UnlockedRewards = {}
	for i=1,7 do
		for j=8,14 do
			if MissionRewards[i][j] then UnlockedRewards[MissionRewards[i][j]] = true end
		end
	end
	if MissionRewards[7][7] then UnlockedRewards[MissionRewards[7][7]] = true end

	local Missions = {}
	for i=1,7 do
		Missions[i] = {}
		for j=1,7 do
			Missions[i][j] = false
		end
	end

	local loops = 0
	local completedMissions = 0
	while loops < 100 do
		for i=7,1,-1 do
			for l=1,7 do
				local j = MissionOrder[i][l]
				if not Missions[i][j] then
					if #Restrictions[i][j] > 0 then
						local haveReward = true
						for k=1,#Restrictions[i][j] do
							haveReward = haveReward and UnlockedRewards[Restrictions[i][j][k]]
						end
						if not haveReward then
							break
						end
					end
					if MissionRewards[i][j] then UnlockedRewards[MissionRewards[i][j]] = true end
					Missions[i][j] = true
					completedMissions = completedMissions + 1
					if completedMissions == 49 then return true end
				end
			end
		end
		loops = loops + 1
	end
	return false
end

function Seed.Init()
	if not Settings.StaticSeed or not Settings.Seed or Settings.Seed == "" then
		local number = math.random(math.maxinteger)
		Settings.Seed = Seed.Base64(string.pack("j", number))
		Seed.SeedRaw = number
		print("Generated a new seed: " .. Settings.Seed)
	else
		if Settings.Seed:len() > 11 then
			Alert("Your seed was longer than 11 characters, characters after this won't affect the seed or the randomness")
		end
		local raw = Seed.Base64dec(Settings.Seed)
		if raw:len() < 16 then
			raw = raw .. string.rep("\0", 16 - raw:len())
		end
		Seed.SeedRaw = string.unpack("j", raw)
	end
	print("Initialising RNG with seed: " .. Settings.Seed .. " (" .. Seed.SeedRaw .. ")")
	math.randomseed(Seed.SeedRaw)
end

function Seed.AddSpoiler(f)
	Seed.Spoiler[#Seed.Spoiler + 1] = tostring(f)
end

function Seed.PrintSpoiler()
	print("--- BEGIN SEED SPOILERS ---")
	local spoilers = table.concat(Seed.Spoiler, "\n")
	print(base64(spoilers))
	print("--- END SPOILERS ---")
end
