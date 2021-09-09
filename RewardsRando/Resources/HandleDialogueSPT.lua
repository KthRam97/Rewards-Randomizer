if Settings.ReverseMissionOrder then
	local Path = GetPath()
	local GamePath = GetGamePath(Path)
	Output(ReadFile(GamePath):gsub("L(%d)M%d", "L%1"))
end