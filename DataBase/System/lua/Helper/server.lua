print("重新加载server.lua")
function server_get_soul(物品编号)
    local configMgr = ConfigMgr:Instance()
    local 配置 = configMgr:GetItem("soul", 物品编号)
    return 配置
end

function engine_gc() 
    local count = collectgarbage("count")
    collectgarbage("collect")
    local collect2 = collectgarbage("count")
    local collected = collect2 - count
    --print("本次收集垃圾数量:"..collected.."kb")
    return collect2
end
