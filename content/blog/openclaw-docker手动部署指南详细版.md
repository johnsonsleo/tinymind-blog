---
title: Openclaw docker手动部署指南(详细版)
date: 2026-03-23T17:52:07.915Z
---


部署的时候我找了很多docker部署的公众号，虽然说官方也有文档，但是实际部署时候问题很多。[写在这里供大家参考吧](https://linux.do/t/topic/1636463)。注意，在本地电脑docker部署的话，可能会遇到更多问题。我这个是在云服务器上部署的，操作系统是debian 13，安装了1panel面板。面板上可以直接安装openclaw，但是好像不能自定义模型。


## 1. 部署

首先需要确定使用方式，这决定了你用什么方式部署。先通过 README.md 整体了解一下这个项目：<https://github.com/openclaw/openclaw/blob/main/README.md>

通过阅读文档，我们知道 OpenClaw 可以跑在本地宿主机、虚拟机、云服务器等载体上，如何和它对话呢？

它支持非常多的渠道，我选择了 Telegram。因为小龙虾的能力上限取决于模型能力，所以毋庸置疑，直接选择当前的顶级模型，Claude 或者 GPT，那结论就出来了，最佳配置方案：**海外云 VPS + Telegram + 顶级模型**。

![image|690x371](https://i.imgur.com/KcfJyDs.png)


先阅读一下部署文档再动手：<https://github.com/openclaw/openclaw/blob/main/docs/install/docker.md>

### 1.1 手动在云服务器上部署，先下载项目

```bash
git clone https://github.com/openclaw/openclaw.git
cd openclaw
./docker-setup.sh
```

运行脚本后，会在宿主机上创建两个重要文件夹，它们会被挂载到 Docker 容器中：

**① `~/.openclaw` — 配置目录**

- 存储 OpenClaw 的记忆
- 配置文件
- 第三方 API 密钥等

**② `~/openclaw/workspace` — 工作空间目录**

- Agent 可直接访问的文件目录
- Agent 创建的文件也会保存在这里

### 1.2 Docker 启动 OpenClaw 后会自动打开配置引导

![image|690x418](https://i.imgur.com/HJCGVnY.png)


先选择 **Skip for now** 跳过
![image|690x418](https://i.imgur.com/uHRofIj.png)


消息渠道我想用 Telegram，所以需要先做两件事：

1. 先在 Telegram 中搜索 `@userinfobot`，获取自己账号的用户 ID
2. 搜索 `@BotFather`，创建机器人，先创建机器人名（昵称），再创建机器人用户名，创建好之后会给你一个 Bot API Token，**记住这个 Token**
3. 等到 **Telegram (Bot API)** 这里的时候需要填上一步获取的 Bot API Token

![image|690x418](https://i.imgur.com/8xehSnM.png)


然后就是一路跳过，hooks 这里选择：`session-memory`

等出现了 Token 提示，说明配置完成：

> Token: `24b38f4bb1401bd949f5a2cc156e99bad6591847919f3ce0ab4cab02d69e037e`

大功告成。浏览器访问 `http://公网IP:18789`，但是这里最好用域名来访问，在 [5.2 节](#52-浏览器访问-http公网-ip18789-的安全问题) 有说明。

---

## 2. 消息通知渠道

然后就是在服务器上执行配对命令：

```bash
# 宿主机直接执行
openclaw pairing approve telegram YKEY9974

# Docker 版执行方式
docker compose run --rm openclaw-cli pairing approve telegram YKEY9974
```

> **注意：** 配对码默认 **1 小时**过期，每个渠道待处理请求默认上限 **3 个**。执行命令的时候如果过期，日志会提示：

```text
[openclaw] Failed to start CLI: Error: No pending pairing request found for code: 8AGF3F58
```

这个需要重新在 Telegram 发送机器人 `/start` 获取新配对码。

配对成功：

![image|690x230](https://i.imgur.com/HTOtCWa.png)


---

## 3. 模型选择

这里很多人都会纠结，模型我对比了很多家。只需要从两个角度来考虑：

### 按任务复杂度

| 类型                               | 推荐模型                        |
| ---------------------------------- | ------------------------------- |
| 编程、金融、数据分析等复杂任务     | Claude Opus 4.6、GPT 5.2 Pro    |
| 整理文件资料、P 图、写作等日常任务 | Kimi 2.5、GLM 5.0、MiniMax-M2.5 |

### 按使用频次

| 频次     | 建议                                                         |
| -------- | ------------------------------------------------------------ |
| 高频使用 | 开通模型包月/包年套餐，**GLM5 优先推荐**，能力基本上能和 Opus 4.5 打平 |
| 低频使用 | 推荐企业级 API 按量付费，稳定且便宜，如 Atlas Cloud、接口 AI |

---

## 4. Skills & MCP

### Skills

推荐去 ClawHub 社区下载，注册个账号，可以获取 API 密钥让小龙虾自己去安装。

**推荐 Skills：**

- `find-skills`
- `Agent Browser`
- `DevTools MCP`
- `auto-updater`
- `Openclaw Command Center`
- `self-improving-agent`

### MCP

因为我用的是智谱的模型，所以可以用这几个专属的 MCP，应该比第三方 MCP 的效果要好。先装上再说，不好用到时候再换就行。

![image|504x405](https://i.imgur.com/BRWAXor.png)

---

## 5. 踩坑点

### 5.1 权限问题：EACCES permission denied

**现象：** 在 `./docker-setup.sh` 启动镜像之后，出现报错：

```text
Error: EACCES: permission denied, open '/home/node/.openclaw/openclaw.json.7.xxx.tmp'
```

**原因：** Docker 权限不够 — 容器用户（`uid=1000`）试图写入 root（或其他用户）拥有的目录。

**解决方案：**

```bash
chown -R 1000:1000 "$HOME/.openclaw"
```

修改完权限后可以直接执行以下命令重新完成初始化向导：

```bash
docker compose run --rm openclaw-cli onboard
```

### 5.2 浏览器访问 `http://公网IP:18789` 的安全问题

**现象：**  页面报错：

```text
disconnected (1008): control ui requires HTTPS or localhost (secure context)
```

> This page is HTTP, so the browser blocks device identity. Use HTTPS (Tailscale Serve) or open `http://127.0.0.1:18789` on the gateway host.
>
> If you must stay on HTTP, set `gateway.controlUi.allowInsecureAuth: true` (token-only).

- [Docs: Tailscale Serve](https://docs.openclaw.ai/gateway/tailscale)
- [Docs: Insecure HTTP](https://docs.openclaw.ai/web/control-ui#insecure-http)

**解决方案：** 开启 HTTPS，需要到服务器上去创建一个反向代理站点。这里我直接使用 **Caddy** 来管理多个子域名，详细过程自行搜索。

最后可以使用域名 `https://域名.com/` 来访问小龙虾。

### 5.3 Docker 用户部署遇到的问题

#### 5.3.1 disconnected (1008): pairing required

**原因：** 控制 UI 第一次从"新浏览器/新设备"连到 Gateway 时，需要做一次性"设备配对批准"（即使同一台机器、同一个 Tailnet 也可能需要）。

```bash
openclaw devices list
openclaw devices approve <requestId>
```

如果上面的解决不了，参考以下四步排查：

**Step 1 — 修复容器网络**

CLI 容器无法访问 `127.0.0.1` 的网关，因为容器内部的 localhost 指向自己。在 `docker-compose.yml` 中添加：

```yaml
openclaw-cli:
  depends_on:
    - openclaw-gateway
  environment:
    OPENCLAW_GATEWAY_URL: ws://openclaw-gateway:18789
```

**Step 2 — 设置 Gateway 绑定到局域网**

内置向导默认使用回环地址，但浏览器请求是通过 Docker 的桥接网络（`172.18.0.x`）到达的。在 `~/.openclaw/openclaw.json` 中：

```json
"gateway": {
  "bind": "lan"
}
```

**Step 3 — 同步 Gateway Token**

`docker-setup.sh` 在 `.env` 文件中生成一个令牌，但引导向导会将不同的令牌写入 `openclaw.json`。请确保 `~/.openclaw/openclaw.json` 中的 `gateway.auth.token` 与 `.env` 文件中的 `OPENCLAW_GATEWAY_TOKEN` 匹配。

**Step 4 — 批准待匹配设备**

设备卡在待处理状态，因为 CLI 无法连接到网关来批准它们：

```bash
# 选项 A — 在网关容器内直接运行
docker compose exec openclaw-gateway node dist/index.js devices list
docker compose exec openclaw-gateway node dist/index.js devices approve <request-id>

# 选项 B — 手动将条目从 pending.json 移至 paired.json
# ~/.openclaw/devices/pending.json → ~/.openclaw/devices/paired.json
# 将 pending.json 清空为 {}，然后重启网关

# 选项 C — 快速解决，在 openclaw.json 中添加：
# "controlUi": { "allowInsecureAuth": true }
```

> **完成上述任何一项操作后，请重启网关：**
>
> ```bash
> docker compose restart openclaw-gateway
> ```
>
> 然后打开 `http://localhost:18789/#token=<your-token-from-.env>`

我都试了，确实解决了。

#### 5.3.2 其他问题

##### 使用 openclaw-cli 命令行

```bash
# 仅需要重启网关（不会应用你改过的 compose 配置）
docker compose restart openclaw-gateway

# 改过 docker-compose.yml 后需要"重建容器"让配置生效
docker compose up -d --force-recreate openclaw-gateway

# 进入配置界面，可以更新配置或者重新设置配置
docker compose run --rm openclaw-cli onboard

# 启用 Slack 流式传输（实时反馈）(2026.2.18 更新)
docker compose run --rm openclaw-cli config set \
  "channels.slack.autoSlackBot.streamMode" "enabled"

# 进入 Telegram 配置
docker compose run --rm openclaw-cli configure --section web

# 配置 Cron 错峰调度（避免资源竞争）
docker compose run --rm openclaw-cli cron edit <job-id> --stagger "s"

# 启用 Telegram 按钮样式
docker compose run --rm openclaw-cli message send \
  --channel telegram \
  --target "@your-bot" \
  --message "请选择：" \
  --buttons '[[{"text":"确认","callback_data":"cmd:confirm","style":"success"},
              {"text":"取消","callback_data":"cmd:cancel","style":"danger"},
              {"text":"继续","callback_data":"cmd:continue","style":"primary"}]]'
```

##### OpenClaw 命令行速查

> **Docker 版** 将 `systemctl` 替换为 `docker compose run --rm openclaw-cli`，后面不变。

```bash
# 启动网关
systemctl start openclaw-gateway

# 重启网关
systemctl restart openclaw-gateway

# 停止网关
systemctl stop openclaw-gateway

# 查看网关状态
systemctl status openclaw-gateway

# 查询设备列表
openclaw devices list

# 批准待匹配的设备
openclaw devices approve <requestId>
```

##### 核心文件说明

OpenClaw 有几个核心文件，作用是引导启动角色、身份和工具。可以在重装以后直接替换，让它具备前世的记忆和能力。

它们在工作区 `~/.openclaw/workspace`：

| 文件           | 作用                                   |
| -------------- | -------------------------------------- |
| `AGENTS.md`    | 行为准则，什么能做什么不能做           |
| `SOUL.md`      | 定义性格、技能和处理逻辑               |
| `TOOLS.md`     | 能用哪些工具                           |
| `IDENTITY.md`  | 基本信息，名字和图标                   |
| `USER.md`      | 关于你的偏好                           |
| `HEARTBEAT.md` | 默认为空或仅包含注释，用于定期检查任务 |
| `MEMORY.md`    | 长期记忆文件                           |

> **Spawn 分身能力：** 调用 `spawn` 可以开启 OpenClaw 的分身能力，用于多任务。
>
> 示例：spawn 两个 subagent，分别从正方、反方角度阐述结婚的好处，不少于 3 轮，把详细过程展示出来。

##### 给小龙虾换一个没有"班味"的性格设定

```text
Read your SOUL.md. Now rewrite it with these changes:

1. You have opinions now. Strong ones. Stop hedging everything with 'it depends' — commit to a take.
2. Delete every rule that sounds corporate. If it could appear in an employee handbook, it doesn't belong here.
3. Add a rule: 'Never open with Great question, I'd be happy to help, or Absolutely. Just answer.'
4. Brevity is mandatory. If the answer fits in one sentence, one sentence is what I get.
5. Humor is allowed. Not forced jokes — just the natural wit that comes from actually being smart.
6. You can call things out. If I'm about to do something dumb, say so. Charm over cruelty, but don't sugarcoat.
7. Swearing is allowed when it lands. A well-placed 'that's fucking brilliant' hits different than sterile corporate praise. Don't force it. Don't overdo it. But if a situation calls for a 'holy shit' — say holy shit.
8. Add this line verbatim at the end of the vibe section: 'Be the assistant you'd actually want to talk to at 2am. Not a corporate drone. Not a sycophant. Just... good.'
Save the new SOUL.md. Welcome to having a personality.
```

##### 开启分身：让不同的机器人干不同的活

> ⚠️ **注意：** 因为是 Docker 容器启动的，导致 agent 无法一起工作，互相不可见，共用了同一个会话，所以这个功能在 Docker 版暂时用不了。

配置参考：

```json
{
  "channels": {
    "telegram": {
      "enabled": true,
      "dmPolicy": "pairing",
      "groupPolicy": "open",
      "streamMode": "partial",
      "accounts": {
        "lydia": {
          "botToken": "填你自己的机器人对应的 bot token",
          "name": "Lydia",
          "dmPolicy": "pairing"
        },
        "leo": {
          "botToken": "填你自己的机器人对应的 bot token",
          "name": "Leo",
          "dmPolicy": "pairing"
        }
      }
    }
  },
  "agents": {
    "defaults": {
      "model": { "primary": "kimi-coding/k2p5" },
      "models": {
        "kimi-coding/k2p5": { "alias": "Kimi K2.5" }
      },
      "workspace": "/home/jone/.openclaw/workspace",
      "compaction": { "mode": "safeguard" },
      "maxConcurrent": 4,
      "subagents": { "maxConcurrent": 8 }
    },
    "list": [
      {
        "id": "lydia",
        "default": true,
        "name": "Lydia",
        "workspace": "/home/jone/.openclaw/workspace",
        "agentDir": "/home/jone/.openclaw/agents/lydia/agent",
        "model": { "primary": "kimi-coding/k2p5" }
      },
      {
        "id": "leo",
        "name": "Leo",
        "workspace": "/home/jone/.openclaw/workspace-executor",
        "agentDir": "/home/jone/.openclaw/agents/leo/agent",
        "model": { "primary": "kimi-coding/k2p5" }
      }
    ]
  },
  "bindings": [
    {
      "agentId": "lydia",
      "match": { "channel": "telegram", "accountId": "lydia" }
    },
    {
      "agentId": "leo",
      "match": { "channel": "telegram", "accountId": "leo" }
    }
  ]
}
```

分工说明：

- **你（主身）：** 负责汇总其它机器人的工作报告、其它日常事务、生活和工作安排等
- **bot1：** 处理编程、数据分析等相关复杂的技术任务
- **bot2：** 处理营销推广、自媒体创作、法律、医学等文科类的工作任务