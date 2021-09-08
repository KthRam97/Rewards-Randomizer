if Cache.IngameP3D then
	Output(Cache.IngameP3D)
	return
end

local Path = GetPath()
local GamePath = GetGamePath(Path)

local Chunk = P3D.P3DChunk:new{Raw = ReadFile(GamePath)}
local ProjectIDX = Chunk:GetChunkIndex(P3D.Identifiers.Frontend_Project)
local ProjectChunk = P3D.FrontendProjectP3DChunk:new{Raw = Chunk:GetChunkAtIndex(ProjectIDX)}
for PageIDX in ProjectChunk:GetChunkIndexes(P3D.Identifiers.Frontend_Page) do
	local PageChunk = P3D.FrontendPageP3DChunk:new{Raw = ProjectChunk:GetChunkAtIndex(PageIDX)}
	local Name = P3D.CleanP3DString(PageChunk.Name)
	if Name == "GenericPrompt.pag" then
		local LayerIDX = PageChunk:GetChunkIndex(P3D.Identifiers.Frontend_Layer)
		local LayerChunk = P3D.FrontendLayerP3DChunk:new{Raw = PageChunk:GetChunkAtIndex(LayerIDX)}
		local MultiTextIDX = LayerChunk:GetChunkIndex(P3D.Identifiers.Frontend_Multi_Text)
		local MultiTextChunk = P3D.FrontendMultiTextP3DChunk:new{Raw = LayerChunk:GetChunkAtIndex(MultiTextIDX)}
		for i=1,#Rewards do
			local TextChunk = P3D.FrontendStringTextBibleP3DChunk:create("srr2", P3D.MakeP3DString("INGAME_MESSAGE_" .. 19 + i))
			MultiTextChunk:AddChunk(TextChunk:Output())
		end
		LayerChunk:SetChunkAtIndex(MultiTextIDX, MultiTextChunk:Output())
		PageChunk:SetChunkAtIndex(LayerIDX, LayerChunk:Output())
		ProjectChunk:SetChunkAtIndex(PageIDX, PageChunk:Output())
	elseif Name == "PauseMissionObjective.pag" then
		local LayerIDX = PageChunk:GetChunkIndex(P3D.Identifiers.Frontend_Layer)
		local LayerChunk = P3D.FrontendLayerP3DChunk:new{Raw = PageChunk:GetChunkAtIndex(LayerIDX)}
		local GroupIDX = LayerChunk:GetChunkIndex(P3D.Identifiers.Frontend_Group)
		local GroupChunk = P3D.FrontendGroupP3DChunk:new{Raw = LayerChunk:GetChunkAtIndex(GroupIDX)}
		local MultiTextIDX = GroupChunk:GetChunkIndex(P3D.Identifiers.Frontend_Multi_Text)
		local MultiTextChunk = P3D.FrontendMultiTextP3DChunk:new{Raw = GroupChunk:GetChunkAtIndex(MultiTextIDX)}
		local ids = {}
		for _,v in pairs(CustomRestrictionsIdx) do
			ids[#ids + 1] = v[2]
		end
		table.sort(ids)
		for i=1,#ids do
			local TextChunk = P3D.FrontendStringTextBibleP3DChunk:create("srr2", P3D.MakeP3DString("MISSION_OBJECTIVE_" .. ids[i]))
			MultiTextChunk:AddChunk(TextChunk:Output())
		end
		GroupChunk:SetChunkAtIndex(MultiTextIDX, MultiTextChunk:Output())
		LayerChunk:SetChunkAtIndex(GroupIDX, GroupChunk:Output())
		PageChunk:SetChunkAtIndex(LayerIDX, LayerChunk:Output())
		ProjectChunk:SetChunkAtIndex(PageIDX, PageChunk:Output())
	elseif Name == "Hud.pag" then
		for LayerIDX in PageChunk:GetChunkIndexes(P3D.Identifiers.Frontend_Layer) do
			local LayerChunk = P3D.FrontendLayerP3DChunk:new{Raw = PageChunk:GetChunkAtIndex(LayerIDX)}
			if P3D.CleanP3DString(LayerChunk.Name) == "Foreground" then
				for GroupIDX in LayerChunk:GetChunkIndexes(P3D.Identifiers.Frontend_Group) do
					local GroupChunk = P3D.FrontendGroupP3DChunk:new{Raw = LayerChunk:GetChunkAtIndex(GroupIDX)}
					if P3D.CleanP3DString(GroupChunk.Name) == "Message" then
						local MultiTextIDX = GroupChunk:GetChunkIndex(P3D.Identifiers.Frontend_Multi_Text)
						local MultiTextChunk = P3D.FrontendMultiTextP3DChunk:new{Raw = GroupChunk:GetChunkAtIndex(MultiTextIDX)}
						local ids = {}
						for _,v in pairs(CustomRestrictionsIdx) do
							ids[#ids + 1] = v[2]
						end
						table.sort(ids)
						for i=1,#ids do
							local TextChunk = P3D.FrontendStringTextBibleP3DChunk:create("srr2", P3D.MakeP3DString("MISSION_OBJECTIVE_" .. i))
							MultiTextChunk:AddChunk(TextChunk:Output())
						end
						GroupChunk:SetChunkAtIndex(MultiTextIDX, MultiTextChunk:Output())
						LayerChunk:SetChunkAtIndex(GroupIDX, GroupChunk:Output())
						break
					end
				end
				PageChunk:SetChunkAtIndex(LayerIDX, LayerChunk:Output())
			end
		end
		ProjectChunk:SetChunkAtIndex(PageIDX, PageChunk:Output())
	elseif Name == "PauseMission.pag" then
		local LayerIDX = PageChunk:GetChunkIndex(P3D.Identifiers.Frontend_Layer)
		local LayerChunk = P3D.FrontendLayerP3DChunk:new{Raw = PageChunk:GetChunkAtIndex(LayerIDX)}
		local GroupIDX = LayerChunk:GetChunkIndex(P3D.Identifiers.Frontend_Group)
		local GroupChunk = P3D.FrontendGroupP3DChunk:new{Raw = LayerChunk:GetChunkAtIndex(GroupIDX)}
		local MultiTextChunk = P3D.FrontendMultiTextP3DChunk:create(P3D.MakeP3DString("RandoPauseInfo"),17,220,170,200,20,P3D.FrontendMultiTextP3DChunk.Justifications.Centre, P3D.FrontendMultiTextP3DChunk.Justifications.Top,{A=255,R=255,G=255,B=255},0,0,P3D.MakeP3DString("font0_16"),1,{A=128,R=0,G=0,B=0},2,-2,0)
		local TextChunk = P3D.FrontendStringTextBibleP3DChunk:create("srr2", P3D.MakeP3DString("RandoPauseInfo"))
		MultiTextChunk:AddChunk(TextChunk:Output())
		GroupChunk:AddChunk(MultiTextChunk:Output())
		LayerChunk:SetChunkAtIndex(GroupIDX, GroupChunk:Output())
		PageChunk:SetChunkAtIndex(LayerIDX, LayerChunk:Output())
		ProjectChunk:SetChunkAtIndex(PageIDX, PageChunk:Output())
	elseif Name == "PauseSunday.pag" then
		local LayerIDX = PageChunk:GetChunkIndex(P3D.Identifiers.Frontend_Layer)
		local LayerChunk = P3D.FrontendLayerP3DChunk:new{Raw = PageChunk:GetChunkAtIndex(LayerIDX)}
		local GroupIDX = LayerChunk:GetChunkIndex(P3D.Identifiers.Frontend_Group)
		local GroupChunk = P3D.FrontendGroupP3DChunk:new{Raw = LayerChunk:GetChunkAtIndex(GroupIDX)}
		local MultiTextChunk = P3D.FrontendMultiTextP3DChunk:create(P3D.MakeP3DString("RandoPauseInfo"),17,220,165,200,20,P3D.FrontendMultiTextP3DChunk.Justifications.Centre, P3D.FrontendMultiTextP3DChunk.Justifications.Top,{A=255,R=255,G=255,B=255},0,0,P3D.MakeP3DString("font0_16"),1,{A=128,R=0,G=0,B=0},2,-2,0)
		local TextChunk = P3D.FrontendStringTextBibleP3DChunk:create("srr2", P3D.MakeP3DString("RandoPauseInfo"))
		MultiTextChunk:AddChunk(TextChunk:Output())
		GroupChunk:AddChunk(MultiTextChunk:Output())
		LayerChunk:SetChunkAtIndex(GroupIDX, GroupChunk:Output())
		PageChunk:SetChunkAtIndex(LayerIDX, LayerChunk:Output())
		ProjectChunk:SetChunkAtIndex(PageIDX, PageChunk:Output())
	elseif Name == "PhoneBooth.pag" then
		PageChunk:AddChunk(P3D.FrontendPure3DResourceP3DChunk:create("3Dmodel", 1, "pure3d\\_stubs\\dummy.p3d", "dummy", "Pedestal_Camera", "", ""):Output(), #PageChunk.Chunks)
		PageChunk:AddChunk(P3D.FrontendPure3DResourceP3DChunk:create("phonebg", 1, "pure3d\\_stubs\\dummy.p3d", "dummy", "Pedestal_Camera", "", ""):Output(), #PageChunk.Chunks)
		PageChunk:AddChunk(P3D.FrontendPure3DResourceP3DChunk:create("rewardfg", 1, "pure3d\\rewardfg.p3d", "PurchaseScene", "Pedestal_Camera", "", ""):Output(), #PageChunk.Chunks)
		local LayerIDX = PageChunk:GetChunkIndex(P3D.Identifiers.Frontend_Layer)
		local LayerChunk = P3D.FrontendLayerP3DChunk:new{Raw = PageChunk:GetChunkAtIndex(LayerIDX)}
		local GroupChunk = P3D.FrontendGroupP3DChunk:create("3DModel", 0, 255)
		GroupChunk:AddChunk(P3D.FrontendPure3DObjectP3DChunk:create("RewardBG", 1, 29, 145, 400, 300, P3D.FrontendPure3DObjectP3DChunk.Justifications.Left, P3D.FrontendPure3DObjectP3DChunk.Justifications.Top, {A=255,R=255,G=255,B=255}, 0, 0, "phonebg", ""):Output())
		GroupChunk:AddChunk(P3D.FrontendPure3DObjectP3DChunk:create("RewardFG", 1, 29, 145, 400, 300, P3D.FrontendPure3DObjectP3DChunk.Justifications.Left, P3D.FrontendPure3DObjectP3DChunk.Justifications.Top, {A=255,R=255,G=255,B=255}, 0, 0, "rewardfg", ""):Output())
		GroupChunk:AddChunk(P3D.FrontendPure3DObjectP3DChunk:create("PreviewWindow", 1, 29, 145, 400, 300, P3D.FrontendPure3DObjectP3DChunk.Justifications.Left, P3D.FrontendPure3DObjectP3DChunk.Justifications.Top, {A=255,R=255,G=255,B=255}, 0, 0, "3Dmodel", ""):Output())
		LayerChunk:AddChunk(GroupChunk:Output(), #LayerChunk.Chunks - 2)
		PageChunk:SetChunkAtIndex(LayerIDX, LayerChunk:Output())
		ProjectChunk:SetChunkAtIndex(PageIDX, PageChunk:Output())
	end
end
Chunk:SetChunkAtIndex(ProjectIDX, ProjectChunk:Output())
Cache.IngameP3D = Chunk:Output()
Output(Cache.IngameP3D)