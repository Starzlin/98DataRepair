function 魔虫窟_执行(地图)
    if 主程.当前时间 > 地图.节点计时 then
        if 地图.副本节点 == 0 and 地图.固定怪物总数 - 地图.存活怪物总数 >= 60 then
            地图.副本节点 = 1
            地图.节点计时 = 主程.当前时间:AddHours(2.0)
            地图:地图公告("<#T:50607>")
            local 怪物刷新 = 获取副本怪物区域(地图, "魔虫窟-BOSS怪物区域"):获取刷新范围()
            范围刷新怪物从地图实例("蛇蝎 魔闪", 地图, 0, 怪物刷新, true, true)
            范围刷新怪物从地图实例("蛇蝎 毒钩", 地图, 0, 怪物刷新, true, true)
            范围刷新怪物从地图实例("蛇蝎 赤牙", 地图, 0, 怪物刷新, true, true)
        else
            地图.节点计时 = 主程.当前时间:AddSeconds(2.0)
        end
    end
end