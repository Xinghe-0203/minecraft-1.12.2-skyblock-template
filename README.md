# 1.12.2 我的世界空岛服务器模板

> 星空岛 — 基于 Paper 1.12.2 的中文空岛生存服务器模板，开箱即用

---

## 服务器简介

**星空岛**是一个基于 Paper 1.12.2 的空岛生存服务器模板，所有玩家界面已全面中文化，内置完善的经济系统、商店系统、领地保护和权限管理。适合直接部署或作为二次开发的基础模板。

### 核心特性

- **全面中文化** — 所有玩家可见的提示、消息、商店界面均为中文
- **内置经济系统** — 星币货币体系，初始余额 500，NPC 商店 + 玩家商店双轨并行
- **空岛玩法** — ASkyBlock 空岛世界，独立的空岛生成器
- **领地保护** — WorldGuard 区域保护，主城 1000x1000 安全区
- **权限管理** — LuckPerms 权限组系统，支持网页编辑器
- **新手友好** — 自动发放新手礼包，传送系统完善
- **账号安全** — AuthMe 强制注册 + SHA256 密码哈希
- **离线修复** — FastLogin 自动识别正版玩家

---

## 服务器信息

| 项目 | 配置 |
|------|------|
| 服务端 | Paper 1.12.2 (git-Paper-1620) |
| Java | **必须 Java 8 或 11**（不支持 17+） |
| 端口 | 25565 |
| 最大玩家 | 100 |
| 游戏模式 | 生存 |
| 难度 | 困难 |
| PvP | 开启 |
| 正版验证 | 关闭（AuthMe 接管账号认证） |
| 视距 | 10 区块 |
| 出生点保护 | 16 格（基础）+ WorldGuard 1000×1000（主城） |

---

## 插件列表

| 插件 | 版本 | 用途 |
|------|------|------|
| EssentialsX | 2.21.2 | 核心功能（传送、家、经济、礼包、邮件） |
| EssentialsXProtect | 2.21.2 | 出生点保护 |
| EssentialsXSpawn | 2.21.2 | 出生点管理 |
| BossShop | — | NPC 图形商店（星空物资商店） |
| QuickShop | 1.13.2 | 玩家箱子商店 |
| LuckPerms | 5.4.145 | 权限管理 |
| WorldEdit | 6.1.9 | 世界编辑（普通玩家单次操作上限 50,000 方块） |
| WorldGuard | 6.2.2 | 领地保护 |
| Vault | — | 经济/权限 API 桥接 |
| ASkyBlock | 3.0.9.4 | 空岛世界与挑战系统 |
| AuthMe | 5.7.0-FORK | 账号注册与登录（SHA256 哈希） |
| FastLogin | — | 正版玩家自动登录 |
| SkinsRestorer | — | 离线服玩家皮肤恢复（中文语言） |
| ProtocolLib | 5.3.0 | 网络协议支持库 |

---

## 目录结构

