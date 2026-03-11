---
title: OpenClaw Plugin 最详细的终极指南
date: 2026-03-11T14:57:04.461Z
---

# OpenClaw Plugin 最详细的终极指南

如果你已经开始认真使用 OpenClaw，迟早会碰到一个分水岭问题：

**我到底该写 Skill、加 Tool，还是直接做一个 Plugin？**

很多人一开始会把 Plugin 理解成“更高级一点的 Tool”。这不对。 **Plugin 不是一个功能点，而是一整套系统扩展机制。**

它能做的，不只是“多一个能力”，而是：

- 给 Agent 注册新工具
- 给 OpenClaw 增加新的消息渠道
- 给模型接 OAuth / API Key 登录
- 在生命周期关键节点自动执行逻辑
- 启动后台服务
- 暴露 HTTP 路由或 Gateway RPC
- 甚至接管默认的 memory / contextEngine

所以这篇文章不只讲“Plugin 是什么”，还会讲两件更关键的事：

1. **怎么使用一个现成的 Plugin**
2. **怎么从零开发一个 Plugin**

而且我会尽量把它写成： **小白能看懂，入门开发者能照着开始做。**

## 一、先把三种扩展方式讲清楚：Skill、Tool、Plugin

这是理解 Plugin 的前提。

1. Skill：教 AI 怎么做

Skill 更像一份操作手册或作战 SOP。

它解决的是：

- 遇到某类任务时应该怎么做
- 该遵循什么风格、规则和流程
- 某个领域有哪些背景知识

Skill 的本质是：**给模型额外的规则和上下文**。 它不直接给系统增加新代码能力。

适合场景：

- 写作规范
- 调研流程
- 内容风格约束
- 某领域知识补充
- Tool：给 AI 一个动作

Tool 是一个可调用的功能单元。

比如：

- 搜索网页
- 读文件
- 发消息
- 查询数据库
- 生成图片

Tool 的特点是：

- 有输入参数
- 做一个明确动作
- 返回一个明确结果

它更像“AI 可使用的函数”。

但 Tool 通常是**被动的**：要不要调用，由 Agent 自己决定。

3. Plugin：扩展系统本身

Plugin 的级别比 Tool 高一层。

它不是单个动作，而是**系统级扩展机制**。 一个 Plugin 可以：

- 注册 Tool
- 注册 Hook
- 注册 CLI 命令
- 注册 HTTP 路由
- 注册消息渠道
- 注册 Provider 登录
- 注册后台服务
- 注册 Context Engine
- 接管某个 Slot（如 memory / contextEngine）

一句话：

> **Skill 是“教它怎么做”，Tool 是“给它一个动作”，Plugin 是“给整个系统加能力和流程控制”。**

## 二、什么时候该用 Plugin，而不是 Skill 或 Tool？

这个判断非常重要。

用 Skill 的场景

如果你的需求是：

- 给 AI 增加规则
- 限制行为
- 补充知识
- 规范回答方式

那大概率用 Skill 就够了。

用 Tool 的场景

如果你的需求是：

- 增加一个明确功能
- 输入参数 → 执行 → 返回结果
- 不需要系统级接入，只需要 Agent 能调用

那通常用 Tool 更合适。

必须上 Plugin 的场景

以下这些，通常就该直接考虑 Plugin：

1）你想“自动发生”某件事

比如：

- 每次 prompt 构建前自动注入内容
- 每次工具调用前自动审计参数
- 每次消息发送前自动改格式
- 每次会话开始时初始化资源

这种需求靠 Tool 不优雅，因为 Tool 需要 Agent 主动调用； 但 Plugin 可以通过 Hook 主动介入生命周期。

2）你想加一个新的消息渠道

比如接入一个新的聊天平台、企业 IM、自建消息系统。

这不是“发消息”这么简单，而是要：

