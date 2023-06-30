print("Loading rewards...")
local startTime = GetTime()
Rewards = {}
RewardsIdx = {}
RewardNames = {}
local CustomRewardNames = {
	["CBONE"]="Bonestorm Truck",
	["CPOLICE"]="Hit and Run Police",
	["GLASTRUC"]="Glass Truck",
	["REDBRICK"]="Redbrick Car",
	["TT"]="Audi TT",
}

local TextBibleP3D = P3D.P3DChunk:new{Raw = ReadFile("/GameData/art/frontend/scrooby/resource/txtbible/srr2.p3d")}
local BibleIdx = TextBibleP3D:GetChunkIndex(P3D.Identifiers.Frontend_Text_Bible)
local BibleChunk = P3D.FrontendTextBibleP3DChunk:new{Raw = TextBibleP3D:GetChunkAtIndex(BibleIdx)}
local LanguageChunk
for idx in BibleChunk:GetChunkIndexes(P3D.Identifiers.Frontend_Language) do
	local Chunk = P3D.FrontendLanguageP3DChunk:new{Raw = BibleChunk:GetChunkAtIndex(idx)}

	if Chunk.Language == GetGameLanguage() then
		LanguageChunk = Chunk
		break
	end
end

Costumes = {}
DefaultCharacters = {}
TotalGags = {}
local RewardsFile = ReadFile("/GameData/scripts/missions/rewards.mfk")
local RewardsMFK = MFKLexer.Lexer:Parse(RewardsFile)
for i=1,#RewardsMFK.Functions do
	local func = RewardsMFK.Functions[i]
	if func.Name:lower() == "bindreward" and func.Arguments[3] == "skin" then
		if func.Arguments[4] == "forsale" then
			Costumes[func.Arguments[1]] = func.Arguments[5]
			local RewardIdx = #Rewards + 1
			Rewards[RewardIdx] = func.Arguments[1]
			RewardsIdx[func.Arguments[1]] = RewardIdx
			local P3DFile = P3D.P3DChunk:new{Raw = ReadFile(GetGamePath(func.Arguments[2]))}
			local CompositeDrawableIDX = P3DFile:GetChunkIndex(P3D.Identifiers.Composite_Drawable)
			local CompositeDrawableChunk = P3D.CompositeDrawableP3DChunk:new{Raw = P3DFile:GetChunkAtIndex(CompositeDrawableIDX)}
			local CompName = P3D.CleanP3DString(CompositeDrawableChunk.Name):sub(1, -3):upper()
			RewardNames[func.Arguments[1]] = LanguageChunk:GetValueFromName(CompName)
		elseif func.Arguments[4] == "defaultskin" then
			DefaultCharacters[tonumber(func.Arguments[5])] = func.Arguments[1]
		end
	elseif func.Name:lower() == "settotalgags" then
		TotalGags[tonumber(func.Arguments[1])] = func.Arguments[2]
	end
end

Cars = {}
local BannedCars = {
	["common"] = true,
	["huskA"] = true,
	["cCellB"] = true,
	["cCellC"] = true,
	["cCellD"] = true,
	["sedanB"] = true,
}

BannedCarCount=6
if Settings.BanCars and Settings.BannedCars and Settings.BannedCars:len() > 0 then
	for BannedCar in Settings.BannedCars:gmatch("[^,]+") do
		BannedCarCount = BannedCarCount + 1
		BannedCars[BannedCar] = true
	end
end

if Settings.Bingo then
	if BannedCarCount < 12 then
		extra_bans = {"cPolice", "icecream", "cCube", "compactA", "glastruc", "minivanA"}
		i=1
		while BannedCarCount < 12 do
			BannedCars[extra_bans[i]] = true
			BannedCarCount = BannedCarCount + 1
			i = i + 1
		end
	end
end

local tmp = {}
for k,v in pairs(BannedCars) do
	if v then tmp[#tmp +1] = k end
end
table.sort(tmp)
print("Banned cars: " .. table.concat(tmp, ", "))
DirectoryGetEntries("/GameData/art/cars", function(Name, IsDir)
	local fileName = RemoveFileExtension(Name)
	if not IsDir and GetFileExtension(Name):lower() == ".p3d" and not BannedCars[fileName] then
		local carFile = "/GameData/art/cars/" .. Name
		if Exists(carFile, true, false) then
			Cars[fileName] = true
			local RewardIdx = #Rewards + 1
			Rewards[RewardIdx] = fileName
			RewardsIdx[fileName] = RewardIdx
			local P3DFile = P3D.P3DChunk:new{Raw = ReadFile(carFile)}
			local CompositeDrawableIDX = P3DFile:GetChunkIndex(P3D.Identifiers.Composite_Drawable)
			local CompositeDrawableChunk = P3D.CompositeDrawableP3DChunk:new{Raw = P3DFile:GetChunkAtIndex(CompositeDrawableIDX)}
			local CompName = P3D.CleanP3DString(CompositeDrawableChunk.Name):upper()
			RewardNames[fileName] = CustomRewardNames[CompName] or (LanguageChunk:GetValueFromName(CompName) or CompName)
		end
	end
	return true
end)

local endTime = GetTime()
print("Loaded " .. #Rewards .. " rewards in " .. (endTime - startTime) * 1000 .. "ms.")
