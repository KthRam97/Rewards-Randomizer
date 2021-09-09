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
	local InvalidCount = 0
	::RepickLevel::
	local level = math.random(#Possible)
	local missions = {}
	for i=1,#Possible[level] do
		if Possible[level][i] and (i < 12 or IsCar) and ((level ~= 7 and i ~= 7) or IsCar) then
			missions[#missions + 1] = i
		end
	end
	if #missions == 0 then
		goto RepickLevel
	end
	local mission = missions[math.random(#missions)]
	return level, mission
end

function Seed.Generate()
	local InvalidCount = 0
	::RestartGenerator::
	Seed.Spoiler = {}
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
		for j=1,14 do
			PossibleMissions[i][j] = true
		end
	end
	--PossibleMissions[7][7] = false
	local RemainingRewards = {}
	for i=1,#Rewards do
		RemainingRewards[i] = Rewards[i]
	end
	
	MissionRewards = {}
	for i=1,7 do
		MissionRewards[i] = {}
	end
	
	--[[local RemainingRestrictions = {}
	for i=1,#Restrictions do
		for j=1,#Restrictions[i] do
			local MissionRestricions = Restrictions[i][j]
			for k=1,#MissionRestricions do
				local Restriction = {}
				Restriction.Name = MissionRestricions[k]
				Restriction.Level = i
				Restriction.Mission = j
				local AvailableMissions = {}
				for l=1,7 do
					AvailableMissions[l] = {}
					for m=1,14 do
						AvailableMissions[l][m] = true
					end
				end
				AvailableMissions[7][7] = false
				for l=j,7 do
					AvailableMissions[i][l] = false
				end
				Restriction.AvailableMissions = AvailableMissions
				RemainingRestrictions[#RemainingRestrictions + 1] = Restriction
			end
		end
	end
	
	for i=1,#RemainingRestrictions do
		local Restriction = RemainingRestrictions[i]
		for j=1,#PossibleMissions do
			for k=1,#PossibleMissions[j] do
				if not PossibleMissions[j][k] then
					Restriction.AvailableMissions[j][k] = false
				end
			end
		end
		local level, mission = ChooseLevelAndMission(Restriction.AvailableMissions, Cars[Restriction.Name])
		MissionRewards[level][mission] = Restriction.Name
		for j=1,#RemainingRewards do
			if RemainingRewards[j] == Restriction.Name then
				table.remove(RemainingRewards, j)
			end
		end
		PossibleMissions[level][mission] = false
		for j=1,#RemainingRestrictions do
			if i ~= j then
				local Restriction2 = RemainingRestrictions[j]
				if Restriction2.Level >= level then
					for k=mission,7 do
						Restriction2.AvailableMissions[level][k] = false
					end
				end
			end
		end
	end]]
	
	if false then
		--[[
		Awful order test:
		L1M5 - Mr Plow
		L2M7 - School Bus
		L3M4 - Lisa Cool
		L3M7 - Inmate Marge
		L4M3 - Police Marge
		L4M6 - Homer Dirty
		L4M7 - Car Built For Homer
		L5M3 - Apu American
		L5M6 - Globex
		L6M6 - Zombie Car
		L7M4 - Dirty Homer
		L7M5 - Evil Homer
		L7M6 - Plow King
		]]
		
		PossibleMissions[1][5] = false
		PossibleMissions[2][7] = false
		PossibleMissions[3][4] = false
		PossibleMissions[3][7] = false
		PossibleMissions[4][3] = false
		PossibleMissions[4][6] = false
		PossibleMissions[4][7] = false
		PossibleMissions[5][3] = false
		PossibleMissions[5][6] = false
		PossibleMissions[6][6] = false
		PossibleMissions[7][4] = false
		PossibleMissions[7][5] = false
		PossibleMissions[7][6] = false
		MissionRewards[1][5] = "mrplo_v"
		MissionRewards[2][7] = "otto_v"
		MissionRewards[3][4] = "l_cool"
		MissionRewards[3][7] = "m_prison"
		MissionRewards[4][3] = "m_police"
		MissionRewards[4][6] = "h_scuzzy"
		MissionRewards[4][7] = "carhom_v"
		MissionRewards[5][3] = "a_american"
		MissionRewards[5][6] = "scorp_v"
		MissionRewards[6][6] = "zombi_v"
		MissionRewards[7][4] = "h_scuzzy"
		MissionRewards[7][5] = "h_evil"
		MissionRewards[7][6] = "plowk_v"
	end
	
	Seed.AddSpoiler("RESTRICTIONS:")
	for i=1,#Restrictions do
		for j=1,#Restrictions[i] do
			local MissionRestrictions = Restrictions[i][j]
			for k=1,#MissionRestrictions do
				local level, mission = ChooseLevelAndMission(PossibleMissions, Cars[MissionRestrictions[k]])
				MissionRewards[level][mission] = MissionRestrictions[k]
				Seed.AddSpoiler(MissionRestrictions[k] .. "|L" .. level .. "M" .. mission)
				PossibleMissions[level][mission] = false
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
						RemainingRewards[i] = Rewards[i]
					end
				end
				PossibleMissions[j][k] = false
			end
		end
	end
	
	Seed.AddSpoiler("")
	Seed.AddSpoiler("REWARDS:")
	for i=1,#MissionRewards do
		for j=1,#MissionRewards[i] do
			if i ~= 7 or j ~= 7 then
				assert(MissionRewards[i][j], "Reward not generated for L" .. i .. "M" .. j)
				Seed.AddSpoiler("L" .. i .. "M" .. j .. "|" .. MissionRewards[i][j])
			end
		end
	end
	
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
	
	local Missions = {}
	for i=1,7 do
		Missions[i] = {}
		for j=1,7 do
			Missions[i][j] = false
		end
	end
	
	local loops = 0
	local completedMissions = 0
	if Settings.ReverseMissionOrder then
		local LevelMissions = {
			{7, 6, 5, 4, 3, 2, 1},
			{7, 6, 5, 4, 3, 2, 1},
			{7, 6, 5, 4, 3, 2, 1},
			{7, 6, 5, 4, 3, 2, 1},
			{7, 6, 5, 4, 3, 2, 1},
			{7, 6, 5, 4, 3, 2, 1},
			{4, 3, 2, 1, 5, 6, 7},
		}
		while loops < 100 do
			for i=7,1,-1 do
				for l=1,7 do
					j = LevelMissions[i][l]
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
	else
		while loops < 100 do
			for i=1,7 do
				for j=1,7 do
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
	end
	return false
end

function Seed.Init()
	if not Settings.Seeded or not Settings.Seed or Settings.Seed == "" then
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

function Seed.AddSpoiler(f, ...)
	Seed.Spoiler[#Seed.Spoiler + 1] = string.format(f, ...)
end

function Seed.PrintSpoiler()
	print("--- BEGIN SEED SPOILERS ---")
	local spoilers = table.concat(Seed.Spoiler, "\n")
	print(Settings.Debug and spoilers or base64(spoilers))
	print("--- END SPOILERS ---")
	if Settings.Debug then Pause() end
end