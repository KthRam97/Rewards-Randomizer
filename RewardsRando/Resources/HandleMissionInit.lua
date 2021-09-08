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

if MissionRewards[CurrLevel][CurrMission] and not CompletedMissions[CurrLevel][CurrMission] then
	local File = ReadFile(GamePath)
	local MFK = MFKLexer.Lexer:Parse(File)

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

	MFK:Output()
end