- 定义账号配置
- 定义收发逻辑
- 对接 OpenClaw 的 channel 体系
- 提供状态、配置、可能还有 onboarding

这种属于典型的 **channel plugin**。

3）你想给模型做登录授权

比如 OAuth、API Key、Device Code 这类登录流程。 这类能力属于 **provider auth plugin**。

4）你想替换默认系统能力

比如：

- 替换默认记忆系统
- 自定义上下文引擎

这时你面对的是 Slot，而不是普通 Tool。

5）你想让 OpenClaw 多出“一个系统入口”

例如：

- 新 CLI 命令
- 新 HTTP 路由
- 新 Gateway RPC 方法
- 后台服务

这都不是 Skill / Tool 能完整覆盖的事情。

## 三、OpenClaw Plugin 到底能做什么？

按官方文档，插件可以注册这些能力：

- **Gateway RPC methods**
- **Gateway HTTP routes**
- **Agent tools**
- **CLI commands**
- **Background services**
- **Context engines**
- **Skills**
- **Auto-reply commands**
- **Provider auth**
- **Messaging channels**

这说明 Plugin 不是“边缘扩展”，而是 OpenClaw 正式支持的扩展单元。

你可以把它理解为：

> OpenClaw 允许你把“自己的系统能力”接进来，而不必改核心代码。

## 四、Plugin 的几个关键概念：你后面开发时一定会遇到

1. Manifest

每个 Plugin 都必须有一个 openclaw.plugin.json。 这是插件的清单文件，用来定义：

- 插件身份（id、name、description）
- 配置 Schema
- UI hints（可选）
- 插件发现与校验所需的元信息

它很重要，因为 OpenClaw 的配置校验**不会执行插件代码**，而是依赖 manifest 和 JSON Schema。

这意味着：

- 更安全
- 更容易做配置校验
- 更适合在 UI 里渲染配置表单
- Plugin Entry

插件本体通常是一个 TypeScript 入口文件，比如 index.ts。 OpenClaw 会在运行时加载它。

插件可以导出：

- 一个函数
- 或一个对象 { id, register(api) { ... } }

最小骨架大概长这样：

```typescript
export default {
  id: "my-plugin",
  register(api) {
    api.logger.info("plugin loaded");
  },
};
```

或者：

3. plugins.entries.<id>.config

```typescript
export default function (api) {
  api.logger.info("plugin loaded");
}
```

这是普通插件自己的配置空间。

例如：

```json
{
  "plugins": {
    "entries": {
      "my-plugin": {
        "enabled": true,
        "config": {
          "apiKey": "${MY_API_KEY}",
          "region": "us-east-1"
        }
      }
    }
  }
}
```

重点记住：

- 普通插件配置放在 plugins.entries.<id>.config
- 支持环境变量 ${ENV_VAR}
- 配置会按 manifest 里的 Schema 校验
- Slots

Slots 是很多人一开始忽略、但后面一定会踩的点。

有些插件不是“并排增加能力”，而是要**独占接管某个系统模块**。 官方文档里当前明确提到两个 slot：

- memory
- contextEngine

配置示例：

```json
{
  "plugins": {
    "slots": {
      "memory": "memory-core",
      "contextEngine": "legacy"
    }
  }
}
```

也可以：

```json
{
  "plugins": {
    "slots": {
      "memory": "none"
    }
  }
}
```

表示关闭该 slot。

这里的关键点是：

> **同一个 slot，同时只能由一个插件接管。**

所以如果你做的是 memory plugin 或 context engine plugin，就不是“再加一个”，而是“替换当前 owner”。

## 五、如何使用一个现成的 Plugin？

先讲使用，再讲开发。因为你只有先理解“用户侧怎么接入”，才知道开发时该提供什么体验。

第一步：查看当前插件

openclaw plugins list

先看系统里已经有哪些插件。

第二步：安装插件

安装 npm 插件

openclaw plugins install @openclaw/voice-call

