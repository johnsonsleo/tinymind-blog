---
title: The Entire Claude Code Architecture
date: 2026-03-31T10:20:54.981Z
---

Internal codename: **Tengu**. Runtime: Bun. UI: React Ink. Language: TypeScript.

---

## 1. System Overview

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'primaryColor': '#1a1a2e', 'primaryTextColor': '#e0e0e0', 'primaryBorderColor': '#4a9eff', 'lineColor': '#4a9eff', 'secondaryColor': '#16213e', 'tertiaryColor': '#0f3460', 'edgeLabelBackground': '#1a1a2e'}}}%%
graph TB
    CLI["CLI Entry<br/>main.tsx — 804KB"]:::entry
    SDK["SDK Entry<br/>Programmatic API"]:::entry
    MCP_S["MCP Server<br/>Expose as MCP"]:::entry

    REPL["REPL.tsx — 896KB<br/>Interactive Terminal Shell"]:::ui
    Comps["113 Components<br/>Messages, Diffs, Dialogs"]:::ui
    Hooks["83 React Hooks<br/>Permissions, Input, IDE"]:::ui

    QE["QueryEngine.ts<br/>Session Lifecycle Owner"]:::core
    QL["query.ts — 1730 lines<br/>Agentic Loop"]:::core
    CL["claude.ts — 3420 lines<br/>Anthropic API Client"]:::core

    TD["Tool Interface<br/>Tool.ts"]:::tool
    BT["42 Built-in Tools"]:::tool
    MT["MCP Tools — dynamic"]:::tool
    TO["Tool Orchestration<br/>Parallel Execution"]:::tool

    Compact["Compaction Pipeline<br/>snip / micro / auto /<br/>reactive / collapse"]:::ctx

    Rules["Allow + Deny Rules"]:::perm
    HK["PreToolUse Hooks"]:::perm
    Classifier["Auto-mode Classifier"]:::perm

    AS["AppState Store<br/>Immutable — 50+ fields"]:::state
    SS["Session Storage<br/>Transcripts + Resume"]:::state
    Cfg["Config Layer<br/>Global / Project / CLAUDE.md"]:::state

    Skills["Skills"]:::ext
    Plugins["Plugins"]:::ext
    Agents["Sub-agents + Swarms"]:::ext

    API["Anthropic Messages API"]:::external
    MCP_Ext["External MCP Servers"]:::external
    GrowthBook["GrowthBook + Statsig"]:::external

    CLI --> REPL
    SDK --> QE
    MCP_S --> QE

    REPL --> Comps
    REPL --> Hooks
    REPL --> QE
    REPL --> AS

    QE --> QL
    QL --> CL
    QL --> Compact
    QL --> TO

    CL --> API
    CL --> GrowthBook

    TO --> TD
    TD --> BT
    TD --> MT
    BT --> Rules
    BT --> HK
    MT --> Rules

    Rules --> Classifier

    QE --> SS
    REPL --> Cfg

    Skills --> TD
    Plugins --> TD
    Plugins --> MCP_Ext
    Agents --> QL
    MCP_Ext --> MT

    classDef entry fill:#0d4f4f,stroke:#17a2b8,color:#e0e0e0,stroke-width:2px
    classDef ui fill:#1a1a4e,stroke:#6f42c1,color:#e0e0e0,stroke-width:2px
    classDef core fill:#2d1b4e,stroke:#e83e8c,color:#e0e0e0,stroke-width:2px
    classDef tool fill:#1b3a1b,stroke:#28a745,color:#e0e0e0,stroke-width:2px
    classDef ctx fill:#3d2b00,stroke:#fd7e14,color:#e0e0e0,stroke-width:2px
    classDef perm fill:#4a1a1a,stroke:#dc3545,color:#e0e0e0,stroke-width:2px
    classDef state fill:#1a2d4a,stroke:#4a9eff,color:#e0e0e0,stroke-width:2px
    classDef ext fill:#2d2d0d,stroke:#ffc107,color:#e0e0e0,stroke-width:2px
    classDef external fill:#333,stroke:#888,color:#aaa,stroke-width:1px,stroke-dasharray: 5 5
