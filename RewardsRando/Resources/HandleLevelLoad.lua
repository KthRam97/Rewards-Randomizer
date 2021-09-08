local Path = GetPath()
local GamePath = GetGamePath(Path)

local File = ReadFile(GamePath)
local MFK = MFKLexer.Lexer:Parse(File)

for i=1,#MFK.Functions do
	local func = MFK.Functions[i]
	if func.Name:lower() == "loaddisposablecar" and func.Arguments[3] == "DEFAULT" then
		func.Arguments[1] = "art\\cars\\" .. MissionRewards[7][7] .. ".p3d"
		func.Arguments[2] = MissionRewards[7][7]
	end
end

MFK:AddFunction("LoadP3DFile", "art\\frontend\\dynaload\\images\\msnicons\\object\\tshirt.p3d")

MFK:Output()