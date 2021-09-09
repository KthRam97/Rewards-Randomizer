local Path = GetPath()
local GamePath = GetGamePath(Path)

local File = ReadFile(GamePath)
local RMSFile = RMS.File:new(File)

Output(RMSFile:Output())