```

---

## 2. Core Engine — The Agentic Loop

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'primaryColor': '#1a1a2e', 'primaryTextColor': '#e0e0e0', 'lineColor': '#4a9eff', 'actorTextColor': '#e0e0e0', 'actorBorder': '#4a9eff', 'signalColor': '#4a9eff', 'noteBkgColor': '#16213e', 'noteTextColor': '#e0e0e0', 'activationBkgColor': '#2d1b4e', 'activationBorderColor': '#e83e8c'}}}%%
sequenceDiagram
    participant U as User
    participant QE as QueryEngine
    participant PI as processUserInput
    participant Q as query.ts
    participant CP as Compaction
    participant C as claude.ts
    participant API as Anthropic API
    participant T as Tool Executor
    participant H as Hooks

    U->>QE: submitMessage(prompt)
    activate QE
    QE->>PI: parse slash commands, @mentions, attachments
    PI-->>QE: messages[], shouldQuery

    alt Slash command — no API call needed
        QE-->>U: return local result
    else Model query required
        QE->>QE: persist transcript to disk
        QE->>Q: query(messages, systemPrompt, tools)
        activate Q

        loop Agentic Loop — until end_turn or max_turns
            Q->>CP: snip compact
            CP->>CP: micro compact
            CP->>CP: auto compact
            CP->>CP: context collapse
            CP-->>Q: compacted messages

            Q->>C: queryModel(messages, tools, thinking)
            activate C
            C->>C: build request: betas, cache, effort, budget
            C->>API: POST /v1/messages — SSE stream
            activate API

            API-->>C: message_start — usage
            API-->>C: content_block — thinking / text / tool_use
            API-->>C: message_delta — stop_reason, final usage
            deactivate API

            C-->>Q: yield AssistantMessage + StreamEvents
            deactivate C

            alt stop_reason = end_turn
                Q->>H: postSamplingHooks
                Q->>Q: handleStopHooks
                Q-->>QE: return Terminal result
            else stop_reason = tool_use
                Q->>T: runTools(toolUseBlocks)
                activate T

                T->>T: validate input against schema
                T->>H: PreToolUse hooks
                T->>T: check permissions
                T->>T: call(input, context)
                T->>H: PostToolUse hooks
                T-->>Q: yield tool_result messages
                deactivate T

                Q->>Q: inject CLAUDE.md attachments
                Note over Q: push tool_results, continue loop
            else stop_reason = max_tokens
                Q->>Q: truncation retry — up to 3x
                Q->>CP: reactive compact — emergency
            end
        end

        deactivate Q
        QE->>QE: accumulate usage, persist transcript
        QE-->>U: yield SDKMessage stream
    end
    deactivate QE
```

---

