function buff_add(对象, Buff数据) --增加BUFF
    local 模版 = Buff数据.Buff模板
    if 对象.对象类型 == 游戏对象类型.玩家 then
        -- 天赋 致命守护
        local 职业对应BUFF26417 = {
            [游戏对象职业.战士] = 26411,
            [游戏对象职业.法师] = 26412,
            [游戏对象职业.道士] = 26413,
            [游戏对象职业.刺客] = 26414,
            [游戏对象职业.弓手] = 26415,
            [游戏对象职业.龙枪] = 26416,
        }
        if 模版.Buff编号 == 26417 and 对象.对象类型 == 游戏对象类型.玩家 then
            对象:添加Buff时处理(职业对应BUFF26417[对象.角色职业], 对象)
        end

        -- 龙枪 燃血化元
        if 模版.Buff编号 == 12060 then
            if 对象.主体技能表:ContainsKey(1211) then
                if 对象.主体技能表[1211].铭文编号 == 3 then
                    对象:删除Buff时处理(12110)
                    对象:删除Buff时处理(12111)
                    对象:删除Buff时处理(12112)
                    对象:删除Buff时处理(12114)
                    对象:添加Buff时处理(12110, 对象)
                    对象:添加Buff时处理(12112, 对象)
                else
                    对象:删除Buff时处理(12112)
                    对象:删除Buff时处理(12114)
                    对象:添加Buff时处理(12110, 对象)
                end
            end
        end

        if 模版.Buff编号 == 12061 then
            if 对象.主体技能表:ContainsKey(1211) then
                if 对象.主体技能表[1211].铭文编号 == 3 then
                    对象:删除Buff时处理(12110)
                    对象:删除Buff时处理(12111)
                    对象:删除Buff时处理(12112)
                    对象:删除Buff时处理(12114)
                    对象:添加Buff时处理(12112, 对象)
                    对象:添加Buff时处理(12110, 对象)
                else
                    对象:删除Buff时处理(12110)
                    对象:删除Buff时处理(12111)
                    对象:添加Buff时处理(12112, 对象)
                end
            end
        end
    end
end

function buff_remove(对象, Buff数据) --移除BUFF
    local 模版 = Buff数据.Buff模板
    local 职业对应BUFF26307 = {
        [游戏对象职业.战士] = 26301,
        [游戏对象职业.法师] = 26302,
        [游戏对象职业.道士] = 26303,
        [游戏对象职业.刺客] = 26304,
        [游戏对象职业.弓手] = 26305,
        [游戏对象职业.龙枪] = 26306,
    }
    if 模版.Buff编号 == 26307 and 对象.对象类型 == 游戏对象类型.玩家 then
        对象:添加Buff时处理(职业对应BUFF26307[对象.角色职业], 对象)
    end
end

function buff_delete(对象, Buff数据)
    local 模版 = Buff数据.Buff模板
    if 对象.对象类型 == 游戏对象类型.玩家 then
        if 模版.Buff编号 == 12120 then
            if 对象.生效龙卫:ContainsKey(1126) then
                对象:添加Buff时处理(12125, 对象)
            end
            对象:添加Buff时处理(12126, 对象)
        end

        if 模版.Buff编号 == 12121 then
            if 对象.生效龙卫:ContainsKey(1126) then
                对象:添加Buff时处理(12125, 对象)
            end
            对象:添加Buff时处理(12123, 对象)
            对象:添加Buff时处理(12127, 对象)
        end

        if 模版.Buff编号 == 12122 then
            if 对象.生效龙卫:ContainsKey(1126) then
                对象:添加Buff时处理(12125, 对象)
            end
            对象:添加Buff时处理(12124, 对象)
            对象:添加Buff时处理(12128, 对象)
        end
    end
end

function buff_run(对象, Buff数据)

end