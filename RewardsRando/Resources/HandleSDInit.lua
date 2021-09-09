local Path = GetPath()
local GamePath = GetGamePath(Path)

local ThisLevel, ThisMission = Path:match("level0(%d)[/\\]m(%d)")
ThisLevel = tonumber(ThisLevel)
ThisMission = tonumber(ThisMission)

if ThisLevel == 1 and ThisMission == 0 then
	CompletedMissions = {}
	CardCount = 0
	CardHintsGiven = 0
	for i=1,7 do
		CompletedMissions[i] = {}
	end
end

local File
local MFK
local AddCoins

if CompletedLevel and CompletedMission then
	print("L" .. CompletedLevel .. "M" .. CompletedMission, "Completed", CompletedMissions[CompletedLevel][CompletedMission] and "Not first time" or "First time")
	if MissionRewards[CurrLevel][CurrMission] and not CompletedMissions[CompletedLevel][CompletedMission] and not (CompletedLevel == 7 and CompletedMission == 7) then
		local Reward = MissionRewards[CompletedLevel][CompletedMission]
		File = File or ReadFile(GamePath)
		MFK = MFK or MFKLexer.Lexer:Parse(File)
		if Costumes[Reward] then
			print("UNLOCK|COSTUME|"..CompletedLevel.."|"..CompletedMission.."|"..RewardNames[Reward])
			MFK:InsertFunction(1, "BindReward", {Reward, "art\\chars\\"..Reward:sub(1,6).."_m.p3d", "skin", "forsale", CompletedLevel, 0, "interior"})
			if CompletedLevel ~= Costumes[Reward] then
				MFK:InsertFunction(1, "BindReward", {Reward, "art\\chars\\"..Reward:sub(1,6).."_m.p3d", "skin", "forsale", Costumes[Reward], 0, "interior"})
			end
		elseif Cars[Reward] then
			print("UNLOCK|CAR|"..CompletedLevel.."|"..CompletedMission.."|"..RewardNames[Reward])
			MFK:InsertFunction(1, "BindReward", {Reward, "art\\cars\\"..Reward..".p3d", "car", "forsale", CompletedLevel, 0, "simpson"})
		elseif type(Reward) == "number" then
			print("UNLOCK|COINS|"..CompletedLevel.."|"..CompletedMission.."|"..Reward)
			AddCoins = Reward
		else
			error("Unknown reward for L"..CompletedLevel.."M"..CompletedMission..": "..Reward)
		end
	end
	CompletedMissions[CompletedLevel][CompletedMission] = true
	CompletedLevel = nil
	CompletedMission = nil
end

local missionLocked = false
if ThisMission > 0 and ThisMission < 8 and ThisMission ~= MissionOrder[ThisLevel][1] then
	local requiredMission
	for i=1,7 do
		if MissionOrder[ThisLevel][i] == ThisMission then
			break
		end
		requiredMission = MissionOrder[ThisLevel][i]
	end
	if not CompletedMissions[ThisLevel][requiredMission] then
		missionLocked = true
		File = File or ReadFile(GamePath)
		MFK = MFK or MFKLexer.Lexer:Parse(File)

		local idx = nil
		for i=1,#MFK.Functions do
			local name = MFK.Functions[i].Name:lower()
			if name == "addstage" then
				idx = i
				break
			end
		end

		for i=#MFK.Functions,idx,-1 do
			MFK.Functions[i] = nil
		end

		MFK:AddFunction("AddStage")
		MFK:AddFunction("RESET_TO_HERE")
		MFK:AddFunction("AddObjective", "timer")
		MFK:AddFunction("SetDurationTime", 5)
		MFK:AddFunction("CloseObjective")
		MFK:AddFunction("CloseStage")

		MFK:AddFunction("AddStage", {"locked", "skin", "beeman"})
		MFK:AddFunction("SetStageMessageIndex", LockedMissionPrompts[ThisLevel][Settings.ReverseMissionOrder and 8 - requiredMission or requiredMission][1])
		MFK:AddFunction("AddObjective", "timer")
		MFK:AddFunction("SetDurationTime", 0)
		MFK:AddFunction("CloseObjective")
		MFK:AddFunction("CloseStage")

		MFK:AddFunction("AddStage")
		MFK:AddFunction("SetStageMessageIndex", LockedMissionPrompts[ThisLevel][Settings.ReverseMissionOrder and 8 - requiredMission or requiredMission][2])
		MFK:AddFunction("SetHUDIcon", "tshirt" )
		MFK:AddFunction("AddObjective", {"buyskin", "beeman"})
		MFK:AddFunction("CloseObjective")
		MFK:AddFunction("CloseStage")
		MFK:AddFunction("CloseMission")
	end
