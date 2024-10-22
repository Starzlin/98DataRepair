### 98DataRepair

> 背景
- 在github上看到`mir-eternal`这么个比较复杂的C#开源项目
- 这个项目是个`3DMir`的模拟器，刚好是个好玩的游戏
- 项目里用到了很多C#的语言特性，这也是用来练习C#的好工具
- 同时，这个项目代码里有很多bug，是练习C#工程bugfix的好工具
- 所以，开了这个仓，用于练习和记录feature及bugfix
- 练习的过程中，会把这个模拟器编译出来，边学边玩

> 声明
- 本项目为已有模拟器开源项目的编译及配置数据的优化项目，用于练习C#编程和Lua脚本
- 下载本项目数据的个人和团体，请勿扩散，并在24小时内删除
- 如果本项目中的内容无意中损害到了您的个人权益，请在issue中告知你的相关权益，以及您建议处理相关数据
- 如果本项目中的内容无意中触犯了您所在地的法律法规，请在issue中告知，本项目将在24小时内删除相关数据

> 数据格式的定义原则
- 如果可以用工具批量生成，不需要人为大量定义的，可以直接用Json方便工具处理
- 如些是不能用工具生成的，就可以仿Mir2那样找个方便人工批量修改的格式

> 进一步背景
- 星空传永团队优化了`mir-eternal`类似的代码，发布了`百牛端`
- `98端`在`百牛端`的基础上，进一步开放了扩展能力和数据配置能力，并发布了免费试玩版本，见`release附件`
- 但98端自带的DataBase不完善，所以，本项目当前变更为了修复DataBase

> 测试方式
- 下载release中的 `98GameServer.zip` 解压
- 下载最新版本的`DataBase`目录解压
- 在98GameServer的setup.ini配置中指定DataBase路径
- 用`本地测试登录器.exe`登录游戏进行测试

