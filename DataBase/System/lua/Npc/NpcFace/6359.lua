function 未知暗殿_小莹_主对话(玩家, 对话守卫, 选项编号, 界面层数)
    if 玩家.管理员模式 then
        玩家:发送系统消息("".. 玩家.对话页面 .."")
    end

    if 玩家.对话页面 == 0 then
        return "<#P0:0><#P1:0><#T:667293>"
    end

    if 玩家.对话页面 == 1 then
        if 玩家.所属队伍 ~= nil and 玩家.所属队伍.队长编号 == 玩家.地图编号 then -- 检测是不是队长
            local 所需物品 = 玩家:查找背包物品(90235, 1)
            if 所需物品 == nil then
                return "<#P0:0><#P1:0><#T:667285>" --你没有黑曜石 无法进入
            else
                local 队长地图 = 玩家.当前地图.地图编号
                local 玩家列表 = 获取在线队友(玩家)
                for key, value in pairs(玩家列表) do
                    local 队员 = value
                    if 玩家.角色数据.脚本变量[数字_未知二层每日进入次数] == tonumber(os.date("%j")) then
                        return "<#P0:0><#P1:0><#T:667312>"
                    elseif 队员.当前地图.地图编号 ~= 队长地图 then
                        return "<#P0:0><#P1:0><#T:980025>" --报名时需要全体队员都在本地图
                    end
                end

                local 未知暗殿 = 创建副本(88)
                if 未知暗殿 ~= nil then
                    未知暗殿.副本主人 = 玩家.地图编号
                    未知暗殿:初始化副本怪物(180) --存货时间
                    未知暗殿:初始化副本守卫()
                    未知暗殿.节点计时 = 主程.当前时间:AddSeconds(1.0)
                    玩家:消耗背包物品(1, 所需物品)
                    local 玩家列表 = 获取在线队友(玩家)
                    for key, value in pairs(玩家列表) do
                        local 队员 = value
                        玩家.角色数据.脚本变量[数字_未知二层每日进入次数] = tonumber(os.date("%j"))
                        队员:玩家切换地图(未知暗殿, 地图区域类型.未知区域, Point(1142, 211))
                    end
                end
            end
        else
            return "<#P0:0><#P1:0><#T:50660>" --你不是队长。<#SO:1>确定<#SO/>
        end
    end
end
return 未知暗殿_小莹_主对话


-- local 未知暗殿 = 创建副本(88)
-- if 未知暗殿 ~= nil then
--     未知暗殿:初始化副本怪物(180)
--     未知暗殿:初始化副本守卫()
--     未知暗殿.节点计时 = 主程.当前时间:AddSeconds(10.0)
--     local 玩家列表 = 获取在线队友(玩家)
--     for key, value in pairs(玩家列表) do
--       local 队员 = value
--       local 所需物品 = 队员:查找背包物品(90235, 1)
--       if 所需物品 ~= nil then
--       end
--       队员:玩家切换地图()
--     end
-- end