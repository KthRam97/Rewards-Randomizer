if Settings.ReverseMissionOrder and Settings.HackyMusicFix then
	local Path = GetPath()
	local GamePath = GetGamePath(Path)
	local Level = tonumber(Path:match("[lL](%d)"))

	local File = ReadFile(GamePath)
	local RMSFile = RMS.File:new(File)

	for i=1,7 do
		if MissionOrder[Level][i] ~= i then
			RMSFile.Data = RMSFile.Data:gsub("M"..i, "M"..MissionOrder[Level][i])
		end
	end

	Output(RMSFile:Output())
end