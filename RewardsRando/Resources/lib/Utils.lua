function GetGamePath(Path)
	Path = FixSlashes(Path,false,true)
	if Path:sub(1,1) ~= "/" then Path = "/GameData/"..Path end
	return Path
end

function Clamp(Value, Lo, Hi)
	if Value < Lo then return Lo end
	if Hi < Value then return Hi end
	return Value
end

local std_bs = { [0] =
	'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
	'Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f',
	'g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v',
	'w','x','y','z','0','1','2','3','4','5','6','7','8','9','+','/',
}

local std_bsi = {}
for i=0,#std_bs do
	std_bsi[string.byte(std_bs[i])] = i
end

function base64(s, bs)
	if bs == nil then
		bs = std_bs
	end
	local byte, rep = string.byte, string.rep
	local pad = 2 - ((#s-1) % 3)
	s = (s..rep('\0', pad)):gsub("...", function(cs)
		local a, b, c = byte(cs, 1, 3)
		return bs[a>>2] .. bs[(a&3)<<4|b>>4] .. bs[(b&15)<<2|c>>6] .. bs[c&63]
	end)
	return s:sub(1, #s-pad) .. rep('=', pad)
end

function base64dec(s, bs, bsi)
	if bs == nil then
		bs = std_bs
		bsi = std_bsi
	end
	if bsi == nil then
		bsi = {}
		for i=0,#bs do
		bsi[string.byte(bs[i])] = i
		end
	end
	s = s:gsub("[^A" .. table.concat(bs) .. "=]", "")
	local p = ''
	if s:sub(#s) == '=' then
		if s:sub(#s - 1) == '=' then
			p = 'AA'
		else
			p = 'A'
		end
		s = s:sub(1, #s - #p) .. p
	end
	s = s:gsub("....", function(cs)
		local a, b, c, d = string.byte(cs, 1, 4)
		local n = (bsi[a] << 18) + (bsi[b] << 12) + (bsi[c] << 6) + bsi[d]
		return string.char((n >> 16) & 255, (n >> 8) & 255, n & 255)
	end)
	return s:sub(1, #s - #p)
end