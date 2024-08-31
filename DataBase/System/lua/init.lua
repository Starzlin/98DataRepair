--加上这个就会重载

print("加载lua包")

package.loaded["Config/Class"] = nil
package.loaded["Config/ConfigMgr"] = nil
package.loaded["Common/const"] = nil
package.loaded["Common/func"] = nil
package.loaded["Helper/server"] = nil
package.loaded["Map/scene"] = nil
package.loaded["Npc/npc"] = nil

package.loaded["Player/player"] = nil

package.loaded["Monster/monster"] = nil

package.loaded["Buff/buff"] = nil

require "Config/Class"
require "Config/ConfigMgr"
require "Common/const" --常量数据
require "Common/func" --功能函数
require "Helper/server" --服务器获取相关
require "Map/scene" --地图相关处理
require "Npc/npc" --npc相关交互

require "Player/player" --玩家相关交互

require "Monster/monster" --怪物相关交互

require "Buff/buff"

--下面是和C#代码桥接需要注册的对象

主程 = luanet.import_type("游戏服务器.主程")
计算类 = luanet.import_type("游戏服务器.计算类")
游戏方向 = luanet.import_type("游戏服务器.游戏方向")
物品持久分类 = luanet.import_type("游戏服务器.物品持久分类")
游戏对象职业 = luanet.import_type("游戏服务器.游戏对象职业")
游戏对象性别 = luanet.import_type("游戏服务器.游戏对象性别")
游戏对象类型 = luanet.import_type("游戏服务器.游戏对象类型")
怪物实例 = luanet.import_type("游戏服务器.地图类.怪物实例")
地图处理网关 = luanet.import_type("游戏服务器.地图类.地图处理网关")
游戏数据网关 = luanet.import_type("游戏服务器.数据类.游戏数据网关")
网络服务网关 = luanet.import_type("游戏服务器.网络类.网络服务网关")
地图实例 = luanet.import_type("游戏服务器.地图类.地图实例")
物品实例 = luanet.import_type("游戏服务器.地图类.物品实例")
守卫实例 = luanet.import_type("游戏服务器.地图类.守卫实例")
游戏怪物 = luanet.import_type("游戏服务器.模板类.游戏怪物")
游戏地图 = luanet.import_type("游戏服务器.模板类.游戏地图")
游戏脚本 = luanet.import_type("游戏服务器.模板类.游戏脚本")
地图守卫 = luanet.import_type("游戏服务器.模板类.地图守卫")
地图区域类型 = luanet.import_type("游戏服务器.模板类.地图区域类型")
随机属性 = luanet.import_type("游戏服务器.模板类.随机属性")
游戏对象属性 = luanet.import_type("游戏服务器.游戏对象属性")
装备穿戴部位 = luanet.import_type("游戏服务器.装备穿戴部位")
宠物实例 = luanet.import_type("游戏服务器.地图类.宠物实例")
宠物模式 = luanet.import_type("游戏服务器.宠物模式")
游戏称号 = luanet.import_type("游戏服务器.模板类.游戏称号")
游戏物品 = luanet.import_type("游戏服务器.模板类.游戏物品")
游戏装备 = luanet.import_type("游戏服务器.模板类.游戏装备")
随机属性 = luanet.import_type("游戏服务器.模板类.随机属性")
铭文技能 = luanet.import_type("游戏服务器.模板类.铭文技能")
游戏货币 = luanet.import_type("游戏服务器.游戏货币")
道具实例 = luanet.import_type("游戏服务器.地图类.道具实例")
游戏装备套装 = luanet.import_type("游戏服务器.游戏装备套装")
-------------封包
玩家转移物品 = luanet.import_type("游戏服务器.网络类.玩家转移物品")
同步宠物等级 = luanet.import_type("游戏服务器.网络类.同步宠物等级")
游戏错误提示 = luanet.import_type("游戏服务器.网络类.游戏错误提示")
同步交互结果 = luanet.import_type("游戏服务器.网络类.同步交互结果")
同步玩家外观 = luanet.import_type("游戏服务器.网络类.同步玩家外观")
同步特权信息 = luanet.import_type("游戏服务器.网络类.同步特权信息")
玩家物品变动 = luanet.import_type("游戏服务器.网络类.玩家物品变动")
删除玩家物品 = luanet.import_type("游戏服务器.网络类.删除玩家物品")