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
	elseif Settings.MissionOrderType > 1 and name == "addmission" then
		local Mission = tonumber(func.Arguments[1]:match("m(%d)"))
		if Mission and Mission > 0 and Mission < 8 then
			func.Arguments[1] = "m" .. MissionOrder[Level][Mission]
		end
	end
end

MFK:AddFunction("LoadP3DFile", "art\\frontend\\dynaload\\images\\msnicons\\object\\tshirt.p3d")

MFK:Output()