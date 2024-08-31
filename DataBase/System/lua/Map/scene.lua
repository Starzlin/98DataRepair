print("重新加载scene.lua")

package.loaded["Map/yaota"] = nil
package.loaded["Map/tumo"] = nil
package.loaded["Map/mochongku"] = nil
package.loaded["Map/mota"] = nil
package.loaded["Map/xuegong"] = nil
package.loaded["Map/motamijing"] = nil
package.loaded["Map/zhizhuchanglang"] = nil
package.loaded["Map/weizhiandian"] = nil

require "Map/yaota"
require "Map/tumo"
require "Map/mochongku"
require "Map/mota"
require "Map/xuegong"
require "Map/motamijing"
require "Map/zhizhuchanglang"
require "Map/weizhiandian"

function scene_instance_create(地图)

end

function scene_instance_destroy(地图)

end

function scene_instance_run(地图)
  if 地图.地图编号 == 72 then
    魔虫窟_执行(地图)
  end
  if 地图.地图编号 == 73 then
    蜘蛛长廊_执行(地图)
  end
  if 地图.地图编号 == 76 then
    九层魔塔_执行(地图)
  end
  if 地图.地图编号 == 80 then
    屠魔大厅_执行(地图)
  end
  if 地图.地图编号 == 84 then
    学宫_执行(地图)
  end
  if 地图.地图编号 == 88 then
    未知暗殿_执行(地图)
  end
  if 地图.地图编号 == 120 then
    魔塔秘境_执行(地图)
  end
  if 地图.地图编号 == 227 then
    九层妖塔_执行(地图)
  end
end

function scene_instance_player_into(地图, 玩家)
  --print(玩家.对象名字 .. "进入地图" .. 地图.地图模板.地图名字)
end

function scene_instance_player_leave(地图, 玩家)
  
end
---从服务端怪物刷新文件夹中取某个刷怪区域，需要刷怪区域文件中包含"区域名字"的参数
---@param 地图 地图实例
---@param 区域名字 string
---@return nil
function 获取副本怪物区域(地图, 区域名字)
  local 刷怪列表 = 地图:获取怪物区域()
  for i = 0, 刷怪列表.Count - 1 do
    local 刷怪信息 = 刷怪列表[i]
    if 刷怪信息.区域名字 == 区域名字 then
      return 刷怪信息
    end
  end
  return nil
end