```
MC/
├── paper-1.12.2.jar          # 服务端核心
├── start.sh                   # Linux/Mac 启动脚本（含 Java 版本检查）
├── start.bat                  # Windows 启动脚本（含 Java 版本检查）
├── server.properties          # 服务器主配置
├── eula.txt                   # EULA 同意文件
├── bukkit.yml                 # Bukkit 配置
├── spigot.yml                 # Spigot 配置（含玩家消息汉化）
├── paper.yml                  # Paper 配置
├── commands.yml               # 命令别名
├── help.yml                   # 帮助主题配置（已汉化）
├── permissions.yml            # 兜底权限配置（实际使用 LuckPerms）
├── wepif.yml                  # WorldEdit 权限桥接配置
├── README.md                  # 本文件
├── 命令大全.md                 # 命令参考文档
├── ops.json                   # OP 列表（部署后需手动添加管理员）
├── plugins/
│   ├── Essentials/            # EssentialsX 配置
│   │   ├── config.yml         # 主配置（传送、经济、礼包等）
│   │   ├── kits.yml           # 礼包定义（全部汉化）
│   │   ├── motd.txt           # 登录欢迎语（已汉化）
│   │   ├── book.txt           # /book 命令内容（已汉化）
│   │   ├── worth.yml          # 物品回收价格
│   │   ├── tpr.yml            # /tpr 随机传送（已加 cooldown/warmup）
│   │   └── warps/             # 公共传送点
│   ├── BossShop/
│   │   ├── config.yml
│   │   ├── messages.yml       # 消息汉化
│   │   └── shops/
│   │       └── SkyBlockShop.yml  # 星空物资商店
│   ├── QuickShop/
│   │   ├── config.yml
│   │   └── messages.yml       # 消息汉化
│   ├── LuckPerms/
│   │   └── config.yml
│   ├── WorldEdit/
│   │   └── config.yml         # 已加普通玩家操作上限
│   ├── WorldGuard/
│   │   ├── config.yml         # 全局配置（已修复损坏的 key）
│   │   └── worlds/
│   │       └── world/
│   │           └── regions.yml  # 主城领地保护
    │   ├── AuthMe/
    │   │   ├── config.yml         # SHA256 哈希、强制注册、允许登录前移动
    │   │   └── messages/          # 中文消息
│   ├── FastLogin/
│   │   ├── config.yml
│   │   └── messages.yml       # 25 条消息全部汉化
│   ├── SkinsRestorer/
│   │   └── config.yml         # locale: zh_cn
│   └── ASkyBlock/
│       ├── config.yml
│       ├── locale/zh-CN.yml   # 中文语言包
│       ├── challenges.yml     # 挑战配置
│       └── schematics/        # 岛屿模板
├── world/                     # 主世界
├── world_nether/              # 下界
├── world_the_end/             # 末地
├── ASkyBlock/                 # 空岛世界
└── ASkyBlock_nether/          # 空岛下界
```

---

## 部署教程

### 第一步：环境准备

#### 1.1 安装 Java 8 或 11

Paper 1.12.2 **仅支持 Java 8 或 11**，不支持 Java 17+（运行时会因模块系统报错）。

