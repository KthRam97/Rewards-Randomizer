local Path = GetPath()
local GamePath = GetGamePath(Path)

local File = ReadFile(GamePath)
local SetStreaming = {
	["mission_complete"] = true,
	--["card_collect"] = true,
}
File = File:gsub("create daSoundResourceData named (.-)\r\n{\r\n(.-)\r\n}", function(Name, Settings)
    if SetStreaming[Name] then
        return "create daSoundResourceData named " .. Name .. "\r\n{\r\n" .. Settings .. "\r\n    SetStreaming ( true )\r\n}"
    end
end)
Output(File)