安装本地插件

openclaw plugins install ./extensions/my-plugin

开发调试时 link 本地插件

openclaw plugins install -l ./extensions/my-plugin

根据官方文档：

- npm spec 只接受 registry-only
- 可以用包名、精确版本、dist-tag
- 不接受 Git / URL / file spec / semver range

第三步：启用插件

openclaw plugins enable <id>

别把“安装成功”误以为“已经可用”。

第四步：配置插件

在配置文件中补上插件参数。普通插件一般写在：

plugins.entries.<id>.config

例如：

```json
{
  "plugins": {
    "entries": {
      "voice-call": {
        "enabled": true,
        "config": {
          "provider": "twilio"
        }
      }
    }
  }
}
```

第五步：重启 Gateway

openclaw gateway restart

这一步特别重要。文档明确说：

> **Config changes require a gateway restart.**

很多“为什么不生效”，根因就是没重启。

第六步：验证与诊断

openclaw plugins info <id> openclaw plugins doctor openclaw config validate

这三条基本能覆盖大部分常见问题。

## 六、开发一个 Plugin，目录结构应该怎么搭？

一个最常见的插件目录大概长这样：

```bash
my-plugin/
├── package.json
├── openclaw.plugin.json
├── index.ts
└── ...
package.json
```

负责：

- npm 包信息
- 依赖管理
- 声明 openclaw.extensions

例如一个 package pack 可以这样声明：

{  "name": "my-plugin",  "openclaw": {    "extensions": ["./index.ts"]  } }

如果一个包里声明多个 extension entry，OpenClaw 会按规则派生 plugin id。

openclaw.plugin.json

这是插件 manifest。通常你至少会写：

- id
- name
- description
- configSchema
- uiHints（可选）

例如：

```typescript
{
  "id": "my-plugin",
  "name": "My Plugin",
  "description": "Does something useful",
  "configSchema": {
    "type": "object",
    "properties": {
      "apiKey": { "type": "string" },
      "region": { "type": "string" }
    }
  },
  "uiHints": {
    "apiKey": { "label": "API Key", "sensitive": true },
    "region": { "label": "Region" }
  }
}
```

index.ts

插件真正的逻辑入口。

你会在这里：

- register tool
- register hook
- register provider
- register channel
- register service
- register CLI / command / route

## 七、从零开发：最小可用 Plugin

先别一上来就做 channel、provider auth、memory slot。 最稳的学习路径是：

> **先做一个最小插件 → 再注册一个 tool → 再加 hook → 最后再挑战更重的能力。**

第一步：先做最小骨架

```typescript
export default {
  id: "my-plugin",
  register(api) {
    api.logger.info("my-plugin loaded");
  },
};
```

只要它能被加载，你就已经打通了最基本的插件开发路径。

第二步：注册一个最简单的 Tool

这是最适合入门的下一步，因为它能帮你理解插件 API，又不会太重。

官方文档里，插件可以通过 api.registerTool(...) 注册 agent tool。

最小示例：

```typescript
export default function (api) {
  api.registerTool(
    {
      name: "say_hello",
      label: "Say Hello",
      description: "Greet the user",
      parameters: {
        type: "object",
        properties: {
          name: { type: "string" }
        },
        required: ["name"]
      },
      async execute(_toolCallId, params) {
        return {
          content: [
            { type: "text", text: `Hello, ${params.name}!` }
          ]
        };
      }
    },
    { name: "say_hello" }
  );
}
```

这个例子最重要的意义不是功能本身，而是让你明白：

- 插件能生成 tool
- tool 只是插件能力的一部分
- 你可以逐步把自己的系统能力接进来

## 八、Hook 怎么开发？为什么它是 Plugin 的真正分水岭？

如果说注册 Tool 只是“让系统多一个功能”，那 Hook 才是“让系统在关键节点自动干预”。

这就是 Plugin 和普通 Tool 最大的分水岭之一。

