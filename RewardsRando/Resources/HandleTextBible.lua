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

local MissionOrderType = ({"Normal", "Reversed", "Random"})[Settings.MissionOrderType]
local HintType = ({"None", "Collect X", "Dispersed"})[Settings.HintType]

local SeedInfo = Settings.HashSeed and ("Hash: " .. sha1.hex(Settings.Seed):gsub("(.)...", "%1")) or ("Seed: " .. Settings.Seed)
local RandoInfo = os.date("[%Y-%m-%d]") .. "\n" .. ModTitle .. " v" .. ModVersion .. "\nMission Order: " .. MissionOrderType .. " | Hints: " .. HintType .. "\nPrice Multiplier: " .. Settings.PriceMultiplier .. "\n" .. SeedInfo
local RandoPauseInfo = SeedInfo

local CardHintText = {}
local RestrictionNames = {}
local RestrictionMissions = {}
local ImportantRewards = {}
for Level=1,7 do
	for Mission=1,7 do
		for RestrictionIdx=1,#Restrictions[Level][Mission] do
			local Restriction = Restrictions[Level][Mission][RestrictionIdx]
			local RestrictionMission
			for i=1,7 do
				for j=1,14 do
					if MissionRewards[i][j] == Restriction then
						RestrictionMission = {i, j}
						break
					end
				end
			end
			if RestrictionMission then
				RestrictionNames[#RestrictionNames + 1] = Restriction
				RestrictionMissions[#RestrictionMissions + 1] = RestrictionMission
				ImportantRewards[Restriction] = {Level, Mission}
			end
		end
	end
end
LockedMissionPrompts = {}
local lang = GetGameLanguage()
for idx in BibleChunk:GetChunkIndexes(P3D.Identifiers.Frontend_Language) do
	local LanguageChunk = P3D.FrontendLanguageP3DChunk:new{Raw = BibleChunk:GetChunkAtIndex(idx)}
	
	if LanguageChunk.Language == lang then
		LanguageChunk:AddValue("RandoInfo", RandoInfo)
		LanguageChunk:AddValue("RandoPauseInfo", RandoPauseInfo)
		local MissionInfo = {}
		local MissionTitle = {}
		for i=1,7 do
			MissionInfo[i] = {}
			MissionTitle[i] = {}
			for j=1,7 do
				MissionInfo[i][j] = LanguageChunk:GetValueFromName("MISSION_INFO_L"..i.."_M"..j)
				MissionTitle[i][j] = LanguageChunk:GetValueFromName("MISSION_TITLE_L"..i.."_M"..j)
			end
		end
		
		if Settings.HintType == 3 then
			LanguageChunk:SetValue("CARD_GET", "HINT CARD!")
			local Hints = {}
			local AvailableHints = {}
			for i=1,55 do
				if i % 8 ~= 0 then
					AvailableHints[#AvailableHints + 1] = string.format("%.2i", i - 1)
				end
			end
			
			for i=1,#RestrictionNames do
				local HintIdx = math.random(#AvailableHints)
				local Hint = AvailableHints[HintIdx]
				local RestrictionMission = RestrictionMissions[i]
				table.remove(AvailableHints, HintIdx)
				local Info = ImportantRewards[RestrictionNames[i]]
				if RestrictionMission[1] == 7 and RestrictionMissions[2] == 7 then
					LanguageChunk:SetValue("CARD_DESC_" .. Hint, "This would have been a lucky collector card hint for \"" .. RewardNames[RestrictionNames[i]] .. "\", but it's the default car...\n\nThis is required for:\n" .. MissionTitle[Info[1]][Info[2]] .. " (L" .. Info[1] .. "M" .. Info[2] .. ")")
					LanguageChunk:SetValue("CARD_EPISODE_" .. Hint, "Well that's unfortunate!")
				else
					LanguageChunk:SetValue("CARD_DESC_" .. Hint, "You got a lucky collector card, so here is a hint:\n\nYou can find \"" .. RewardNames[RestrictionNames[i]] .. "\" in Level " .. RestrictionMission[1] .. "!\n\nThis is required for:\n" .. MissionTitle[Info[1]][Info[2]] .. " (L" .. Info[1] .. "M" .. Info[2] .. ")")
					LanguageChunk:SetValue("CARD_EPISODE_" .. Hint, "Congratulations!")
				end
				LanguageChunk:SetValue("CARD_TITLE_" .. Hint, RewardNames[RestrictionNames[i]])
			end
			for i=1,#AvailableHints do
				LanguageChunk:SetValue("CARD_DESC_" .. AvailableHints[i], "Unlucky! Unfortunately, this card doesn't contain a hint.")
				LanguageChunk:SetValue("CARD_TITLE_" .. AvailableHints[i], "Unlucky :(")
				LanguageChunk:SetValue("CARD_EPISODE_" .. AvailableHints[i], "Better Luck Next Time")
			end
		end
		
		local InGameIdx = 19
		for i=1,#Rewards do
			InGameIdx = InGameIdx + 1
			if ImportantRewards[Rewards[i]] then
				local Info = ImportantRewards[Rewards[i]]
				LanguageChunk:AddValue("INGAME_MESSAGE_" .. InGameIdx, "New reward unlocked:\n" .. RewardNames[Rewards[i]] .. "\n\nThis is a required reward for:\n" .. MissionTitle[Info[1]][Info[2]] .. " (L" .. Info[1] .. "M" .. Info[2] .. ")")
			else
				LanguageChunk:AddValue("INGAME_MESSAGE_" .. InGameIdx, "New reward unlocked:\n" .. RewardNames[Rewards[i]])
			end
		end
		
		local BMIdx = 12
		for i=1,7 do
			local Reward = MissionRewards[i][11]
			if ImportantRewards[Reward] then
				local Info = ImportantRewards[Reward]
				LanguageChunk:SetValue("INGAME_MESSAGE_" .. BMIdx, "New reward unlocked:\n" .. RewardNames[Reward] .. "\n\nThis is a required reward for:\n" .. MissionTitle[Info[1]][Info[2]] .. " (L" .. Info[1] .. "M" .. Info[2] .. ")")
			else
				LanguageChunk:SetValue("INGAME_MESSAGE_" .. BMIdx, "New reward unlocked:\n" .. RewardNames[Reward])
			end
			BMIdx = BMIdx + 1
		end
		
		CardsPerHint = math.floor(49 / #RestrictionNames)
		for i=1,#RestrictionNames do
			local RestrictionIdx = math.random(#RestrictionNames)
			local Restriction = RestrictionNames[RestrictionIdx]
			local RestrictionMission = RestrictionMissions[RestrictionIdx]
			table.remove(RestrictionNames, RestrictionIdx)
			table.remove(RestrictionMissions, RestrictionIdx)
			local Info = ImportantRewards[Restriction]
			local HintText
			if RestrictionMission[1] == 7 and RestrictionMission[2] == 7 then
				HintText = "Well that's unfortunate... You have collected "..CardsPerHint.." cards, so this would have been a hint...\n\nYou can find \"" .. RewardNames[Restriction] .. "\" as the default car!\n\nThis is required for:\n" .. MissionTitle[Info[1]][Info[2]] .. " (L" .. Info[1] .. "M" .. Info[2] .. ")"
			else
				HintText = "Congratulations! You have collected "..CardsPerHint.." cards, so here is a hint:\n\nYou can find \"" .. RewardNames[Restriction] .. "\" in Level " .. RestrictionMission[1] .. "!\n\nThis is required for:\n" .. MissionTitle[Info[1]][Info[2]] .. " (L" .. Info[1] .. "M" .. Info[2] .. ")"
			end
			CardHintText[i] = HintText
		end
		CardHints = {}
		for i=1,#CardHintText do
			InGameIdx = InGameIdx + 1
			LanguageChunk:AddValue("INGAME_MESSAGE_" .. InGameIdx, CardHintText[i])
			CardHints[i] = {InGameIdx, CardHintText[i]}
		end
		
		local ObjectiveIdx = 299
		for i=1,7 do
			for j=1,7 do
				if CustomRestrictions[i][j] then
					InGameIdx = InGameIdx + 1
					ObjectiveIdx = ObjectiveIdx + 1
					local Restriction = CustomRestrictions[i][j]
					CustomRestrictionsIdx[Restriction[1]] = {InGameIdx,ObjectiveIdx}
					LanguageChunk:AddValue("INGAME_MESSAGE_" .. InGameIdx, Restriction[2])
					LanguageChunk:AddValue("MISSION_OBJECTIVE_" .. ObjectiveIdx, "Purchase \"" .. RewardNames[Restriction[1]] .. "\" to continue.")
				end
			end
		end
		
		for i=1,7 do
			LockedMissionPrompts[i] = {}
			for j=1,7 do
				if Settings.MissionOrderType > 1 then
					LanguageChunk:SetValue("MISSION_INFO_L"..i.."_M"..j, MissionInfo[i][MissionOrder[i][j]])
					LanguageChunk:SetValue("MISSION_TITLE_L"..i.."_M"..j, MissionTitle[i][MissionOrder[i][j]])
				end
				InGameIdx = InGameIdx + 1
				ObjectiveIdx = ObjectiveIdx + 1
				LockedMissionPrompts[i][j] = {InGameIdx,ObjectiveIdx}
				LanguageChunk:AddValue("INGAME_MESSAGE_" .. InGameIdx, "You must first finish the mission \"" .. MissionTitle[i][MissionOrder[i][j]] .. "\" before you can do this mission.")
				LanguageChunk:AddValue("MISSION_OBJECTIVE_" .. ObjectiveIdx, "Mission warp to \"" .. MissionTitle[i][MissionOrder[i][j]] .. "\".")
			end
		end
		
		BibleChunk:SetChunkAtIndex(idx, LanguageChunk:Output())
		break
	end
end
Chunk:SetChunkAtIndex(BibleIdx, BibleChunk:Output())
Cache.SRR2 = Chunk:Output()
Output(Cache.SRR2)