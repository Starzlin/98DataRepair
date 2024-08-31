function 盟重省_星移_主对话(玩家, 对话守卫, 选项编号, 界面层数)
  if 玩家.管理员模式 then
    玩家:发送系统消息("".. 玩家.对话页面 .."")
  end

  if 玩家.对话页面 == 0 then
    local 当前时间 = tonumber(os.date("%H"))
    if 主程.开区节点 < 5 then
      return "该玩法将在苍月版本开放，可以通过快捷键W查看版本内容详情！<#SO:99>知道了<#SO/>"
    elseif 当前时间 < 10 or 当前时间 > 23 then
      return "目前不是开放时间，无法进入，未知暗殿每天10~22点开放。<#SO:99>知道了<#SO/>"
    else
      return "勇士们，暗殿中有很多未知的危险，等级达到30级即可进入。若有兴趣，还可在我这里领取一些任务委托后再前往探险，完成委托可以获得丰厚的收益。<#SO:1>进入未知暗殿<#SO/><#SO:2>兑换暗殿钥匙<#SO/>"
    end
  end

  if 玩家.对话页面 == 1 then
    if 玩家.角色数据.脚本变量[数字_未知一层每日进入次数] == tonumber(os.date("%j")) and 玩家.Buff列表:ContainsKey(2628) == nil then
      return "<#P0:30><#P1:0><#T:667422>" --拥有BUFF“未知暗殿”期间可以进入，您今日进入时间已结束，请明日再来挑战吧。<#SO:1>知道了<#SO/>
    else
      return "<#P0:0><#P1:0><#T:667421>" --请选择您要进入的方式。<#SO:1>消耗1枚未知暗殿秘符<#SO/><#SO:2>消耗50000金币<#SO/>
    end
  end

  if 玩家.对话页面 == 2 then
    return "<#D>我这里有几种类型的钥匙，不同类型的钥匙能打开的宝箱也不同，请问你想兑换哪种钥匙呢？<#D/><#SO:1>兑换铜钥匙（20张灵符）<#SO/><#SO:2>兑换银钥匙（600张灵符）<#SO/><#SO:3>兑换金钥匙（4800张灵符）<#SO/>"
  end

  if 玩家.对话页面 == 11 then
    local 所需物品 = 玩家:查找背包物品(90234, 1)
    if 玩家.当前等级 < 30 then
      return "<#P0:30><#P1:0><#T:667416>" --不好意思，您的等级不足，请到达[`~]级以后再来！<#SO:1>知道了<#SO/>
    elseif 所需物品 == nil then
      return "<#P0:30><#P1:0><#T:667283>" --你身上没有未知暗殿秘符，暂时无法进入。<#SO:1>知道了<#SO/>
    elseif 玩家.角色数据.脚本变量[数字_未知一层每日进入次数] == tonumber(os.date("%j")) then
      if 玩家.Buff列表:ContainsKey(2628) then
        玩家:消耗背包物品(1, 所需物品)
        玩家:玩家切换地图(87, 852, 383, 0)
      else
        return "<#P0:30><#P1:0><#T:667422>" --拥有BUFF“未知暗殿”期间可以进入，您今日进入时间已结束，请明日再来挑战吧。<#SO:1>知道了<#SO/>
      end
    else
      玩家:消耗背包物品(1, 所需物品)
      玩家:玩家切换地图(87, 852, 383, 0)
      玩家:添加Buff时处理(2628, nil) --限时3小时
      if 计算类.转换时间(玩家.角色数据.角色变量[692]).Date ~= 主程.当前时间.Date then
        玩家:修改角色变量(692, 计算类.时间转换(主程.当前时间))
      end
    end
  end

  if 玩家.对话页面 == 12 then
    if 玩家.当前等级 < 30 then
      return "<#P0:30><#P1:0><#T:667416>" --不好意思，您的等级不足，请到达[`~]级以后再来！<#SO:1>知道了<#SO/>
    elseif 玩家.金币数量 < 50000 then
      return "<#P0:30><#P1:0><#T:668249>" --你的金币不足哦，无法传送。<#SO:1>知道了<#SO/>
    elseif 玩家.角色数据.脚本变量[数字_未知一层每日进入次数] == tonumber(os.date("%j")) then
      if 玩家.Buff列表:ContainsKey(2628) then
        玩家.金币数量 = 玩家.金币数量 - 50000
        玩家:玩家切换地图(87, 852, 383, 0)
      else
        return "<#P0:30><#P1:0><#T:667422>" --拥有BUFF“未知暗殿”期间可以进入，您今日进入时间已结束，请明日再来挑战吧。<#SO:1>知道了<#SO/>
      end
    else
      玩家.金币数量 = 玩家.金币数量 - 50000
      玩家:玩家切换地图(87, 852, 383, 0)
      玩家:添加Buff时处理(2628, nil) --限时3小时
      if 计算类.转换时间(玩家.角色数据.角色变量[692]).Date ~= 主程.当前时间.Date then
        玩家:修改角色变量(692, 计算类.时间转换(主程.当前时间))
      end
    end
  end

  if 玩家.对话页面 == 21 then
    local 物品 = 玩家:查找背包物品(90226, 20)
    if 物品 ~= nil then
      玩家:消耗背包物品(20, 物品, "兑换铜钥匙")
      玩家:玩家获得物品(91164, 1)
    else
      return "您的灵符数量不足，请确认后再来兑换！<#SO:99>知道了<#SO/>"
    end
  end

  if 玩家.对话页面 == 22 then
    local 物品 = 玩家:查找背包物品(90226, 600)
    if 物品 ~= nil then
      玩家:消耗背包物品(600, 物品, "兑换银钥匙")
      玩家:玩家获得物品(91165, 1)
    else
      return "您的灵符数量不足，请确认后再来兑换！<#SO:99>知道了<#SO/>"
    end
  end

  if 玩家.对话页面 == 23 then
    local 物品 = 玩家:查找背包物品(90226, 4800)
    if 物品 ~= nil then
      玩家:消耗背包物品(4800, 物品, "兑换金钥匙")
      玩家:玩家获得物品(91166, 1)
    else
      return "您的灵符数量不足，请确认后再来兑换！<#SO:99>知道了<#SO/>"
    end
  end
end
return 盟重省_星移_主对话