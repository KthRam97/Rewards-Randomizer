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
	if Settings["CanGetNPCRewardsL"..i] then
		MFK:AddFunction("BindReward", {MissionRewards[i][12], "art\\cars\\" .. MissionRewards[i][12] .. ".p3d", "car", "forsale", i, math.floor(Settings.PriceMultiplier * (Settings.RandomBasePrice and math.random(100, 1000) or Prices[i][1])), "simpson"})
	else
		MFK:AddFunction("BindReward", {"huskA", "art\\cars\\huskA.p3d", "car", "forsale", i, 69420, "simpson"})
	end
	if Settings["CanGetGilRewardsL"..i] then
		MFK:AddFunction("BindReward", {MissionRewards[i][13], "art\\cars\\" .. MissionRewards[i][13] .. ".p3d", "car", "forsale", i, math.floor(Settings.PriceMultiplier * (Settings.RandomBasePrice and math.random(100, 1000) or Prices[i][2])), "gil"})
		MFK:AddFunction("BindReward", {MissionRewards[i][14], "art\\cars\\" .. MissionRewards[i][14] .. ".p3d", "car", "forsale", i, math.floor(Settings.PriceMultiplier * (Settings.RandomBasePrice and math.random(100, 1000) or Prices[i][3])), "gil"})
	else
		MFK:AddFunction("BindReward", {"huskA", "art\\cars\\huskA.p3d", "car", "forsale", i, 69420, "gil"})
	end
	
	MFK:AddFunction("BindReward", {DefaultCharacters[i], "art\\chars\\"..DefaultCharacters[i]:sub(1,6).."_m.p3d", "skin", "defaultskin", i})
	MFK:AddFunction("BindReward", {"beeman", "art\\chars\\beeman_m.p3d", "skin", "forsale", i, 69420, "interior"})
	
	MFK:AddFunction("SetTotalGags", {i, TotalGags[i]})
end

local function SetCarAttributes(CarName)
	local CONFile = ReadFile("/GameData/scripts/cars/" .. CarName .. ".con")
	local CON = MFKLexer.Lexer:Parse(CONFile)
	local Speed, GasScale, TireGrip, Mass, HitPoints, NormalSteering
	for i=1,#CON.Functions do
		local func = CON.Functions[i]
		local name = func.Name:lower()
		if name == "settopspeedkmh" then
			Speed = tonumber(func.Arguments[1])
		elseif name == "setgasscale" then
			GasScale = tonumber(func.Arguments[1])
		elseif name == "settiregrip" then
			TireGrip = tonumber(func.Arguments[1])
		elseif name == "setmass" then
			Mass = tonumber(func.Arguments[1])
		elseif name == "sethitpoints" then
			HitPoints = tonumber(func.Arguments[1])
		elseif name == "setnormalsteering" then
			NormalSteering = tonumber(func.Arguments[1])
		end
	end
	local SpeedAttribute
	if Speed == nil then
		SpeedAttribute = 0
	else
		SpeedAttribute = 5 * ((Speed - 120) / 50)
		SpeedAttribute = Clamp(SpeedAttribute, 0.1, 5)
	end
	
	local AccelerationAttribute
	if GasScale == nil or TireGrip == nil then
		AccelerationAttribute = 0
	else
		AccelerationAttribute = 5 * ((GasScale * TireGrip) / 32)
		AccelerationAttribute = Clamp(AccelerationAttribute, 0.1, 5)
	end
	
	local ToughnessAttribute
	if HitPoints == nil or Mass == nil then
		ToughnessAttribute = 0
	else
		ToughnessAttribute = 5 * (((Mass / 100) + HitPoints) / 60)
		ToughnessAttribute = Clamp(ToughnessAttribute, 0.1, 5)
	end
	
	local HandlingAttribute
	if NormalSteering == nil then
		HandlingAttribute = 0
	else
		HandlingAttribute = 5 * ((NormalSteering - 50) / 50)
		HandlingAttribute = Clamp(HandlingAttribute, 0.1, 5)
	end
	MFK:AddFunction("SetCarAttributes", {CarName, SpeedAttribute, AccelerationAttribute, ToughnessAttribute, HandlingAttribute})
end

for k in pairs(Cars) do
	SetCarAttributes(k)
end
SetCarAttributes("huskA")

MFK:Output()