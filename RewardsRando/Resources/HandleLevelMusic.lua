if Settings.DisableMusicFix then
	return
end
if Settings.MissionOrderType > 1 then
	local Path = GetPath()
	local GamePath = GetGamePath(Path)
	local Level = tonumber(Path:match("[lL](%d)"))
	if Cache["L"..Level.."RMS"] then
		Output(Cache["L"..Level.."RMS"])
		return
	end
	
	local startTime = GetTime()
	
	local function DataModifier(Data)
		local Mission = Data:match("^M(%d)_")
		if Mission then
			Mission = tonumber(Mission)
			if MissionOrder[Level][Mission] and MissionOrder[Level][Mission] ~= Mission then
				return "M" .. MissionOrder[Level][Mission] .. "_" .. Data:sub(4)
			end
		end
		return Data
	end
	
	local File = ReadFile(GamePath)
	local RMSFile = RMS.File:new(File, DataModifier)
	
	Cache["L"..Level.."RMS"] = RMSFile:Output()
	local endTime = GetTime()
	print("Fixed mission music for level " .. Level .. " in " .. (endTime-startTime) * 1000 .. "ms")
	Output(Cache["L"..Level.."RMS"])
end