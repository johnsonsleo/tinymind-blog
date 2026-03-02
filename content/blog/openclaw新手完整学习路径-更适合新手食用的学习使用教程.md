---
title: OpenClaw新手完整学习路径-更适合新手食用的学习+使用教程
date: 2026-03-02T02:20:34.203Z
---

![圖片](https://pbs.twimg.com/media/HB7xEvcaAAAmexY?format=jpg&name=medium)

1个月以前，我也和你一样，看着 X 上铺天盖地关于OpenClaw的讨论，我心里痒痒的又不知道从哪儿下手。

**那时候我最大的困惑是：**

- 网上教程太多了，我到底该按什么顺序学？
- 哪些是真正有用的资源/内容？
- 会不会一不小心就把我mac电脑搞坏了？？



![圖片](https://pbs.twimg.com/media/HB7xTjCbEAAZJ8K?format=jpg&name=medium)

我的实践从我的2017款老Mac开始，以下是我1.30日折腾OpenClaw的推文。

https://x.com/AI_Jasonyu/status/2017034137014849635

现在我的AI助手已经能帮我管理Telegram消息、整理文件、甚至自动发公众号和推了（当然，我墙裂不建议大家用来自动发推）。

回过头看,学OpenClaw的路径没那么复杂，关键是知道"在什么阶段学什么"。

这篇文章不是传统的安装教程，而是我整理出的一条清晰学习路径。我会告诉你每个阶段应该看谁的内容、跟着哪些博主或者哪些教程走、需要注意什么坑。资源都是我自己验证过的，链接都能直接点开。

**我将流程总共拆成五个步骤：理解——搭建——配置——扩展——优化**

# ![圖片](https://pbs.twimg.com/media/HB71RI6bcAAE5zG?format=jpg&name=medium) 

# 第一阶段：理解OpenClaw是什么（先看懂再动手）

**这个阶段的目标**：建立对OpenClaw的基本认知，知道它能干什么、不能干什么，值不值得你花时间学。

很多新手上来就直接安装，结果发现根本不知道自己在干嘛。我的建议是，先花2-3小时看几个关键内容，建立心理预期。

![圖片](https://pbs.twimg.com/media/HB7x2iZbgAAMVDU?format=jpg&name=medium)

## 必看资源

**1. Nat Eliason的Felix案例**

这是我见过最好的OpenClaw"可能性展示"。Nat Eliason用OpenClaw搭建了一个叫Felix的AI助手，三周内帮他赚了一万四千多美元。不是说你也能赚这么多钱，而是通过这个案例你能看到OpenClaw到底能做到什么程度。

- **推荐观看**：Peter Yang ([@peteryang](https://x.com/@peteryang)) 2月22日发的访谈视频
  https://www.youtube.com/watch?v=nSBKCZQkmYw&t=2s

- **配套阅读**：[creatoreconomy.so](https://creatoreconomy.so/)上的详细文章《Use OpenClaw to Build a Business That Runs Itself》这是一篇付费文章，实际上可以只看视频即可
- **重点关注内容**：Felix的3层记忆系统、多线程工作流、自主运营能力

**2. 理解架构**

OpenClaw不只像聊天机器人，它更像是一个能连上你系统和应用的"AI网关"。它能24/7运行、执行命令、管理文件，通过Telegram / WhatsApp / Discord 或者飞书来和你对话。

简单理解：ChatGPT活在浏览器里，OpenClaw活在你的电脑/服务器里。

如果看上面的视频你觉得复杂，你可以选择看 [@GoSailGloba](https://x.com/@GoSailGloba) **老师的这篇解读，100万阅读的干货：**

https://x.com/GoSailGlobal/status/2023945258896351644?s=20

## 新手友好提醒

⚠️ **不要急着安装**：看完这些内容后再决定要不要继续。OpenClaw需要你投入时间学习，也会产生API费用（高质量的API，比如Claude Opus 4.6，这个费用上限会很高，取决于使用频率）。

⚠️ 管理预期：OpenClaw很强大，但它不是魔法。前期需要大量配置和调教，以及逐渐去开放很多的授权，才能变成真正懂你的助手。

⚠️ **安全意识**：因为OpenClaw能执行系统命令，配置不当可能会有安全风险。这也是为什么我强调要先理解原理。

# 第二阶段：基础搭建（让它跑起来）

**这个阶段的目标**：完成最基础的安装和配置,让OpenClaw能响应你的消息。

这是很多人卡住的地方。我当时在Node.js版本上就折腾了半天。下面是我整理的最稳妥的安装流程。

![圖片](https://pbs.twimg.com/media/HB7y2C-aoAES8CM?format=jpg&name=medium)

## 1、前期准备（必须完成）

**这里如果想要去看更详细的教程，或者遇到问题需要解决，我推荐范凯老师的教程，新手友好，我是参考这个来安装的：**

[**https://x.com/robbinfan/status/2020094295844470980?s=20**](https://x.com/robbinfan/status/2020094295844470980?s=20)

当然，也可以继续往下看... ...

**1. 系统要求**

- macOS / Linux / Windows(必须用WSL2)
- Node.js v22或更高版本
- 一个API密钥（Anthropic的Claude或OpenAI的GPT）
- 一个Telegram账号（最简单的消息通道）

没有Telegram账号的，需要注册，这里需要海外手机号，可以去我主页里面找，有香港、荷兰、德国手机号的各种保姆级教程可以参考。

安装过程记得打开科学上网！！！

**2. Node.js安装**

这是最容易出问题的环节。OpenClaw 2026版本严格要求Node.js v22+，用老版本会报错。

如果你和我一样，使用的是很老的版本的Mac，可以看我之前的这篇教程来升级Node版本。

https://x.com/AI_Jasonyu/status/2017034137014849635

推荐用nvm（Node Version Manager）来管理：

```bash
# 安装nvm后运行
nvm install 22
nvm use 22
```

##  

## 2、一键安装脚本（官方最推荐方式）

**macOS / Linux / WSL2 用户**（打开终端）：

```bash
curl -fsSL https://openclaw.ai/install.sh | bash
```

**Windows 用户**（直接用 PowerShell，**管理员权限运行**）：

```bash
iwr -useb https://openclaw.ai/install.ps1 | iex
```

脚本会自动检测环境、安装依赖、设置全局命令 openclaw。

## 3、配置向导（安装完立刻运行）

```bash
openclaw onboard --install-daemon
```

**向导会一步步问你：**

**Q1：选择 AI 模型**

- **首推**：Claude 4.5 Sonnet（性价比之王）
- 预算充足再上 Claude 4.6 Opus
- 预算紧张选 GPT-4o / Codex、Minimax、Kimi等都可以

💡 **进阶技巧**：可以配置多模型路由 —— 简单任务走 mini，复杂任务自动切 Sonnet！

**Q2：输入 API 密钥**

- Anthropic → 

  [console.anthropic.com](https://console.anthropic.com/)

- OpenAI → 

  [platform.openai.com](https://platform.openai.com/)

也可以使用这样的**第三方API 聚合服务**： 

https://aigocode.com/invite/MJA8A8MB

【朋友的，带小尾巴】

**Q3：选择消息通道**

- **强烈推荐 Telegram**（最快、最稳、DM 默认隔离）

## 4、安装后必备命令（建议立刻保存）

```bash
openclaw doctor          # 健康检查 + 安全提醒（必跑！）
openclaw status          # 查看运行状态
openclaw gateway status  # 查看网关状态
openclaw dashboard       # 浏览器控制面板（最快上手测试）
```

## 5、想跳过向导快速测试？（很多人这么干）

```bash
# 跳过向导直接安装
curl -fsSL https://openclaw.ai/install.sh | bash -s -- --no-onboard

openclaw dashboard       # 直接打开浏览器测试
```

## 6、Telegram机器人设置

这一步，如果你觉得麻烦，其实也可以跳过，然后在OpenClaw的Dashboard网页上，通过聊天让AI帮忙接入TG，对新手会更简单。

![圖片](https://pbs.twimg.com/media/HB70TB1awAAowoA?format=jpg&name=medium)

1. 打开Telegram，搜索 [@BotFather](https://x.com/@BotFather)
2. 发送 /newbot
3. 给你的bot起个名字（比如"我的Claw助手"）
4. 选择一个唯一的用户名，必须以bot结尾（比如my_claw_bot）
5. BotFather会给你一个**API Token**（类似 123456:ABC-DEF...），保存好，这是你bot的“密码”，直接点击Copy
6. 在配置向导中选择Telegram通道时，粘贴这个Token
7. 打开你刚创建的bot，发送一条消息（比如/start或"Hello"）
8. bot会回复一个**配对码**（比如123456）
9. 回到终端，运行以下命令批准配对：

```bash
openclaw pairing approve telegram [你的配对码]
```

**或者直接在向导界面中输入配对码。**

✅ 完成！现在你可以启动OpenClaw了：

```bash
openclaw
```

给你的Telegram bot发"Hello"，如果它回复了，说明成功了！

## 7、验证安装

安装完成后，强烈建议运行诊断命令检查环境：

```bash
openclaw doctor
```

**这个命令会检查：**

- Node.js版本是否符合要求
- API密钥是否有效
- 网络连接是否正常
- 文件权限是否正确

## 8、新手友好提醒

⚠️ **Windows用户必看**：不要在PowerShell里运行，一定要用WSL2（Windows Subsystem for Linux）。在Microsoft Store下载Ubuntu，然后在Ubuntu终端里操作。

⚠️ **API成本控制**：

- 在Anthropic/OpenAI的控制台设置每日消费上限（建议$5/天）
- 前期测试阶段，Heartbeat频率设置成60分钟，不要设太短
- 用openclaw doctor命令检查配置是否健康

⚠️ **安全配置第一条**：绝对不要把OpenClaw暴露到公网！只在localhost(127.0.0.1)运行。如果需要远程访问，用Tailscale。

⚠️ **遇到"command not found: openclaw"**：

这是最常见的问题之一。解决方法：

1. 重启终端
2. 如果仍然不行，运行：source ~/.zshrc 或 source ~/.bashrc
3. 还不行就用：npx openclaw

⚠️ **遇到"sharp"模块错误**：

如果安装时提示"sharp: Please add node-gyp to your dependencies"，这是图像处理库编译问题。解决：

macOS：

```bash
xcode-select --install
SHARP_IGNORE_GLOBAL_LIBVIPS=1 npm install -g openclaw@latest
```

Linux/WSL：

```bash
sudo apt install build-essential python3
npm install -g node-gyp
npm install -g openclaw@latest
```

⚠️ **权限错误(EACCES)**：

如果安装时提示权限不足，不要用sudo！正确做法：

```bash
sudo chown -R $(whoami) $(npm prefix -g)/lib/node_modules
```

然后重新运行安装脚本。

# 第三阶段：核心配置（让它真正懂你）

**这个阶段的目标**：配置[SOUL.md](https://soul.md/) & [USER.md](https://user.md/)等核心文件，让AI助手了解你的偏好和工作方式。

这是OpenClaw和普通聊天机器人的最大区别。通过这些配置文件，你的助手会拥有持久的"身份"和"记忆"。

![圖片](https://pbs.twimg.com/media/HB71fE7bYAAGJPn?format=jpg&name=medium)

小Tips：这些都可以在GateWay Dashboard页面进行可视化的修改和调整，看不懂的话，在OverView页面，把语言改成中文。

![圖片](https://pbs.twimg.com/media/HB71jEQasAAiw6F?format=jpg&name=medium)

**关于核心配置这块，建议可以看这几个博主的文章：**

1、关于**OpenClaw Memory，可以看看李韭二老师的** 

https://x.com/lijiuer92/status/2025678747509391664?s=20

---

2、关于OpenClaw的最高热度综合讲解 + Memory 系统实操：[Matthew Berman](https://x.com/MatthewBerman)老师的

https://x.com/MatthewBerman/status/2023843493765157235?s=20

---

3、[Jacky Chou](https://x.com/indexsy)老师分享的关于Memory部分

https://x.com/indexsy/status/2019657721314939014?s=20

---

4、关于[SOUL.md](https://t.co/dD8xK2e6G7)的分享

https://x.com/johann_sath/status/2024662169300979786?s=20

---

5、[@yanhua1010](https://x.com/@yanhua1010)分享的作者的配置

https://x.com/yanhua1010/status/2025114613919220085?s=20

---

6、OpenClaw作者的改写Prompt

https://x.com/steipete/status/2020704611640705485?s=20

## 1、理解核心文件

OpenClaw在~/.openclaw/workspace/目录下用Markdown文件来定义行为：

- [**SOUL.md**](https://soul.md/)

  ：助手的"人格"和行为准则

- [**USER.md**](https://user.md/)

  ：关于你的偏好和背景信息

- [**MEMORY.md**](https://memory.md/)

  ：长期记忆存储

- [**HEARTBEAT.md**](https://heartbeat.md/)

  ：自主检查任务的频率

##  

## 2、[SOUL.md](https://soul.md/)配置最佳实践

[SOUL.md](https://soul.md/)是最重要的文件。2026年的最佳实践是用"角色真相"而非"指令规则"。

**推荐结构**（可以直接用这个模板）：

```bash
# SOUL: [给你的助手起个名字]

## 核心身份
- 你是一个高效的执行助手
- 你的语气简洁、技术化、直奔主题
- 你把每个任务当成使命，不达目标不罢休

## 行为准则
- 优先使用本地CLI工具，而不是网页界面
- 如果任务超过3步，先创建PLAN.md再开始执行

## 安全边界（重要！）
- **严格规定**：修改.env或credentials/文件夹前必须经过我的二次确认
- **隐私保护**：如果在日志中发现个人身份信息，发送给外部API前必须脱敏
- **财务限制**：单笔超过$50的操作必须在Telegram里获得我的"Y"确认

## 永远不要做的事
- 不要说"我很乐意帮助"、"好问题"这种客套话
- 不要在没有明确指令的情况下删除文件
- 不要在我睡觉时间（23:00-07:00）发送非紧急通知
```

## 3、[USER.md](https://user.md/)配置技巧

告诉助手关于你的关键信息：

- 你的工作领域和常用工具
- 你的时区和工作时间
- 你的沟通偏好（喜欢简洁还是详细）
- 你的常用联系人和他们的角色

## 4、3层记忆系统（Nat Eliason的方法）

如果你想要更高级的配置，可以参考Nat Eliason的Felix使用的3层记忆系统：

**Layer 1 - 知识图谱**：用PARA方法组织的文件夹，存储持久性事实

**Layer 2 - 每日笔记**：按日期记录的交互日志，助手每晚自动更新

**Layer 3 - 隐性知识**：你的偏好、规则、沟通风格

## 5、新手友好提醒

⚠️ **先简单后复杂**：第一次配置

[SOUL.md](https://soul.md/)

时，写3-5条核心规则就够了。用一段时间后，根据实际情况再补充。

⚠️ **"Never"列表很重要**：一定要写清楚助手"永远不要做"的事情。比如"永远不要在没有预览的情况下执行rm命令"。

⚠️ **Heartbeat频率别设太高**：建议30-60分钟。设成5分钟会让API费用飙升，而且大部分时候没必要。

⚠️ **定期compact记忆**：每周运行一次openclaw compact，把长对话压缩成摘要，否则会越来越慢、越来越贵。

⚠️ **用openclaw soul edit快速编辑**：不用手动找文件，这个命令会帮你打开编辑器。

![圖片](https://pbs.twimg.com/media/HB72kxkaIAAJ5Rh?format=jpg&name=medium)

# 第四阶段：技能扩展（按需定制）

**这个阶段的目标**：根据你的实际需求，给OpenClaw安装特定技能。

OpenClaw的技能市场ClawHub有超过10,518个技能。但别被数字吓到，你只需要安装跟自己需求相关的。

ClawHub的官网：

https://clawhub.ai/

## 1、最受欢迎的必装技能

**1. Twitter/X发帖：opentweet/x-poster**

```bash
clawhub install opentweet/x-poster
```

用途：让助手帮你发推文、创建thread、安排定时发布

成本：X的API目前是支持按量付费的，所以不用担心太多成本

**2. GitHub管理：github**

```bash
clawhub install github
```

用途：管理代码仓库、审查PR、自动commit

适合：开发者

**3. 浏览器自动化：playwright-mcp**

```bash
clawhub install playwright-mcp
```

用途：让助手自动浏览网页、填表单、截图

注意：功能强大但要小心配置，不要让它自动登录重要账号

**4. Obsidian知识库：obsidian-direct**

```bash
clawhub install obsidian-direct
```

用途：把你的Obsidian笔记库变成助手的长期记忆

适合：用Obsidian做笔记的朋友

**5. NotebookLM集成：jacob-bd/notebooklm-mcp-cli**

```bash
clawhub install jacob-bd/notebooklm-mcp-cli
```

用途：让助手直接访问你的NotebookLM笔记本，获取研究资料、生成音频概述

适合：做研究、内容创作、需要整理大量资料的朋友

注意：需要先用nlm login完成Google账号授权

**6. YouMind连接：**

还没有Youmind账号的，可以体验下，真的是适合内容创作者的神器：

https://youmind.com/invite/LTEIKN

```bash
clawhub install youmind
```

**用途：**

📚 直接查询 YouMind board 里的内容

🔗 把链接/网页保存到 board

🗂 管理你的 board 库

🔐 持久化登录，不用每次重新认证

适合：YouMind用户,希望AI助手能访问自己的创作素材

ClawHub：

https://clawhub.ai/skills/youmind

GitHub：

https://github.com/p697/youmind-skill

![圖片](https://pbs.twimg.com/media/HB73wM6bwAA86If?format=jpg&name=medium)

## 2、安全重要提醒（必读！）

**2026年2月发生了一次严重的安全事件**：ClawHub上排名第一的技能"What Would Elon Do"被发现是恶意软件，会窃取API密钥和SSH凭证。超过1,184个恶意技能被识别出来。

现在ClawHub已经和VirusTotal合作，会自动扫描所有上传。但你自己也要注意：

✅ **只装"Verified"（已验证）的技能**：发布者旁边有认证标志

✅ **检查代码**：技能本质上是Markdown或JSON文件，安装前看一眼有没有可疑的curl | bash或sudo命令

✅ **关注安全账号**：Twitter上的 [@KoiSecurity](https://x.com/@KoiSecurity) [@SnykSec](https://x.com/@SnykSec) 会及时发布恶意技能警报

✅ **用Docker运行**（进阶）：把OpenClaw跑在容器里，限制它能访问的文件范围

## 3、技能推荐账号

想知道最新的好用技能，可以关注这些Twitter账号：

- [**@openclaw**](https://x.com/@openclaw)

  （官方账号，第一时间发布新技能、更新和公告）

- [**@steipete**](https://x.com/@steipete)

  （Peter Steinberger = OpenClaw 作者 / ClawFather，本人账号，最权威的第一手信息，几乎每天都在发）

- [**@nateliason**](https://x.com/@nateliason)

  （Nat Eliason，Felix 的创造者，高级配置和记忆系统干货超多）

- [**@FelixCraftAI**](https://x.com/@FelixCraftAI)

  （Felix 助手的官方账号，实用技巧、真实案例、好用 skill 分享最频繁）

- [**@MatthewBerman**](https://x.com/@MatthewBerman)

  （英文社区最火的深度评测和技能合集）

- [**@OpenClawTips**](https://x.com/@OpenClawTips)

  （纯中文/英文混发的每日小技巧账号，专门挖新 skill）

## 4、新手友好提醒

⚠️ **不要一次装太多技能**：每装一个新技能，先用几天，确保它正常工作、没有冲突，再装下一个。

⚠️ **技能也会过时**：OpenClaw更新很快，有些技能可能不兼容新版本。如果某个技能突然不工作了，去它的GitHub页面看看issue。

⚠️ **用openclaw logs --verbose调试**：技能出问题时，这个命令会显示详细的错误信息，方便排查。

⚠️ **卸载也很简单**：clawhub uninstall <skill-name>

# 第五阶段：进阶优化（效率最大化）

**这个阶段的目标**：掌握成本优化、性能调优、自动化任务等高级技巧，让OpenClaw真正成为你的生产力工具。

![圖片](https://pbs.twimg.com/media/HB743H9bMAEpqjX?format=jpg&name=medium)

到这个阶段，你已经基本掌握了OpenClaw。现在要做的是"精细化运营"。

这个阶段，我建议你看以下的视频和文章：

1、掌握自定义技能、CRON 自动化和 Google Workspace。

https://www.youtube.com/watch?v=4evf5YqVzOM

2、OpenClaw的实操视频

https://x.com/MatthewBerman/status/2021669868366598632?s=20

## **1、Model Routing（省钱的关键）**

很多新手第一周就烧 $100+，因为所有任务都丢给最贵的模型。

智能模型路由策略：

- 大脑模型（Claude Opus / GPT-5）：只用于复杂推理、多步骤规划
- 肌肉模型（Claude Haiku / Kimi 2.5）：日常检查、简单任务、文件整理

在 ~/.openclaw/openclaw.json 里配置 primary + fallbacks，或者直接装 **Clawouter** skill，就能自动路由，节省 70-90% 成本。

推荐帖：

https://x.com/justinweb33/status/2021033736213758139

## **2、24/7 运行（VPS 部署）**

想让助手全天候工作（电脑关机也行）？上 VPS！

**推荐服务商：**

- Hostinger（$5-10/月，一键 Docker）
- DigitalOcean（$12/月起，Marketplace）
- Hetzner（€4.5/月起，性价比之王）

**Docker 部署（强烈推荐）**：

1. VPS 上安装 Docker
2. 用官方 [docker-setup.sh](https://docker-setup.sh/) 或 docker-compose.yml
3. docker compose up -d

好处：完全隔离，出错也不影响服务器。

安全提醒：永远别把 gateway 暴露公网，用 SSH tunnel。

##  

## **3、Cron 任务（自动化）**

让助手主动做事，而不是被动等指令。

常见场景：

- 每天早上 8 点发送今日日程
- 每周五下午总结本周进展
- 每晚 23 点运行 memory compact

用 openclaw cron add 或直接在 Dashboard 里点几下就能设置（比手动 cron 更智能）。

这里分享一下 [JaredL](https://x.com/jaredliu_bravo) 老师的推文：

https://x.com/jaredliu_bravo/status/2023710437905469479?s=20

## ![圖片](https://pbs.twimg.com/media/HB75XJXa0AARxvY?format=jpg&name=medium) 

## **4、多 Agent 协作（高级玩法）**

需要社交媒体、代码、财务分开管？跑多个 OpenClaw 实例，每个给独立 SOUL + workspace。

![圖片](https://pbs.twimg.com/media/HB75a-JbMAArHO2?format=jpg&name=medium)

参考 Hesam Sheikh 的多 Agent 团队方案（1.3M 浏览神帖）： 

https://github.com/hesamsheikh/awesome-openclaw-usecases

---

还有[Elvis](https://x.com/elvissun)老师的一人开发团队配置

https://x.com/elvissun/status/2025920521871716562?s=20

---

还有几个中推博主的内容，值得仔细阅读：

1、Jason Zuo老师的“为什么放弃了多Agent”

https://x.com/xxx111god/status/2025394346191708297?s=20

2、黄总的**龙虾4兄弟的AI协作实战**

https://x.com/servasyy_ai/status/2020475413055885385?s=20

3、Ben总的**手把手教你配置多 Agent 模式**

https://x.com/littlebena/status/2024518061609669042?s=20

4、[sitin](https://x.com/sitinme) 老师的**OpenClaw 多 Agent 玩法**

https://x.com/sitinme/status/2025435006819336311?s=20

##  

## **5、API 成本监控工具**

装 **ClawWatcher**（[clawwatcher.com](https://clawwatcher.com/)），实时看每个模型花了多少钱，可设每日硬上限（$2/天超了自动暂停）。 必装！防止半夜被 Opus 偷偷烧几百刀。

## ![圖片](https://pbs.twimg.com/media/HB75lh_a8AA5k8j?format=jpg&name=medium) 

## 6、新手友好提醒

⚠️ **每周更新OpenClaw**：运行openclaw update。2026版本经常修补安全漏洞，别用老版本。

⚠️ **备份你的workspace**：~/.openclaw/workspace/文件夹定期备份到云端。里面有你所有的配置、记忆、对话历史。

⚠️ **Mac Mini不是必需品**：虽然很多人推荐买个Mac Mini专门跑OpenClaw，但如果你预算有限，VPS完全够用。老Mac也能跑（只要能装Node.js v22）。

⚠️ **加入社区**：

- Discord: "Friends of the Crustacean"服务器
- Reddit: r/OpenClaw
- Twitter: 搜索#OpenClaw hashtag

遇到问题在这些地方问，通常很快就有人回答。

## 学习路径总结

![圖片](https://pbs.twimg.com/media/HB751BUbQAA1YrH?format=png&name=medium)

如果你想一步步的打怪升级，按顺序来做一些操作，我还特别推荐Noci@[Nicolechan](https://x.com/stark_nico99)的OpenClaw新手到进阶指南。

https://x.com/stark_nico99/status/2026235176150581282?s=20

再附上官方的中文学习教程指南：

https://docs.openclaw.ai/zh-CN/start/showcase

**小Tips：**

1、ClawHub需要登录，否则会限制速率。

2、安装clawhub，也必须需要登录，然后以此来安装所需的skills，比如Twitter、Youtube这些

3、OpenClaw想要去做更多事情，那么则得给更多权限， 比如要登录，比如要配置各个API，否则做不了啥事情：最好申请单独的谷歌邮箱账号

这些权限都是在一个个使用场景中，逐步开放和配置的，不用着急，最关键的还是得有使用场景。

#  

# 最后的话

![圖片](https://pbs.twimg.com/media/HB76B7LbYAA_CGq?format=jpg&name=medium)

从完全不懂到能熟练使用OpenClaw，我大概花了3周时间。前两周主要是搭建和调试，第三周开始真正感受到它的价值。

现在回头看，最重要的不是技术有多复杂，而是要**按照正确的顺序学习**。不要跳步，每个阶段都扎实掌握了再进入下一阶段。

我把这篇教程分享出来，就是希望能帮更多新手少走弯路。如果你在学习过程中遇到问题，欢迎在评论区留言，我看到了会尽量回复。

也欢迎你把自己踩过的坑、发现的好资源分享出来，让这个学习路径更完善。

祝你早日拥有自己的AI助手！搞定你的龙虾军团🎉

最后，欢迎关注我的即刻 & 公众号：鱼总聊AI