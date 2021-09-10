if IsHackLoaded("NoAudio") then
	Alert("Unfortunately, some of the logic in this randomiser requires audio to be loaded.\nYou have the \"No Audio\" hack loaded, which renders this impossible.\nThe game will now exit.")
	os.exit()
end
if not IsHackLoaded("Console") and not Confirm("This mod uses the console to print unlocked rewards, and other useful information.\nIf you want to continue with the console disabled, click OK. Otherwise, click Cancel to close the game.") then
	os.exit()
end

ModName = GetModName()
ModTitle = GetModTitle()
ModVersion = GetModVersion()
Settings = GetSettings()

Paths = {}
Paths.ModPath = GetModPath()
Paths.Resources = Paths.ModPath .. "/Resources/"
dofile(Paths.Resources .. "lib/MFKLexer.lua")
dofile(Paths.Resources .. "lib/P3D.lua")
dofile(Paths.Resources .. "lib/RMS.lua")
dofile(Paths.Resources .. "lib/Seed.lua")

Cache = {}

function GetGamePath(Path)
	Path = FixSlashes(Path,false,true)
	if Path:sub(1,1) ~= "/" then Path = "/GameData/"..Path end
	return Path
end

local std_bs = { [0] =
	'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
	'Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f',
	'g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v',
	'w','x','y','z','0','1','2','3','4','5','6','7','8','9','+','/',
}

local std_bsi = {}
for i=0,#std_bs do
	std_bsi[string.byte(std_bs[i])] = i
end