1）api.registerHook(...)

文档示例：

```typescript
export default function register(api) {
  api.registerHook(
    "command:new",
    async () => {
      // Hook logic here.
    },
    {
      name: "my-plugin.command-new",
      description: "Runs when /new is invoked",
    },
  );
}
```

注意：

- 这类 hook 会出现在 openclaw hooks list
- 会显示为 plugin:<id>
- 不能通过 hooks CLI 单独启停，要通过启停插件来控制

2）api.on(...)：生命周期 Hook

官方文档还推荐用 api.on(...) 做 typed lifecycle hooks。

例如：

```typescript
export default function register(api) {
  api.on("before_prompt_build", () => {
    return {
      prependSystemContext: "Follow company style guide.",
    };
  });
}
```

几个最关键的生命周期节点：

before_model_resolve

- 发生在模型选择前
- 适合做 modelOverride / providerOverride

before_prompt_build

- 发生在 prompt 构建前
- 适合注入上下文、修改 prompt 结构
- 可返回：prependContext systemPrompt prependSystemContext appendSystemContext

before_agent_start

- 官方明确说它是 **legacy compatibility hook**
- 更推荐优先用前两个更明确的 hook

3）Prompt 注入并不是无限制的

文档特别提到，运营者可以限制插件做 prompt 注入：

```typescript
{
  "plugins": {
    "entries": {
      "some-plugin": {
        "hooks": {
          "allowPromptInjection": false
        }
      }
    }
  }
}
```

这说明一件事：

> Hook 很强，但强能力一定伴随更高的安全要求。

所以如果你要做 prompt 相关 Hook，别只关注“能不能做”，还要关注“系统允许不允许做”。

## 九、Provider Auth Plugin 怎么开发？

这是很多人第一次看官方文档时会忽略，但实际上很高级、也很实用的一类插件。

它的作用是：

> 把模型供应商登录能力正式接进 OpenClaw。

比如：

- OAuth
- API Key
- Device Code

核心接口是：

api.registerProvider(...)

官方文档给出的示意大概是：

```typescript
api.registerProvider({
  id: "acme",
  label: "AcmeAI",
  auth: [
    {
      id: "oauth",
      label: "OAuth",
      kind: "oauth",
      run: async () => {
        return {
          profiles: [
            {
              profileId: "acme:default",
              credential: {
                type: "oauth",
                provider: "acme",
                access: "...",
                refresh: "...",
                expires: Date.now() + 3600 * 1000,
              },
            },
          ],
          defaultModel: "acme/opus-1",
        };
      },
    },
  ],
});
```

用户侧就可以这样用：

openclaw models auth login --provider acme --method oauth

如果你以后要做自定义 provider 集成，这块是主战场。

## 十、Channel Plugin 怎么开发？

如果你想让 OpenClaw 接入一个新的聊天平台，那就不是普通 Tool 了，而是要写 **channel plugin**。

官方文档给出的最小示例大致如下：

```typescript
const myChannel = {
  id: "acmechat",
  meta: {
    id: "acmechat",
    label: "AcmeChat",
    selectionLabel: "AcmeChat (API)",
    docsPath: "/channels/acmechat",
    blurb: "demo channel plugin.",
    aliases: ["acme"],
  },
  capabilities: { chatTypes: ["direct"] },
  config: {
    listAccountIds: (cfg) => Object.keys(cfg.channels?.acmechat?.accounts ?? {}),
    resolveAccount: (cfg, accountId) =>
      cfg.channels?.acmechat?.accounts?.[accountId ?? "default"] ?? {
        accountId,
      },
  },
  outbound: {
    deliveryMode: "direct",
    sendText: async () => ({ ok: true }),
  },
};

export default function (api) {
  api.registerChannel({ plugin: myChannel });
}
```

你不需要一开始就把所有字段背下来，但至少要理解三件事：

