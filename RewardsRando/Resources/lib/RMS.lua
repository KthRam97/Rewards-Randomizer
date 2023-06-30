RMS = {}

local pack = string.pack
local unpack = string.unpack
local concat = table.concat

RMS.File = {}
function RMS.File:new(Raw, DataModifier)
	local RetVal = {}
	
	local idx, num, bits
	
	num, idx = unpack("I", Raw)
	local References = {unpack(string.rep("I", num), Raw, idx)}
	idx = References[#References]
	RetVal.References = {}
	for i=1,#References - 1 do
		RetVal.References[i] = {References[i]}
	end
	bits, idx = unpack("I", Raw, idx)
	assert(bits % 8 == 0, "Invalid RMS file - Incorrect number of bits")
	local baseIdx = idx
	
	local Offsets = {}
	for i=1,#RetVal.References do
		RetVal.References[i][2] = unpack("I", Raw, baseIdx + RetVal.References[i][1] / 8)
		RetVal.References[i][2] = RetVal.References[i][2] / 8
		Offsets[i] = RetVal.References[i][2]
	end
	table.sort(Offsets)
	
	RetVal.Data = {}
	local startPos = baseIdx
	for i=1,#Offsets do
		local Data = DataModifier and DataModifier(Raw:sub(startPos, baseIdx + Offsets[i] - 1)) or Raw:sub(startPos, baseIdx + Offsets[i] - 1)
		RetVal.Data[i] = Data
		startPos = baseIdx + Offsets[i]
	end
	RetVal.Data[#RetVal.Data + 1] = Raw:sub(startPos)
	
	self.__index = self
	return setmetatable(RetVal, self)
end

function RMS.File:Output()
	local Output = {}
	local References = {}
	for i=1,#self.References do
		References[i] = self.References[i][1]
	end
	
	local DataStr = concat(self.Data)
	Output[1] = pack("I" .. string.rep("I", #References), #References, table.unpack(References))
	Output[2] = pack("I", DataStr:len() * 8)
	Output[3] = DataStr
	return concat(Output)
end