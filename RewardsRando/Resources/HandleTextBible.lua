if Cache.SRR2 ~= nil then
	Output(Cache.SRR2)
	return
end

local Path = GetPath()
local GamePath = "/GameData/" .. Path

local Chunk = P3D.P3DChunk:new{Raw = ReadFile(GamePath)}
local BibleIdx = Chunk:GetChunkIndex(P3D.Identifiers.Frontend_Text_Bible)
if not BibleIdx then return end
local BibleChunk = P3D.FrontendTextBibleP3DChunk:new{Raw = Chunk:GetChunkAtIndex(BibleIdx)}

local RandoInfo = os.date("[%Y-%m-%d]") .. "\n" .. ModTitle .. " v" .. ModVersion .. "\nPrice Multiplier: " .. Settings.PriceMultiplier--[[ .. "\nBanned Cars: " .. ((Settings.BanCars and Settings.BannedCars ~= "") and Settings.BannedCars or "NONE")]] .. "\nSeed: " .. Settings.Seed
local RandoPauseInfo = "Seed: " .. Settings.Seed

for idx in BibleChunk:GetChunkIndexes(P3D.Identifiers.Frontend_Language) do
	local LanguageChunk = P3D.FrontendLanguageP3DChunk:new{Raw = BibleChunk:GetChunkAtIndex(idx)}
	
	LanguageChunk:AddValue("RandoInfo", RandoInfo)
	LanguageChunk:AddValue("RandoPauseInfo", RandoPauseInfo)
	
	local InGameIdx = 19
	for i=1,#Rewards do
		InGameIdx = InGameIdx + 1
		LanguageChunk:AddValue("INGAME_MESSAGE_" .. InGameIdx, "New reward unlocked: " .. RewardNames[Rewards[i]])
	end
	local ObjectiveIdx = 299
	for i=1,7 do
		for j=1,7 do
			if CustomRestrictions[i][j] then
				InGameIdx = InGameIdx + 1
				ObjectiveIdx = ObjectiveIdx + 1
				local Restriciton = CustomRestrictions[i][j]
				CustomRestrictionsIdx[Restriciton] = {InGameIdx,ObjectiveIdx}
				LanguageChunk:AddValue("INGAME_MESSAGE_" .. InGameIdx, "You must purchase \"" .. RewardNames[Rewards[i]] .. "\" to start this level.")
				LanguageChunk:AddValue("MISSION_OBJECTIVE_" .. ObjectiveIdx, "Purchase \"" .. RewardNames[Restriciton] .. "\" to continue.")
			end
		end
	end
	
	BibleChunk:SetChunkAtIndex(idx, LanguageChunk:Output())
end
Chunk:SetChunkAtIndex(BibleIdx, BibleChunk:Output())
Cache.SRR2 = Chunk:Output()
Output(Cache.SRR2)