## 3. Tool System

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'primaryColor': '#1a1a2e', 'primaryTextColor': '#e0e0e0', 'primaryBorderColor': '#28a745', 'lineColor': '#28a745', 'secondaryColor': '#16213e', 'tertiaryColor': '#0f3460'}}}%%
graph TB
    subgraph Interface["Tool Interface — Tool.ts"]
        direction LR
        IS["inputSchema<br/>Zod validation"]
        CP["checkPermissions"]
        CALL["call — execute"]
        PROMPT["prompt — model instructions"]
        RENDER["render — terminal UI"]
    end

    IS --> CP --> CALL --> PROMPT --> RENDER

    subgraph FileOps["File Operations"]
        FR["FileRead"]
        FW["FileWrite"]
        FE["FileEdit"]
        GL["Glob"]
        GR["Grep"]
        NE["NotebookEdit"]
    end

    subgraph Exec["Execution"]
        BA["Bash"]
        PS["PowerShell"]
    end

    subgraph Web["Web"]
        WF["WebFetch"]
        WS["WebSearch"]
    end

    subgraph AgentTools["Agent and Task"]
        AG["Agent — spawn sub-agent"]
        TC["TaskCreate"]
        TG["TaskGet"]
        TU["TaskUpdate"]
        TL["TaskList"]
        TS["TaskStop"]
        SM["SendMessage"]
    end

    subgraph Meta["Meta Tools"]
        AQ["AskUserQuestion"]
        SK["SkillTool"]
        TW["TodoWrite"]
        EP["EnterPlanMode"]
        XP["ExitPlanMode"]
        TSR["ToolSearch"]
    end

    subgraph Dynamic["Dynamic — Runtime Loaded"]
        MCP_T["MCP Tools<br/>from external servers"]
        LSP_T["LSP Tool<br/>language server queries"]
    end

    subgraph Orchestration["Orchestration Layer"]
        RUN["toolOrchestration.ts<br/>runTools — parallel dispatch"]
        STE["StreamingToolExecutor<br/>execute as blocks stream in"]
        TEX["toolExecution.ts — 60KB<br/>single tool lifecycle"]
        THK["toolHooks.ts<br/>Pre/Post hook dispatch"]
    end

    Interface --> FileOps
    Interface --> Exec
    Interface --> Web
    Interface --> AgentTools
    Interface --> Meta
    Interface --> Dynamic

    FileOps --> Orchestration
    Exec --> Orchestration
    Web --> Orchestration
    AgentTools --> Orchestration
    Meta --> Orchestration
    Dynamic --> Orchestration

    RUN --> STE
    RUN --> TEX
    TEX --> THK
```

---

## 4. Permission System

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'primaryColor': '#1a1a2e', 'primaryTextColor': '#e0e0e0', 'lineColor': '#dc3545', 'primaryBorderColor': '#dc3545'}}}%%
flowchart TD
    ENTRY["Tool call arrives"]:::start

    DR{"Deny rules?<br/>blanket deny, pattern match"}
    AR{"Allow rules?<br/>always-allow from settings"}
    TSP{"tool.checkPermissions?<br/>tool-specific logic"}
    HOOK{"PreToolUse hooks?<br/>user-defined scripts"}
    CLASS{"Auto-mode classifier?<br/>transcript safety analysis"}
    DIALOG{"User permission dialog<br/>Y / n / always-allow"}

    ALLOW["ALLOW<br/>execute tool"]:::allow
    DENY["DENY<br/>return error to model"]:::deny

    ENTRY --> DR

    DR -->|"matched deny rule"| DENY
    DR -->|"no match"| AR

    AR -->|"matched allow rule"| ALLOW
    AR -->|"no match"| TSP

    TSP -->|"tool says allow"| HOOK
    TSP -->|"tool says deny"| DENY

    HOOK -->|"hook approves"| ALLOW
    HOOK -->|"hook denies"| DENY
    HOOK -->|"no decision"| CLASS

    CLASS -->|"classified safe"| ALLOW
    CLASS -->|"classified unsafe"| DIALOG
    CLASS -->|"not in auto-mode"| DIALOG

    DIALOG -->|"user accepts"| ALLOW
    DIALOG -->|"user rejects"| DENY
    DIALOG -->|"always allow"| AR

    classDef start fill:#1a2d4a,stroke:#4a9eff,color:#e0e0e0,stroke-width:2px
    classDef allow fill:#1b3a1b,stroke:#28a745,color:#e0e0e0,stroke-width:2px
    classDef deny fill:#4a1a1a,stroke:#dc3545,color:#e0e0e0,stroke-width:2px
```

