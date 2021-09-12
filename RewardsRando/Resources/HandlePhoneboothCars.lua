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
elseif RemoveAllWheels[FileNameNoExtension] then
	local P3DFile = P3D.P3DChunk:new{Raw = ReadFile(FilePath)}
	RemoveProps(P3DFile, {["wShape0"]=true,["wShape1"]=true,["wShape2"]=true,["wShape3"]=true})
	Cache["Phonebooth"..FileName] = P3DFile:Output()
	Output(Cache["Phonebooth"..FileName])
elseif RemoveFrontWheels[FileNameNoExtension] then
	local P3DFile = P3D.P3DChunk:new{Raw = ReadFile(FilePath)}
	RemoveProps(P3DFile, {["wShape2"]=true,["wShape3"]=true})
	Cache["Phonebooth"..FileName] = P3DFile:Output()
	Output(Cache["Phonebooth"..FileName])
else
	Redirect(FilePath)
end