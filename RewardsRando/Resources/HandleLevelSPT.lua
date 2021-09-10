local Path = GetPath()
local GamePath = GetGamePath(Path)

local File = ReadFile(GamePath)
File = File:gsub("create daSoundResourceData named (.-)\r\n{\r\n(.-)\r\n}", function(Name, Settings)
	if Name:find("level_%d_pickup_sfx") then
		return "create daSoundResourceData named " .. Name .. "\r\n{\r\n" .. Settings .. "\r\n    SetStreaming ( true )\r\n}"
	end
end)
Output(File)