**Windows：**
1. 前往 [Adoptium](https://adoptium.net/) 下载 Java 8 (LTS) 或 Java 11 (LTS)
2. 安装时勾选 "Set JAVA_HOME variable"
3. 打开命令提示符验证：
   ```cmd
   java -version
   ```

**Linux（Ubuntu/Debian）：**
```bash
sudo apt update
sudo apt install openjdk-11-jre-headless
java -version
```

**macOS：**
```bash
brew install openjdk@11
java -version
```

> 启动脚本（start.sh / start.bat）已内置 Java 版本检查，Java 17+ 会直接拒绝启动。

#### 1.2 端口开放

确保 **25565** 端口已开放：
- **本地测试**：无需额外配置
- **局域网**：在路由器中转发 25565 到服务器内网 IP
- **公网**：在云服务器安全组放行 TCP 25565

---

### 第二步：下载服务器文件

#### 方式一：从 GitHub 克隆

```bash
git clone https://github.com/你的用户名/1.12.2-空岛服务器模板.git
cd 1.12.2-空岛服务器模板
```

#### 方式二：直接下载 ZIP

1. 在 GitHub 页面点击绿色 "Code" 按钮
2. 选择 "Download ZIP"
3. 解压到目标目录

---

### 第三步：首次启动

#### 3.1 同意 EULA

编辑 `eula.txt`：
```
eula=true
```

#### 3.2 启动服务器

**Linux / macOS：**
```bash
chmod +x start.sh
./start.sh
```

**Windows：**

双击 `start.bat`，或在命令提示符中运行：
```cmd
start.bat
```

> 首次启动会自动生成世界文件，耗时较长。

#### 3.3 启动脚本说明

`start.sh` 与 `start.bat` 已内置：
- Java 版本检查（拒绝 Java 17+）
- 内存设置 `-Xms2G -Xmx4G`（按需调整）
- G1GC 调优参数（适合 4G 堆）

**内存建议：**

| 玩家数 | 推荐内存 |
|--------|----------|
| 10 人以下 | 2G（`-Xmx2G`） |
| 10-30 人 | 4G（`-Xmx4G`，默认） |
| 30-50 人 | 6G（`-Xmx6G`） |
| 50 人以上 | 8G（`-Xmx8G`） |

---

### 第四步：基础配置

#### 4.1 修改服务器属性（server.properties）

```properties
# 服务器名称（显示在服务器列表）
motd=§b§l★ §d§l星空岛 §b§l★

# 最大玩家数
max-players=100

# 正版验证（关闭 = 离线服，由 AuthMe 接管账号认证）
online-mode=false

# 难度（3 = 困难，2 = 普通，1 = 简单，0 = 和平）
difficulty=3

# 端口
server-port=25565

# 视距（降低可减少卡顿）
view-distance=10
```

#### 4.2 设置管理员

```bash
# 在服务器控制台执行：
op 你的游戏名
```

> 本模板的 `ops.json` 默认为空，部署后由您自行添加管理员。

#### 4.3 经济配置

编辑 `plugins/Essentials/config.yml`：
```yaml
currency-symbol: ' 星币'    # 货币符号前含空格
currency-symbol-before: false
starting-balance: 500        # 新玩家初始余额
```

---

### 第五步：世界配置

#### 5.1 主城保护

主城区域已预配置为 1000×1000 的安全区（WorldGuard `main_spawn` 区域）：
- 禁止建造
- 禁止 PvP
- 禁止怪物生成
- 自动回血回饱食度

#### 5.2 空岛世界

ASkyBlock 插件已包含。空岛世界会自动生成在 `ASkyBlock/` 与 `ASkyBlock_nether/` 目录。

玩家首次进服使用 `/is` 创建个人空岛。

#### 5.3 传送点管理

已配置的传送点：

| 传送点 | 世界 | 用途 |
|--------|------|------|
| `spawn` | 主世界 | 主城出生点 |
| `dy` | 下界 | 下界传送点 |
| `md` | 末地 | 末地传送点 |
| `island001` | ASkyBlock | 空岛出生点 |

管理命令：
```
/setwarp <名称>     # 设置传送点
/delwarp <名称>     # 删除传送点
/warps              # 列出所有传送点
```

---

### 第六步：权限配置

#### 6.1 创建权限组

```bash
# 在服务器控制台执行：
/lp creategroup default
/lp creategroup vip
/lp creategroup admin
```

#### 6.2 推荐权限组结构

```
default（默认玩家）
  ├── essentials.tpa
  ├── essentials.tpaccept
  ├── essentials.sethome
  ├── essentials.sethome.multiple.players (10个家)
  ├── essentials.home
  ├── essentials.warp
  ├── essentials.kit
  ├── essentials.pay
  ├── essentials.balance
  ├── essentials.worth
  ├── essentials.sell
  ├── quickshop.shop.create
  └── askyblock.island

vip（VIP 玩家）
  ├── 继承 default
  ├── essentials.sethome.multiple.vip (20个家)
  ├── essentials.fly
  └── essentials.back.ondeath

admin（管理员）
  ├── 继承 vip
  ├── essentials.*
  ├── worldedit.*
  ├── worldguard.*
  ├── luckperms.*
  └── authme.*
```

#### 6.3 常用命令

```bash
# 设置组权限
/lp group default permission set essentials.tpa true
/lp group vip permission set essentials.fly true
/lp group admin permission set essentials.* true

# 玩家加入组
/lp user 玩家名 parent add admin
```

#### 6.4 使用网页编辑器

```bash
/lp editor
```

会生成一个网页链接，在浏览器中可视化编辑权限。

---

### 第七步：商店配置

#### 7.1 NPC 商店（BossShop）

```bash
/shop    # 打开星空物资商店
```

编辑 `plugins/BossShop/shops/SkyBlockShop.yml` 可修改商品和价格。

#### 7.2 玩家商店（QuickShop）

```bash
/qs create [价格]    # 在目标箱子上创建商店
```

配置要点（`plugins/QuickShop/config.yml`）：
```yaml
shop:
  cost: 10           # 创建费用（10 星币）
  lock: true         # 商店锁定
  display-items: true  # 悬浮物品展示（1.12.2 上有几率触发物品复制 Bug，生产环境建议设为 false）
tax: 0.00            # 税率（0 = 免税）
```

---

### 第八步：账号安全（AuthMe）

本模板已启用 AuthMe 强制注册 + SHA256 密码哈希。

玩家首次进服需要：
1. 输入 `/register <密码> <确认密码>` 注册
2. 之后每次进服输入 `/login <密码>` 登录

**提示**：由于服务器使用 FRP 转发，所有玩家连接 IP 均显示为 127.0.0.1。请勿在公网环境部署。

---

### 第九步：备份与维护

#### 9.1 手动备份

```bash
# 停止服务器后
tar -czf backup_$(date +%Y%m%d).tar.gz world world_nether world_the_end ASkyBlock plugins
```

#### 9.2 自动备份

Essentials 配置中已启用：
```yaml
backup:
  enabled: true
  interval: 1440    # 每 24 小时
  command: 'tar -czf backup.tar.gz world'
```

#### 9.3 性能优化建议

- 视距 `view-distance` 设为 8-10
- `spigot.yml` 中 `mob-spawn-range` 设为 4（已配）
- `paper.yml` 中 `max-auto-save-chunks-per-tick` 设为 24（已配）
- 定期清理掉落物（已配 20 分钟自动清理）
- 启动脚本已启用 G1GC（适合 4G+ 堆）

---

## 常见问题

### Q: 玩家连接显示"版本不匹配"
A: 服务器是 1.12.2 版本，玩家需使用 Minecraft 1.12.2 客户端。

### Q: 启动时报 `UnsupportedOperationException: ... java.lang does not "opens java.lang"`
A: 您正在使用 Java 17+。Paper 1.12.2 不支持 Java 17+，请安装 Java 8 或 11。

### Q: 启动时报 `bind(..) failed: 地址已在使用`
A: 端口 25565 被占用。先停止占用该端口的进程：
```bash
# Linux
lsof -i :25565
kill -9 <PID>

# Windows
netstat -ano | findstr :25565
taskkill /PID <PID> /F
```

### Q: 新手礼包发放失败？
A: 检查 `plugins/Essentials/kits.yml` 中 `newbie` 礼包的物品格式。使用 `/kit newbie` 手动测试。

### Q: 如何添加新的 NPC 商店？
A: 在 `plugins/BossShop/shops/` 目录下创建新的 yml 文件，参考 `SkyBlockShop.yml`。

### Q: 玩家无法在某区域建造？
A: 检查 WorldGuard 区域设置：`/rg info <区域名>`，确认 `build` 标志是否为 `allow`。

### Q: 服务器卡顿怎么办？
A:
1. 检查 Java 版本（必须是 8 或 11）
2. 降低视距至 8
3. 减少实体数量：`/butcher 100`
4. 使用 `/gc` 查看 TPS
5. 检查是否有多余的掉落物
6. 启动脚本已启用 G1GC

### Q: 玩家想用皮肤？
A: SkinsRestorer 已启用，玩家使用 `/skin <玩家名>` 即可。其他玩家能正常看见该玩家的皮肤。

### Q: AuthMe 提示密码错误
A: 确认输入的大小写正确。如忘记密码，使用控制台执行 `authme unregister <玩家名>` 重置。

### Q: 玩家不需要登录？
A: 编辑 `plugins/AuthMe/config.yml`：
```yaml
registration:
  enabled: false  # 关闭注册
settings:
  sessions:
    enabled: true
```

---

## 命令速查

详见 [命令大全.md](命令大全.md)

---

## 许可证

本服务器模板基于 Paper 1.12.2 构建，各插件遵循其原始许可证。

- Paper: GPL-3.0
- EssentialsX: GPL-3.0
- LuckPerms: MIT
- WorldEdit: GPL-3.0
- WorldGuard: GPL-3.0
- ASkyBlock: GPL-3.0
- AuthMe: GPL-3.0
- FastLogin: MIT
- SkinsRestorer: GPL-3.0
- BossShop: 免费使用
- QuickShop: GPL-3.0
- Vault: 免费使用
- ProtocolLib: GPL-2.0

---

## 致谢

- [PaperMC](https://papermc.io/) — 高性能 Minecraft 服务端
- [EssentialsX](https://essentialsx.net/) — 核心功能插件
- [LuckPerms](https://luckperms.net/) — 权限管理
- [WorldEdit](https://enginehub.org/worldedit/) — 世界编辑
- [WorldGuard](https://enginehub.org/worldguard/) — 领地保护
- [ASkyBlock](https://www.spigotmc.org/resources/askyblock.1220/) — 空岛插件
- [AuthMe](https://github.com/AuthMe/AuthMeReloaded) — 账号安全
- [FastLogin](https://www.spigotmc.org/resources/fastlogin.14153/) — 正版自动登录
- [SkinsRestorer](https://skinsrestorer.net/) — 皮肤恢复
