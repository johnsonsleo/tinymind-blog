---
title: OpenClaw 调教手册：从“能用”到“离不开”的 7 个进阶配置
date: 2026-03-02T03:32:24.659Z
---

![image.webp](https://cdn.pichub.app/img/images/b2/1f/b21f44e53dc697462edc8e8e04c66b3a51ea6192.webp)

## 写在前面：这篇默认你已经做到这些

如果你已经：

- 装好了 OpenClaw 并能正常聊天（Discord / Telegram / WebChat 都行）
- 写过 `SOUL.md / USER.md / IDENTITY.md`
- 知道 `MEMORY.md`、`memory/` 分层结构、以及 `memorySearch` 大概是啥

那就可以直接往下看了。

这篇我会讲 7 个主题，都是“能直接落地”的配置点：

1. `AGENTS.md`：给 AI 一份工作手册（最关键）
2. 记忆系统实战：让 AI 真正记住、并且自己维护
3. 子 Agent：一个人变一支小队（并行 + 上下文隔离）
4. Cron 定时任务：精确到分钟的自动化
5. Skill 开发：教 AI 学新技能（从 0 写一个 skill）
6. 多渠道接入：随时随地找到你的 AI
7. 配置速查表：常用参数的“推荐值”和坑点

------

## 先看一眼：从“上篇水平”到“本篇调教后”

| 维度     | 上篇水平           | 本篇调教后                                 |
| -------- | ------------------ | ------------------------------------------ |
| 行为规范 | `SOUL.md` 几条原则 | 有工作手册，知道该读什么、写什么、该问什么 |
| 记忆     | 分层结构 + 能搜索  | 自动写入、自动压缩、每周维护，命中更准     |
| 任务能力 | 主脑单线程         | 能派子 Agent 并行干活、汇总结果            |
| 自动化   | Heartbeat 巡检     | Cron 精确定时，早报/周报可自动发           |
| 扩展性   | 装现成 skill       | 能自己写 skill，想要什么能力就加什么       |
| 渠道     | 只接一个平台       | Discord/Telegram/WebChat 多平台同时在线    |
| 配置     | 能跑就行           | 常用参数调到相对稳、相对省 token           |

------

## 一、AGENTS.md：给 AI 写一份“工作手册”

### 1）它解决什么问题？

`SOUL.md` 决定“它像谁”，`USER.md` 决定“它在帮谁”，但很多人忽略了：**AI 并不知道该怎么工作**。

比如：

- 新 session 启动时该先读哪个文件？顺序是啥？
- 记忆应该写到哪里？用什么格式写？
- 哪些操作可以直接做？哪些必须先问你？
- 群聊里能不能引用你的私人记忆？

这就是 `AGENTS.md` 的价值：它不是性格设定，而是**工作手册**。

可以这样理解：

- `SOUL.md` = 性格（“说话实在、直接给结论”）
- `AGENTS.md` = SOP（“先读什么、再做什么、怎么记录、什么不能做”）

### 2）Session 启动流程：AI 醒来第一件事该干啥？

新 session 本质上是“刚醒来”，它不会自动带着你上次对话的上下文。你要把“恢复现场”的流程写死。

在 `AGENTS.md` 里加一个段落（建议英文写规则更稳定）：

## Every Session

Before doing anything else:

1. Read `SOUL.md` — this is who you are
2. Read `USER.md` — this is who you're helping
3. Read `memory/YYYY-MM-DD.md` (today + yesterday) for recent context
4. If in MAIN SESSION (direct chat with your human): Also read `MEMORY.md`

Don't ask permission. Just do it.

为什么要读“今天 + 昨天”的日志？因为凌晨的时候“今天”可能还是空的，昨天才有内容。

为什么 `MEMORY.md` 只在 MAIN SESSION 读？因为 `MEMORY.md` 往往放的是更私人、更核心的索引信息，不适合在群聊或 cron/子 agent 的 session 里加载。

![image.webp](https://cdn.pichub.app/img/images/a2/91/a291be2a0f35fe2e2339083c30b8a2ef569da98b.webp)

### 3）记忆写入规范：教它怎么记“可复用的结论”

很多人的记忆系统翻车，不是分层结构问题，而是**写入规范没定**。

结果通常是两种：

- 什么都堆到 `MEMORY.md`（最后变流水账）
- 或者根本不写（下次直接忘）

建议把“写到哪里、写什么、怎么写”明确下来。比如：

## Memory

You wake up fresh each session. These files are your continuity.

### 记忆分层

| 层级       | 文件                   | 用途                                     |
| ---------- | ---------------------- | ---------------------------------------- |
| 索引层     | `MEMORY.md`            | 核心信息与索引，保持精简（建议 < 40 行） |
| 项目层     | `memory/projects.md`   | 各项目当前状态与待办                     |
| 基础设施层 | `memory/infra.md`      | 服务器、API、部署配置速查                |
| 教训层     | `memory/lessons.md`    | 踩过的坑，按严重程度分级                 |
| 日志层     | `memory/YYYY-MM-DD.md` | 每日原始记录（但要“记结论”）             |

### 写入规则

- **日志**：当天发生的事写入 `memory/YYYY-MM-DD.md`，格式固定
- **项目状态**：项目有进展同步更新 `memory/projects.md`
- **教训**：踩坑后写入 `memory/lessons.md`
- **MEMORY.md**：只在索引变化时更新，保持精简

### 铁律

- 记结论不记过程
- 用标签便于 memorySearch
- 想记住就写文件，别指望“脑子里记着”

日志格式可以用这种：

### [PROJECT:名称] 标题

- **结论**: 一句话总结
- **文件变更**: 涉及的文件
- **教训**: 踩坑点（如有）
- **标签**: #tag1 #tag2

这套格式的优势是：你用 `memorySearch` 搜关键字时，命中会更集中、更干净。

### 4）安全边界：哪些事能做，哪些必须问

建议把“内部 vs 外部”划清楚，不然迟早踩坑（尤其是群聊、自动化任务）。

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

------

## 二、记忆系统实战：让 AI 真正“记住”，并且自己维护

你可能遇到过三个典型问题：

1. 聊久了突然“失忆”（对话被压缩后丢细节） 
2. 日志越写越多，但质量参差，搜索命中越来越玄学 
3. 记忆没人维护，过期信息堆成噪音

这一章就是分别解决这三件事。

### 1）memoryFlush：压缩之前先把重要信息写进文件

OpenClaw 会在上下文接近上限时触发 compaction（压缩）。压缩本身正常，但**压缩可能丢细节**。

解决办法：开 `memoryFlush`，让它在压缩前先落盘。

在 `openclaw.json` 里加（示例）：

```bash
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



简单解释下推荐值怎么理解：

- `reserveTokensFloor=20000`：压缩后至少保留一段“最近对话”
- `softThresholdTokens=4000`：剩余空间少于 4000 token 时触发 flush（太小写不下，太大触发太频繁）

### 2）让 memorySearch 更准：一条日志只讲一个主题

向量检索不怕你写得少，反而更怕“写太杂”。

经验上，命中率最高的写法是：

- 标题里就写清主题（例如 nginx 反代、IPv6、端口冲突）
- 结论放在固定位置
- 标签补齐同义词（#deploy #nginx #reverse-proxy）

非结构化“流水账”会把相似度稀释掉，搜起来就会变玄学。

### 3）每周自动维护：防止“记忆腐烂”

日志写多了以后，过期信息会污染检索结果。我的做法是：把维护变成固定流程，让 AI 每周自动做一次。

你可以在 `HEARTBEAT.md` 里加一个“每周维护”任务，搭配一个状态文件来控制频率：

- `memory/heartbeat-state.json` 记录上次维护日期
- 心跳检查“距离上次维护是否 >= 7 天”
- 超过就执行：提炼、压缩、清理、更新日期

维护动作我建议三类：

- **提炼**：把长期有用的东西搬到 `projects.md / lessons.md`
- **压缩**：一次性任务从长日志压成一行结论
- **清理**：完全过期的信息（比如“明天开会”）

------

## 三、子 Agent：一个人变一支小队（并行 + 隔离上下文）

### 1）子 Agent 到底解决啥？

主脑单线程的问题是：复杂任务一来，它要么拖很久，要么中途你没法插话。

子 Agent 的价值主要两点：

- **并行**：可以同时派 2 个小弟各干一块
- **隔离上下文**：子 agent 的长任务不会把主对话挤爆

### 2）最容易踩的坑：子 Agent 默认“零上下文”

子 Agent 只看到主脑给它的 task 描述，所以 task 写得烂，结果就会烂。

一个好 task 描述至少包括：

- 目标（要产出什么）
- 文件路径（读/写哪些）
- 约束（只读？不能改哪些？规范是什么？）
- 验收标准（什么算完成）

把 task 当成你写给“聪明但陌生的同事”的说明书，越具体越稳。

### 3）并发建议：先从 2 个子 Agent 开始

同时派太多 agent 很容易触发 API 限流（429）。经验上：

- 普通个人额度：同时 2 个最稳
- 额度大/本地模型：可以试 3 个
- 4 个以上大概率开始 429（尤其是带 web 搜索/工具调用时）

------

## 四、Cron 定时任务：精确到分钟的自动化

### 1）Heartbeat vs Cron：别混用

- **Heartbeat**：适合“顺便检查一下”的轻量任务（精度不高）
- **Cron**：适合“几点几分必须执行”的任务（精确到分钟）

如果你想做“每天 9:00 发早报”“每周一 10:00 发周报”，Cron 更合适。

![image.webp](https://cdn.pichub.app/img/images/f9/13/f91352c6a7b91a515a937ecbe6d7901933df533f.webp)

### 2）cron 表达式最常用的几个

- `0 9 * * *`：每天 9:00
- `0 9 * * 1`：每周一 9:00
- `0 9,18 * * *`：每天 9:00 和 18:00
- `*/30 * * * *`：每 30 分钟

**一定要设置时区 `tz`**，不然默认 UTC，时间会偏 8 小时（东八区最常见的坑）。

------

## 五、Skill 开发入门：从 0 写一个能用的 Skill

### 1）Skill 是什么？

它本质上是一份“操作手册（Markdown）”。

OpenClaw 会把每个 skill 的 `description` 放进系统提示里，当用户发消息时，它会匹配哪些 skill 可能触发——匹配到了，就读取对应 `SKILL.md` 按步骤执行。

所以 `description` 不是“写得优雅”，而是“写得覆盖全面”。

### 2）SKILL.md 建议结构

- frontmatter（name/description）
- 触发后第一步做什么
- 步骤（最好可执行、可复现）
- 输出格式（固定模板）
- 错误处理（一定要写）

### 3）练手建议：先写一个 IP 查询 Skill

像“IP 归属地查询”这种 skill 特别适合新手练手：触发简单、步骤明确、输出固定、错误也容易处理。

写 skill 时一个原则：**先手动跑通流程，再把流程写成 skill**。这样成功率最高。

------

## 六、多渠道接入：让 AI 随时在线，但不乱说话

多渠道接入的重点不是“接得多”，而是两件事：

1. **来源控制**：`allowFrom` 一定要收紧（服务器/用户/频道） 
2. **格式适配**：不同平台对 Markdown 支持不同（尤其表格）

如果你同时用 Discord + Telegram，建议在 `AGENTS.md` 里写“平台格式规则”：

- Discord：表格、代码块都 OK
- Telegram：表格不稳定，尽量用列表替代
- WhatsApp：基本当纯文本处理

------

## 七、配置速查表：常用参数怎么调更稳

这一章我只保留我认为“收益明显”的几个点，避免你一上来就被配置淹没。

### 1）blockStreaming：长回复别等到最后一口气

让 AI 把长回复分块发出来，体验更像“实时打字”。

推荐：

- `blockStreamingDefault: "on"`
- `minChars: 200`（太小会刷屏）
- `maxChars: 1500`（太大会失去流式意义）

### 2）ackReaction：先给你一个“我收到了”的反馈

尤其在 Discord/Telegram 这种即时通讯里，很重要。你不然会以为它挂了。

### 3）compaction + memoryFlush：聊再久也尽量不丢关键信息

你只要记住一句：**压缩前先写文件**。这就是 `memoryFlush` 的意义。

### 4）Heartbeat activeHours：别半夜打扰你

如果你开启了心跳巡检，建议配 activeHours，比如 08:00–23:00。这样它不会在你睡觉的时候发消息。

------

## 最后：建议的配置顺序（省时间版）

如果你不想一次性全做，按这个优先级来，最稳：

1. `AGENTS.md`：启动流程 + 记忆规范 + 安全边界 
2. 开启 `memoryFlush`（对话再长也不容易丢关键点） 
3. 配 `ackReaction`（体验立刻变好） 
4. 开 `blockStreaming`（长输出更舒服） 
5. Heartbeat 加 `activeHours`（不打扰） 
6. 再考虑 Cron、子 Agent、Skill、多渠道（按需上）