1）Channel 配置不放在 plugins.entries

而是：

channels.<id>

例如：

```json
{
  "channels": {
    "acmechat": {
      "accounts": {
        "default": {
          "token": "ACME_TOKEN",
          "enabled": true
        }
      }
    }
  }
}
```

2）最基础要实现哪些部分

至少包括：

- config.listAccountIds
- config.resolveAccount
- outbound.sendText

3）可以继续扩展的方向

文档里还提到，channel plugin 还可以扩展：

- onboarding
- security
- status
- gateway
- mentions
- threading
- streaming
- actions
- commands

这意味着 channel plugin 的上限很高，但入门时别一次做满。

## 十一、插件还能注册哪些系统入口？

除了 Tool、Hook、Provider、Channel，Plugin 还可以注册很多“系统入口”。

1）CLI 命令

```typescript
export default function (api) {
  api.registerCli(
    ({ program }) => {
      program.command("mycmd").action(() => {
        console.log("Hello");
      });
    },
    { commands: ["mycmd"] },
  );
}
```

用户就能直接运行：

openclaw mycmd

2）Auto-reply Commands

这类命令很实用，因为它是：

> **不经过 AI agent，直接执行。**

例如：

```typescript
api.registerCommand({
  name: "mystatus",
  description: "Show plugin status",
  handler: () => ({ text: "Plugin is running!" }),
});
```

适合做：

- 状态查询
- 快速切换
- 简单控制命令

3）HTTP Routes

```typescript
api.registerHttpRoute({
  path: "/acme/webhook",
  auth: "plugin",
  match: "exact",
  handler: async (_req, res) => {
    res.statusCode = 200;
    res.end("ok");
    return true;
  },
});
```

适合做：

- webhook
- 第三方回调
- 对外接入点

4）Gateway RPC Methods

```typescript
api.registerGatewayMethod("myplugin.status", ({ respond }) => {
  respond(true, { ok: true });
});
```

适合做：

- 系统内方法暴露
- 状态查询
- 内部控制接口

5）Background Services

```typescript
export default function (api) {
  api.registerService({
    id: "my-service",
    start: () => api.logger.info("ready"),
    stop: () => api.logger.info("bye"),
  });
}
```

适合做：

- 持久连接
- 后台轮询
- 插件级资源管理

## 十二、Plugin 的发现、加载与优先级

这一节不难，但很容易出 bug。

OpenClaw 会按顺序扫描插件来源：

1. plugins.load.paths
2. 工作区 .openclaw/extensions/
3. 全局目录 ~/.openclaw/extensions/
4. bundled extensions

如果多个插件 id 相同：

> **前面优先级更高的生效，后面的会被忽略。**

所以当你遇到“明明改了插件代码却不生效”时，不一定是代码有问题，可能是系统实际上加载的是另一份同 id 插件。

## 十三、开发时最容易踩的坑

这一段很重要，很多坑不是“不会写代码”，而是“不懂 OpenClaw 的规则”。

坑 1：装了插件，但没启用

install ≠ enable。 装完以后别忘了：

openclaw plugins enable <id>

坑 2：改了配置，但没重启 Gateway

这是最常见的问题之一：

openclaw gateway restart

没重启，很多变更根本不会生效。

坑 3：把 channel 配置写到 plugins.entries

错。 普通插件配置放：

plugins.entries.<id>.config

但 channel plugin 配置放：

channels.<id>

坑 4：多个同 id 插件冲突

你以为自己加载的是新版本，实际上系统吃的是旧版本。

遇到这个问题要先检查：

- plugin source path
- install path
- load precedence

坑 5：Slot 插件并存，但没有明确 owner

memory / contextEngine 是独占位。 不是“多装几个看谁先抢到”，而是要明确写在：

plugins.slots

坑 6：把 Plugin 当成低风险小组件

官方已经说得很直白：

> **Plugins run in-process with the Gateway. Treat them as trusted code.**