### Permission Modes

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'primaryColor': '#1a1a2e', 'primaryTextColor': '#e0e0e0', 'lineColor': '#fd7e14', 'primaryBorderColor': '#fd7e14'}}}%%
flowchart TB
    START(["Session Start"]):::neutral --> DEFAULT

    DEFAULT["DEFAULT MODE<br/>Prompt user on every write tool"]:::mode1
    PLAN["PLAN MODE<br/>Read tools auto-approved<br/>Write tools require approval"]:::mode2
    AUTO["AUTO MODE<br/>Classifier decides safety<br/>Safe = allow, Unsafe = prompt"]:::mode3
    BYPASS["BYPASS MODE<br/>Everything auto-approved<br/>No permission checks"]:::mode4

    DEFAULT -->|"/plan command<br/>or model enters plan"| PLAN
    PLAN -->|"model exits<br/>plan mode"| DEFAULT
    DEFAULT -->|"--auto flag<br/>user opts in"| AUTO
    AUTO -->|"denial limit<br/>exceeded"| DEFAULT
    DEFAULT -->|"--dangerously-<br/>skip-permissions"| BYPASS

    classDef neutral fill:#333,stroke:#888,color:#e0e0e0,stroke-width:1px
    classDef mode1 fill:#1a2d4a,stroke:#4a9eff,color:#e0e0e0,stroke-width:2px
    classDef mode2 fill:#2d2d0d,stroke:#ffc107,color:#e0e0e0,stroke-width:2px
    classDef mode3 fill:#0d4f4f,stroke:#17a2b8,color:#e0e0e0,stroke-width:2px
    classDef mode4 fill:#4a1a1a,stroke:#dc3545,color:#e0e0e0,stroke-width:2px
```

---

## 5. Context Management — Compaction Pipeline

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'primaryColor': '#1a1a2e', 'primaryTextColor': '#e0e0e0', 'lineColor': '#fd7e14', 'primaryBorderColor': '#fd7e14'}}}%%
flowchart LR
    RAW["Raw message<br/>history"]:::input

    S1["SNIP COMPACT<br/>Sliding window<br/>Drop oldest turns<br/>Preserve recent N"]:::stage1
    S2["MICRO COMPACT<br/>Truncate individual<br/>tool results exceeding<br/>size thresholds"]:::stage2
    S3["AUTO COMPACT<br/>Summarize full conversation<br/>via separate API call<br/>Circuit breaker on failure"]:::stage3
    S4["CONTEXT COLLAPSE<br/>Read-time projection<br/>Archived collapsed views<br/>Granular preservation"]:::stage4

    FINAL["Messages ready<br/>for API call"]:::output

    S5["REACTIVE COMPACT<br/>Emergency trigger<br/>on API 413 error<br/>Last resort"]:::emergency

    RAW ==> S1 ==> S2 ==> S3 ==> S4 ==> FINAL
    FINAL -. "API returns prompt_too_long" .-> S5
    S5 ==> FINAL

    classDef input fill:#1a2d4a,stroke:#4a9eff,color:#e0e0e0,stroke-width:2px
    classDef stage1 fill:#0d3d0d,stroke:#28a745,color:#e0e0e0,stroke-width:2px
    classDef stage2 fill:#0d4f4f,stroke:#17a2b8,color:#e0e0e0,stroke-width:2px
    classDef stage3 fill:#2d2d0d,stroke:#ffc107,color:#e0e0e0,stroke-width:2px
    classDef stage4 fill:#2d1b4e,stroke:#6f42c1,color:#e0e0e0,stroke-width:2px
    classDef output fill:#1a2d4a,stroke:#4a9eff,color:#e0e0e0,stroke-width:2px
    classDef emergency fill:#4a1a1a,stroke:#dc3545,color:#e0e0e0,stroke-width:2px
```

### Token Budget State Machine

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'primaryColor': '#1a1a2e', 'primaryTextColor': '#e0e0e0', 'lineColor': '#ffc107', 'primaryBorderColor': '#ffc107'}}}%%
flowchart LR
    N["NORMAL<br/>within limits"]:::green
    W["WARNING<br/>context > 80%"]:::yellow
    C["CRITICAL<br/>context > 95%"]:::orange
    B["BLOCKING<br/>context > 98%<br/>auto-compact OFF"]:::red
    AC["AUTO COMPACT<br/>fires automatically"]:::blue
    RC["REACTIVE<br/>emergency on 413"]:::darkred
    M["MANUAL<br/>user runs /compact"]:::gray

    N -->|"grows"| W
    W -->|"grows"| C
    C -->|"auto-compact ON"| AC
    C -->|"auto-compact OFF"| B
    AC -->|"success"| N
    AC -->|"fails + API 413"| RC
    RC -->|"success"| N
    B -->|"user: /compact"| M
    M -->|"success"| N

    classDef green fill:#1b3a1b,stroke:#28a745,color:#e0e0e0,stroke-width:2px
    classDef yellow fill:#2d2d0d,stroke:#ffc107,color:#e0e0e0,stroke-width:2px
    classDef orange fill:#3d2b00,stroke:#fd7e14,color:#e0e0e0,stroke-width:2px
    classDef red fill:#4a1a1a,stroke:#dc3545,color:#e0e0e0,stroke-width:2px
    classDef darkred fill:#3a0a0a,stroke:#a30000,color:#e0e0e0,stroke-width:2px
    classDef blue fill:#1a2d4a,stroke:#4a9eff,color:#e0e0e0,stroke-width:2px
    classDef gray fill:#2a2a2a,stroke:#888,color:#e0e0e0,stroke-width:1px
