RMS = {}

local pack = string.pack
local unpack = string.unpack
local concat = table.concat

RMS.Value = {}
function RMS.Value:new(RMSFile, Address)
	local RetVal = {}
	RetVal.RMSFile = RMSFile
	RetVal.Address = Address
	
	self.__index = self
	return setmetatable(RetVal, self)
end

RMS.File = {}
function RMS.File:new(Raw)
	local RetVal = {}
	RMS.ValuesByAddress = {}
	
	local num, idx = unpack("I", Raw)
	local References = {unpack(string.rep("I", num), Raw, idx)}
	idx = References[#References]
	RetVal.References = {}
	for i=1,#References - 1 do
		RetVal.References[i] = {References[i], math.maxinteger}
	end
	local bits, idx = unpack("I", Raw, idx)
	RetVal.Data = Raw:sub(idx, idx + bits / 8 - 1)
	
	--RetVal.Project = GetValue(0).GetInterface
	
	self.__index = self
	return setmetatable(RetVal, self)
end

function RMS.File:GetValue(Address)
	self.ValuesByAddress[Address] = self.ValuesByAddress[Address] or RMS.Value:new(self, Addres)
	return self.ValuesByAddress[Address]
end

function RMS.File:Output()
	local Output = {}
	local References = {}
	for i=1,#self.References do
		References[i] = self.References[i][1]
	end
	local Data = self.Data
	--TODO: Build Data
	Output[1] = pack("I" .. string.rep("I", #References), #References, table.unpack(References))
	Output[2] = pack("I", Data:len() * 8)
	Output[3] = Data
	return concat(Output)
end