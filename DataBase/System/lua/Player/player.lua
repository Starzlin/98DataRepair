local 武器幸运表 = {
  [0] = {0.8, 0.001},
  [1] = {0.6, 0.001},
  [2] = {0.4, 0.001},
  [3] = {0.2, 0.001},
  [4] = {0.05, 0.001},
  [5] = {0.005, 0.001},
  [6] = {0.0005, 0.001},
}

function player_clear_everyday(角色数据) --12点清除变量
  角色数据.脚本变量[数字_魔虫窟每日进入次数] = 0
end

function player_useitem(玩家, 物品) -- 使用物品
  if 物品.物品编号 == 1500250 then
    玩家:消耗背包物品(1, 物品)
    玩家.金币数量 = 玩家.金币数量 + randomNum(1000, 10000, false)
    return 1
  end

  return 0
end