```

---

## 6. Data Flow — User Input to Response

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'primaryColor': '#1a1a2e', 'primaryTextColor': '#e0e0e0', 'lineColor': '#4a9eff', 'primaryBorderColor': '#4a9eff'}}}%%
flowchart TD
    TYPE["User types in terminal"]:::input
    PASTE["Paste: text, image, file"]:::input
    VOICE["Voice input via STT"]:::input
    IDE_IN["IDE sends prompt"]:::input
    SDK_IN["SDK submitMessage"]:::input

    PARSE["Parse input<br/>slash commands, @mentions"]:::process
    SLASH{"Slash<br/>command?"}:::decision
    LOCAL["Execute locally<br/>clear, compact, model"]:::process
    ATTACH["Build attachments<br/>images, PDFs, CLAUDE.md"]:::process
    UMSG["Create UserMessage"]:::process

    SYS["Build system prompt<br/>tool descriptions +<br/>user rules + CLAUDE.md"]:::context
    GIT["Inject git context<br/>branch, commits, status"]:::context
    USR["Inject user context<br/>CLAUDE.md, date"]:::context
    CMP["Run compaction pipeline"]:::context
    CACHE["Apply cache_control<br/>prompt cache breakpoints"]:::context

    BUILD["Build API request<br/>model, betas, effort,<br/>task_budget, thinking"]:::api
    STREAM["Stream SSE response<br/>from Anthropic API"]:::api
    RETRY["withRetry wrapper<br/>429 backoff, 529 fallback"]:::api

    THINK["Thinking blocks"]:::response
    TEXT["Text blocks"]:::response
    TOOL_USE["tool_use blocks"]:::response

    VALIDATE["Validate input"]:::toolexec
    PERMS["Check permissions"]:::toolexec
    EXEC["Execute tool"]:::toolexec
    RESULT["Map to tool_result"]:::toolexec
    FEEDBACK["Push to messages<br/>LOOP BACK"]:::feedback

    RENDER["Render in terminal"]:::output
    TRANSCRIPT["Persist transcript"]:::output
    SDK_OUT["Yield SDK events"]:::output
    COST["Track cost + usage"]:::output

    TYPE --> PARSE
    PASTE --> PARSE
    VOICE --> PARSE
    IDE_IN --> PARSE
    SDK_IN --> PARSE

    PARSE --> SLASH
    SLASH -->|"yes"| LOCAL --> RENDER
    SLASH -->|"no"| ATTACH --> UMSG

    UMSG --> SYS --> GIT --> USR --> CMP --> CACHE

    CACHE --> BUILD --> STREAM
    STREAM --> RETRY --> STREAM

    STREAM --> THINK --> RENDER
    STREAM --> TEXT --> RENDER
    STREAM --> TOOL_USE

    TOOL_USE --> VALIDATE --> PERMS --> EXEC --> RESULT --> FEEDBACK
    FEEDBACK ==>|"loop back to<br/>compaction"| CMP

    TEXT -->|"end_turn"| TRANSCRIPT --> SDK_OUT --> COST

    classDef input fill:#0d4f4f,stroke:#17a2b8,color:#e0e0e0,stroke-width:2px
    classDef process fill:#1a2d4a,stroke:#4a9eff,color:#e0e0e0,stroke-width:2px
    classDef decision fill:#2d2d0d,stroke:#ffc107,color:#e0e0e0,stroke-width:2px
    classDef context fill:#2d1b4e,stroke:#6f42c1,color:#e0e0e0,stroke-width:2px
    classDef api fill:#1b3a1b,stroke:#28a745,color:#e0e0e0,stroke-width:2px
    classDef response fill:#3d2b00,stroke:#fd7e14,color:#e0e0e0,stroke-width:2px
    classDef toolexec fill:#1a1a4e,stroke:#6f42c1,color:#e0e0e0,stroke-width:2px
    classDef feedback fill:#4a1a1a,stroke:#dc3545,color:#e0e0e0,stroke-width:3px
    classDef output fill:#333,stroke:#888,color:#e0e0e0,stroke-width:1px
```

