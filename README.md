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

---

## 服务器信息

| 项目 | 配置 |
|------|------|
| 服务端 | Paper 1.12.2 (git-Paper-1620) |
| 端口 | 25565 |
| 最大玩家 | 100 |
| 游戏模式 | 生存 |
| 难度 | 困难 |
| PvP | 开启 |
| 正版验证 | 开启 |
| 视距 | 10 区块 |

---

## 插件列表

| 插件 | 版本 | 用途 |
|------|------|------|
| EssentialsX | 2.21.2 | 核心功能（传送、家、经济、礼包、邮件） |
| EssentialsXProtect | 2.21.2 | 出生点保护 |
| EssentialsXSpawn | 2.21.2 | 出生点管理 |
| BossShop | — | NPC 图形商店（星空物资商店） |
| QuickShop | 经典版 | 玩家箱子商店 |
| LuckPerms | 5.4.145 | 权限管理 |
| WorldEdit | 6.1.9 | 世界编辑 |
| WorldGuard | 6.2.2 | 领地保护 |
| Vault | — | 经济/权限 API 桥接 |

---

## 目录结构

```
MC/
├── paper-1.12.2.jar          # 服务端核心
├── start.sh                   # Linux/Mac 启动脚本
├── start.bat                  # Windows 启动脚本
├── server.properties          # 服务器主配置
├── eula.txt                   # EULA 同意文件
├── bukkit.yml                 # Bukkit 配置
├── spigot.yml                 # Spigot 配置
├── paper.yml                  # Paper 配置
├── commands.yml               # 命令别名
├── help.yml                   # 帮助配置
├── 命令大全.md                 # 命令参考文档
├── README.md                  # 本文件
├── plugins/
│   ├── Essentials/            # EssentialsX 配置
│   │   ├── config.yml         # 主配置（传送、经济、礼包等）
│   │   ├── kits.yml           # 礼包定义
│   │   ├── warps/             # 公共传送点
│   │   ├── worth.yml          # 物品回收价格
│   │   └── motd.txt           # 登录欢迎语
│   ├── BossShop/
│   │   ├── config.yml         # BossShop 配置
│   │   ├── messages.yml       # 消息汉化
│   │   └── shops/
│   │       └── SkyBlockShop.yml  # 星空物资商店
│   ├── QuickShop/
│   │   ├── config.yml         # QuickShop 配置
│   │   └── messages.yml       # 消息汉化
│   ├── LuckPerms/
│   │   └── config.yml         # 权限配置
│   ├── WorldEdit/
│   │   └── config.yml         # WorldEdit 配置
│   └── WorldGuard/
│       ├── config.yml         # WorldGuard 全局配置
│       └── worlds/
│           └── world/
│               └── regions.yml  # 主城领地保护
├── world/                     # 主世界
├── world_nether/              # 下界
└── world_the_end/             # 末地
```

---

## 部署教程

### 第一步：环境准备

#### 1.1 安装 Java 8

Paper 1.12.2 需要 **Java 8**（不支持 Java 11+）。

