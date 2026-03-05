---
title: OpenClaw 调教手册：从“能用”到“离不开”的 7 个进阶配置
date: 2026-03-02T03:32:24.659Z
---

# OpenClaw 调教手册：从"能用"到"离不开"

> 上篇 [《OpenClaw 刚配好就完了？几步调教让你的 AI 助手脱胎换骨》](https://linux.do/t/topic/1635713) 教你给 AI 装上了人格和记忆。
>
> 但你可能发现——它还是只能等你说话才动，复杂任务经常翻车，token 费用蹭蹭涨。
>
> 这篇解决这些问题。

**写在前面**：这篇教程是折腾 OpenClaw 一个多月、踩了无数坑之后总结出来的实战经验。不是翻译官方文档，是真金白银的 token 烧出来的。每一个配置、每一个"推荐值"都是反复试错后的结论。

写这么长一篇不容易，如果对你有帮助，**恳请点个赞、留个评论**，让更多人看到。有问题直接评论区问，看到都会回。白嫖可以，但互动一下更好——你的反馈也是继续写下去的动力 😄

---

如果你还没看过上篇，建议先看完再来。本篇默认你已经：

- 装好了 OpenClaw 并能正常聊天
- 写过 SOUL.md / USER.md / IDENTITY.md
- 知道 MEMORY.md 和 memorySearch 是什么

本篇覆盖 7 个主题，每个都是**手把手级别**，配置可以直接复制粘贴：

1. **AGENTS.md** — 给 AI 写一部行为宪法
2. **记忆系统实战** — 让 AI 真正"记住"，而且自己维护
3. **子 Agent** — 一个人变一支团队
4. **Cron 定时任务** — 精确到分钟的自动化
5. **Skill 开发** — 教 AI 学新技能
6. **多渠道接入** — 随时随地找到你的 AI
7. **配置速查表** — 把每个参数调到最优

先看一眼效果对比：

|          | 上篇水平         | 本篇调教后                           |
| -------- | ---------------- | ------------------------------------ |
| 行为规范 | SOUL.md 写了几行 | 完整行为宪法，知道什么该做什么不该做 |
| 记忆     | 有分层结构       | 自动维护、自动压缩、语义检索秒回     |
| 任务能力 | 主脑单线程干活   | 一个人变一支团队，并行派活           |
| 自动化   | 心跳能巡检       | 精确定时任务，早报晚报自动发         |
| 扩展性   | 装了几个 skill   | 自己能写 skill，想要什么能力就加什么 |
| 渠道     | 接了一个平台     | 多平台同时在线，消息路由自如         |
| 配置     | 能跑就行         | 每个参数都调到最优                   |

---

## 一、AGENTS.md — 给 AI 写一部行为宪法

### 这是什么？为什么重要？

上篇我们写了 SOUL.md（它是谁）、USER.md（你是谁）、IDENTITY.md（名字和形象）。

但你有没有发现一个问题：**AI 不知道该怎么工作。**

它不知道每次新对话该先读什么文件，不知道记忆该写到哪里，不知道哪些操作可以自己做、哪些要先问你。就像招了一个很聪明的实习生，但没给他工作手册。

这就是 AGENTS.md 的作用——**它是 AI 的工作手册**。

打个比方：

- SOUL.md = 性格（"你是一个随和、实在的助手"）
- AGENTS.md = 工作手册（"每天上班先看邮件，写完代码要测试，删文件前要问我"）

AGENTS.md 放在 workspace 根目录（跟 SOUL.md 同级），OpenClaw 每次新 session 都会自动加载它。

### Session 启动流程：AI 醒来第一件事该做什么？

这是 AGENTS.md 里最重要的部分。

AI 每次新 session 都是"失忆"状态——它不记得上次聊了什么。所以你需要告诉它：**醒来之后，按什么顺序读文件来恢复记忆。**

在 AGENTS.md 里加上这段：

```markdown
## Every Session

Before doing anything else:

1. Read `SOUL.md` — this is who you are
2. Read `USER.md` — this is who you're helping
3. Read `memory/YYYY-MM-DD.md` (today + yesterday) for recent context
4. If in MAIN SESSION (direct chat with your human): Also read `MEMORY.md`

Don't ask permission. Just do it.
```

逐行解释：

**第 1-2 步**：读 SOUL.md 和 USER.md。这两个文件很小（通常不到 1KB），读了之后 AI 就知道自己是谁、在帮谁。每次都读，成本可以忽略。

**第 3 步**：读今天和昨天的日志。这是最关键的——日志里记录了最近发生的事，读完之后 AI 就能接上之前的工作。为什么要读昨天的？因为如果现在是凌晨 1 点，今天的日志可能还是空的，昨天的才有内容。

**第 4 步**：只在主 session 读 MEMORY.md。这里有个细节——什么是"主 session"？

OpenClaw 里有很多种 session：

- **主 session**：你直接跟 AI 聊天的对话（比如 Discord 私聊、WebChat）
- **群聊 session**：Discord 服务器里的群聊
- **子 agent session**：AI 派出去执行任务的子进程
- **cron session**：定时任务触发的对话

MEMORY.md 里可能包含你的个人信息（项目状态、服务器配置等），不应该在群聊或其他 session 里加载。所以我们限制只在主 session 读。

> 💡 **小白提示**：你不需要手动判断当前是什么 session。只要在 AGENTS.md 里写清楚规则，AI 会自己判断。OpenClaw 的 system prompt 里会告诉 AI 当前的 session 类型。

### 记忆写入规范：教 AI 怎么记笔记

光会读记忆不够，还得教它怎么**写**记忆。

上篇我们设计了分层记忆结构：

```
MEMORY.md          ← 索引层
memory/projects.md ← 项目层
memory/infra.md    ← 基础设施层
memory/lessons.md  ← 教训层
memory/YYYY-MM-DD.md ← 日志层
```

但如果你不告诉 AI 该往哪一层写、用什么格式写，它要么全堆到 MEMORY.md 里（变成流水账），要么根本不写（下次就忘了）。

在 AGENTS.md 里加上写入规范：

```markdown
## Memory

You wake up fresh each session. These files are your continuity.

### 记忆分层
| 层级 | 文件 | 用途 |
|------|------|------|
| 索引层 | `MEMORY.md` | 关于用户、能力概览、记忆索引。保持精简(<40行) |
| 项目层 | `memory/projects.md` | 各项目当前状态与待办 |
| 基础设施层 | `memory/infra.md` | 服务器、API、部署等配置速查 |
| 教训层 | `memory/lessons.md` | 踩过的坑，按严重程度分级 |
| 日志层 | `memory/YYYY-MM-DD.md` | 每日原始记录 |

### 写入规则
- **日志**：当天发生的事写入 `memory/YYYY-MM-DD.md`，格式：
```

  ### [PROJECT:名称] 标题

  - **结论**: 一句话总结
  - **文件变更**: 涉及的文件
  - **教训**: 踩坑点（如有）
  - **标签**: #tag1 #tag2

  ```
- **项目状态**：项目有进展时同步更新 `memory/projects.md`
- **教训**：踩坑后写入 `memory/lessons.md`
- **MEMORY.md**：只在索引变化时更新，保持精简

### 铁律
- 记结论不记过程（"部署成功，用了 nginx 反代" ✅ vs 三页操作日志 ❌）
- 标签便于 memorySearch 检索
- "Mental notes" don't survive session restarts. Files do. 想记住就写文件。
  ```

这段规范的核心思想是：**记结论不记过程**。

为什么？因为 AI 的上下文窗口是有限的。如果日志里全是"我先试了方案 A，不行，又试了方案 B，还是不行，最后用方案 C 成功了"这种流水账，读日志就要消耗大量 token。

正确的做法是只记："用方案 C 成功了。方案 A/B 失败原因是 XX。"

下面是一个好日志和烂日志的对比：

**❌ 烂日志：**

```markdown
### 部署
今天部署了项目。先试了直接跑，报错了。然后查了半天，发现是端口被占了。
用 lsof 查了一下，发现是 nginx 占了 80 端口。把 nginx 停了，项目跑起来了。
但是后来发现直接跑不行，需要用 nginx 反代。又配了 nginx，折腾了一个小时，
终于搞定了。配置文件在 /etc/nginx/sites-available/myapp。
```

**✅ 好日志：**

```markdown
### [PROJECT:MyApp] 部署完成
- **结论**: 用 nginx 反代部署成功，监听 80 端口
- **文件变更**: `/etc/nginx/sites-available/myapp`
- **教训**: 直接暴露端口不可行，必须走 nginx 反代
- **标签**: #myapp #deploy #nginx
```

第二种格式，AI 用 memorySearch 搜"MyApp 部署"就能精准命中，而且一眼就能看到结论。

### 安全边界：什么能做，什么不能做

这部分很多人忽略，但非常重要。没有安全边界的 AI 可能会：

- 在群聊里泄露你的私人信息
- 未经确认就发邮件或推文
- 用 `rm -rf` 删掉重要文件

在 AGENTS.md 里加上：

```markdown
## Safety

- Don't exfiltrate private data. Ever.
- Don't run destructive commands without asking.
- `trash` > `rm` (recoverable beats gone forever)
- When in doubt, ask.

## External vs Internal

**Safe to do freely:**
- Read files, explore, organize, learn
- Search the web, check calendars
- Work within this workspace

**Ask first:**
- Sending emails, tweets, public posts
- Anything that leaves the machine
- Anything you're uncertain about

## Group Chats

You have access to your human's stuff. That doesn't mean you share it.
In groups, you're a participant — not their voice, not their proxy.
```

关键原则：

1. **内部操作自由，外部操作要问**。读文件、搜索、整理——随便做。发消息、发邮件、任何"出去"的操作——先问。
2. **trash > rm**。删文件用 trash（可恢复），不用 rm（永久删除）。
3. **群聊里管住嘴**。AI 能看到你的文件和记忆，但在群聊里不能替你说话，也不能泄露你的私人信息。

### 完整 AGENTS.md 模板

下面是一个可以直接复制使用的模板。把它保存为 workspace 根目录的 `AGENTS.md`：

```markdown
# AGENTS.md - Your Workspace

This folder is home. Treat it that way.

## Every Session

Before doing anything else:

1. Read `SOUL.md` — this is who you are
2. Read `USER.md` — this is who you're helping
3. Read `memory/YYYY-MM-DD.md` (today + yesterday) for recent context
4. If in MAIN SESSION: Also read `MEMORY.md`

Don't ask permission. Just do it.

## Memory

You wake up fresh each session. These files are your continuity:

| 层级 | 文件 | 用途 |
|------|------|------|
| 索引层 | `MEMORY.md` | 核心信息和记忆索引，保持精简 |
| 项目层 | `memory/projects.md` | 各项目当前状态与待办 |
| 教训层 | `memory/lessons.md` | 踩过的坑，按严重程度分级 |
| 日志层 | `memory/YYYY-MM-DD.md` | 每日记录 |

### 写入规则
- 日志写入 `memory/YYYY-MM-DD.md`，记结论不记过程
- 项目有进展时同步更新 `memory/projects.md`
- 踩坑后写入 `memory/lessons.md`
- MEMORY.md 只在索引变化时更新
- 想记住就写文件，不要靠"记在脑子里"

### 日志格式
```

### [PROJECT:名称] 标题

- **结论**: 一句话总结
- **文件变更**: 涉及的文件
- **教训**: 踩坑点（如有）
- **标签**: #tag1 #tag2

```
## Safety

- Don't exfiltrate private data. Ever.
- Don't run destructive commands without asking.
- `trash` > `rm`
- When in doubt, ask.

**Safe to do freely:** Read files, search, organize, work within workspace
**Ask first:** Sending emails/tweets, anything that leaves the machine

## Group Chats

You have access to your human's stuff. That doesn't mean you share it.
In groups, you're a participant — not their voice, not their proxy.

## Tools

Skills provide your tools. When you need one, check its SKILL.md.
```

> 💡 这个模板是精简版。随着你用 OpenClaw 越来越深入，你会不断往里加规则。我的 AGENTS.md 已经有 200 多行了——但都是一点点积累起来的，不是一次写完的。

---

## 二、记忆系统实战 — 让 AI 真正"记住"

### 上篇回顾

上篇我们做了两件事：

1. 设计了分层记忆结构（MEMORY.md + memory/*.md）
2. 配置了 memorySearch（语义检索）

但你可能遇到了这些问题：

- 聊了很长一段对话，AI 突然"失忆"了（上下文被压缩了）
- 日志越来越多，但质量参差不齐，搜索命中率不高
- 记忆文件没人维护，过期信息越堆越多

本章解决这三个问题。

### memoryFlush：对话再长也不丢记忆

**问题场景**：你跟 AI 聊了一个小时，讨论了很多重要决策。突然 AI 的回复变得奇怪——它好像忘了之前说的话。

这是因为 OpenClaw 的**上下文压缩（compaction）**触发了。每个模型都有上下文窗口限制（比如 Claude 是 200K token），当对话接近这个限制时，OpenClaw 会自动把旧的对话压缩成摘要，腾出空间。

压缩本身没问题，但问题是：**压缩过程中可能丢失细节**。比如你们讨论了一个配置的具体参数值，压缩后可能只剩"讨论了配置问题"。

**解决方案**：开启 `memoryFlush`。

memoryFlush 的工作原理：

1. OpenClaw 检测到上下文快满了（距离压缩还有一定余量时）
2. 在压缩之前，先给 AI 发一条隐藏的提示："上下文快满了，赶紧把重要信息写到文件里"
3. AI 把关键信息写入 memory/ 目录下的文件
4. 然后才执行压缩

这样即使压缩丢了细节，重要信息已经持久化到文件里了。

**配置方法**：在 `openclaw.json` 里加上：

```json
{
  "agents": {
    "defaults": {
      "compaction": {
        "reserveTokensFloor": 20000,
        "memoryFlush": {
          "enabled": true,
          "softThresholdTokens": 4000
        }
      }
    }
  }
}
```

参数解释：

| 参数                              | 含义                                | 推荐值 |
| --------------------------------- | ----------------------------------- | ------ |
| `reserveTokensFloor`              | 压缩后至少保留多少 token 的最近对话 | 20000  |
| `memoryFlush.enabled`             | 是否开启压缩前自动保存              | `true` |
| `memoryFlush.softThresholdTokens` | 距离压缩多少 token 时触发保存       | 4000   |

`softThresholdTokens` 设成 4000 的意思是：当剩余空间不到 4000 token 时，触发 memoryFlush。这个值不能太小（太小了 AI 没空间写文件），也不能太大（太大了会频繁触发）。 4000 是个不错的平衡点。

**效果**：开启后，你会发现即使聊了很久，AI 也能记住之前的关键信息。因为它在压缩前已经把重要的东西写到文件里了。

> 💡 **怎么知道 memoryFlush 触发了？** 你通常不会注意到——它是静默执行的。AI 会在后台写文件，不会打断你的对话。如果你开了 verbose 模式（`/verbose`），可以看到 `🧹 Auto-compaction complete` 的提示。

### 日志写入规范：让 memorySearch 更精准

上一章我们在 AGENTS.md 里定义了日志格式。这里深入讲讲为什么这个格式能提升 memorySearch 的精度。

memorySearch 的底层是**向量语义检索**——它把你的搜索词和日志内容都转成向量，然后找最相似的。

这意味着：

- **标签**（`#deploy #nginx`）能显著提升召回率，因为搜索"部署"时，`#deploy` 标签会被匹配到
- **结构化格式**比自由文本更容易被精准匹配，因为关键信息集中在固定位置
- **一条日志一个主题**比"今天做了 A、B、C 三件事"更好，因为搜索 A 时不会被 B、C 干扰

实际效果对比：

**搜索词**："nginx 部署问题"

**非结构化日志**（命中率低）：

```
今天折腾了一天，先搞了数据库迁移，然后部署了新版本，nginx 配置改了一下...
```

→ 这条日志包含太多无关信息，向量相似度被稀释了。

**结构化日志**（命中率高）：

```
### [PROJECT:MyApp] nginx 反代配置
- **结论**: 用 nginx 反代部署成功
- **教训**: upstream 要用 127.0.0.1 不要用 localhost（IPv6 问题）
- **标签**: #nginx #deploy #myapp
```

→ 标题、结论、标签都跟搜索词高度相关，精准命中。

### 自动记忆维护：防止记忆腐烂

日志写多了会有一个问题：**过期信息堆积**。

比如三个月前你在调试一个 bug，日志里记了一堆调试过程。现在 bug 早就修了，这些日志就是噪音——它们会干扰 memorySearch 的结果。

解决方案：**定期维护**。

在 HEARTBEAT.md 里加上每周维护任务：

```markdown
## 记忆维护（每周一次）

读取 `memory/heartbeat-state.json`，检查 `lastMemoryMaintenance` 字段。
如果距今 >= 7 天：
1. 读最近 7 天的 `memory/YYYY-MM-DD.md` 日志
2. 提炼有价值的信息到对应文件（projects.md / lessons.md）
3. 压缩已完成一次性任务的日志为一行结论
4. 删除过期信息
5. 更新 `heartbeat-state.json` 的 `lastMemoryMaintenance` 为今天
```

然后在 workspace 里创建 `memory/heartbeat-state.json`：

```json
{
  "lastMemoryMaintenance": "2026-01-01"
}
```

AI 每次心跳时会检查这个文件，如果超过 7 天没维护，就自动执行维护流程。

维护的核心操作：

- **提炼**：把日志里有长期价值的信息（项目决策、踩坑教训）搬到对应的层级文件
- **压缩**：已完成的一次性任务，从详细日志压缩成一行结论
- **清理**：删除完全过期的信息（比如"明天要开会"这种过了就没用的）

### memorySearch 进阶：免费 Embedding API

上篇提到了用 SiliconFlow 的免费 embedding API。这里给一个更详细的配置：

```json
{
  "memorySearch": {
    "enabled": true,
    "provider": "openai",
    "remote": {
      "baseUrl": "https://api.siliconflow.cn/v1",
      "apiKey": "你的 SiliconFlow API key"
    },
    "model": "BAAI/bge-m3"
  }
}
```

**为什么推荐 bge-m3？**

- 免费（SiliconFlow 的免费额度足够个人使用）
- 中英文双语支持好（你的日志可能中英混写）
- 向量维度 1024，精度 and 性能平衡好

**SiliconFlow API key 怎么获取？**

1. 去 [siliconflow.cn](https://siliconflow.cn) 注册账号
2. 进入控制台，创建 API key
3. 免费额度每天有几百万 token，个人使用完全够

**memory_search 和 memory_get 怎么配合？**

AI 内部的工作流程是这样的：

1. 你问："上次那个 nginx 问题怎么解决的？"
2. AI 调用 `memory_search("nginx 问题")`，返回最相关的几条结果（包含文件路径 and 行号）
3. AI 调用 `memory_get(path="memory/2026-02-18.md", from=47, lines=10)`，精确读取那几行
4. AI 基于读到的内容回答你

这个两步走的设计很聪明：search 负责"找到在哪"，get 负责"读出来"。这样不需要把所有记忆文件都加载到上下文里，只读需要的部分。

---

## 三、子 Agent — 一个人变一支团队

### 什么是子 Agent？

到目前为止，你的 AI 是"单线程"的——你说一句，它做一件事，做完了再听你下一句。

但如果你要它做一个复杂任务呢？比如："帮我审查这个项目的代码，检查安全漏洞、性能问题 and 代码风格。"

单线程的 AI 会从头到尾一个人干，可能要跑半个小时。而且中间你没法跟它聊别的——它在忙。

**子 Agent 解决这个问题。**

子 Agent 的原理很简单：主 AI（我们叫它"主脑"）可以**派出独立的 AI 进程**去执行任务。每个子 Agent 有自己的 session、自己的上下文，甚至可以用不同的模型。

打个比方：

- 没有子 Agent：你是老板，只有一个员工，所有活都他一个人干
- 有子 Agent：你是老板，有一个秘书（主脑），秘书可以派实习生（子 Agent）去干活

主脑负责理解你的需求、拆分任务、派活、汇总结果。子 Agent 负责执行具体任务。

### 怎么用？

在 OpenClaw 里，主脑通过 `sessions_spawn` 工具来派子 Agent。你不需要手动调用这个工具——只要在 AGENTS.md 里告诉 AI 它可以派子 Agent，它就会在合适的时候自动使用。

但你需要做两件事：

**第一，在 AGENTS.md 里写明子 Agent 的使用规范：**

```markdown
## 子 Agent

如果任务比较复杂或耗时较长，可以派子 agent 去执行。

### 模型选择
| 等级 | 模型 | 适用场景 |
|------|------|----------|
| 🔴 高 | opus | 复杂架构设计、多文件重构、深度推理 |
| 🟡 中 | sonnet | 写代码、写脚本、信息整理（默认选这个） |
| 🟢 低 | haiku | 简单文件操作、格式转换、搜索汇总 |

默认用 sonnet，性价比最高。
只有真正需要深度思考的任务才上 opus。
纯机械操作用 haiku。
```

**第二，在 `openclaw.json` 里配置模型别名：**

```json
{
  "models": {
    "your-provider/claude-opus-4": { "alias": "opus" },
    "your-provider/claude-sonnet-4": { "alias": "sonnet" },
    "your-provider/claude-haiku-4": { "alias": "haiku" }
  }
}
```

把 `your-provider` 换成你实际用的 API 提供商 and 模型名。配置好之后，AI 派子 Agent 时就可以直接说"用 sonnet"，而不用写一长串模型全名。

> 💡 **小白提示**：如果你只有一个模型（比如只有 Claude Sonnet），也完全可以用子 Agent。子 Agent 的价值不只是用不同模型——更重要的是**并行执行** and **隔离上下文**。

### 模型分级的省钱效果

这是实打实的省钱技巧。

假设你让 AI 做以下任务：

1. 搜索 10 个网页，汇总信息（简单）
2. 写一个 Python 脚本（中等）
3. 审查一个复杂项目的架构设计（困难）

**不分级**：三个任务都用 Opus（最贵的模型），总成本￥￥￥。

**分级后**：

- 任务 1 → Haiku（￥）
- 任务 2 → Sonnet（￥￥）
- 任务 3 → Opus（￥￥￥）

实际体验下来，**token 消耗能降 60-70%**，因为大部分日常操作根本不需要最强模型。Haiku 搜个网页、改个文件名，跟 Opus 做得一样好，但便宜 10 倍以上。

### 上下文传递：子 Agent 的最大坑

这是用子 Agent 最容易踩的坑：**子 Agent 是"零上下文"的**。

什么意思？主脑知道你之前聊了什么、项目背景是什么、有哪些约束。但子 Agent 不知道——它被派出去的时候，只能看到主脑给它的 task 描述。

所以，**task 描述的质量决定了子 Agent 的输出质量**。

一个好的 task 描述应该包含：

1. **目标**：要做什么，产出是什么
2. **文件路径**：要读/写的具体文件
3. **约束**：不可修改的文件、编码规范等
4. **相关背景**：项目上下文、之前的决策
5. **验收标准**：怎么判断做得对不对

**❌ 烂的 task 描述：**

```
帮我审查一下代码
```

→ 子 Agent：审查什么代码？在哪？关注什么？输出什么格式？全靠猜。

**✅ 好的 task 描述：**

```
## 任务：代码安全审查

### 目标
审查 /root/project/src/ 目录下的所有 .js 文件，
重点检查 API 安全问题。

### 关注点
1. SQL 注入风险
2. 未验证的用户输入
3. 硬编码的密钥或 token
4. 缺少权限检查的 API 端点

### 约束
- 只读不写，不要修改任何文件
- 忽略 node_modules/ 和 test/ 目录

### 输出格式
按严重程度分级（🔴致命 / 🟡重要 / 🟢建议），
每个问题给出：文件路径、行号、问题描述、修复建议。

### 结果
写入 /root/project/SECURITY-REVIEW.md
```

看到区别了吗？第二种描述，子 Agent 拿到就能直接干活，不需要猜。

### 并发控制

子 Agent 可以并行跑——主脑可以同时派出多个子 Agent 执行不同任务。

但要注意 **API 限流**。大多数 API 提供商都有每分钟请求数限制（RPM）。如果你同时跑太多子 Agent，可能会触发 429（Too Many Requests）错误。

经验值：**同时最多跑 2 个子 Agent**。如果你的 API 额度充足，可以试试 3 个，但 4 个基本上会 429。

另外，**有依赖关系的任务必须串行**。比如：

- 任务 A：生成数据库 schema
- 任务 B：基于 schema 写 API 代码

任务 B 依赖任务 A 的输出，所以必须等 A 完成再派 B。主脑会自动处理这种依赖关系——前提是你在 AGENTS.md 里提醒了它注意这一点。

### 实战示例：让 AI 帮你做代码审查

完整流程：

1. 你说："帮我审查一下 /root/project 的代码安全"
2. 主脑分析需求，决定这是个复杂任务，需要派 opus 级别的子 Agent
3. 主脑构造 task 描述（包含文件路径、审查重点、输出格式）
4. 主脑调用 `sessions_spawn`，派出子 Agent
5. 子 Agent 在独立 session 中执行审查（读文件、分析、写报告）
6. 子 Agent 完成后，结果自动发回给主脑所在的聊天
7. 主脑总结结果，通知你："审查完成，发现 2 个致命问题和 5 个重要问题，详见 SECURITY-REVIEW.md"

整个过程中，你可以继续跟主脑聊别的事情——子 Agent 在后台独立运行，不会阻塞主对话。

---

## 四、Cron 定时任务 — 精确到分钟的自动化

### Heartbeat vs Cron：先搞清楚区别

上篇我们讲了 Heartbeat（心跳），它能让 AI 定期检查服务状态、整理记忆。但 Heartbeat 有几个局限：

|          | Heartbeat                  | Cron                      |
| -------- | -------------------------- | ------------------------- |
| 精度     | 大约每 30 分钟（会有偏差） | 精确到分钟（cron 表达式） |
| 执行环境 | 在主 session 里执行        | 可以开独立 session        |
| 模型     | 用主脑的模型               | 可以指定不同模型          |
| 适合     | 批量轻量检查               | 精确定时、独立任务        |

**什么时候用 Heartbeat？**

- "顺便检查一下"的轻量任务
- 多个检查可以批量执行
- 不需要精确时间

**什么时候用 Cron？**

- "每天早上 9 点整"这种精确定时
- 需要独立 session（不污染主对话）
- 想用便宜模型执行（比如用 Haiku 发新闻摘要）
- 一次性提醒（"20 分钟后提醒我"）

### Cron 的两种执行模式

这是理解 Cron 的关键。

**模式一：Main Session（systemEvent）**

往主 session 注入一条系统消息。AI 在下次活跃时会看到这条消息并处理。

适合：提醒、通知类任务。

```json
{
  "name": "开会提醒",
  "schedule": { "kind": "at", "at": "2026-02-23T09:50:00+08:00" },
  "payload": { 
    "kind": "systemEvent", 
    "text": "提醒：10 分钟后有产品评审会议" 
  },
  "sessionTarget": "main"
}
```

**模式二：Isolated Session（agentTurn）**

开一个全新的独立 session，AI 在里面执行任务，完成后把结果发回给你。

适合：需要执行操作的任务（搜索、生成报告、检查服务）。

```json
{
  "name": "每日早报",
  "schedule": { "kind": "cron", "expr": "0 9 * * *", "tz": "Asia/Shanghai" },
  "payload": { 
    "kind": "agentTurn", 
    "message": "搜索今天的科技新闻热点，整理成 5 条简报发给我。",
    "model": "haiku"
  },
  "sessionTarget": "isolated",
  "delivery": { "mode": "announce" }
}
```

注意 `delivery: { "mode": "announce" }`——这告诉 OpenClaw 把执行结果发送到你的聊天渠道。如果不设 delivery，任务会静默执行（结果不会发给你）。

> 💡 **小白提示**：`sessionTarget: "main"` 只能搭配 `payload.kind: "systemEvent"`，`sessionTarget: "isolated"` 只能搭配 `payload.kind: "agentTurn"`。搞混了会报错。

### 三种调度类型

**1. `at` — 一次性定时**

在指定时间点执行一次，执行完自动删除。

```json
"schedule": { "kind": "at", "at": "2026-02-23T16:00:00+08:00" }
```

适合：提醒、一次性任务。注意时间格式是 ISO 8601，带时区偏移（`+08:00` 是东八区）。

**2. `every` — 固定间隔循环**

每隔 N 毫秒执行一次。

```json
"schedule": { "kind": "every", "everyMs": 3600000 }
```

`3600000` 毫秒 = 1 小时。常用值：

- 5 分钟 = 300000
- 30 分钟 = 1800000
- 1 小时 = 3600000
- 24 小时 = 86400000

适合：定期巡检、轮询。

**3. `cron` — cron 表达式**

最灵活，支持标准 cron 表达式。

```json
"schedule": { "kind": "cron", "expr": "0 9 * * 1", "tz": "Asia/Shanghai" }
```

这个表达式的意思是：每周一早上 9 点（上海时间）。

cron 表达式格式：`分 时 日 月 星期`

| 字段 | 范围 | 示例                    |
| ---- | ---- | ----------------------- |
| 分   | 0-59 | `0` = 整点，`30` = 半点 |
| 时   | 0-23 | `9` = 早上9点           |
| 日   | 1-31 | `1` = 每月1号           |
| 月   | 1-12 | `*` = 每月              |
| 星期 | 0-6  | `1` = 周一，`0` = 周日  |

常用表达式：

- `0 9 * * *` — 每天早上 9 点
- `0 9 * * 1` — 每周一早上 9 点
- `0 9,18 * * *` — 每天早上 9 点和下午 6 点
- `*/30 * * * *` — 每 30 分钟
- `0 0 1 * *` — 每月 1 号零点

**⚠️ 重要：一定要设 `tz`（时区）！** 不设的话默认 UTC，你以为设的早上 9 点其实是下午 5 点（UTC+8）。

### 四个实用场景（完整配置，可直接复制）

#### 场景 1：N 分钟后提醒我

最常用的场景。你跟 AI 说"20 分钟后提醒我喝水"，AI 会自动创建一个 cron 任务。

但你也可以手动创建。在 OpenClaw 的 webchat 或聊天渠道里直接说：

```
帮我设一个 20 分钟后的提醒：该喝水了
```

AI 会自动调用 cron 工具创建任务。如果你想手动配置：

```json
{
  "name": "喝水提醒",
  "schedule": { 
    "kind": "at", 
    "at": "2026-02-23T04:20:00Z" 
  },
  "payload": { 
    "kind": "systemEvent", 
    "text": "⏰ 提醒：该喝水了！" 
  },
  "sessionTarget": "main"
}
```

#### 场景 2：每天早上发新闻简报

每天早上 9 点，AI 自动搜索新闻并发给你：

```json
{
  "name": "每日早报",
  "schedule": { 
    "kind": "cron", 
    "expr": "0 9 * * *", 
    "tz": "Asia/Shanghai" 
  },
  "payload": { 
    "kind": "agentTurn", 
    "message": "搜索今天的科技和 AI 领域新闻热点，整理成 5 条简报。每条包含：标题、一句话摘要、来源链接。",
    "model": "haiku"
  },
  "sessionTarget": "isolated",
  "delivery": { "mode": "announce" }
}
```

注意这里用了 `model: "haiku"`——新闻搜索和汇总是简单任务，用最便宜的模型就够了。

#### 场景 3：每小时检查服务状态

如果你跑了一些服务（网站、API、数据库），可以让 AI 定期检查：

```json
{
  "name": "服务巡检",
  "schedule": { 
    "kind": "every", 
    "everyMs": 3600000 
  },
  "payload": { 
    "kind": "agentTurn", 
    "message": "用 curl 检查以下服务是否在线：\n1. http://localhost:8080 (我的网站)\n2. http://localhost:3000 (API 服务)\n\n如果全部正常，不要通知我。只有挂了才通知，并说明哪个挂了、返回了什么错误码。",
    "model": "haiku"
  },
  "sessionTarget": "isolated",
  "delivery": { "mode": "announce" }
}
```

关键点：`"只有挂了才通知我"`。不加这句的话，AI 每小时都会给你发"一切正常"，很烦。

#### 场景 4：每周一发项目周报

```json
{
  "name": "周报",
  "schedule": { 
    "kind": "cron", 
    "expr": "0 10 * * 1", 
    "tz": "Asia/Shanghai" 
  },
  "payload": { 
    "kind": "agentTurn", 
    "message": "读取 memory/ 目录下最近 7 天的日志文件，整理成一份周报。包含：本周完成的事项、进行中的项目、遇到的问题、下周计划。格式简洁，用 bullet points。",
    "model": "sonnet"
  },
  "sessionTarget": "isolated",
  "delivery": { "mode": "announce" }
}
```

周报需要理解和归纳能力，所以用 sonnet 而不是 haiku。

### 管理技巧

**查看所有任务：**
在聊天里直接问 AI："列出所有 cron 任务"，或者用命令行：

```bash
openclaw cron list
```

**查看执行历史：**

```bash
openclaw cron runs --id <任务ID>
```

**禁用而不是删除：**
如果一个任务暂时不需要了，禁用它而不是删除。这样以后想重新启用很方便。

**时区踩坑提醒：**
再说一次——**一定要设 `tz` 字段**。我见过太多人设了"每天早上 9 点"的任务，结果因为没设时区，变成了 UTC 的 9 点（北京时间下午 5 点）。

---

## 五、Skill 开发入门 — 教 AI 学新技能

### Skill 是什么？

Skill 是 OpenClaw 最强大的扩展机制。

简单说：**Skill 就是一份给 AI 看的操作手册**。你把"怎么做某件事"写成一个 Markdown 文件，AI 在需要的时候自动读取并按照里面的步骤执行。

举个例子：

- 你写了一个"天气查询 Skill"，里面写了"用户问天气时，调用 XX API，返回格式是 XX"
- 之后你问 AI "今天北京天气怎么样"
- AI 自动识别这是天气相关的请求 → 读取天气 Skill → 按步骤调用 API → 返回结果

**Skill 不是插件，不是代码库**——它本质上就是一个 Markdown 文件。AI 读了这个文件，就"学会"了一个新技能。

### Skill 的加载机制

OpenClaw 从三个地方加载 Skill，优先级从高到低：

```
1. <workspace>/skills/     ← 你的 workspace 里的 skill（最高优先级）
2. ~/.openclaw/skills/     ← 全局 skill
3. 内置 skill              ← OpenClaw 自带的（最低优先级）
```

如果同名 skill 在多个位置都有，高优先级的会覆盖低优先级的。

你自己写的 skill 放在 `<workspace>/skills/` 目录下就行。

### SKILL.md 结构详解

每个 skill 是一个目录，里面必须有一个 `SKILL.md` 文件：

```
skills/
  weather/
    SKILL.md        ← 必须有，AI 读这个文件
    scripts/        ← 可选，辅助脚本
      fetch.sh
```

SKILL.md 由两部分组成：

**第一部分：YAML frontmatter（元数据）**

```yaml
---
name: weather
description: >
  获取天气信息。触发条件：用户问天气、气温、是否下雨、
  穿什么衣服、需不需要带伞等。
---
```

`description` 是最关键的字段——**AI 靠这个判断是否触发你的 skill**。

OpenClaw 启动时会读取所有 skill 的 description，放在 system prompt 里。当用户发消息时，AI 会扫描所有 skill 的 description，判断哪个最匹配。

所以 description 要写得**具体且全面**：

- ✅ "触发条件：用户问天气、气温、是否下雨、穿什么衣服、需不需要带伞"
- ❌ "天气相关的 skill"

前者列出了各种可能的触发方式，后者太模糊，AI 可能不知道"穿什么衣服"也应该触发天气 skill。

**第二部分：正文（操作指令）**

正文就是你给 AI 的操作手册。写什么都行，但建议包含：

1. **触发后第一步做什么**
2. **具体执行步骤**
3. **输出格式**
4. **错误处理**

### 手把手写一个 IP 查询 Skill

我们来从零写一个实用的 skill：查询 IP 地址的地理位置信息。

**第一步：创建目录**

```bash
mkdir -p ~/.openclaw/workspace/skills/ip-lookup
```

**第二步：写 SKILL.md**

创建 `~/.openclaw/workspace/skills/ip-lookup/SKILL.md`：

```markdown
---
name: ip-lookup
description: >
  IP 地址查询。触发条件：用户要求查询 IP 地址、
  IP 归属地、IP 定位、"这个 IP 是哪里的"、
  "帮我查一下 XX.XX.XX.XX"等。
---

# IP 地址查询

当用户要求查询 IP 地址信息时，按以下步骤执行：

## 步骤

1. 从用户消息中提取 IP 地址
2. 调用 web_fetch 访问：`http://ip-api.com/json/{IP地址}?lang=zh-CN`
3. 解析返回的 JSON 数据
4. 按以下格式回复用户：

## 输出格式

```

🌐 IP 查询结果：{IP}
📍 位置：{country} {regionName} {city}
🏢 ISP：{isp}
🏛️ 组织：{org}
⏰ 时区：{timezone}

```
## 错误处理

- 如果 API 返回 `"status": "fail"`，告诉用户"查询失败，可能是内网 IP 或无效地址"
- 如果网络超时，告诉用户"网络请求超时，请稍后重试"

## 注意事项

- ip-api.com 免费版有频率限制（45次/分钟），不要批量查询
- 不要查询用户没有明确要求查询的 IP
```

**第三步：测试**

直接跟 AI 说："帮我查一下 8.8.8.8 是哪里的"

AI 会自动识别这是 IP 查询请求 → 读取 ip-lookup 的 SKILL.md → 调用 web_fetch 访问 ip-api.com → 按格式返回结果。

如果没触发，检查 description 是否覆盖了你的问法。比如你说的是"这个 IP 在哪"，但 description 里没写"在哪"这个触发词，就可能不触发。

**第四步：迭代优化**

第一版 skill 通常不完美。根据实际测试结果调整：

- 触发不了？→ 在 description 里加更多触发词
- 输出格式不对？→ 调整输出格式模板
- 某些边界情况没处理？→ 加错误处理规则

### 进阶：带脚本的 Skill

有些任务光靠 AI 调用 web_fetch 搞不定，需要跑脚本。

比如你想做一个"视频下载 Skill"——需要调用 yt-dlp 命令行工具。这时候可以在 skill 目录里放一个脚本：

```
skills/video-downloader/
  SKILL.md
  scripts/
    download.sh
```

`download.sh`：

```bash
#!/bin/bash
URL="$1"
OUTPUT_DIR="/tmp/downloads"
mkdir -p "$OUTPUT_DIR"
yt-dlp -o "$OUTPUT_DIR/%(title)s.%(ext)s" "$URL" 2>&1
```

`SKILL.md` 里引用脚本：

```markdown
---
name: video-downloader
description: >
  视频下载。触发条件：用户发送视频链接、要求下载视频、
  "帮我下载这个视频"、B站/YouTube/Twitter 视频链接等。
---

# 视频下载

## 前置条件
- 需要 yt-dlp 已安装（`which yt-dlp` 检查）

## 步骤

1. 从用户消息中提取视频 URL
2. 执行下载脚本：
   ```bash
   bash skills/video-downloader/scripts/download.sh "视频URL"
```

3. 检查输出，确认下载成功
4. 告诉用户下载完成，文件保存在哪里

## 错误处理

- yt-dlp 未安装：提示用户运行 `pip install yt-dlp`
- 下载失败：显示错误信息，建议检查 URL 是否正确

```
> 💡 **路径注意**：SKILL.md 里引用脚本时，用相对于 workspace 的路径（`skills/video-downloader/scripts/download.sh`），不要用绝对路径。这样 skill 在不同机器上也能用。

### Skill 开发最佳实践

**1. 把 AI 当实习生**

写 SKILL.md 的时候，想象你在给一个聪明但完全不了解这个任务的实习生写操作手册。步骤要清晰、具体、无歧义。

- ❌ "调用天气 API 获取数据"（哪个 API？怎么调用？参数是什么？）
- ✅ "调用 web_fetch 访问 `http://api.example.com/weather?city={城市名}`，解析返回的 JSON 中的 `temperature` 和 `description` 字段"

**2. 先手动跑通，再写 skill**

不要一上来就写 SKILL.md。先自己手动跟 AI 对话，把流程跑通一遍。确认可行之后，再把步骤整理成 skill。

**3. 错误处理必须写**

网络超时、API 返回异常、参数格式错误——这些情况一定要在 SKILL.md 里写清楚怎么处理。不写的话，AI 遇到错误会自己瞎猜，结果不可预测。

**4. 多轮测试不同的触发方式**

用不同的说法测试：
- "查一下北京天气"
- "今天要不要带伞"
- "明天冷不冷"
- "weather in Beijing"

确保 description 覆盖了各种可能的触发方式。

**5. 用 ClawHub 装现成的 skill**

不是所有 skill 都要自己写。OpenClaw 有一个社区 skill 市场：[clawhub.com](https://clawhub.com)

安装一个 skill：
```bash
clawhub install <skill-slug>
```

更新所有已安装的 skill：

```bash
clawhub update --all
```

---

## 六、多渠道接入 — 随时随地找到你的 AI

### 支持哪些渠道？

OpenClaw 支持的渠道多到离谱：

| 渠道                | 类型     | 特点                                      |
| ------------------- | -------- | ----------------------------------------- |
| **Discord**         | 即时通讯 | 支持服务器+私聊，emoji reaction，markdown |
| **Telegram**        | 即时通讯 | 支持内联按钮、语音消息、文件传输          |
| **WhatsApp**        | 即时通讯 | 最广泛的用户基础，但格式支持有限          |
| **Signal**          | 即时通讯 | 端到端加密，隐私最强                      |
| **Slack**           | 工作协作 | 适合团队场景                              |
| **iMessage**        | 苹果生态 | 需要 macOS + BlueBubbles                  |
| **Google Chat**     | 工作协作 | Google Workspace 集成                     |
| **Matrix**          | 开源协议 | 去中心化，自托管                          |
| **IRC**             | 经典     | 极客最爱                                  |
| **Microsoft Teams** | 工作协作 | 企业场景                                  |
| **WebChat**         | 内置     | 开箱即用，浏览器访问                      |

你可以**同时接入多个渠道**。比如 Discord 私聊 + Telegram 群组 + WebChat，AI 会自动识别消息来源，回复也会发到对应的渠道。

### Discord 接入（手把手）

Discord 是最推荐的渠道之一——功能丰富、配置简单、社区活跃。

#### 第一步：创建 Discord Bot

1. 打开 [Discord Developer Portal](https://discord.com/developers/applications)
2. 点击右上角 **"New Application"**
3. 给你的应用起个名字（比如"我的 AI 助手"），点 Create
4. 左侧菜单点 **"Bot"**
5. 点 **"Reset Token"**，复制生成的 Token（⚠️ 这个 Token 只显示一次，务必保存好）

#### 第二步：开启必要的权限

还是在 Bot 页面：

1. 往下滚到 **"Privileged Gateway Intents"**
2. 开启以下三个开关：
   - ✅ **PRESENCE INTENT**
   - ✅ **SERVER MEMBERS INTENT**
   - ✅ **MESSAGE CONTENT INTENT**（最重要！不开这个 AI 收不到消息内容）

3. 点 Save Changes

#### 第三步：邀请 Bot 到你的服务器

1. 左侧菜单点 **"OAuth2"**
2. 在 **"OAuth2 URL Generator"** 里：
   - Scopes 勾选：`bot`
   - Bot Permissions 勾选：`Send Messages`、`Read Message History`、`Add Reactions`、`Use Slash Commands`
3. 复制生成的 URL，在浏览器打开
4. 选择你的服务器，点授权

#### 第四步：获取服务器 ID

1. 在 Discord 客户端，打开设置 → 高级 → 开启 **"开发者模式"**
2. 右键你的服务器名称 → **"复制服务器 ID"**

#### 第五步：配置 openclaw.json

在你的 `openclaw.json` 里加上 Discord 配置：

```json
{
  "channels": {
    "discord": {
      "token": "你的Bot Token（第一步复制的那个）",
      "allowFrom": [
        "server:你的服务器ID"
      ],
      "ackReaction": "🫐"
    }
  }
}
```

参数解释：

| 参数          | 含义                                                         |
| ------------- | ------------------------------------------------------------ |
| `token`       | Discord Bot 的 Token                                         |
| `allowFrom`   | 允许哪些来源跟 AI 说话。`server:ID` 表示整个服务器，`user:ID` 表示特定用户 |
| `ackReaction` | AI 收到消息后立刻回复的 emoji，表示"收到了，正在处理"        |

#### 第六步：重启 OpenClaw

```bash
openclaw gateway restart
```

重启后，去 Discord 给你的 Bot 发条消息试试。如果一切正常，你会先看到一个 🫐 的 reaction（表示收到了），然后几秒后收到 AI 的回复。

#### 常见问题

**Q：Bot 在线但不回复消息？**

- 检查 MESSAGE CONTENT INTENT 是否开启（第二步）
- 检查 `allowFrom` 是否包含了你的服务器 ID
- 检查 Bot 是否有 "Read Message History" 权限

**Q：Bot 回复了但内容是空的？**

- 可能是模型 API 配置有问题，检查 `openclaw.json` 里的模型配置

**Q：怎么让 Bot 只回复特定频道？**

- `allowFrom` 可以精确到频道：`"channel:频道ID"`

### Telegram 接入（手把手）

#### 第一步：创建 Telegram Bot

1. 在 Telegram 里搜索 **@BotFather**
2. 发送 `/newbot`
3. 按提示输入 Bot 名称 and 用户名
4. BotFather 会给你一个 Token，复制保存

#### 第二步：获取你的 Telegram 用户 ID

1. 在 Telegram 里搜索 **@userinfobot**
2. 给它发任意消息
3. 它会回复你的用户 ID（一串数字）

#### 第三步：配置 openclaw.json

```json
{
  "channels": {
    "telegram": {
      "token": "你的 Telegram Bot Token",
      "allowFrom": [
        "你的用户ID"
      ]
    }
  }
}
```

#### 第四步：重启并测试

```bash
openclaw gateway restart
```

去 Telegram 找你的 Bot 发条消息测试。

#### Telegram 特有功能

- **语音消息**：如果你配置了 TTS（文字转语音），AI 可以发语音消息
- **文件传输**：可以直接发送 and 接收文件
- **内联按钮**：AI 可以在消息里附带可点击的按钮（需要额外配置）

### 多渠道同时在线

你可以在 `openclaw.json` 里同时配置多个渠道：

```json
{
  "channels": {
    "discord": {
      "token": "Discord Token",
      "allowFrom": ["server:123456789"],
      "ackReaction": "🫐"
    },
    "telegram": {
      "token": "Telegram Token",
      "allowFrom": ["你的用户ID"]
    }
  }
}
```

AI 会同时在 Discord and Telegram 上线。消息路由是自动的——Discord 来的消息回复到 Discord，Telegram 来的回复到 Telegram。

### 跨渠道注意事项

不同渠道的格式支持不一样，这是个容易踩的坑：

| 格式           | Discord | Telegram | WhatsApp |
| -------------- | ------- | -------- | -------- |
| Markdown 表格  | ✅       | ❌        | ❌        |
| 代码块         | ✅       | ✅        | ❌        |
| 粗体/斜体      | ✅       | ✅        | ✅        |
| 链接预览       | ✅       | ✅        | ✅        |
| Emoji Reaction | ✅       | ✅        | ✅        |
| 内联按钮       | 需配置  | ✅        | ❌        |

如果你同时用多个渠道，建议在 AGENTS.md 里加上格式适配规则：

```markdown
## 平台格式

- **Discord/Telegram**: 可以用 markdown，代码块用 ``` 包裹
- **WhatsApp**: 不支持 markdown 表格，用 bullet list 代替
- **Discord**: 多个链接用 <> 包裹防止预览刷屏
```

AI 会根据当前消息来源的渠道自动适配格式。

---

## 七、实用配置速查表

这一章把 `openclaw.json` 里最常用的配置参数整理成速查表。每个配置都是"问题 → 解决方案 → 配置 → 效果"的格式。

### blockStreaming — AI 边想边发

**问题**：AI 回复很长的时候（比如写一段代码或一篇分析），你要等它全部生成完才能看到。如果回复有 2000 字，可能要等 30 秒才能看到第一个字。

**解决**：开启 blockStreaming。AI 会把回复分成多个块，边生成边发送。你几秒内就能看到第一块内容。

**配置**：

```json
{
  "agents": {
    "defaults": {
      "blockStreamingDefault": "on",
      "blockStreamingBreak": "text_end",
      "blockStreamingChunk": { 
        "minChars": 200, 
        "maxChars": 1500 
      }
    }
  }
}
```

**参数解释**：

| 参数                           | 含义               | 推荐值                           |
| ------------------------------ | ------------------ | -------------------------------- |
| `blockStreamingDefault`        | 全局开关           | `"on"`                           |
| `blockStreamingBreak`          | 什么时候发送一个块 | `"text_end"`（一段文字结束时发） |
| `blockStreamingChunk.minChars` | 一个块最少多少字符 | 200（太小会发太多条消息）        |
| `blockStreamingChunk.maxChars` | 一个块最多多少字符 | 1500（太大就失去了流式的意义）   |

**效果**：开启后，AI 的长回复会分成多条消息发送，体验从"等半天突然蹦出一大段"变成"像打字一样逐段出现"。

> 💡 也可以按渠道单独控制。比如 Discord 开、Telegram 关：
>
> ```json
> "channels": {
> "discord": { "blockStreaming": "on" },
> "telegram": { "blockStreaming": "off" }
> }
> ```

### ackReaction — 让用户知道 AI 收到了

**问题**：你发了一条消息，AI 在后台思考（可能要 10-20 秒），但你看不到任何反馈。你不确定它是在处理还是挂了。

**解决**：配置 ackReaction。AI 收到消息后立刻回一个 emoji reaction，表示"收到了，正在处理"。

**配置**：

在渠道配置里加上：

```json
{
  "channels": {
    "discord": {
      "ackReaction": "🫐"
    },
    "telegram": {
      "ackReaction": "👀"
    }
  }
}
```

你可以用任何 emoji。比如 🤔（思考中）、⏳（处理中）、👀（看到了）、🫐 等等，选一个你喜欢的。

**效果**：发消息后 1 秒内就能看到 emoji reaction，心里有底了。

### compaction — 上下文不爆炸

**问题**：跟 AI 聊了很久，突然它开始"失忆"——忘了之前说的话。

**原因**：每个模型都有上下文窗口限制。聊天记录超过限制后，OpenClaw 会自动压缩旧对话（compaction），压缩过程中可能丢失细节。

**解决**：配置 compaction + memoryFlush。

**配置**：

```json
{
  "agents": {
    "defaults": {
      "compaction": {
        "reserveTokensFloor": 20000,
        "memoryFlush": {
          "enabled": true,
          "softThresholdTokens": 4000
        }
      }
    }
  }
}
```

**相关命令**：

- `/compact` — 手动触发压缩（可以加指令，比如 `/compact 重点保留技术决策`）
- `/new` — 开一个全新的 session（清空历史）
- `/reset` — 重置当前 session（效果同 /new）
- `/status` — 查看当前 session 状态（token 用量、压缩次数等）

### Heartbeat 调优

**问题**：AI 半夜给你发消息，或者心跳太频繁浪费 token。

**解决**：配置 activeHours 和心跳间隔。

**配置**：

```json
{
  "agents": {
    "defaults": {
      "heartbeat": {
        "every": "30m",
        "target": "last",
        "activeHours": { 
          "start": "08:00", 
          "end": "23:00" 
        }
      }
    }
  }
}
```

**参数解释**：

| 参数                | 含义           | 推荐值                              |
| ------------------- | -------------- | ----------------------------------- |
| `every`             | 心跳间隔       | `"30m"`（30分钟）或 `"1h"`（1小时） |
| `target`            | 心跳消息发到哪 | `"last"`（最近活跃的渠道）          |
| `activeHours.start` | 几点开始心跳   | `"08:00"`                           |
| `activeHours.end`   | 几点停止心跳   | `"23:00"`                           |

设了 activeHours 之后，23:00 到 08:00 之间 AI 不会发心跳消息，不会打扰你睡觉。

> 💡 时间是按你配置的时区来的。确保你在 openclaw.json 里设了正确的时区，或者在 USER.md 里写了你的时区。

### 其他实用配置一览

| 配置路径                    | 作用                         | 推荐值                        |
| --------------------------- | ---------------------------- | ----------------------------- |
| `tools.exec.enabled`        | 是否允许 AI 执行 shell 命令  | `true`（信任 AI 时开启）      |
| `tools.web.search.enabled`  | 是否允许网页搜索             | `true`                        |
| `tools.web.search.apiKey`   | Brave Search API key（免费） | 去 brave.com/search/api 申请  |
| `tools.media.image.enabled` | 是否允许 AI 看图片           | `true`（需要模型支持 vision） |
| `agents.defaults.workspace` | workspace 路径               | `"~/.openclaw/workspace"`     |
| `channels.*.textChunkLimit` | 单条消息最大字符数           | Discord: 2000, Telegram: 4096 |

**Brave Search API 配置**（让 AI 能搜索网页）：

1. 去 [brave.com/search/api](https://brave.com/search/api/) 注册
2. 免费计划每月 2000 次搜索，个人使用足够
3. 获取 API key 后配置：

```json
{
  "tools": {
    "web": {
      "search": {
        "enabled": true,
        "apiKey": "你的 Brave Search API key"
      }
    }
  }
}
```

---

## 配置 Checklist

按优先级排序，建议从上到下逐步配置：

- [ ] **AGENTS.md**：写好 session 启动流程 + 记忆规范 + 安全边界（30 分钟）
- [ ] **memoryFlush**：开启压缩前自动保存（5 分钟，改一行配置）
- [ ] **ackReaction**：配置收到消息的确认 emoji（1 分钟）
- [ ] **blockStreaming**：开启流式回复（5 分钟）
- [ ] **Heartbeat 调优**：设置 activeHours，别半夜打扰（5 分钟）
- [ ] **memorySearch**：配置免费 embedding API（10 分钟）
- [ ] **记忆维护**：在 HEARTBEAT.md 里加每周维护任务（10 分钟）
- [ ] **模型分级**：配置 alias，在 AGENTS.md 里写分配策略（15 分钟）
- [ ] **Cron 任务**：设置 1-2 个常用定时任务（15 分钟）
- [ ] **Skill 开发**：写一个简单的自定义 skill 练手（30 分钟）
- [ ] **多渠道**：接入第二个聊天平台（30 分钟）

全部配完大概需要 2-3 小时。但不用一次全做——先做前 5 项（不到 1 小时），就能感受到明显的提升。

---

## 写在最后

上篇让你的 AI 有了人格 and 记忆，这篇让它有了工作规范、团队协作能力、自动化能力 and 扩展性。

到这一步，你的 OpenClaw 已经不是一个"聊天机器人"了——它更像一个**真正的私人助手**：

- 知道该怎么工作（AGENTS.md）
- 能记住重要的事，而且自己维护记忆（memoryFlush + 自动维护）
- 复杂任务可以派团队去做（子 Agent）
- 能定时执行任务（Cron）
- 可以学习新技能（Skill）
- 随时随地都能找到它（多渠道）

当然，OpenClaw 能做的远不止这些。浏览器自动化、复杂工作流编排、多 Agent 协作……这些更深入的玩法，以后有机会再聊。

---

**最后说几句掏心窝的话：**

这篇教程前前后后花了不少时间，从调研社区需求、梳理配置经验、到一个字一个字写出来。

写这些不是为了炫技，是因为当初配 OpenClaw 的时候，中文资料几乎为零，全靠啃英文文档 and 反复试错。既然踩过的坑已经踩了，不如整理出来让后来的人少走弯路。

**所以如果这篇对你有帮助，真心希望你能：**

1. **点个赞** 👍 — 让更多人能看到这篇教程
2. **留个评论** 💬 — 哪怕就一句"收藏了"也行，互动是继续写的最大动力
3. **分享你的经验** — 你有什么独特的配置技巧？评论区聊聊，大家一起进步
4. **遇到问题直接问** — 评论区提问看到都会回，比自己摸索快得多

下一篇写什么？在考虑几个方向：Skill 开发进阶（写一个完整的实用 skill）、Docker 部署最佳实践、或者 OpenClaw + Cloudflare 全家桶。**你最想看哪个？评论区告诉我。**

有问题也欢迎来 [OpenClaw Discord](https://discord.com/invite/clawd) 一起折腾。

> 相关链接：
>
> - [OpenClaw 官方文档](https://docs.openclaw.ai)
> - [OpenClaw GitHub](https://github.com/openclaw/openclaw)
> - [ClawHub Skill 市场](https://clawhub.com)
> - [上篇：OpenClaw 刚配好就完了？几步调教让你的 AI 助手脱胎换骨](https://linux.do/t/topic/1635713)