if SRR2 ~= nil then
	Output(SRR2)
	return
end

local Path = GetPath()
local GamePath = "/GameData/" .. Path

local Chunk = P3D.P3DChunk:new{Raw = ReadFile(GamePath)}
local BibleIdx = Chunk:GetChunkIndex(P3D.Identifiers.Frontend_Text_Bible)
if not BibleIdx then return end
local BibleChunk = P3D.FrontendTextBibleP3DChunk:new{Raw = Chunk:GetChunkAtIndex(BibleIdx)}
local Settings = GetSettings()
for idx in BibleChunk:GetChunkIndexes(P3D.Identifiers.Frontend_Language) do
	local LanguageChunk = P3D.FrontendLanguageP3DChunk:new{Raw = BibleChunk:GetChunkAtIndex(idx)}
	
	for k,v in pairs(ingame_messages) do
		LanguageChunk:AddValue("INGAME_MESSAGE_" .. v, "You just unlocked: " .. item_names[k])
	end
	
	BibleChunk:SetChunkAtIndex(idx, LanguageChunk:Output())
end
Chunk:SetChunkAtIndex(BibleIdx, BibleChunk:Output())
SRR2 = Chunk:Output()
Output(SRR2)