end

if not missionLocked and CustomRestrictions[ThisLevel][ThisMission] then
	local Restriction = CustomRestrictions[ThisLevel][ThisMission]
	File = File or ReadFile(GamePath)
	MFK = MFK or MFKLexer.Lexer:Parse(File)

	local firstStage
	local lastStage
	local resetStage
	for i=1,#MFK.Functions do
		local name = MFK.Functions[i].Name:lower()
		if name == "addstage" then
			firstStage = firstStage or i
			lastStage = i
		elseif name == "reset_to_here" then
			table.remove(MFK.Functions, i)
			resetStage = lastStage
			break
		end
	end
	
	local idx = resetStage or firstStage
	
	MFK:InsertFunction(idx, "AddStage")
	idx = idx + 1
	if resetStage then
		MFK:InsertFunction(idx, "RESET_TO_HERE")
		idx = idx + 1
	end
	MFK:InsertFunction(idx, "AddObjective", "timer")
	idx = idx + 1
	MFK:InsertFunction(idx, "SetDurationTime", 5)
	idx = idx + 1
	MFK:InsertFunction(idx, "CloseObjective")
	idx = idx + 1
	MFK:InsertFunction(idx, "CloseStage")
	idx = idx + 1

	MFK:InsertFunction(idx, "AddStage", {"locked", Costumes[Restriction] and "skin" or "car", Restriction})
	idx = idx + 1
	MFK:InsertFunction(idx, "SetStageMessageIndex", CustomRestrictionsIdx[Restriction][1])
	idx = idx + 1
	MFK:InsertFunction(idx, "AddObjective", "timer")
	idx = idx + 1
	MFK:InsertFunction(idx, "SetDurationTime", 0)
	idx = idx + 1
	MFK:InsertFunction(idx, "CloseObjective")
	idx = idx + 1
	MFK:InsertFunction(idx, "CloseStage")
	idx = idx + 1

	MFK:InsertFunction(idx, "AddStage")
	idx = idx + 1
	MFK:InsertFunction(idx, "SetStageMessageIndex", CustomRestrictionsIdx[Restriction][2])
	idx = idx + 1
	MFK:InsertFunction(idx, "SetHUDIcon", "tshirt" )
	idx = idx + 1
	MFK:InsertFunction(idx, "AddObjective", {"buyskin", Restriction})
	idx = idx + 1
	MFK:InsertFunction(idx, "CloseObjective")
	idx = idx + 1
	MFK:InsertFunction(idx, "CloseStage")
	idx = idx + 1
end

if CardCount > 0 and CardCount >= CardsPerHint then
	if CardHints[CardHintsGiven + 1] then
		ShowCardHint = true	
		CardCount = CardCount - CardsPerHint
		print("HINT|" .. CardHints[CardHintsGiven + 1][2]:gsub("\n", " ")
	end
end

if AddCoins then
	File = File or ReadFile(GamePath)
	MFK = MFK or MFKLexer.Lexer:Parse(File)
	
	for i=1,#MFK.Functions do
		if MFK.Functions[i].Name:lower() == "reset_to_here" then
			MFK:InsertFunction(i + 1, "SetStagePayout", AddCoins)
			AddCoins = nil
			break
		end
	end
	if AddCoins then
		for i=1,#MFK.Functions do
			if MFK.Functions[i].Name:lower() == "addstage" then
				MFK:InsertFunction(i + 1, "SetStagePayout", AddCoins)
				AddCoins = nil
				break
			end
		end
	end
end

if MFK then MFK:Output() end