function base64(s, bs)
	if bs == nil then
		bs = std_bs
	end
	local byte, rep = string.byte, string.rep
	local pad = 2 - ((#s-1) % 3)
	s = (s..rep('\0', pad)):gsub("...", function(cs)
		local a, b, c = byte(cs, 1, 3)
		return bs[a>>2] .. bs[(a&3)<<4|b>>4] .. bs[(b&15)<<2|c>>6] .. bs[c&63]
	end)
	return s:sub(1, #s-pad) .. rep('=', pad)
end

function base64dec(s, bs, bsi)
	if bs == nil then
		bs = std_bs
		bsi = std_bsi
	end
	if bsi == nil then
		bsi = {}
		for i=0,#bs do
		bsi[string.byte(bs[i])] = i
		end
	end
	s = s:gsub("[^A" .. table.concat(bs) .. "=]", "")
	local p = ''
	if s:sub(#s) == '=' then
		if s:sub(#s - 1) == '=' then
			p = 'AA'
		else
			p = 'A'
		end
		s = s:sub(1, #s - #p) .. p
	end
	s = s:gsub("....", function(cs)
		local a, b, c, d = string.byte(cs, 1, 4)
		local n = (bsi[a] << 18) + (bsi[b] << 12) + (bsi[c] << 6) + bsi[d]
		return string.char((n >> 16) & 255, (n >> 8) & 255, n & 255)
	end)
	return s:sub(1, #s - #p)
end

CompletedMissions = {}
for i=1,7 do
	CompletedMissions[i] = {}
end

if Settings.ReverseMissionOrder then
	MissionOrder = {
		{7, 6, 5, 4, 3, 2, 1},
		{7, 6, 5, 4, 3, 2, 1},
		{7, 6, 5, 4, 3, 2, 1},
		{7, 6, 5, 4, 3, 2, 1},
		{7, 6, 5, 4, 3, 2, 1},
		{7, 6, 5, 4, 3, 2, 1},
		{4, 3, 2, 1, 5, 6, 7},
	}
else
	MissionOrder = {}
	for i=1,7 do
		MissionOrder[i] = {1,2,3,4,5,6,7}
	end
end

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
if Settings.BanCars and Settings.BannedCars and Settings.BannedCars:len() > 0 then
	for BannedCar in Settings.BannedCars:gmatch("[^,]+") do
		BannedCars[BannedCar] = true
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
if Settings.Debug then
	print("--- BEGIN REWARDS LIST ---")
	for i=1,#Rewards do
		print(Rewards[i], RewardNames[Rewards[i]])
	end
	print("--- END REWARDS LIST ---")
	Pause()
end

print("Setting up level shop locators...")
local startTime = GetTime()

--TODO: Make locator generation automatic
local CarLocators = {
	{
		{"L1M2CS_npcwalk",211.39340209961,3.3662109375,-166.89379882813,3.4536788463593},
		{"L1M2CS_carspawn",213.19850158691,3.2666020393372,-161.87860107422,4.6967272758484},
		{"L1M2CS_npcspawn",211.02310180664,3.3671879768372,-176.98950195313,1.6129474639893},
		{"L1M4CS_npcwalk",-85.631156921387,0.0,308.24600219727,0.40849909186363},
		{"L1M4CS_carspawn",-87.089508056641,0.0,298.19549560547,4.8266711235046},
		{"L1M4CS_npcspawn",-85.551208496094,0.0,313.25131225586,0.18729692697525},
		{"L1M6CS_carspawn",-26.671329498291,-0.62109380960464,-506.16390991211,3.0120360851288},
		{"L1M6CS_npcspawn",-6.4629039764404,-0.16601559519768,-504.60681152344,1.6461844444275},
		{"L1M6CS_npcwalk",-23.839490890503,-0.2919921875,-503.99789428711,1.6314237117767},
		{"L1M7CS_carspawn",-26.671329498291,-0.62109380960464,-506.16390991211,3.0120360851288},
	},
	{
		{"L2M1CS_npcwalk",131.52709960938,8.03515625,36.302639007568,4.6678647994995},
		{"L2M1CS_npcspawn",125.69920349121,7.6289057731628,35.501220703125,4.8037195205688},
		{"L2M1CS_carspawn",126.47859954834,7.7607421875,32.369720458984,3.2223505973816},
		{"L2M2CS_carspawn",-349.43310546875,6.7548828125,374.53439331055,3.2833034992218},
		{"L2M2CS_npcwalk",-344.53369140625,6.9541020393372,363.30209350586,3.3517808914185},
		{"L2M2CS_npcspawn",-335.56259155273,7.0966801643372,376.71728515625,2.7586295604706},
		{"L2M3CS_carspawn",-154.94729614258,28.848630905151,483.84838867188,3.2027773857117},
		{"L2M3CS_npcwalk",-140.27389526367,28.848630905151,511.2262878418,1.6849393844604},
		{"L2M3CS_npcspawn",-126.53520202637,28.890619277954,511.49890136719,1.9212604761124},
		{"L2M4CS_carspawn",138.7333984375,11.20654964447,309.74609375,0.34764111042023},
		{"L2M4CS_npcwalk",140.86219787598,10.691410064697,319.87869262695,0.46892032027245},
		{"L2M4CS_npcspawn",140.86219787598,10.691410064697,319.87869262695,0.46892032027245},
		{"L2M5CS_carspawn",52.579719543457,7.1451277732849,-19.902990341187,0.01961325481534},
		{"L2M5CS_npcwalk",42.32963180542,6.7539057731628,-21.056869506836,1.3439772129059},
		{"L2M5CS_npcspawn",42.088611602783,7.0390620231628,-37.941589355469,3.0154278278351},
	},
	{
		{"L3M4CS_npcspawn",158.88639831543,2.5976560115814,462.53070068359,2.8011682033539},
		{"L3M4CS_npcwalk",158.88639831543,2.5976560115814,462.53070068359,2.8011682033539},
		{"L3M4CS_carspawn",170.58459472656,-2.5898439884186,456.93908691406,4.7481365203857},
		{"L3M3CS_carspawn",15.444789886475,7.98073387146,25.483560562134,0.61397385597229},
		{"L3M3CS_npcwalk",10.346819877625,6.8349609375,30.690019607544,5.9760150909424},
		{"L3M3CS_npcspawn",10.346819877625,6.8349609375,30.690019607544,5.9760150909424},
		{"L3M1CS_npcspawn",23.530479431152,6.8164057731628,-0.59033352136612,2.8736476898193},
		{"L3M1CS_carspawn",16.593250274658,5.9638671875,-12.044170379639,0.12386451661587},
		{"L3M1CS_npcwalk",18.828420639038,6.3828120231628,-10.771510124207,1.652024269104},
		{"L3M2CS_carspawn",84.151863098145,7.6406240463257,27.998809814453,6.1820707321167},
		{"L3M2CS_npcwalk",73.792640686035,7.0371088981628,40.108921051025,0.78078842163086},
		{"L3M2CS_npcspawn",67.552696228027,7.0371088981628,33.811069488525,0.78470325469971},
		{"L3M5CS_carspawn",-374.09539794922,-51.763080596924,-167.07369995117,6.2351846694946},
		{"L3M5CS_npcwalk",-378.62231445313,-52.458011627197,-167.22219848633,3.174252986908},
		{"L3M5CS_npcspawn",-378.39639282227,-52.496089935303,-183.1369934082,4.7443161010742},
		{"L3M6CS_carspawn",-480.41720581055,-64.122161865234,-39.250659942627,1.7856477499008},
		{"L3M6CS_npcwalk",-481.85708618164,-64.6611328125,-44.612010955811,3.1080417633057},
		{"L3M6CS_npcspawn",-481.85708618164,-64.6611328125,-44.612010955811,3.1080417633057},
	},
	{
		{"L4M1CS_carspawn",215.25729370117,3.5,-171.91830444336,0.25224056839943},
		{"L4M1CS_npcwalk",218.85450744629,3.3671879768372,-175.90809631348,3.1923971176147},
		{"L4M1CS_npcspawn",233.32029724121,3.5107419490814,-176.56350708008,2.9649932384491},
		{"L4M2CS_carspawn",340.73260498047,-2.1777338981628,351.33511352539,2.9948692321777},
		{"L4M2CS_npcwalk",348.43399047852,-2.0625,353.85778808594,6.0877552032471},
		{"L4M2CS_npcspawn",349.19830322266,-1.29245698452,360.06799316406,6.0897798538208},
		{"L4M3CS_carspawn",261.59869384766,3.9462890625,-311.94180297852,0.11568839102983},
		{"L4M3CS_npcwalk",266.14538574219,3.9941411018372,-312.75149536133,3.1344094276428},
		{"L4M3CS_npcspawn",265.70529174805,4.0371088981628,-319.47048950195,2.2304403781891},
		{"L4M4CS_carspawn",391.66009521484,2.7724609375,27.311239242554,2.0585825443268},
		{"L4M4CS_npcwalk",396.92541503906,2.6533200740814,30.631200790405,0.80488634109497},
		{"L4M4CS_npcspawn",399.33959960938,2.6699221134186,38.63191986084,0.488436460495},
		{"L4M5CS_carspawn",299.24978637695,3.8554689884186,-289.49951171875,3.1438727378845},
		{"L4M5CS_npcwalk",305.73849487305,4.783203125,-286.6589050293,3.5511577129364},
		{"L4M5CS_npcspawn",305.83389282227,4.7822270393372,-293.33551025391,3.1954751014709},
		{"L4M7CS_carspawn",221.51089477539,4.0,-291.96319580078,5.859299659729},
		{"L4M7CS_npcwalk",214.73330688477,3.7763669490814,-287.06631469727,2.7237598896027},
		{"L4M7CS_npcspawn",206.8238067627,3.4609379768372,-286.44030761719,4.8040471076965},
	},
	{
		{"L5M7CS_carspawn",-186.01870727539,6.798828125,69.538887023926,1.4888499975204},
		{"L5M7CS_npcwalk",-182.57029724121,6.8984379768372,64.409187316895,2.9245979785919},
		{"L5M7CS_npcspawn",-182.57029724121,6.8984379768372,64.409187316895,2.9245979785919},
		{"L5M1CS_carspawn",-154.96569824219,29.976160049438,481.2001953125,6.0891489982605},
		{"L5M1CS_npcwalk",-155.41450500488,28.949220657349,494.99710083008,4.8634433746338},
		{"L5M1CS_npcspawn",-155.41450500488,28.949220657349,494.99710083008,4.8634433746338},
		{"L5M2CS_carspawn",-219.87100219727,6.798828125,69.54109954834,1.718137383461},
		{"L5M2CS_npcwalk",-222.43310546875,6.8984379768372,64.309936523438,3.326518535614},
		{"L5M2CS_npcspawn",-222.43310546875,6.8984379768372,64.309936523438,3.326518535614},
		{"L5M4CS_carspawn",37.373340606689,6.9140620231628,-31.287990570068,6.1757550239563},
		{"L5M4CS_npcwalk",41.528831481934,6.9228520393372,-29.446710586548,1.3563811779022},
		{"L5M4CS_npcspawn",41.784080505371,7.048828125,-37.582389831543,3.3111433982849},
		{"L5M5CS_carspawn",-270.67620849609,8.3432312011719,349.54449462891,6.2678699493408},
		{"L5M5CS_npcwalk",-268.54959106445,6.8544921875,354.54629516602,1.9419099092484},
		{"L5M5CS_npcspawn",-267.86358642578,6.8544921875,361.03271484375,1.7797840833664},
	},
	{
		--[[{"L6M7CS_npcwalk",11.960900306702,6.8349609375,32.745800018311,0.12922020256519},
		{"L6M7CS_npcspawn",11.960900306702,6.8349609375,32.745800018311,0.12922020256519},
		{"L6M7CS_carspawn",9.5900621414185,7.9875679016113,26.504430770874,5.928295135498},]]
		{"L6M1CS_npcspawn",12.673379898071,6.8349609375,32.895118713379,0.0065803159959614},
		{"L6M1CS_npcwalk",55.071300506592,6.7548828125,27.114749908447,6.2362432479858},
		{"L6M1CS_npcspawn",55.071300506592,6.7548828125,27.114749908447,6.2362432479858},
		{"L6M2CS_carspawn",-299.94821166992,-52.54967880249,218.61180114746,6.277702331543},
		{"L6M2CS_npcwalk",-302.94100952148,-53.0,225.79449462891,0.11239872127771},
		{"L6M2CS_npcspawn",-302.94100952148,-53.0,225.79449462891,0.11239872127771},
		{"L6M3CS_carspawn",-490.36129760742,-68.41015625,-125.02619934082,3.1873469352722},
		{"L6M3CS_npcwalk",-481.30969238281,-68.091796875,-125.80280303955,1.6010483503342},
		{"L6M3CS_npcspawn",-481.30969238281,-68.091796875,-125.80280303955,1.6010483503342},
		{"L6M4CS_carspawn",179.77909851074,3.8925778865814,477.82919311523,4.1001901626587},
		{"L6M4CS_npcwalk",177.65049743652,3.8925778865814,481.50149536133,5.1228704452515},
		{"L6M4CS_npcspawn",177.65049743652,3.8925778865814,481.50149536133,5.1228704452515},
		{"L6M5CS_carspawn",-502.74951171875,-65.4765625,161.47380065918,0.21608828008175},
		{"L6M5CS_npcwalk",-506.08459472656,-65.3916015625,162.29550170898,4.5873994827271},
		{"L6M5CS_npcspawn",-506.08459472656,-65.3916015625,162.29550170898,4.5873994827271},
	},
	{
		{"L7M1CS_carspawn",235.14970397949,3.7021479606628,-171.86329650879,1.4340658187866},
		{"L7M1CS_npcwalk",235.59970092773,3.3671879768372,-180.94380187988,3.0196621417999},
		{"L7M1CS_npcspawn",235.59970092773,3.3671879768372,-180.94380187988,3.0196621417999},
		{"L7M2CS_carspawn",-114.5059967041,2.0665121078491,-584.22351074219,5.7904214859009},
		{"L7M2CS_npcwalk",-116.15550231934,0.95214837789536,-580.75787353516,0.027798777446151},
		{"L7M2CS_npcspawn",-115.67440032959,1.7607419490814,-574.04052734375,1.4119572639465},
		{"L7M3CS_carspawn",8.613076210022,-0.10644529759884,290.61880493164,1.5050466060638},
		{"L7M3CS_npcwalk",2.8105270862579,0.0,292.78659057617,4.8765687942505},
		{"L7M3CS_npcspawn",2.8105270862579,0.0,292.78659057617,4.8765687942505},
		{"L7M4CS_carspawn",-24.899450302124,2.1259770393372,-598.04620361328,1.1607155799866},
		{"L7M4CS_npcwalk",-25.260429382324,2.7353520393372,-593.56842041016,4.75350522995},
		{"L7M4CS_npcspawn",-25.260429382324,2.7353520393372,-593.56842041016,4.75350522995},
	}
}
CarShops = {
	{
		{"zmale1","L1M2CS_npcspawn","L1M2CS_carspawn","L1M2CS_npcwalk"},
		{"zmale3","L1M4CS_npcspawn","L1M4CS_carspawn","L1M4CS_npcwalk"},
		{"zmale4","L1M6CS_npcspawn","L1M6CS_carspawn","L1M6CS_npcwalk"},
		{"zfem1","ambient_lenny","L1M7CS_carspawn","lenny_walk1"},
	},
	{
		{"zmale1","L2M1CS_npcspawn","L2M1CS_carspawn","L2M1CS_npcwalk"},
		{"zmale3","L2M2CS_npcspawn","L2M2CS_carspawn","L2M2CS_npcwalk"},
		{"zmale4","L2M3CS_npcspawn","L2M3CS_carspawn","L2M3CS_npcwalk"},
		{"zfem1","L2M4CS_npcspawn","L2M4CS_carspawn","L2M4CS_npcwalk"},
		{"zfem5","L2M5CS_npcspawn","L2M5CS_carspawn","L2M5CS_npcwalk"},
	},
	{
		{"zmale1","L3M1CS_npcspawn","L3M1CS_carspawn","L3M1CS_npcwalk"},
		{"zmale3","L3M2CS_npcspawn","L3M2CS_carspawn","L3M2CS_npcwalk"},
		{"zmale4","L3M3CS_npcspawn","L3M3CS_carspawn","L3M3CS_npcwalk"},
		{"zfem1","L3M4CS_npcspawn","L3M4CS_carspawn","L3M4CS_npcwalk"},
		{"zfem5","L3M5CS_npcspawn","L3M5CS_carspawn","L3M5CS_npcwalk"},
		{"witch","L3M6CS_npcspawn","L3M6CS_carspawn","L3M6CS_npcwalk"},
	},
	{
		{"zmale1","L4M1CS_npcspawn","L4M1CS_carspawn","L4M1CS_npcwalk"},
		{"zmale3","L4M2CS_npcspawn","L4M2CS_carspawn","L4M2CS_npcwalk"},
		{"zmale4","L4M3CS_npcspawn","L4M3CS_carspawn","L4M3CS_npcwalk"},
		{"zfem1","L4M4CS_npcspawn","L4M4CS_carspawn","L4M4CS_npcwalk"},
		{"zfem5","L4M5CS_npcspawn","L4M5CS_carspawn","L4M5CS_npcwalk"},
		{"witch","L4M7CS_npcspawn","L4M7CS_carspawn","L4M7CS_npcwalk"},
	},
	{
		{"zmale1","L5M1CS_npcspawn","L5M1CS_carspawn","L5M1CS_npcwalk"},
		{"zmale3","L5M2CS_npcspawn","L5M2CS_carspawn","L5M2CS_npcwalk"},
		{"zmale4","L5M4CS_npcspawn","L5M4CS_carspawn","L5M4CS_npcwalk"},
		{"zfem1","L5M5CS_npcspawn","L5M5CS_carspawn","L5M5CS_npcwalk"},
		{"witch","L5M7CS_npcspawn","L5M7CS_carspawn","L5M7CS_npcwalk"},
	},
	{
		{"zmale1","L6M1CS_npcspawn","L6M1CS_carspawn","L6M1CS_npcwalk"},
		{"zmale3","L6M2CS_npcspawn","L6M2CS_carspawn","L6M2CS_npcwalk"},
		{"zmale4","L6M3CS_npcspawn","L6M3CS_carspawn","L6M3CS_npcwalk"},
		{"zfem1","L6M4CS_npcspawn","L6M4CS_carspawn","L6M4CS_npcwalk"},
		{"zfem5","L6M5CS_npcspawn","L6M5CS_carspawn","L6M5CS_npcwalk"},
		--{"witch","L6M7CS_npcspawn","L6M7CS_carspawn","L6M7CS_npcwalk"}, --Removed as unnecessarily close to another shop
	},
	{
		{"hibbert","L7M1CS_npcspawn","L7M1CS_carspawn","L7M1CS_npcwalk"},
		{"willie","L7M2CS_npcspawn","L7M2CS_carspawn","L7M2CS_npcwalk"},
		{"captain","L7M3CS_npcspawn","L7M3CS_carspawn","L7M3CS_npcwalk"},
		{"milhouse","L7M4CS_npcspawn","L7M4CS_carspawn","L7M4CS_npcwalk"},
	},
}

local CostumeLocators = {
	{
		{"L1M2SS",216.19590759277,3.3671879768372,-179.20629882813,"L1M1SS"},
		{"L1M4SS",-83.470031738281,0.0,314.42959594727,"L1M1SS"},
		{"L1M6SS",-20.437839508057,0.03710937872529,-502.89389038086,"L1M1SS"},
		{"L1M7SS",40.048679351807,-0.13769529759884,280.06930541992,"L1M1SS"},
	},
	{
		{"L2M1SS",135.37260437012,8.0673828125,35.407390594482,"L1M1SS"},
		{"L2M2SS",-333.30880737305,7.2373051643372,376.6051940918,"L1M1SS"},
		{"L2M3SS",-123.35230255127,28.890619277954,510.71301269531,"L1M1SS"},
		{"L2M4SS",145.40759277344,10.648440361023,319.13900756836,"L1M1SS"},
		{"L2M5SS",48.128768920898,6.9365229606628,-35.865509033203,"L1M1SS"},
	},
	{
		{"L3M1SS",24.751310348511,6.65625,-0.0028113629668951,"L1M1SS"},
		{"L3M2SS",75.887306213379,7.0371088981628,37.809558868408,"L1M1SS"},
		{"L3M3SS",13.72922039032,6.8349609375,31.698299407959,"L1M1SS"},
		{"L3M4SS",155.44560241699,2.5976560115814,463.15341186523,"L1M1SS"},
		{"L3M5SS",-377.56311035156,-52.53125,-186.4593963623,"L1M1SS"},
		{"L3M6SS",-479.38259887695,-64.66015625,-44.842758178711,"L1M1SS"},
		{"L1M2SS",216.19590759277,3.3671879768372,-179.20629882813,"L1M1SS"},
	},
	{
		{"L4M1SS",232.88079833984,3.3671879768372,-180.74639892578,"L1M1SS"},
		{"L4M2SS",347.35369873047,-1.296875,361.14358520508,"L1M1SS"},
		{"L4M3SS",259.92230224609,3.8242189884186,-306.57400512695,"L1M1SS"},
		{"L4M4SS",386.50961303711,3.1308588981628,31.873600006104,"L1M1SS"},
		{"L4M5SS",306.56210327148,4.7734379768372,-283.90008544922,"L1M1SS"},
	},
	{
		{"L5M1SS",-156.59689331055,28.949220657349,489.95629882813,"L1M1SS"},
		{"L5M2SS",-218.77810668945,6.8984379768372,63.937808990479,"L1M1SS"},
		{"L5M3SS",284.51379394531,6.5986328125,66.755668640137,"L1M1SS"},
		{"L5M4SS",47.471168518066,6.8779301643372,-36.409370422363,"L1M1SS"},
		{"L5M5SS",-264.72689819336,6.8544921875,362.75961303711,"L1M1SS"},
		{"L5M7SS",-179.90449523926,6.8994140625,63.589511871338,"L1M1SS"},
	},
	{
		{"L6M1SS",60.890159606934,6.9902338981628,27.262329101563,"L1M1SS"},
		{"L6M2SS",-301.4587097168,-53.0,223.75619506836,"L1M1SS"},
		{"L6M3SS",-481.95941162109,-68.0859375,-128.11839294434,"L1M1SS"},
		{"L6M4SS",177.26330566406,3.8925778865814,478.69839477539,"L1M1SS"},
		{"L6M5SS",-506.90740966797,-65.7900390625,158.40029907227,"L1M1SS"},
		{"L6M7SS",8.5609359741211,6.8349609375,32.707580566406,"L1M1SS"},
	},
	{
		{"L7M1SS",232.9759979248,3.3671879768372,-181.154296875,"L1M1SS"},
		{"L7M2SS",-116.37599945068,1.2783199548721,-577.35168457031,"L1M1SS"},
		{"L7M3SS",3.4874529838562,-0.33398440480232,285.54888916016,"L1M1SS"},
		{"L7M5SS",-15.431690216064,32.0,291.97491455078,"L1M1SS"},
	},
}

for i=1,7 do
	local P3DFile = P3D.P3DChunk:new{Raw = ReadFile("/GameData/art/missions/level0"..i.."/level.p3d")}
	
	for j=1,#CarLocators[i] do
		local Locator = CarLocators[i][j]
		P3DFile:AddChunk(P3D.LocatorP3DChunk:createType3(Locator[1], {X=Locator[2],Y=Locator[3],Z=Locator[4]}, Locator[5]):Output())
	end
	
	for j=1,#CostumeLocators[i] do
		local Locator = CostumeLocators[i][j]
		local LocatorChunk = P3D.LocatorP3DChunk:createType9(Locator[1], {X=Locator[2],Y=Locator[3],Z=Locator[4]}, "PurchaseSkin", Locator[5], "<null>", 3, 0)
		LocatorChunk:AddChunk(P3D.TriggerVolumeP3DChunk:create(Locator[1] .. " Trigger",0,{X=2.5,Y=2.5,Z=2.5},{M11=0,M12=0,M13=0,M14=0,M21=0,M22=0,M23=0,M24=0,M31=0,M32=0,M33=0,M34=0,M41=Locator[2],M42=Locator[3],M43=Locator[4],M44=0}):Output())
		P3DFile:AddChunk(LocatorChunk:Output())
	end
	
	Cache["Level" .. i] = P3DFile:Output()
end

local endTime = GetTime()
print("Setup level shop locators in " .. (endTime - startTime) * 1000 .. "ms.")

print("Setting seed...")
local startTime = GetTime()

CustomRestrictions = {
	{false, false, false, false, false, false, false}, -- Level 1
	{false, false, false, false, false, false, false}, -- Level 2
	{false, false, false, false, false, false, false}, -- Level 3
	{false, false, false, false, false, false, false}, -- Level 4
	{false, false, false, false, false, false, false}, -- Level 5
	{false, false, false, false, false, false, false}, -- Level 6
	{false, false, false, false, {"h_scuzzy","You need to look Scuzzy. Purchase Homer's DIRTY HOMER at a Clothing Shop if you've unlocked it. Otherwise Scuzz it up in other missions.\nYou must show your Proof of Scuzzy to continue!"}, {"h_evil","You need to descend into hell! Purchase Homer's EVIL HOMER at a Clothing Shop if you've unlocked it. Otherwise head out and commit some sins in other missions.\You must show your Proof of Hell to continue!"}, {"h_donut","You need to make a deal with the devil. Purchase Homer's DONUT HOMER at a clothing Shop if you've unlocked it. Otherwise track down Devil Flanders in other missions.\nYou must show your Proof of Gluttony to continue!"}}, -- Level 7
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
if Settings.Debug then
	print("--- BEGIN RESTRICTIONS LIST ---")
	for i=1,#Restrictions do
		for j=1,#Restrictions[i] do
			local MissionRestricions = Restrictions[i][j]
			if #MissionRestricions > 0 then
				print("L" .. i .. "M" .. j, table.unpack(MissionRestricions))
			end
		end
	end
	print("--- END RESTRICTIONS LIST ---")
	Pause()
end

Seed.Init()
local InvalidCount = Seed.Generate()
Seed.PrintSpoiler()

local endTime = GetTime()
print("Seeding configured after " .. InvalidCount .. " attempts in " .. (endTime - startTime) * 1000 .. "ms.")
