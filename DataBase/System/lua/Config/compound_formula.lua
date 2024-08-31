--[[Notice:This lua config file is auto generate by Xls2Lua Tools，don't modify it manually! --]]
local fieldIdx = {}
fieldIdx.id = 1
fieldIdx.ItemID1 = 2
fieldIdx.ItemCount1 = 3
fieldIdx.ItemID2 = 4
fieldIdx.ItemCount2 = 5
fieldIdx.ItemID3 = 6
fieldIdx.ItemCount3 = 7
fieldIdx.ItemID4 = 8
fieldIdx.ItemCount4 = 9
fieldIdx.ResultItem = 10
fieldIdx.Money = 11
local data = {
{1,140001,3,0,0,0,0,0,0,140002,50000},
{2,140002,3,0,0,0,0,0,0,140003,150000},}
local mt = {}
mt.__index = function(a,b)
	if fieldIdx[b] then
		return a[fieldIdx[b]]
	end
	return nil
end
mt.__newindex = function(t,k,v)
	error('do not edit config')
end
mt.__metatable = false
for _,v in ipairs(data) do
	setmetatable(v,mt)
end
return data