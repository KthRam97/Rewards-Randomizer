print("Setting seed...")
local startTime = GetTime()

CustomRestrictions = {
	{false, false, false, false, false, false, false}, -- Level 1
	{false, false, false, false, false, false, false}, -- Level 2
	{false, false, false, false, false, false, false}, -- Level 3
	{false, false, false, false, false, false, false}, -- Level 4
	{false, false, false, false, false, false, false}, -- Level 5
	{false, false, false, false, false, false, false}, -- Level 6
	{false, false, false, false, {"h_scuzzy","You need to look Scuzzy. Purchase Homer's DIRTY HOMER at a Clothing Shop if you've unlocked it. Otherwise Scuzz it up in other missions.\nYou must show your Proof of Scuzzy to continue!"}, {"h_evil","You need to descend into hell! Purchase Homer's EVIL HOMER at a Clothing Shop if you've unlocked it. Otherwise head out and commit some sins in other missions.\nYou must show your Proof of Hell to continue!"}, {"h_donut","You need to make a deal with the devil. Purchase Homer's DONUT HOMER at a clothing Shop if you've unlocked it. Otherwise track down Devil Flanders in other missions.\nYou must show your Proof of Gluttony to continue!"}}, -- Level 7
}
CustomRestrictionsIdx = {}
Restrictions = {}
for Level=1,7 do
	Restrictions[Level] = {}
	for Mission=1,7 do
		local MissionRestricions = {}
		local MFKFile = ReadFile("/GameData/scripts/missions/level0"..Level.."/m"..Mission.."sdi.mfk")
		local MFK = MFKLexer.Lexer:Parse(MFKFile)
		for i=1,#MFK.Functions do
			local func = MFK.Functions[i]
			if func.Name:lower() == "addobjective" and (func.Arguments[1] == "buycar" or func.Arguments[1] == "buyskin") then
				MissionRestricions[#MissionRestricions + 1] = func.Arguments[2]
			end
		end
		if #MissionRestricions == 0 and CustomRestrictions[Level][Mission] then
			MissionRestricions[1] = CustomRestrictions[Level][Mission][1]
		else
			CustomRestrictions[Level][Mission] = false
		end
		Restrictions[Level][Mission] = MissionRestricions
	end
end

local InvalidCount = Seed.Generate()

local endTime = GetTime()
print("Seeding configured after " .. InvalidCount .. " attempts in " .. (endTime - startTime) * 1000 .. "ms.")