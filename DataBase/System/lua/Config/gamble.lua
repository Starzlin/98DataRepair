--[[Notice:This lua config file is auto generate by Xls2Lua Tools，don't modify it manually! --]]
local fieldIdx = {}
fieldIdx.id = 1
fieldIdx.GambleType = 2
fieldIdx.GambleLevel = 3
fieldIdx.CostItemID = 4
fieldIdx.CostItemCount = 5
fieldIdx.CostMoney = 6
fieldIdx.BossCount1 = 7
fieldIdx.BossGroupID1 = 8
fieldIdx.BossTipID1 = 9
fieldIdx.BossCount2 = 10
fieldIdx.BossGroupID2 = 11
fieldIdx.BossTipID2 = 12
fieldIdx.BossCount3 = 13
fieldIdx.BossGroupID3 = 14
fieldIdx.BossTipID3 = 15
fieldIdx.BossCount4 = 16
fieldIdx.BossGroupID4 = 17
fieldIdx.BossTipID4 = 18
local data = {
{[[ITEMSUBTYPE_INVALID]],[[egtInvalid]],0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_WEAPON]],[[egtEquipWeapon]],0,111001,90,0,60,1000011,0,6000,1000012,0,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_CHEST_ARMOR]],[[egtEquipChestArmor]],0,111001,90,0,1000,1000051,0,0,0,0,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_HAT]],[[egtEquipHat]],0,111001,75,0,50,1000061,0,5000,1000062,0,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_NECKLACE]],[[egtEquipNecklace]],0,111001,60,0,25,1000021,0,600,1000022,0,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_RING]],[[egtEquipRing]],0,111001,60,0,10,1000031,0,300,1000032,0,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_BRACELET]],[[egtEquipBracelet]],0,111001,75,0,10,1000041,0,500,1000042,0,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_WEAPON]],[[egtEquipWeapon]],1,111008,90,0,1000,1100011,0,2500,1100012,113,6000,1100013,114,0,0,0},
{[[ITEMSUBTYPE_EQUIP_CHEST_ARMOR]],[[egtEquipChestArmor]],1,111008,90,0,1200,1100051,0,0,0,0,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_NECKLACE]],[[egtEquipNecklace]],1,111008,60,0,1500,1100021,0,12000,1100022,115,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_RING]],[[egtEquipRing]],1,111008,60,0,400,1100031,0,0,0,0,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_BRACELET]],[[egtEquipBracelet]],1,111008,75,0,180,1100041,0,0,0,0,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_BELT]],[[egtEquipBelt]],1,111008,75,0,400,1100081,0,0,0,0,0,0,0,0,0,0},
{[[ITEMSUBTYPE_EQUIP_SHOES]],[[egtEquipShoes]],1,111008,75,0,400,1100071,0,0,0,0,0,0,0,0,0,0},}
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