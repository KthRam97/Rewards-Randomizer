if Settings.RandomCardLocations or Settings.RemoveUnluckyCards then
	local Path = GetPath()
	local GamePath = GetGamePath(Path)

	local P3DFile = P3D.P3DChunk:new{Raw = ReadFile(GamePath)}
	local removed = false
	for idx in P3DFile:GetChunkIndexes(P3D.Identifiers.Locator) do
		local LocatorChunk = P3D.LocatorP3DChunk:new{Raw = P3DFile:GetChunkAtIndex(idx)}
		if LocatorChunk.Type == 9 then
			local Type, UnknownStr1, UnknownStr2, Unknown1, Unknown2 = LocatorChunk:GetType9Data()
			if P3D.CleanP3DString(Type) == "CollectorCard" then
				if Settings.RandomCardLocations then
					P3DFile:RemoveChunkAtIndex(idx)
					removed = true
				else
					local level, mission = UnknownStr1:match("card(%d)(%d)")
					level = tonumber(level)
					mission = tonumber(mission)
					if UnluckyCards[level] and UnluckyCards[level][mission] then
						P3DFile:RemoveChunkAtIndex(idx)
						removed = true
					end
				end
			end
		end
	end
	if removed then
		Output(P3DFile:Output())
	end
end
