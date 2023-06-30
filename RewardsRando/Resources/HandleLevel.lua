local Path = GetPath()
local Level = Path:match("level0(%d)")
Output(Cache["Level" .. Level])