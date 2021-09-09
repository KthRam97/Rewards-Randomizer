local Path = GetPath()
local GamePath = GetGamePath(Path)

CurrLevel = tonumber(Path:match("level0(%d)[/\\]"))
if Path:find("sr", 1, true) then
	CurrMission = tonumber(Path:match("sr(%d)")) + 7
elseif Path:find("bm", 1, true) then
	CurrMission = 11
else
	CurrMission = tonumber(Path:match("m(%d)"))
end

local File
local MFK

if not Settings.DisableIngamePopups then
	if MissionRewards[CurrLevel][CurrMission] and not CompletedMissions[CurrLevel][CurrMission] and not (CurrLevel == 7 and CurrMission == 7) then
		File = File or ReadFile(GamePath)
		MFK = MFK or MFKLexer.Lexer:Parse(File)

		MFK.Functions[#MFK.Functions] = nil

		local hasFinal = false
		for i=#MFK.Functions,1,-1 do
			local func = MFK.Functions[i]
			if func.Name:lower() == "addstage" then
				for i=1,#func.Arguments do
					if func.Arguments[i] == "final" then
						hasFinal = true
						func.Arguments[i] = 0
						break
					end
				end
				break
			end
		end	

		MFK:AddFunction("AddStage", {"locked", "car", "notification"})
		MFK:AddFunction("SetStageMessageIndex", 19 + RewardsIdx[MissionRewards[CurrLevel][CurrMission]])
		MFK:AddFunction("AddObjective", "timer")
		MFK:AddFunction("SetDurationTime", 0)
		MFK:AddFunction("CloseObjective")
		MFK:AddFunction("CloseStage")
		if hasFinal then
			MFK:AddFunction("AddStage", "final")
			MFK:AddFunction("AddObjective", "timer")
			MFK:AddFunction("SetDurationTime", 0)
			MFK:AddFunction("CloseObjective")
			MFK:AddFunction("CloseStage")
		end

		MFK:AddFunction("CloseMission")
	end

	if ShowCardHint then
		ShowCardHint = false
		CardHintsGiven = CardHintsGiven + 1
		
		if not Settings.DisableIngamePopups then
			File = File or ReadFile(GamePath)
			MFK = MFK or MFKLexer.Lexer:Parse(File)
			
			local firstStage
			for i=1,#MFK.Functions do
				local name = MFK.Functions[i].Name:lower()
				if name == "addstage" then
					firstStage = firstStage or i
					break
				end
			end
			
			local idx = firstStage
			
			MFK:InsertFunction(idx, "AddStage", {"locked", "car", "notification"})
			idx = idx + 1
			MFK:InsertFunction(idx, "SetStageMessageIndex", CardHints[CardHintsGiven][1])
			idx = idx + 1
			MFK:InsertFunction(idx, "AddObjective", "timer")
			idx = idx + 1
			MFK:InsertFunction(idx, "SetDurationTime", 0)
			idx = idx + 1
			MFK:InsertFunction(idx, "CloseObjective")
			idx = idx + 1
			MFK:InsertFunction(idx, "CloseStage")
			idx = idx + 1
		end
	end
end

if MFK then MFK:Output() end