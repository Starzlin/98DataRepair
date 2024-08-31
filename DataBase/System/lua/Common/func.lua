print("重新加载func.lua")
--计算类
function FormatNum(num)
  if num <= 0 then
    return 0
  else
    local t1, t2 = math.modf(num)
    ---小数如果为0，则去掉
    if t2 > 0 then
      return num
    else
      return t1
    end
  end
end

function 计算概率(概率)
  if 概率 >= 1.0 then
    return true
  elseif 概率 <= 0.0 then
    return false
  end
  return 概率 * 100000000.0 > randomNum(0, 100000000.0, false);
end

function randomNum(numMin, numMax, setRandom)
  if setRandom then
    math.randomseed(tostring(os.time()):reverse():sub(1, 7)) --设置时间种子
  end
  local reNum = math.random(numMin, numMax)
  return reNum
end

function 获取掉落模板物品数量(模板)
  if 模板 == nil then
    return 0
  end
  return randomNum(模板.CountMin, 模板.CountMax, false)
end

function 计算掉落模板概率(概率)
  if 概率 >= 1000000 then
    return true
  elseif 概率 <= 0 then
    return false
  end
  return 概率 * 1000000 > randomNum(0, 1000000, true);
end

function 从表随机取值(Table, setRandom)
  if setRandom then
    math.randomseed(tostring(os.time()):reverse():sub(1, 7)) --设置时间种子
  end
  return Table[math.random(1, #Table)]
end

function 从几率表随机取值(Table, setRandom)
  if setRandom then
    math.randomseed(tostring(os.time()):reverse():sub(1, 7)) --设置时间种子
  end
  local 返回值 = 0
  local 计次 = 0
  while true do
    值 = Table[math.random(1, #Table)]
    if 计算概率(值[2]) then
      -- print(计次 .. "ci")
      返回值 = 值[1]
      break
    end
    -- if 计次 == 1000 then
    --   print("1000ci")
    --   返回值 = 值[1]
    --   break
    -- end
    -- 计次 = 计次 + 1
  end
  return 返回值
end

--游戏功能类

function 兑换物品(玩家, 拿走编号, 拿走数量, 拿走日志, 给予编号, 给予数量, 给予日志)
  物品列表 = 玩家:查找背包物品(拿走编号, 拿走数量)
  if 物品列表 ~= nil then
    玩家:消耗背包物品(拿走数量, 物品列表, 拿走日志)
    玩家:玩家获得物品(给予编号, 给予数量, 给予日志)
    return true
  else
    return false
  end
end

function 消耗物品(玩家, 拿走编号, 拿走数量, 拿走日志)
  物品列表 = 玩家:查找背包物品(拿走编号, 拿走数量)
  if 物品列表 ~= nil then
    玩家:消耗背包物品(拿走数量, 物品列表, 拿走日志)
    return true
  else
    return false
  end
end

--地图实例类
function 创建副本(模板编号)
  local 地图模板 = 游戏地图.数据表[模板编号]
  local 实例 = 地图处理网关.地图实例表[模板编号 * 16 + 1]
  if 地图模板 ~= nil and 地图模板.副本地图 then
    if 实例 ~= nil then
      local 副本 = 地图实例(地图模板, 实例)
      地图处理网关.副本实例表:Add(副本);
      return 副本
    end
  end
  return nil
end

function 创建宠物(玩家, 怪物)
  local 模板 = 游戏怪物.获取游戏怪物(怪物)
  if 模板 == nil then
    return false
  end
  local 宠物 = 宠物实例(玩家, 模板, 0, 7, false, 0, 2 * 3600)
  if 宠物 ~= nil then
    local 同步 = 同步宠物等级()
    同步.宠物编号 = 宠物.地图编号
    同步.宠物等级 = 宠物.宠物等级
    玩家.网络连接:发送封包(同步)
    local 提示 = 游戏错误提示()
    提示.错误代码 = 9473
    提示.第一参数 = 玩家.宠物模式
    玩家.角色数据.网络连接:发送封包(提示)
    玩家.宠物数据:Add(宠物.宠物数据)
    玩家.宠物列表:Add(宠物)
  end
  return true
end

function 范围刷新怪物从地图实例(怪物名字, 地图实例, 复活间隔, 刷新范围, 禁止复活, 立即刷新)
  local 模板 = 游戏怪物.获取游戏怪物(怪物名字)
  if 模板 == nil then
    return false
  end
  local 怪物 = 怪物实例(模板, 地图实例, 复活间隔, 刷新范围, 禁止复活, 立即刷新)
  怪物.存活时间 = 主程.当前时间:AddHours(2.0)
  return true
end

function 刷新怪物从地图实例(怪物名字, 地图实例, 复活间隔, 刷新坐标X, 刷新坐标Y, 禁止复活
                                     , 立即刷新)
  local 模板 = 游戏怪物.获取游戏怪物(怪物名字)
  if 模板 == nil then
    return false
  end
  local 范围 = Point(刷新坐标X, 刷新坐标Y)
  local 怪物 = 怪物实例(模板, 地图实例, 复活间隔, 范围, 禁止复活, 立即刷新)
  怪物.存活时间 = 主程.当前时间:AddHours(2.0)
  return true
end

function 刷新怪物从地图编号(怪物名字, 地图编号, 复活间隔, 刷新坐标X, 刷新坐标Y, 禁止复活
                                     , 立即刷新)
  local 模板 = 游戏怪物.获取游戏怪物(怪物名字)
  local 地图 = 地图处理网关.分配地图(地图编号)
  if 模板 == nil or 地图 == nil then
    return false
  end
  local 范围 = Point(刷新坐标X, 刷新坐标Y)
  local 怪物 = 怪物实例(模板, 地图, 复活间隔, 范围, 禁止复活, 立即刷新)
  怪物.存活时间 = 主程.当前时间:AddHours(2.0)
  return true
end

function 刷新守卫从地图实例(守卫编号, 地图实例, 出生方向, 出生坐标)
  local 模板 = 地图守卫.数据表[守卫编号]
  if 模板 == nil then
    return nil
  end
  local 守卫 = 守卫实例(模板, 地图实例, 出生方向, 出生坐标)
  return 守卫
end

function 获取在线队友(玩家)
  local 队友列表 = {}
  local 队友数据 = 玩家.队友数据
  if 队友数据 ~= nil then
    for i = 0, 队友数据.Count - 1 do
      if 队友数据[i].网络连接 ~= nil then
        local 队员 = 队友数据[i].网络连接.绑定角色
        table.insert(队友列表, 队员)
      end
    end
  end
  return 队友列表
end

function 穿戴物品(玩家, 物品, 位置)
  local 封包 = 玩家转移物品()
  local 装备 = 玩家.角色装备[位置]
  if 物品 ~= nil and 封包 ~= nil then
      local 原有容器 = 1
      local 目标容器 = 0
      local 目标位置 = 位置
      local 原有位置 = 物品.物品位置.V
      玩家.角色背包:Remove(原有位置)
      物品.物品容器.V = 目标容器
      物品.物品位置.V = 目标位置
      if 装备 ~= nil then
        玩家.角色装备:Remove(目标位置)
        装备.物品容器.V = 原有容器
        装备.物品位置.V = 原有位置
        玩家.角色背包[原有位置] = 装备
      end
      玩家.角色装备[位置] = 物品

      封包.原有容器 = 原有容器
      封包.目标容器 = 目标容器
      封包.原有位置 = 原有位置
      封包.目标位置 = 目标位置
      local 网络 = 玩家.角色数据.网络连接
      网络:发送封包(封包)
      玩家:玩家穿卸装备(部位, 装备, 物品)
      return true
  end
  return false
end

function 获得并穿戴物品(玩家, 编号, 位置, 部位)
  local 封包 = 玩家转移物品()
  local 物品 = 玩家:玩家获得物品(编号, 1)
  local 装备 = 玩家.角色装备[位置]
  if 物品 ~= nil and 封包 ~= nil then
      local 原有容器 = 1
      local 目标容器 = 0
      local 目标位置 = 位置
      local 原有位置 = 物品.物品位置.V
      玩家.角色背包:Remove(原有位置)
      物品.物品容器.V = 目标容器
      物品.物品位置.V = 目标位置
      if 装备 ~= nil then
        玩家.角色装备:Remove(目标位置)
        装备.物品容器.V = 原有容器
        装备.物品位置.V = 原有位置
        玩家.角色背包[原有位置] = 装备
      end
      玩家.角色装备[位置] = 物品
      物品.当前持久.V = 物品.最大持久.V
      封包.原有容器 = 原有容器
      封包.目标容器 = 目标容器
      封包.原有位置 = 原有位置
      封包.目标位置 = 目标位置
      local 网络 = 玩家.角色数据.网络连接
      网络:发送封包(封包)
      玩家:玩家穿卸装备(部位, 装备, 物品)
      玩家.战力加成[玩家.角色装备[位置]] = 玩家.角色装备[位置].装备战力
      玩家.属性加成[玩家.角色装备[位置]] = 玩家.角色装备[位置].装备属性
      玩家:更新物品详情(玩家.角色装备[位置])
      玩家:更新玩家战力()
      玩家:更新对象属性()
      return true
  end
  return false
end

function 获取职业数字(玩家)
  if 玩家.角色职业 == 游戏对象职业.战士 then
    return 1
  elseif 玩家.角色职业 == 游戏对象职业.法师 then
    return 2
  elseif 玩家.角色职业 == 游戏对象职业.刺客 then
    return 3
  elseif 玩家.角色职业 == 游戏对象职业.弓手 then
    return 4
  elseif 玩家.角色职业 == 游戏对象职业.道士 then
    return 5
  elseif 玩家.角色职业 == 游戏对象职业.龙枪 then
    return 6
  else
    return 0
  end
end

function 返回字符结果(变量, ...)
  --print(type(变量))
  if type(变量) == "function" then
      return 变量(...)
  elseif type(变量) == "string" then
      return 变量
  else
    return ""
  end
end

function 是否包含某个极品(装备, 极品编号)
  for i = 0, 装备.随机属性.Count - 1 do
    if 装备.随机属性[i].属性编号 == 极品编号 then
        return true
    end
  end
  return false
end