function 九层妖塔_烈火祭坛_主对话(玩家, 对话守卫, 选项编号, 界面层数)
    if 玩家.Buff列表:ContainsKey(58001) or 玩家.Buff列表:ContainsKey(58011) then
      return ""
    end
    对话守卫:移除Buff时处理(58002)
    对话守卫:移除Buff时处理(58003)
    玩家:添加Buff时处理(58001, nil)
    --对话守卫:发送聊天信息("May the force be with you")
end
return 九层妖塔_烈火祭坛_主对话