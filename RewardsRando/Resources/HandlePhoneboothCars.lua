-- Fuck you radical for making this hard coded.
local RemoveAllWheels = {
	["frink_v"] = true,
	["honor_V"] = true,
	["hbike_v"] = true,
	["witchcar"] = true,
	["ship"] = true,
	["mono_v"] = true,
}
local RemoveFrontWheels = {
	["rocke_v"] = true,
}
local function RemoveProps(P3DFile, PropNames)
	local CompositeDrawableIDX = P3DFile:GetChunkIndex(P3D.Identifiers.Composite_Drawable)
	local CompositeDrawableChunk = P3D.CompositeDrawableP3DChunk:new{Raw = P3DFile:GetChunkAtIndex(CompositeDrawableIDX)}

	local CompositeDrawablePropListIDX = CompositeDrawableChunk:GetChunkIndex(P3D.Identifiers.Composite_Drawable_Prop_List)
	local CompositeDrawablePropListChunk = P3D.CompositeDrawablePropListP3DChunk:new{Raw = CompositeDrawableChunk:GetChunkAtIndex(CompositeDrawablePropListIDX)}

	for idx in CompositeDrawablePropListChunk:GetChunkIndexes(P3D.Identifiers.Composite_Drawable_Prop) do
		local CompositeDrawablePropChunk = P3D.CompositeDrawablePropP3DChunk:new{Raw = CompositeDrawablePropListChunk:GetChunkAtIndex(idx)}
		if PropNames[P3D.CleanP3DString(CompositeDrawablePropChunk.Name)] then
			CompositeDrawablePropListChunk:RemoveChunkAtIndex(idx)
		end
	end

	CompositeDrawableChunk:SetChunkAtIndex(CompositeDrawablePropListIDX, CompositeDrawablePropListChunk:Output())

	P3DFile:SetChunkAtIndex(CompositeDrawableIDX, CompositeDrawableChunk:Output())
end

local Path = GetPath()
local FileName = GetFileName(Path)
local FilePath = "/GameData/art/cars/" .. FileName
local FileNameNoExtension = RemoveFileExtension(FileName)
if Cache["Phonebooth" .. FileName] then
	Output(Cache["Phonebooth"..FileName])
	return
end
local P3DFile = P3D.P3DChunk:new{Raw = ReadFile(FilePath)}

if RemoveAllWheels[FileNameNoExtension] then
	RemoveProps(P3DFile, {["wShape0"]=true,["wShape1"]=true,["wShape2"]=true,["wShape3"]=true})
elseif RemoveFrontWheels[FileNameNoExtension] then
	RemoveProps(P3DFile, {["wShape2"]=true,["wShape3"]=true})
end

local removedBillboards = {}

for idx in P3DFile:GetChunkIndexes(P3D.Identifiers.Old_Billboard_Quad_Group) do
	local OldBillboardQuadGroupChunk = P3D.OldBillboardQuadGroupP3DChunk:new{Raw = P3DFile:GetChunkAtIndex(idx)}
	removedBillboards[P3D.CleanP3DString(OldBillboardQuadGroupChunk.Name)] = true
	P3DFile:RemoveChunkAtIndex(idx)
end

for idx in P3DFile:GetChunkIndexes(P3D.Identifiers.Old_Frame_Controller) do
	P3DFile:RemoveChunkAtIndex(idx)
end

local CompositeDrawableIDX = P3DFile:GetChunkIndex(P3D.Identifiers.Composite_Drawable)
local CompositeDrawableChunk = P3D.CompositeDrawableP3DChunk:new{Raw = P3DFile:GetChunkAtIndex(CompositeDrawableIDX)}

local CompositeDrawablePropListIDX = CompositeDrawableChunk:GetChunkIndex(P3D.Identifiers.Composite_Drawable_Prop_List)
local CompositeDrawablePropListChunk = P3D.CompositeDrawablePropListP3DChunk:new{Raw = CompositeDrawableChunk:GetChunkAtIndex(CompositeDrawablePropListIDX)}

for idx in CompositeDrawablePropListChunk:GetChunkIndexes(P3D.Identifiers.Composite_Drawable_Prop) do
	local CompositeDrawablePropChunk = P3D.CompositeDrawablePropP3DChunk:new{Raw = CompositeDrawablePropListChunk:GetChunkAtIndex(idx)}
	if removedBillboards[P3D.CleanP3DString(CompositeDrawablePropChunk.Name)] then
		CompositeDrawablePropListChunk:RemoveChunkAtIndex(idx)
	end
end

CompositeDrawableChunk:SetChunkAtIndex(CompositeDrawablePropListIDX, CompositeDrawablePropListChunk:Output())
P3DFile:SetChunkAtIndex(CompositeDrawableIDX, CompositeDrawableChunk:Output())

local MultiControllerIDX = P3DFile:GetChunkIndex(P3D.Identifiers.Multi_Controller)
if MultiControllerIDX then
	local MultiControllerChunk = P3D.MultiControllerP3DChunk:new{Raw = P3DFile:GetChunkAtIndex(MultiControllerIDX)}

	local MultiControllerTracksIDX = MultiControllerChunk:GetChunkIndex(P3D.Identifiers.Multi_Controller_Tracks)
	local MultiControllerTracksChunk = P3D.MultiControllerTracksP3DChunk:new{Raw = MultiControllerChunk:GetChunkAtIndex(MultiControllerTracksIDX)}

	for i=#MultiControllerTracksChunk.Tracks,1,-1 do
		if MultiControllerTracksChunk.Tracks[i].Name:sub(1, 4) ~= "PTRN" then
			table.remove(MultiControllerTracksChunk.Tracks, i)
		end
	end

	MultiControllerChunk:SetChunkAtIndex(MultiControllerTracksIDX, MultiControllerTracksChunk:Output())
	P3DFile:SetChunkAtIndex(MultiControllerIDX, MultiControllerChunk:Output())
end

Cache["Phonebooth"..FileName] = P3DFile:Output()
Output(Cache["Phonebooth"..FileName])
