local Path = GetPath()
local GamePath = GetGamePath(Path)
local Level = tonumber(Path:match("level0(%d)"))

local File = ReadFile(GamePath)
local MFK = MFKLexer.Lexer:Parse(File)

for i=1,#MFK.Functions do
	local func = MFK.Functions[i]
	if func.Name:lower() == "initlevelplayervehicle" and func.Arguments[3] == "DEFAULT" then
		func.Arguments[1] = MissionRewards[7][7]
	end
end

for i=1,#CarShops[Level] do
	local Shop = CarShops[Level][i]
	MFK:AddFunction("AddPurchaseCarReward", {"simpson", Shop[1], "npd", Shop[2], 1.3, Shop[3]})
	--MFK:AddFunction("AddPurchaseCarNPCWaypoint", {Shop[1], Shop[4]})
end

MFK:Output()