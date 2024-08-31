--[[Notice:This lua config file is auto generate by Xls2Lua Tools，don't modify it manually! --]]
local fieldIdx = {}
fieldIdx.id = 1
fieldIdx.CardTimeType = 2
fieldIdx.Cost = 3
fieldIdx.Time = 4
fieldIdx.RewardItemID1 = 5
fieldIdx.RewardItemCount1 = 6
fieldIdx.RewardItemID2 = 7
fieldIdx.RewardItemCount2 = 8
fieldIdx.RewardItemID3 = 9
fieldIdx.RewardItemCount3 = 10
fieldIdx.RewardItemID4 = 11
fieldIdx.RewardItemCount4 = 12
fieldIdx.RewardItemID5 = 13
fieldIdx.RewardItemCount5 = 14
fieldIdx.RewardItemID6 = 15
fieldIdx.RewardItemCount6 = 16
fieldIdx.RewardItemID7 = 17
fieldIdx.RewardItemCount7 = 18
fieldIdx.RewardItemID8 = 19
fieldIdx.RewardItemCount8 = 20
fieldIdx.RewardItemID9 = 21
fieldIdx.RewardItemCount9 = 22
fieldIdx.RewardItemID10 = 23
fieldIdx.RewardItemCount10 = 24
fieldIdx.RewardItemID11 = 25
fieldIdx.RewardItemCount11 = 26
fieldIdx.RewardItemID12 = 27
fieldIdx.RewardItemCount12 = 28
fieldIdx.RewardItemID13 = 29
fieldIdx.RewardItemCount13 = 30
fieldIdx.RewardItemID14 = 31
fieldIdx.RewardItemCount14 = 32
fieldIdx.RewardItemID15 = 33
fieldIdx.RewardItemCount15 = 34
fieldIdx.RewardItemID16 = 35
fieldIdx.RewardItemCount16 = 36
fieldIdx.RewardItemID17 = 37
fieldIdx.RewardItemCount17 = 38
fieldIdx.RewardItemID18 = 39
fieldIdx.RewardItemCount18 = 40
fieldIdx.RewardItemID19 = 41
fieldIdx.RewardItemCount19 = 42
fieldIdx.RewardItemID20 = 43
fieldIdx.RewardItemCount20 = 44
fieldIdx.RewardItemID21 = 45
fieldIdx.RewardItemCount21 = 46
fieldIdx.RewardItemID22 = 47
fieldIdx.RewardItemCount22 = 48
fieldIdx.RewardItemID23 = 49
fieldIdx.RewardItemCount23 = 50
fieldIdx.RewardItemID24 = 51
fieldIdx.RewardItemCount24 = 52
fieldIdx.RewardItemID25 = 53
fieldIdx.RewardItemCount25 = 54
fieldIdx.RewardItemID26 = 55
fieldIdx.RewardItemCount26 = 56
fieldIdx.RewardItemID27 = 57
fieldIdx.RewardItemCount27 = 58
fieldIdx.RewardItemID28 = 59
fieldIdx.RewardItemCount28 = 60
local data = {
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{1,1,12800,30,1500369,1,1500368,1,80201,1,2201,2,1370210,3,80003,1,80003,1,100003,1,80203,1,1500368,1,2201,2,1370210,3,80203,1,1500372,1,1370210,3,1500368,1,1370210,3,80203,1,2201,2,1370210,3,1500370,1,1500368,1,80203,1,1370210,3,100003,1,1500368,1,80202,1,1500371,1},
{2,1,28800,30,1410099,1,1500819,1,1370212,2,1500820,1,1500821,1,91184,2,91184,2,80003,2,80003,2,1370212,2,1500819,1,1500822,1,1370212,2,1500823,1,1370212,2,1500821,1,91184,2,91184,2,1500819,1,1370212,2,1500824,1,1370212,2,1500821,1,1370212,2,91163,2,1500825,1,91115,1,111109,1},
{3,1,12800,30,1410100,1,1500369,1,80201,1,91184,2,1370210,3,80003,2,80003,2,100003,1,80203,1,1500368,1,91184,2,1370210,3,80203,1,1500372,1,1370210,3,1500368,1,1370210,3,80203,1,2201,2,1370210,3,1500370,1,1500368,1,80206,1,1370210,3,91184,2,1500368,1,80202,1,91211,1},
{4,1,28800,30,1410099,1,1500819,1,1370212,2,1500820,1,1500821,1,91184,2,91184,2,80003,3,80003,3,1370212,2,1500819,1,1500822,1,1370212,2,1500823,1,1370212,2,1500821,1,91184,2,1500819,1,1370212,2,1500824,1,1370212,2,80206,1,1370212,2,91163,4,1500825,1,91115,1,1600016,1,111109,1},
{5,1,28800,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{6,1,6800,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{7,1,58800,30,1410104,1,1500892,1,1500894,1,1500893,1,1500895,1,91184,4,1500892,1,1500897,1,80003,5,1500895,1,1500892,1,41002,8,1500893,1,111109,1,91211,2,1500892,1,1500896,1,91184,4,80003,5,1500892,1,91184,4,1500892,1,1500892,1,91163,4,1500895,1,91115,2,1600016,2,111109,1},}
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