翻译成人话：

> 插件是高权限代码，不是玩具。

坑 7：一上来就做最重的 Plugin

如果你第一次写 Plugin，就直接挑战：

- 自定义 channel
- provider auth
- memory slot
- context engine

那大概率会被复杂度打爆。

更好的路径是：

1. 先做最小骨架
2. 再注册一个简单 Tool
3. 再加一个 Hook
4. 最后再做 channel / provider / slot 类插件

## 十四、排错时怎么查？给你一条最稳的顺序

第一步：插件存在吗？

openclaw plugins list

第二步：插件状态和详情对吗？

openclaw plugins info <id>

第三步：整体诊断通过吗？

openclaw plugins doctor

第四步：配置是否合法？

openclaw config validate

第五步：是不是忘了重启？

openclaw gateway restart

第六步：是不是加载到了错误的同 id 插件？

重点检查：

- plugins.load.paths
- workspace extensions
- global extensions
- bundled extensions

这条排查链非常实用，很多问题根本不用 debug 代码，就能直接定位。

## 十五、给初学者的最小开发路线

如果你是第一次开发 OpenClaw Plugin，我建议你按这个顺序走：

第一步：写最小插件骨架

目标：先让插件被系统成功加载。

第二步：注册一个最小 Tool

目标：理解插件 API 和 agent tool 的接入方式。

第三步：加一个简单 Hook

目标：理解“主动介入生命周期”和“被动等待调用”的区别。

第四步：补 Manifest Schema 和 UI Hints

目标：让插件配置更像正式产品，而不是自己能跑就算了。

第五步：再挑战更重的 Plugin 类型

比如：

- provider auth plugin
- channel plugin
- memory plugin
- context engine plugin

这条路线的核心思想是：

> **先学 Plugin 机制，再上系统级复杂度。**

不要第一天就去打 boss。

## 十六、最后做个收口：这篇你真正要记住什么？

如果你只记住 5 件事，这篇文章就没白看：

1）Plugin 不等于 Tool 升级版

它是系统级扩展机制。

2）Skill / Tool / Plugin 的边界一定要先分清

不然你会一直用错扩展方式。

3）Plugin 的强大之处在于“系统接入”和“生命周期控制”

这才是它和普通 Tool 的本质差别。

4）开发时先从最小骨架、最小 Tool 开始

别一上来就做最重的类型。

5）配置、加载、重启、优先级，是比代码更容易踩坑的地方

别低估工程细节。

## 十七、常用命令速查

```bash
# 查看插件
openclaw plugins list

# 查看插件详情
openclaw plugins info <id>

# 安装插件（npm / 本地 / link）
openclaw plugins install <npm-spec>
openclaw plugins install ./local-plugin
openclaw plugins install -l ./local-plugin

# 启用 / 禁用
openclaw plugins enable <id>
openclaw plugins disable <id>

# 更新插件
openclaw plugins update <id>
openclaw plugins update --all

# 插件诊断
openclaw plugins doctor

# 模型认证插件登录
openclaw models auth login --provider <id> [--method <id>]

# 校验配置
openclaw config validate

# 重启 Gateway
openclaw gateway restart
```

## 结语

对小白来说，Plugin 一开始看起来像“很重、很工程化”的东西； 对开发者来说，它又很容易被误解成“无非就是多写点代码”。

这两种理解都不完整。

更准确地说，OpenClaw Plugin 是这样一种东西：

> 它让你不改核心代码，也能把自己的能力、流程、入口和系统接进 OpenClaw。

所以它不只是一个“扩展点”，而是 OpenClaw 真正可工程化、可产品化、可系统化扩展的关键机制。

如果你接下来只准备迈出第一步，那就从最小插件骨架开始。 先让它加载成功，再让它注册一个 Tool。做到这一步，你就已经真正进入 OpenClaw Plugin 的世界了。