---
title: OpenClaw 接中转站常见坑与解决方案
date: 2026-03-15T04:15:49.828Z
---

用 OpenClaw 接自定义中转站（NewAPI / OneAPI 等），配置看着没问题但就是不work，这篇整理了几个高频踩坑点和对应的解决方案，都是实战中一个个排出来的。

[最近有点缺LDC，佬们如果觉得有用务必给我点一个赞谢谢](https://linux.do/t/topic/1667136)

# 建议扔给CC/龙虾让它给你修复

## 1. 403 被拦

### 症状

provider 配好了，curl 直接请求中转站 API 完全正常（200），但 OpenClaw 发出去就是 `403 Your request was blocked`。

### 原因

OpenClaw 底层用的 `@anthropic-ai/sdk`，发请求时会带上官方 SDK 的 User-Agent：

```makefile
User-Agent: Anthropic/JS 0.73.0
```

很多中转站（特别是套了 Cloudflare 或自带 WAF 的）会直接拦截带官方 SDK 特征的 UA。`OpenAI/JS` 同理。

### 验证方法

```bash
# 带 SDK UA → 403
curl -H "User-Agent: Anthropic/JS 0.73.0" \
     -H "x-api-key: sk-your-api-key" \
     -H "anthropic-version: 2023-06-01" \
     https://your-relay.example.com/v1/messages \
     -d '{"model":"claude-sonnet-4-20250514","max_tokens":10,"messages":[{"role":"user","content":"hi"}]}'

# 普通 UA → 200
curl -H "User-Agent: Mozilla/5.0" \
     -H "x-api-key: sk-your-api-key" \
     -H "anthropic-version: 2023-06-01" \
     https://your-relay.example.com/v1/messages \
     -d '{"model":"claude-sonnet-4-20250514","max_tokens":10,"messages":[{"role":"user","content":"hi"}]}'
```

### 解决

在 provider 配置里加 `headers` 字段覆盖 UA：

```json
{
  "my-relay": {
    "baseUrl": "https://your-relay.example.com",
    "apiKey": "sk-your-api-key",
    "api": "anthropic-messages",
    "headers": {
      "User-Agent": "Mozilla/5.0"
    },
    "models": [...]
  }
}
```

## 2. baseUrl 不要带 /v1

### 症状

请求直接 404，日志里看到请求路径变成了 `/v1/v1/messages`。

### 原因

Anthropic SDK 会在 `baseURL` 后面自动拼接 `/v1/messages`。如果你的 `baseUrl` 写了 `https://your-relay.example.com/v1`，实际请求就变成了：

```bash
https://your-relay.example.com/v1/v1/messages  → 404
```

OpenAI 模式同理，SDK 会自动拼 `/v1/chat/completions`。

### 解决

`baseUrl` 只写到域名，不带路径：

```json
{
  "baseUrl": "https://your-relay.example.com"
}
```

## 3. api 字段只认三个值

### 症状

启动报 `Config invalid`，或者模型列表里看不到你配的 provider。

### 原因

OpenClaw 的 `api` 字段做了严格校验，只接受：

| 值                   | 对应格式                |
| :------------------- | :---------------------- |
| `anthropic-messages` | Anthropic Messages API  |
| `openai-completions` | OpenAI Chat Completions |
| `openai-responses`   | OpenAI Responses API    |

写成 `openai-chat`、`openai`、`anthropic` 等都会报错。

### 解决

老老实实用上面三个值之一。**推荐用 `anthropic-messages`**，因为 OpenClaw 内部就是 Anthropic 格式，用 OpenAI 格式可能出现下面第 4 点的问题。

## 4. openai-completions 收到空回复

### 症状

`api` 设为 `openai-completions`，请求成功（日志 `isError=false`），但 UI 上显示空消息。

### 原因

OpenClaw 内部用 Anthropic 格式处理消息流。`openai-completions` 返回的 OpenAI 格式响应在某些情况下无法正确映射，导致 UI 拿不到内容。

### 解决

如果你的中转站同时支持 Anthropic 和 OpenAI 格式（大多数 NewAPI/OneAPI 都支持），优先用 `anthropic-messages`。

## 5. 还有两个配置文件

OpenClaw 有两处 provider 配置需要**同步修改**：

```bash
~/.openclaw/openclaw.json          → models.providers
~/.openclaw/agents/main/agent/models.json → providers
```

只改一个会出现"配了但没生效"的灵异现象。改完后用 `openclaw models status` 确认。

## 完整配置示例

```json
{
  "my-relay": {
    "baseUrl": "https://your-relay.example.com",
    "apiKey": "sk-your-api-key",
    "api": "anthropic-messages",
    "headers": {
      "User-Agent": "Mozilla/5.0"
    },
    "models": [
      {
        "id": "claude-sonnet-4-20250514",
        "name": "my-relay claude-sonnet-4",
        "reasoning": false,
        "input": ["text", "image"],
        "cost": { "input": 0, "output": 0, "cacheRead": 0, "cacheWrite": 0 },
        "contextWindow": 200000,
        "maxTokens": 32000
      }
    ]
  }
}
```

## 排查工具速查

| 命令                                          | 用途                     |
| :-------------------------------------------- | :----------------------- |
| `tail /tmp/openclaw/openclaw-$(date +%F).log` | 实时查看运行日志         |
| `openclaw models status`                      | 查看当前模型和认证状态   |
| `openclaw models list --provider xxx`         | 查看特定 provider 的模型 |
| `openclaw doctor`                             | 综合诊断                 |

------

排查的核心思路：先用 curl 确认中转站本身没问题，再看 OpenClaw 端发出去的请求有什么不同（UA、路径、格式）。大多数情况下就是上面这几个坑。

有其他踩坑经验欢迎评论区补充：

①补一个排障顺序：

1. 先用 curl 验证中转站原生可用；
2. 再看 OpenClaw 实际请求路径和头；
3. 最后统一检查 `openclaw.json` + `agents/main/agent/models.json`两处配置是否一致。

②补充个今天的踩坑，gpt5.3-codex配置里没加推理，只会回复文字不干活，openclaw.json和agent的model.json两处都要加

```json
"compat": {
"supportsReasoningEffort": true,
"supportsStore": true
}
```

③关于UA补充一个点：
如果在provider下不生效，可以试试在provider.model下也加一个试试看
2026.2.26版本下有这个情况

④通过 `openclaw logs --follow` 命令查看 openclaw 的日志能看到问题所在，提示上下文已压缩是因为 openclaw.json 配置文件中 provider.model.contextWindow 的值太小了，生成的配置默认值为 16000，把 `contextWindow` 的值改为 32000 以及上即可
