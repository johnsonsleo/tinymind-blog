---
title: 从一个 Agent 到一支队伍：Hermes 多 Agent 部署流程
date: 2026-04-21T17:13:21.100Z
---

# [从一个 Agent 到一支队伍：Hermes 多 Agent 部署流程](https://x.com/ResearchWang/status/2046573439276994773)

![图像](https://i.imgur.com/3GrxS8A.png)

## 一个核心，无限Agent

现在单拎一个Agent都已经足够强大了，它可以独立完成研究、写作、分析、编程 ... 节省大量调研时间与精力

> 然而，真正拉开差距的地方，恰恰在于单个代理的边界

一件事做到极致，但无法同时在所有领域都保持高水平。 这时，一个由多个专业Agent组成的团队，就升级成了决定性竞争优势，每一个Agent只负责自己的领域，搭配起来的力量一定大于单个全能王

**这篇教程从安装到生产部署，覆盖 Hermes 多 Agent 体系的每一个环节，包括社区已经验证过的增强工具和真实用户踩过的坑**

**推荐阅读：**

> [1\. 《我的 OpenClaw 到 Hermes 无痛迁移实录》](https://x.com/ResearchWang/status/2045133243629154726)

> [2\. 《一文理清！Hermes 全部高阶工具配置》](https://x.com/ResearchWang/status/2045812932538438001)

**hermes资源汇总：**[Hermes Agent 完整配置工具清单 | Research王13](https://researchwang13.space/hermes/)

# 📚 目录

- **Hermes 多 Agent 协同的底层逻辑**
- **利用 Profiles 实现 Agent 的克隆与部署**
- **每Agent都拥有专属的model (无须再手动配置)**
- **定制 子Agent 独特人格**
- **为每个 Agent 开启独立的信息传送门**
- **Hermes 多Agent 的必备指令汇总**
- **可视化监控 多Agent 军队**

## 一. 解读 Hermes 多 Agent 的工作方式

在开始部署之前，先理解多Agent的设计约束，这直接决定你后面怎么写任务

先说一个容易产生误解的地方：ThreadPoolExecutor 并行、上下文隔离、工具封锁这套执行机制本身并不是 Hermes 独有的。Hermes 真正独特的地方是：

> **多 Agent 运行在一个会学习、会持久化的系统里**

详细说有三层：

- 第一，子 Agent 完成复杂任务后，系统会自主生成可复用的 Skill 文档，下次遇到同类任务直接加载。
- 第二，Hermes 是持久运行的服务进程而不是 Python 库，它同时挂载 Telegram、Discord、Slack，你可以从手机发一条消息触发三路并行 Agent 在 VPS 上工作。
- 第三，除了 delegate\_task，Hermes 还有 execute\_code 作为第三层执行粒度，你可以精准控制哪部分消耗 token、哪部分不消耗

**Hermes 有两种不同的多 Agent模式：delegate\_task 和 Profiles**

> **delegate\_task（主从层级）**：主控 Agent 在一次对话里临时 spawn 子 Agent，用完即销毁。子 Agent 没有自己的记忆和配置，生命周期不超过当次会话。

> **Profiles（平行独立）**：每个 Agent 是独立运行的进程，有自己的配置、记忆、身份，平等地长期运行。

![图像](https://i.imgur.com/BxxIk5y.png)

**delegate\_task有一个关键约束**：子 Agent 一定不能再派生子 Agent，层级最多两层。子 Agent 将被永久封锁了一批工具： 防无限递归、不能向用户提问、不能写入共享记忆、不能私自发消息、execute\_code，**主控 Agent 一旦中断任务，所有活跃的子 Agent 也会同步停止**

## 二. 利用 Profiles 实现 Agent 的克隆与部署

hermes 上创建子Agent的方式特别简单 ，在服务器终端运行

> hermes profile create xxx爱马仕个人资料创建 xxx

运行指令会在 ~/.hermes/profiles/<名字>/ 下创建完整的独立目录，并在 ~/.local/bin/ 注册同名命令别名

```bash
# 创建 xxxx 子agent （XXX 只代表名称）
hermes profile create xxxxx

# 创建 小红书写作 Agent
hermes profile create xhswriter

# 创建 信息搜索Agent
hermes profile create researcher
```

![图像](https://i.imgur.com/o3E0RoI.png)

> 创建完后用 hermes profile list 确认

![图像](https://i.imgur.com/6a1jOoc.png)

> 从现有配置克隆 API Key 和模型设置，可以跳过后续的模型配置步骤：

```bash
hermes profile create coder --clone          # 复用配置，记忆和会话独立

hermes profile create ops --clone-from coder # 从指定 Profile 克隆
```

![图像](https://i.imgur.com/ItMGh4Q.png)

## 三. 每Agent都拥有专属的model

这是 Profiles 最重要的能力：每个 Agent 完全独立配置模型，互不影响，修改每个agent模型有两种方法，3种方法都在下一个新 session 生效，在配置完之后要调用 **/new** 开启新会话

- 使用命令行的方法

```bash
# 推荐方式一：交互式向导（全程引导）
coder model

# 方式二：直接指定 OAuth 类型
hermes -p coder auth add anthropic --type oauth

# 方式三：直接配置
coder config set model.model "anthropic/claude-sonnet-4"

coder config set model.provider "openrouter"
```

![图像](https://i.imgur.com/GGFECEY.png)

## 四. 给子 Agent 定制独特的人格

SOUL.md 是 Agent 的核心身份文件，占据系统提示的第一位。写清楚职责和行为规范，Agent 才能专注地"做自己该做的事" , 不越界抢别人的活

这里我们直接把agency-agents的全部角色下载到根目录， 然后子代理配置Soul.md 软连接过去就好

> [https://github.com/jnMetaCode/agency-agents-zh](https://github.com/jnMetaCode/agency-agents-zh)

```bash
# 克隆agency-agents-zh仓库到 hermes 根目录
git clone https://github.com/jnMetaCode/agency-agents-zh.git ~/.hermes/agency-agents-zh

# 子代理用软链接，这样仓库 git pull 后所有 Profile 自动跟着更新：

# 将 agency-agents-zh 的代理 连接到 Coder 子代理的Soul.md 上
ln -sf ~/.hermes/agency-agents-zh/engineering/engineering-backend-architect.md \
        ~/.hermes/profiles/coder/SOUL.md

# coder → 后端架构师
ln -sf $REPO/engineering/engineering-backend-architect.md \
        $PROFILES/coder/SOUL.md

# master → 智能体编排者（主控/全局协调）
ln -sf $REPO/specialized/agents-orchestrator.md \
        $PROFILES/master/SOUL.md

# researcher → 趋势研究员
ln -sf $REPO/product/product-trend-researcher.md \
        $PROFILES/researcher/SOUL.md
```

> 配置完，输入 ： **xhswriter chat -q "请介绍你自己的职责"**

![图像](https://i.imgur.com/X5mnCy6.png)

以后如果 agency-agents-zh仓库更新，有你需要的新角色时，只需要输入

```bash
cd ~/.hermes/agency-agents-zh && git pull
# 因为子代理的Soul.md是符号链接，所有 Profile 自动更新
```

## 五. 给每个 Agent 配置独立的消息平台入口

- 第一步：给每个 Agent 创建独立的 Telegram Bot

每个 Agent 需要一个独立的 Bot，去 Telegram 找 [@BotFather](https://x.com/@BotFather)：

> /newbot

输入 Bot 名称（比如 xiaohongshu\_Researchwang\_bot）。BotFather 会返回一个 Token，格式类似：

> 7234567890:AAHxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

![图像](https://i.imgur.com/wgMYZCm.png)

**我这给四个 Agent 各创建一个 Bot，拿到四个 Token**

- **第二步：批量把 Token 写入各 Profile 的 .env ，把命令中的**TELEGRAM\_BOT\_TOKEN替换成你自己的

```bash
# coder
echo "TELEGRAM_BOT_TOKEN=8626455870:AAHkP_u-ccVJJnD0d3dKP5CtvT4" >> ~/.hermes/profiles/coder/.env

# master
echo "TELEGRAM_BOT_TOKEN=8633288874:AAF-4eOxACvPFBKGACnaAJAE" >> ~/.hermes/profiles/master/.env

# researcher
echo "TELEGRAM_BOT_TOKEN=8732715539:AAF0FWav__krJUGaHIu-SrkTlcY" >> ~/.hermes/profiles/researcher/.env

# xhswriter
echo "TELEGRAM_BOT_TOKEN=8716407357:AAEDzIuQhe_iEVIhF-Ps" >> ~/.hermes/profiles/xhswriter/.env
```

第三步：配置每个 Gateway

每个 Profile 的 gateway 需要单独配置一次，告诉它允许哪些用户发消息。先拿到你自己的 Telegram User ID（去找 [@userinfobot](https://x.com/@userinfobot) 发任意消息，它会返回你的 ID）。

```bash
# 给 coder 配置 gateway（会进交互向导）
coder gateway setup
master gateway setup
researcher gateway setup
xhswriter gateway setup
```

> 向导里会问：选择平台 → Done (因为我们已经全部写入到子代理的 .env 文件里了) 剩下的一路按Y就好

![图像](https://i.imgur.com/vks9M9x.png)

> 还需要给子代理配置 pair code ， 配置完就可以开始聊天了

![图像](https://i.imgur.com/Cjx6oTt.png)

> 检查子代理的运行情况：systemctl --user status hermes-gateway-xhswriter

![图像](https://i.imgur.com/9fZ813Q.png)

## 六. Hermes 多Agent 的必备指令汇总

> 实时查看 Agent 矩阵规模与当前活跃状态：

```bash
hermes profile list                        # 列出所有 Profile 及运行状态
hermes profile show coder                  # 查看某个 Agent 的详细信息（模型、技能、绑定平台）
coder config                               # 查看 coder 当前的完整配置
hermes status                              # 查看当前 Agent、认证和平台连接状态
hermes dump                                # 输出完整的可分享配置摘要（适合排障时粘贴给别人）
```

> 身份切换，让 hermes 命令直接作用于指定 Agent：

```bash
hermes profile use coder                   # 切换默认 Agent，之后所有 hermes 命令作用于 coder
hermes profile use default                 # 切回默认的通用主控
hermes -p coder chat -q "你好"             # 不切换默认，临时对某个 Agent 发一条消息
```

> 热加载配置，不用重启，直接修改运行中 Agent 的属性：

```bash
coder config set model.model "anthropic/claude-opus-4"   # 修改 coder 的模型
ops config set terminal.cwd /home/ubuntu/projects        # 修改工作目录
researcher config set memory.memory_char_limit 5000      # 扩大记忆容量

# 批量修改所有 Agent 的同一配置项（逐一执行）
for profile in coder ops researcher writer; do
  $profile config set model.provider openrouter
done
```

> 当 SOUL.md 更新或技能库有新版本时：

```bash
coder update                               # 更新指定 Agent 的技能库
hermes update                             # 全员技能同步，一键更新所有 Profile 的 Skill
hermes skills update                      # 更新已安装的技能到最新版本
hermes skills check                       # 检查哪些技能有上游更新
```

PS：SOUL.md 修改后，Hermes 在**下一个新 session** 时自动加载新内容。如果当前在对话中，用 /new 开启新会话即可生效，无需重启进程

> 部署与迁移，Agent 的分发、扩容或跨机器搬迁：

```bash
hermes profile export coder                # 打包备份，生成 coder.tar.gz
hermes profile export coder -o /backup/coder-$(date +%Y%m%d).tar.gz  # 带日期戳的备份

hermes profile import coder.tar.gz         # 从备份恢复
hermes profile import coder.tar.gz --name coder-prod  # 恢复为新名字（避免冲突）

hermes profile rename coder dev-assistant  # 重命名
hermes profile delete writer              # 删除（需输入名称二次确认）
hermes profile delete writer --yes        # 跳过确认直接删除

---------------------------------------------------------------
也可以用系统级备份命令对整个 Hermes 数据做快照：

hermes backup                              # 完整备份到 ~/hermes-backup-<时间戳>.zip
hermes backup --quick --label "pre-upgrade"  # 快速备份（仅关键状态文件）
hermes import hermes-backup-*.zip          # 从系统备份恢复
```

> 运行监控 , 查看 hermes 日志：

```bash
hermes logs -f                             # 实时跟踪主 Agent 日志（相当于 tail -f）
hermes logs errors -f                      # 只看错误日志的实时流
hermes logs gateway -f                     # 实时看消息网关日志（Telegram/Discord 收发）

hermes logs -n 50                          # 查看最近 50 条日志
hermes logs errors -n 20                   # 查看最近 20 条错误记录
hermes logs --level WARNING --since 1h    # 过去 1 小时内的 WARNING 以上级别日志
hermes logs --since 30m --level ERROR     # 过去 30 分钟的错误

hermes logs list                           # 列出所有日志文件及大小

# 查看指定 Profile 的日志（logs 文件在各自目录下）
coder logs -f                              # 等价于 hermes -p coder logs -f
ops logs errors -n 20
```

> 并发控制 ， 一键启动，一键关闭：

```bash
# 查看所有 gateway 服务状态
sudo systemctl status hermes-gateway-*

# 一键启动所有已安装的 gateway 服务
sudo systemctl start hermes-gateway-coder hermes-gateway-ops hermes-gateway-researcher hermes-gateway-writer

# 全员停止（释放资源）
sudo systemctl stop hermes-gateway-coder hermes-gateway-ops hermes-gateway-researcher hermes-gateway-writer

# 单独重启某个 Agent 的网关
sudo systemctl restart hermes-gateway-ops

# 通过 -p 标志对特定 Agent 发起操作（不依赖 gateway）
hermes -p coder chat -q "检查 src/auth/ 有没有 SQL 注入漏洞"
hermes -p researcher chat -q "搜索本周 AI 最新进展"
```

## 七. 可视化监控 多Agent 军队

多个子 Agent 并行跑起来之后，光靠命令行很难同时盯住它们的状态。对多 Agent 场景最好用的是 [@lumao\_2026](https://x.com/@lumao_2026) 路飞老师创建的 **hermes-web-ui 可视化面板**

**GitHub链接：** [https://github.com/EKKOLearnAI/hermes-web-ui](https://github.com/EKKOLearnAI/hermes-web-ui)

> 专门为多 Agent 可扩展性设计，**hermes-web-ui**有Session 按来源平台分组、内置 Web 终端、Skills 和 Memory 管理界面、Token 用量统计看板

```bash
# 直接和 agent 说
帮我部署 https://github.com/EKKOLearnAI/hermes-web-ui
```

![图像](https://i.imgur.com/IaEXy5V.png)

部署完，他会给一个token，输入token登入即可,在web页面就可以看到你的全部子Agent

![图像](https://i.imgur.com/KSlTXrw.png)