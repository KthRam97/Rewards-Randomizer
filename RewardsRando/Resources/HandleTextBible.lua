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

local RandoInfo = os.date("[%Y-%m-%d]") .. "\n" .. ModTitle .. " v" .. ModVersion .. "\nPrice Multiplier: " .. Settings.PriceMultiplier .. "\nReverse Mission Order: " .. tostring(Settings.ReverseMissionOrder) .. "\nSeed: " .. Settings.Seed
local RandoPauseInfo = "Seed: " .. Settings.Seed

local CardHintText = {}
local RestrictionNames = {}
local RestrictionLevels = {}
for Level=1,7 do
	for Mission=1,7 do
		for RestrictionIdx=1,#Restrictions[Level][Mission] do
			local Restriction = Restrictions[Level][Mission][RestrictionIdx]
			local RestrictionLevel = 0
			for i=1,7 do
				for j=1,14 do
					if MissionRewards[i][j] == Restriction then
						if i == 7 and j == 7 then
							--Idk?
						else
							RestrictionLevel = i
						end
						break
					end
				end
			end
			if RestrictionLevel > 0 then
				RestrictionNames[#RestrictionNames + 1] = RewardNames[Restriction]
				RestrictionLevels[#RestrictionLevels + 1] = RestrictionLevel
			end
		end
	end
end

CardsPerHint = math.floor(49 / #RestrictionNames)
for i=1,#RestrictionNames do
	local RestrictionIdx = math.random(#RestrictionNames)
	local Restriction = RestrictionNames[RestrictionIdx]
	local RestrictionLevel = RestrictionLevels[RestrictionIdx]
	table.remove(RestrictionNames, RestrictionIdx)
	table.remove(RestrictionLevels, RestrictionIdx)
	local HintText = "Congratulations! You have collected "..CardsPerHint.." cards, so here is a hint:\n\nYou can find \"" .. Restriction .. "\" in Level " .. RestrictionLevel .. "!"
	CardHintText[i] = HintText
end
CardHints = {}
LockedMissionPrompts = {}
local lang = GetGameLanguage()
for idx in BibleChunk:GetChunkIndexes(P3D.Identifiers.Frontend_Language) do
	local LanguageChunk = P3D.FrontendLanguageP3DChunk:new{Raw = BibleChunk:GetChunkAtIndex(idx)}
	
	if LanguageChunk.Language == lang then
		LanguageChunk:AddValue("RandoInfo", RandoInfo)
		LanguageChunk:AddValue("RandoPauseInfo", RandoPauseInfo)
		
		local InGameIdx = 19
		for i=1,#Rewards do
			InGameIdx = InGameIdx + 1
			LanguageChunk:AddValue("INGAME_MESSAGE_" .. InGameIdx, "New reward unlocked: " .. RewardNames[Rewards[i]])
		end
		
		for i=1,7 do
			InGameIdx = InGameIdx + 1
			LanguageChunk:AddValue("INGAME_MESSAGE_" .. InGameIdx, CardHintText[i])
			CardHints[#CardHints + 1] = {InGameIdx, CardHintText[i]}
		end
		
		local ObjectiveIdx = 299
		for i=1,7 do
			for j=1,7 do
				if CustomRestrictions[i][j] then
					InGameIdx = InGameIdx + 1
					ObjectiveIdx = ObjectiveIdx + 1
					local Restriction = CustomRestrictions[i][j]
					CustomRestrictionsIdx[Restriction] = {InGameIdx,ObjectiveIdx}
					LanguageChunk:AddValue("INGAME_MESSAGE_" .. InGameIdx, "You must purchase \"" .. RewardNames[Restriction] .. "\" to start this level.")
					LanguageChunk:AddValue("MISSION_OBJECTIVE_" .. ObjectiveIdx, "Purchase \"" .. RewardNames[Restriction] .. "\" to continue.")
				end
			end
		end
		
		for i=1,7 do
			LockedMissionPrompts[i] = {}
			local MissionInfo = {}
			local MissionTitle = {}
			for j=1,7 do
				MissionInfo[j] = LanguageChunk:GetValueFromName("MISSION_INFO_L"..i.."_M"..j)
				MissionTitle[j] = LanguageChunk:GetValueFromName("MISSION_TITLE_L"..i.."_M"..j)
			end
			
			for j=1,7 do
				if Settings.ReverseMissionOrder then
					LanguageChunk:SetValue("MISSION_INFO_L"..i.."_M"..j, MissionInfo[MissionOrder[i][j]])
					LanguageChunk:SetValue("MISSION_TITLE_L"..i.."_M"..j, MissionTitle[MissionOrder[i][j]])
				end
				--INGAME_MESSAGE_19=You must finish the mission "S-M-R-T" before you can do this mission.
				--MISSION_OBJECTIVE_276=Mission warp to "S-M-R-T".
				InGameIdx = InGameIdx + 1
				ObjectiveIdx = ObjectiveIdx + 1
				LockedMissionPrompts[i][j] = {InGameIdx,ObjectiveIdx}
				LanguageChunk:AddValue("INGAME_MESSAGE_" .. InGameIdx, "You must first finish the mission \"" .. MissionTitle[MissionOrder[i][j]] .. "\" before you can do this mission.")
				LanguageChunk:AddValue("MISSION_OBJECTIVE_" .. ObjectiveIdx, "Mission warp to \"" .. MissionTitle[MissionOrder[i][j]] .. "\".")
			end
		end
		
		BibleChunk:SetChunkAtIndex(idx, LanguageChunk:Output())
	end
end
Chunk:SetChunkAtIndex(BibleIdx, BibleChunk:Output())
Cache.SRR2 = Chunk:Output()
Output(Cache.SRR2)