---

## 7. State Management

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'primaryColor': '#1a1a2e', 'primaryTextColor': '#e0e0e0', 'lineColor': '#4a9eff', 'primaryBorderColor': '#4a9eff'}}}%%
graph TB
    subgraph Store["AppState — Single Immutable Store"]
        direction TB
        subgraph Core_S["Core Session State"]
            Model["mainLoopModel"]
            Think["thinkingEnabled"]
            Fast["fastMode"]
            Effort["effortValue"]
            Settings["settings: SettingsJson"]
        end

        subgraph Perm_S["Permission State"]
            TPC["toolPermissionContext"]
            Mode["mode: default / plan / auto / bypass"]
            Allow["alwaysAllowRules"]
            Deny["alwaysDenyRules"]
        end

        subgraph MCP_S["MCP State"]
            MCPCli["clients: MCPServerConnection array"]
            MCPTool["tools: Tool array"]
            MCPCmd["commands: Command array"]
        end

        subgraph Task_S["Background Tasks"]
            Tasks["tasks: taskId to TaskState map"]
            AgentReg["agentNameRegistry"]
            FG["foregroundedTaskId"]
        end

        subgraph UI_S["UI State"]
            Spec["speculation: predictive execution"]
            Suggest["promptSuggestion: autocomplete"]
            Notif["notifications queue"]
            Bridge["replBridge: remote control state"]
        end

        subgraph History_S["History and Tracking"]
            FH["fileHistory: snapshots for rewind"]
            Attr["attribution: commit metadata"]
            Todos["todos: per-agent lists"]
        end
    end

    REPL_C["REPL.tsx<br/>reads + subscribes"]:::consumer
    QE_C["QueryEngine<br/>reads via getAppState"]:::consumer
    Tools_C["Tools<br/>reads via ToolUseContext"]:::consumer

    SET["setAppState<br/>functional update"]:::mutator
    ONCHANGE["onChangeAppState<br/>side effect reactions"]:::mutator

    Store --> REPL_C
    Store --> QE_C
    Store --> Tools_C

    SET --> Store
    ONCHANGE --> Store

    classDef consumer fill:#1b3a1b,stroke:#28a745,color:#e0e0e0,stroke-width:2px
    classDef mutator fill:#2d1b4e,stroke:#e83e8c,color:#e0e0e0,stroke-width:2px