**Windows：**
1. 前往 [Adoptium](https://adoptium.net/) 下载 Java 8 (LTS)
2. 安装时勾选 "Set JAVA_HOME variable"
3. 打开命令提示符，验证安装：
   ```cmd
   java -version
   ```
   应显示 `openjdk version "1.8.x"` 或类似版本号

**Linux（Ubuntu/Debian）：**
```bash
sudo apt update
sudo apt install openjdk-8-jre-headless
java -version
```

**macOS：**
```bash
brew install openjdk@8
java -version
```

#### 1.2 端口开放

确保服务器的 **25565** 端口已开放：

- **本地测试**：无需额外配置
- **局域网**：在路由器中转发 25565 端口到服务器内网 IP
- **公网**：在云服务器安全组中放行 TCP 25565 端口

---

### 第二步：下载服务器文件

#### 方式一：从 GitHub 下载（推荐）

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

编辑 `eula.txt`，确保内容为：
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

> 首次启动会自动生成世界文件，耗时较长，请耐心等待。

#### 3.3 启动脚本说明

`start.sh`（Linux/Mac）：
```bash
#!/bin/bash
java -Xms1G -Xmx2G -jar paper-1.12.2.jar nogui
```

`start.bat`（Windows）：
```bat
@echo off
java -Xms1G -Xmx2G -jar paper-1.12.2.jar nogui
pause
```

**内存说明：**
- `-Xms1G`：初始内存 1GB
- `-Xmx2G`：最大内存 2GB
- 建议根据玩家数量调整：10人以下 2G，10-30人 4G，30人以上 8G

---

### 第四步：基础配置

#### 4.1 修改服务器属性（server.properties）

```properties
# 服务器名称（显示在服务器列表）
motd=§b§l★ §d§l星空岛 §b§l★

# 最大玩家数
max-players=100

# 正版验证（离线服务器设为 false）
online-mode=true

# 端口
server-port=25565

# 视距（降低可减少卡顿）
view-distance=10
```

#### 4.2 设置管理员

在服务器控制台中执行：
```
op 你的游戏名
```

#### 4.3 经济配置

编辑 `plugins/Essentials/config.yml`：
```yaml
currency-symbol: '星币'
currency-symbol-before: false
starting-balance: 500
```

---

### 第五步：世界配置

#### 5.1 主城保护

主城区域已预配置为 1000x1000 的安全区（WorldGuard `main_spawn` 区域）：
- 禁止建造
- 禁止 PvP
- 禁止怪物生成
- 自动回血回饱食度

#### 5.2 空岛世界

空岛世界需要安装 ASkyBlock 插件：

1. 下载 [ASkyBlock](https://www.spigotmc.org/resources/askyblock.1220/) 插件
2. 将 jar 文件放入 `plugins/` 目录
3. 重启服务器
4. 空岛世界会自动生成

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

#### 6.1 使用 LuckPerms 网页编辑器

```
/lp editor
```
执行后会生成一个网页链接，在浏览器中打开即可可视化编辑权限。

#### 6.2 推荐权限组结构

```
default（默认玩家）
  ├── essentials.tpa
  ├── essentials.sethome
  ├── essentials.sethome.multiple.players
  ├── essentials.home
  ├── essentials.warp
  ├── essentials.kit
  ├── essentials.pay
  ├── essentials.balance
  ├── essentials.worth
  ├── essentials.sell
  └── quickshop.shop.create

vip（VIP 玩家）
  ├── 继承 default
  ├── essentials.sethome.multiple.vip (20个家)
  └── essentials.fly

admin（管理员）
  ├── 继承 vip
  ├── essentials.*
  ├── worldedit.*
  ├── worldguard.*
  └── luckperms.*
```

创建示例：
```
/lp creategroup default
/lp creategroup vip
/lp creategroup admin

/lp group default permission set essentials.tpa true
/lp group default permission set essentials.sethome true
/lp group vip permission set essentials.fly true
/lp group admin permission set essentials.* true

/lp user 玩家名 parent add admin
```

---

### 第七步：商店配置

#### 7.1 NPC 商店（BossShop）

编辑 `plugins/BossShop/shops/SkyBlockShop.yml` 可修改商品和价格。

#### 7.2 玩家商店（QuickShop）

玩家使用 `/qs create <价格>` 在箱子上创建商店。

配置要点（`plugins/QuickShop/config.yml`）：
```yaml
shop:
  cost: 10           # 创建费用
  lock: true          # 商店锁定
  display-items: true # 悬浮物品展示
tax: 0.00             # 税率（0 = 免税）
```

---

### 第八步：备份与维护

#### 8.1 手动备份

```bash
# 停止服务器后
tar -czf backup_$(date +%Y%m%d).tar.gz world world_nether world_the_end plugins
```

#### 8.2 自动备份

在 Essentials 配置中启用：
```yaml
backup:
  enabled: true
  interval: 1440    # 每24小时
  command: 'tar -czf backup_$(date +%Y%m%d).tar.gz world'
```

#### 8.3 性能优化建议

- 视距 `view-distance` 设为 8-10
- `spigot.yml` 中 `mob-spawn-range` 设为 4
- `paper.yml` 中 `max-auto-save-chunks-per-tick` 设为 24
- 定期清理掉落物（已配置 20 分钟自动清理）

---

## 常见问题

### Q: 玩家连接显示"版本不匹配"
A: 服务器是 1.12.2 版本，玩家需要使用 Minecraft 1.12.2 客户端连接。可在启动器中切换版本。

### Q: 如何关闭正版验证（离线模式）？
A: 编辑 `server.properties`，将 `online-mode=true` 改为 `online-mode=false`。注意：关闭后皮肤系统失效，且需注意安全问题。

### Q: 新手礼包发放失败？
A: 检查 `plugins/Essentials/kits.yml` 中 `newbie` 礼包的物品格式是否正确。使用 `/kit newbie` 手动测试。

### Q: 如何添加新的 NPC 商店？
A: 在 `plugins/BossShop/shops/` 目录下创建新的 yml 文件，参考 `SkyBlockShop.yml` 的格式。

### Q: 玩家无法在某区域建造？
A: 检查 WorldGuard 区域设置：`/rg info <区域名>`，确认 `build` 标志是否为 `allow`。

### Q: 服务器卡顿怎么办？
A: 
1. 降低视距至 8
2. 减少实体数量：`/butcher 100`
3. 使用 `/gc` 查看TPS
4. 检查是否有多余的掉落物

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
- BossShop: 免费使用
- QuickShop: 免费使用
- Vault: 免费使用

---

## 致谢

- [PaperMC](https://papermc.io/) — 高性能 Minecraft 服务端
- [EssentialsX](https://essentialsx.net/) — 核心功能插件
- [LuckPerms](https://luckperms.net/) — 权限管理插件
- [WorldEdit](https://enginehub.org/worldedit/) — 世界编辑插件
- [WorldGuard](https://enginehub.org/worldguard/) — 领地保护插件
