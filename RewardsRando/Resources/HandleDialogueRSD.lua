if Settings.ReverseMissionOrder or Settings.RandomMissionOrder then
	local Path = GetPath()
	local GamePath = GetGamePath(Path)
	if not Exists(GamePath, true, false) then
		for i = 1, 7 do
			local tmp = GamePath:gsub("L(%d)", "L%1M" .. i)
			if Exists(tmp, true, false) then
				Redirect(tmp)
				return
			end
		end
	end
end