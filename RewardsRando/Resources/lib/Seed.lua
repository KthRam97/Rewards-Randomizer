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
		error("Unfortunately, a working reward order couldn't be generated in over 1000 attempts with this seed and settings. The game will now exit.")
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
		if Settings.CanGetMissionRewards ~= false then
			for j=1,7 do
				PossibleMissions[i][j] = true
			end
		end
		if Settings.CanGetRaceRewards then
			for j=8,10 do
				PossibleMissions[i][j] = true
			end
		end
		if Settings.CanGetBonusRewards then
			PossibleMissions[i][11] = true
		end
		if Settings.CanGetNPCRewards then
			PossibleMissions[i][12] = true
		end
		if Settings.CanGetGilRewards then
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
	
	MissionRewards = {}
	for i=1,7 do
		MissionRewards[i] = {}
	end
	
	Seed.AddSpoiler("RESTRICTIONS:")
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
	Seed.AddSpoiler("")
	
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
	
	Seed.AddSpoiler("REWARDS:")
	for i=1,#MissionRewards do
		for j=1,#MissionRewards[i] do
			if i ~= 7 or j ~= 7 then
				assert(MissionRewards[i][j], "Reward not generated for L" .. i .. "M" .. j)
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
	if not Settings.FixedSeed or not Settings.Seed or Settings.Seed == "" then
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