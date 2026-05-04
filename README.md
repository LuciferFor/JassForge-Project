# JassForge Project Template

这是一个用于 Warcraft III 地图脚本开发的 JassForge 脚手架项目。项目把 JassForge 编译器、地图脚本目录、JASS include/import、PowerShell 构建入口和示例代码放在一起，方便快速编译 `war3map.j` 并写入 `Map.w3x`。

当前示例代码位于 `JassFrame/JassCode/Project/Main/Main.j`，主要用于展示 JassForge 相比传统 JASS/vJASS 的语言能力。

## 特性概览

- Zinc 风格语法：使用 `{}`、`;`、`->` 返回类型。
- 强类型枚举：避免裸整数常量混用。
- 默认参数与 `&` 引用参数。
- 静态局部变量。
- 函数指针类型与 `sys::function<函数名>` 精确绑定。
- lambda 与闭包：`TimerStart`、`ForGroup` 回调中可直接捕获外层变量。
- 泛型结构体：如 `Box<integer>`、`Box<string>`。
- `new/delete/let` 生命周期语法。
- 结构体反射：`at/size/type`。
- 标准容器：`sys::vector`、`sys::stack`、`sys::queue`、`sys::map`。
- hashtable 双下标语法糖。
- 数组初始化、raw string、interpreter 分组。

更多语法细节见 `JassForge_语言参考.md`。

## 目录结构

```text
.
├── JassFrame/
│   ├── JassCode/
│   │   └── Project/Main/Main.j   # 示例业务代码入口
│   ├── include/
│   │   ├── main.j                # 地图主入口脚本
│   │   └── EXJapi.j              # EXJapi/YDWE 相关声明
│   └── import/
│       ├── common.j
│       ├── blizzard.j
│       ├── DzAPI.j
│       └── Platformapi_common.j
├── jassforge.exe                 # JassForge 编译器
├── makefile.common.ps1           # 通用配置与构建流程
├── makefile.ps1                  # 普通构建入口
├── makefile_run.ps1              # 构建后直接启动 War3
├── makefile1.ps1                 # 计划任务启动兼容入口
├── Map.w3x                       # 地图模板/目标地图
└── JassForge_语言参考.md          # 语言参考文档
```

## 快速开始

### 1. 修改本机路径配置

打开 `makefile.common.ps1`，根据你的机器修改这些配置：

- `$YdweExe`：YDWE 启动器路径。
- `$YdweSearchRoot`：YDWE 自动搜索根目录。
- `$WatcherSyncPairs`：资源同步源目录和魔兽导入目录。
- `$MapFile`：要写入的地图文件，默认是 `.\Map.w3x`。
- `$MapCopyTarget`：构建后复制地图到的位置；不需要复制时可留空。

相对路径默认以脚本所在目录为根目录。

### 2. 编译地图

```powershell
powershell -ExecutionPolicy Bypass -File .\makefile.ps1
```

该命令会：

- 初始化控制台编码。
- 启动资源同步器 `sync.exe`，如果配置了同步目录。
- 调用 `jassforge.exe` 编译 `JassFrame/JassCode`。
- 输出 `war3map.j`。
- 将脚本和资源写入 `Map.w3x`。
- 按配置复制构建后的地图。

### 3. 编译并启动 War3 测试

```powershell
powershell -ExecutionPolicy Bypass -File .\makefile_run.ps1
```

该入口会在编译成功后通过 YDWE 启动 Warcraft III 并加载地图。

如果你需要通过 Windows 计划任务把启动命令投递到交互桌面，可以使用：

```powershell
powershell -ExecutionPolicy Bypass -File .\makefile1.ps1
```

## 示例入口

示例库在：

```text
JassFrame/JassCode/Project/Main/Main.j
```

入口函数为：

```jass
function onInit() {
    BJDebugMsg("===== JassForge 编译器特性 Demo =====");
    // ...
}
```

编译后，`onInit()` 会由库初始化流程自动调用。你可以直接修改这个文件，或在 `JassFrame/JassCode` 下新增自己的模块。

## 推荐开发方式

1. 以 Zinc 风格为主，保持函数、结构体、枚举声明清晰。
2. 公共模块使用 `library` 拆分。
3. 结构体方法建议显式写 `public/private`。
4. 容器优先使用 `sys::vector/sys::map/sys::stack/sys::queue`。
5. 回调逻辑优先使用 lambda/闭包，减少手动 hashtable 传参。
6. 临时结构体对象优先使用 `let`，需要手动控制生命周期时使用 `new/delete`。
7. 编译器特性更新后，同步维护 `JassForge_语言参考.md`。

## 打包与提交注意

脚手架对外发布前建议检查这些内容：

- 不要提交 `.vscode/jass-cache/`，里面会记录本机和其他项目的绝对路径。
- 不要提交生成文件 `war3map.j`，除非你明确需要保留生成结果。
- `makefile.common.ps1` 中的 YDWE、Warcraft III、同步目录路径建议改成示例值或本地配置。
- `Map.w3x` 建议使用干净模板地图，避免把个人工作地图打进脚手架。
- `Storm.dll`、`jassforge.exe` 等二进制文件请确认来源和分发许可。

## 常见问题

### PowerShell 无法运行脚本

使用带 `ExecutionPolicy Bypass` 的命令运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\makefile.ps1
```

### YDWE 路径不存在

先检查 `makefile.common.ps1` 中的 `$YdweExe`。如果路径不存在，脚本会尝试从 `$YdweSearchRoot` 递归查找 `$YdweExecutableName`。

### 编译成功但地图没有更新

检查：

- `$MapFile` 是否指向正确的 `.w3x`。
- `$MapCopyTarget` 是否复制到了你实际测试的地图位置。
- `jassforge.exe` 输出是否提示已经重建并导入文件。

## 许可证

请根据你实际准备公开的编译器、依赖 DLL、地图模板和示例代码授权方式补充许可证说明。
