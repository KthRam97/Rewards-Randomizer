local Path = GetPath()
local GamePath = GetGamePath(Path)
local Level = tonumber(Path:match("level0(%d)"))

local File = ReadFile(GamePath)
local MFK = MFKLexer.Lexer:Parse(File)

for i=1,#MFK.Functions do
	local func = MFK.Functions[i]
	local name = func.Name:lower()
	if name == "loaddisposablecar" and func.Arguments[3] == "DEFAULT" then
		func.Arguments[1] = "art\\cars\\" .. MissionRewards[7][7] .. ".p3d"
		func.Arguments[2] = MissionRewards[7][7]
	elseif Settings.ReverseMissionOrder and name == "addmission" then
		if Level ~= 7 then
			if func.Arguments[1] == "m1" then
				func.Arguments[1] = "m7"
			elseif func.Arguments[1] == "m2" then
				func.Arguments[1] = "m6"
			elseif func.Arguments[1] == "m3" then
				func.Arguments[1] = "m5"
			elseif func.Arguments[1] == "m4" then
				func.Arguments[1] = "m4"
			elseif func.Arguments[1] == "m5" then
				func.Arguments[1] = "m3"
			elseif func.Arguments[1] == "m6" then
				func.Arguments[1] = "m2"
			elseif func.Arguments[1] == "m7" then
				func.Arguments[1] = "m1"
			end
		else
			if func.Arguments[1] == "m1" then
				func.Arguments[1] = "m4"
			elseif func.Arguments[1] == "m2" then
				func.Arguments[1] = "m3"
			elseif func.Arguments[1] == "m3" then
				func.Arguments[1] = "m2"
			elseif func.Arguments[1] == "m4" then
				func.Arguments[1] = "m1"
			end
		end
	end
end

MFK:AddFunction("LoadP3DFile", "art\\frontend\\dynaload\\images\\msnicons\\object\\tshirt.p3d")

MFK:Output()