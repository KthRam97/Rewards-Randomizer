local Path = GetPath()
local GamePath = GetGamePath(Path)

local File = ReadFile(GamePath):gsub("SetEngineClipName %( \"tt\" %)", "SetEngineClipName ( \"snake_car\" )"):gsub("SetEngineIdleClipName %( \"tt\" %)", "SetEngineIdleClipName ( \"snake_car\" )"):gsub("\r\n    SetOverlayClipName %( \"\" %)", ""):gsub("\r\n    SetOverlayClipName %( \"generator\" %)", "")
Output(File)