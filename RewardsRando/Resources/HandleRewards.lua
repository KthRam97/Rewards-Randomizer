local MFK = MFKLexer.Lexer:New()

MFK:AddFunction("BindReward", {MissionRewards[7][7], "art\\cars\\" .. MissionRewards[7][7] .. ".p3d", "car", "defaultcar", 1})
local Prices = {
	{150, 125, 100},
	{200, 150, 250},
	{300, 250, 250},
	{400, 350, 300},
	{500, 425, 350},
	{600, 400, 500},
	{500, 1000, 750},
}
for i=1,7 do
	if Settings.CanGetNPCRewards then
		MFK:AddFunction("BindReward", {MissionRewards[i][12], "art\\cars\\" .. MissionRewards[i][12] .. ".p3d", "car", "forsale", i, math.floor(Settings.PriceMultiplier * (Settings.RandomBasePrice and math.random(100, 1000) or Prices[i][1])), "simpson"})
	else
		MFK:AddFunction("BindReward", {"huskA", "art\\cars\\huskA.p3d", "car", "forsale", i, 69420, "simpson"})
	end
	if Settings.CanGetGilRewards then
		MFK:AddFunction("BindReward", {MissionRewards[i][13], "art\\cars\\" .. MissionRewards[i][13] .. ".p3d", "car", "forsale", i, math.floor(Settings.PriceMultiplier * (Settings.RandomBasePrice and math.random(100, 1000) or Prices[i][2])), "gil"})
		MFK:AddFunction("BindReward", {MissionRewards[i][14], "art\\cars\\" .. MissionRewards[i][14] .. ".p3d", "car", "forsale", i, math.floor(Settings.PriceMultiplier * (Settings.RandomBasePrice and math.random(100, 1000) or Prices[i][3])), "gil"})
	else
		MFK:AddFunction("BindReward", {"huskA", "art\\cars\\huskA.p3d", "car", "forsale", i, 69420, "gil"})
	end
	
	MFK:AddFunction("BindReward", {DefaultCharacters[i], "art\\chars\\"..DefaultCharacters[i]:sub(1,6).."_m.p3d", "skin", "defaultskin", i})
	MFK:AddFunction("BindReward", {"beeman", "art\\chars\\beeman_m.p3d", "skin", "forsale", i, 69420, "interior"})
	
	MFK:AddFunction("SetTotalGags", {i, TotalGags[i]})
end

for k in pairs(Cars) do
	MFK:AddFunction("SetCarAttributes", {k, 0, 0, 0, 0, 0})
end

MFK:Output()