```

---

## 8. Extension Model

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'primaryColor': '#1a1a2e', 'primaryTextColor': '#e0e0e0', 'lineColor': '#ffc107', 'primaryBorderColor': '#ffc107'}}}%%
graph TB
    subgraph Skills["Skills"]
        BS["Bundled Skills<br/>shipped with CLI"]:::skill
        US["User Skills<br/>.claude/skills/*.md"]:::skill
        PS["Project Skills<br/>.claude/skills/ in repo"]:::skill
        SL["loadSkillsDir.ts<br/>discover + parse frontmatter"]:::loader
    end

    subgraph Plugins["Plugins"]
        MP["Managed Plugins<br/>org-level policy"]:::plugin
        IP["Installed Plugins<br/>user choice"]:::plugin
        BP["Built-in Plugins<br/>shipped with CLI"]:::plugin
        PL["pluginLoader.ts<br/>cache-only, versioned"]:::loader
    end

    subgraph Agents["Agents"]
        SA["Sub-agents via AgentTool<br/>forked context, own query loop"]:::agent
        CO["Coordinator Mode<br/>leader dispatches tasks,<br/>workers get limited tools"]:::agent
        SW["Swarms<br/>multi-process via tmux,<br/>mailbox message passing"]:::agent
        FA["Forked Agents<br/>share parent prompt cache,<br/>overlay filesystem"]:::agent
    end

    subgraph HookSys["Hooks"]
        PRE["PreToolUse<br/>before tool execution"]:::hook
        POST["PostToolUse<br/>after tool execution"]:::hook
        SESS["Session Hooks<br/>lifecycle events"]:::hook
        HC["Configured in<br/>settings.json or CLAUDE.md"]:::hook
    end

    CMD["commands.ts — Command Registry<br/>merges all sources"]:::registry
    TOOL["Tool.ts — Tool Interface"]:::registry
    QUERY["query.ts — Agentic Loop"]:::registry

    BS --> SL
    US --> SL
    PS --> SL
    SL --> CMD

    MP --> PL
    IP --> PL
    BP --> PL
    PL --> CMD
    PL -->|"plugin MCP servers"| TOOL

    CMD --> TOOL

    SA --> QUERY
    CO --> QUERY
    SW --> QUERY
    FA --> QUERY

    PRE --> TOOL
    POST --> TOOL
    HC --> PRE
    HC --> POST

    classDef skill fill:#0d4f4f,stroke:#17a2b8,color:#e0e0e0,stroke-width:2px
    classDef plugin fill:#2d2d0d,stroke:#ffc107,color:#e0e0e0,stroke-width:2px
    classDef agent fill:#2d1b4e,stroke:#6f42c1,color:#e0e0e0,stroke-width:2px
    classDef hook fill:#3d2b00,stroke:#fd7e14,color:#e0e0e0,stroke-width:2px
    classDef loader fill:#1a2d4a,stroke:#4a9eff,color:#e0e0e0,stroke-width:2px
    classDef registry fill:#1b3a1b,stroke:#28a745,color:#e0e0e0,stroke-width:3px
```

---

## 9. API Request Lifecycle

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'primaryColor': '#1a1a2e', 'primaryTextColor': '#e0e0e0', 'lineColor': '#28a745', 'actorTextColor': '#e0e0e0', 'actorBorder': '#28a745', 'signalColor': '#28a745', 'noteBkgColor': '#16213e', 'noteTextColor': '#e0e0e0', 'activationBkgColor': '#1b3a1b', 'activationBorderColor': '#28a745'}}}%%
sequenceDiagram
    participant Q as query.ts
    participant C as claude.ts
    participant R as withRetry
    participant K as AnthropicClient
    participant A as Anthropic API

    Q->>C: queryModel(messages, tools, options)
    activate C

    C->>C: resolve model — runtime override, plan-mode swap
    C->>C: normalize messages — strip internal fields
    C->>C: build tool schemas — filter by deny, defer via ToolSearch
    C->>C: configure betas, cache_control, effort, task_budget
    C->>C: add prompt cache breakpoints
    C->>C: compute metadata — user_id, session_id, device_id

    C->>R: withRetry(clientFactory, requestFn)
    activate R

    loop Retry on 429, 529, timeouts
        R->>K: getAnthropicClient(apiKey, model)
        K->>A: beta.messages.stream(params)
        activate A

        alt 200 OK
            A-->>R: SSE event stream
        else 429 Rate Limited
            R->>R: exponential backoff
        else 529 Overloaded
            R->>R: backoff + optional model fallback
        else 401 Auth Error
            R-->>C: CannotRetryError — abort
        end
        deactivate A
    end

    deactivate R

    C->>C: parse stream into AssistantMessage
    C->>C: update usage tracking and cost
    C->>C: detect prompt cache breaks
    C-->>Q: yield AssistantMessage + StreamEvents
    deactivate C
```
