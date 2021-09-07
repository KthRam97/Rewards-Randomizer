local Path = "/GameData/" .. GetPath()

if IngameP3D then
	Output(IngameP3D)
	return
end

local Chunk = P3D.P3DChunk:new{Raw = ReadFile(Path)}
local ProjectIDX = Chunk:GetChunkIndex(P3D.Identifiers.Frontend_Project)
local ProjectChunk = P3D.FrontendProjectP3DChunk:new{Raw = Chunk:GetChunkAtIndex(ProjectIDX)}
local PageIDX = nil
local PageChunk = nil
for idx in ProjectChunk:GetChunkIndexes(P3D.Identifiers.Frontend_Page) do
	PageChunk = P3D.FrontendPageP3DChunk:new{Raw = ProjectChunk:GetChunkAtIndex(idx)}
	if P3D.CleanP3DString(PageChunk.Name) == "GenericPrompt.pag" then
		PageIDX = idx
		break
	end
end
if PageIDX then
	--local TextStyleChunk = P3D.FrontendTextStyleResourceP3DChunk:create(P3D.MakeP3DString("font1_14"),1,P3D.MakeP3DString("fonts\\font1_14.p3d"),P3D.MakeP3DString("Tt2001m__14"))
	--PageChunk:AddChunk(TextStyleChunk:Output(), 1)
	local LayerIDX = PageChunk:GetChunkIndex(P3D.Identifiers.Frontend_Layer)
	local LayerChunk = P3D.FrontendLayerP3DChunk:new{Raw = PageChunk:GetChunkAtIndex(LayerIDX)}
	local MultiTextIDX = LayerChunk:GetChunkIndex(P3D.Identifiers.Frontend_Multi_Text)
	local MultiTextChunk = P3D.FrontendMultiTextP3DChunk:new{Raw = LayerChunk:GetChunkAtIndex(MultiTextIDX)}
	local IDs = {}
	for k,v in pairs(ingame_messages) do
		IDs[#IDs + 1] = tonumber(v)
	end
	table.sort(IDs)
	for i=1,#IDs do
		local TextChunk = P3D.FrontendStringTextBibleP3DChunk:create("srr2", P3D.MakeP3DString("INGAME_MESSAGE_" .. IDs[i]))
		MultiTextChunk:AddChunk(TextChunk:Output())
	end
	LayerChunk:SetChunkAtIndex(MultiTextIDX, MultiTextChunk:Output())
	PageChunk:SetChunkAtIndex(LayerIDX, LayerChunk:Output())
	ProjectChunk:SetChunkAtIndex(PageIDX, PageChunk:Output())
	Chunk:SetChunkAtIndex(ProjectIDX, ProjectChunk:Output())
	IngameP3D = Chunk:Output()
	Output(IngameP3D)
end