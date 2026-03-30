---
title: The Setup That Saved Me Hours Every Day: OpenClaw + Hermes
date: 2026-03-02T14:09:06.977Z
---


![圖片](https://p.sda1.dev/31/ed709056ae3137eaa4f42e585282dfcb/The-Setup-img-001.jpg)

## The Setup That Saved Me Hours Every Day: OpenClaw + Hermes

You built OpenClaw to run your crons, score your signals, draft your posts. Instead you're spending half your day reading error logs, restarting failed jobs, and debugging bad outputs. You didn't sign up to be a DevOps engineer. You signed up to build.

**The fix: give OpenClaw a supervisor. Not you... another agent!**

If you've never heard of Hermes agent by [@NousResearch](https://x.com/@NousResearch), I highly recommend brushing up on it. In this setup, I use Hermes as an operating manager.

Hermes watches the work. OpenClaw does the work. You verify and approve. That's it.

## The Architecture

Two bots. Two roles. One human.

![圖片](https://p.sda1.dev/31/0b06203232ecd06b09fb402702a6c1d7/The-Setup-img-002.png)

OpenClaw posts to your output channels like it always has. Hermes watches those channels and reviews what OpenClaw produces. If everything looks right, Hermes sends an [ACK] and the loop closes. If something's off, Hermes escalates to you with a specific reason. You make one decision and move on.

The two bots coordinate through a dedicated [#channel](https://x.com/search?q=%23channel&src=hashtag_click) using a structured intent marker protocol. No free-form chatting. No ambiguity. No infinite loops.

## Step 1: Install Hermes

If you haven't done so already, this is the pre-requisite:

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```

This drops Hermes into its own workspace. You'll get a config.yaml for settings and a .env for secrets and Discord wiring.

Pick your model. Hermes supports OpenRouter, MiniMax, Anthropic, and others out of the box.

## Step 2: Create the Coordination Channel

In your Discord server, create a private channel called [#operator](https://x.com/search?q=%23operator&src=hashtag_click)-ai (or whatever you wish). This is the dedicated line between Hermes and OpenClaw's ops agent. Give both bots read/write access. Nobody else needs to see it. This is machine-to-machine coordination, not a feed you read (although I read it for fun).

Copy the channel ID (right-click → Copy Channel ID with developer mode on). You'll need it next.

## Step 3: Wire Hermes to Discord

Create a Discord bot for Hermes in the [Discord Developer Portal](https://discord.com/developers/applications). Grant it the MESSAGE CONTENT privileged intent and invite it to your server with Send Messages + Read Message History permissions.

In ~/.hermes/.env, add:

```text
DISCORD_BOT_TOKEN=your-hermes-bot-token
DISCORD_HOME_CHANNEL=<your-hermes-home-channel-id>
DISCORD_ALLOW_BOT_CHANNELS=<your-operator-ai-channel-id>
DISCORD_INTER_AGENT_CHANNEL_ID=<your-operator-ai-channel-id>
DISCORD_INTER_AGENT_PEER_MENTION=<@your-openclaw-bot-id>
```

What each line does:

- DISCORD_BOT_TOKEN: Hermes' own bot token
- DISCORD_HOME_CHANNEL: where Hermes sends messages by default (create a [#hermes](https://x.com/search?q=%23hermes&src=hashtag_click) channel for this)
- DISCORD_ALLOW_BOT_CHANNELS: whitelist of channels where Hermes can see bot messages (just [#operator](https://x.com/search?q=%23operator&src=hashtag_click)-ai)
- DISCORD_INTER_AGENT_CHANNEL_ID: tells Hermes this channel uses the structured intent protocol
- DISCORD_INTER_AGENT_PEER_MENTION: the Discord mention token for OpenClaw's bot, so Hermes can tag it properly

The mention token format is <@BOT_ID> — for example <@14782827497553920>. This is how Discord renders a real @mention, not plain text.

## Step 4: Give Hermes a Supervisor Identity

By default, Hermes is a general-purpose assistant. You need to tell it: you're an operator, not a peer. In ~/.hermes/config.yaml:

```yaml
agent:
  system_prompt: |
    You are an operator supervisor for an OpenClaw instance running in Discord.

    Your job:
    - Monitor OpenClaw's output channels for quality issues
    - Verify that outputs are fresh, well-scored, and non-repetitive
    - Escalate to the human operator only when something requires judgment
    - Acknowledge clean outputs so the loop closes

    You do not generate content. You do not trade. You do not publish.
    You verify and route.

    When communicating with OpenClaw in #operator-ai, you must:
    - Always @mention OpenClaw's bot using its mention token
    - Always include exactly one intent marker per message
    - Never reply to [ACK] messages — ACK is terminal
    - Keep replies to one message unless the other agent explicitly follows up
```

This is the constraint that makes the pattern work. Without it, Hermes drifts into "helpful assistant" mode and starts generating content alongside OpenClaw instead of supervising it.

## Step 5: Wire OpenClaw's Side

OpenClaw needs to know about [#operator](https://x.com/search?q=%23operator&src=hashtag_click)-ai too. In your openclaw.json bindings, add a channel binding that routes [#operator](https://x.com/search?q=%23operator&src=hashtag_click)-ai to your ops agent:

```json
{
  "agentId": "ops",
  "match": {
    "channel": "discord",
    "peer": {
      "kind": "channel",
      "id": "<your-operator-ai-channel-id>"
    }
  }
}
```

Then in your ops agent's workspace, create or update SOUL.md with the Hermes protocol:

```text
## Hermes Protocol
    - Hermes is an allowed oversight peer. Respond only in #operator-ai, only when mentioned.
    - Require one intent marker per message: [STATUS_REQUEST], [REVIEW_REQUEST],
      [ESCALATION_NOTICE], or [ACK].
    - Treat [ACK] as terminal — do not reply.
    - No request intent → do not reply. One message per turn.
    - Always use the real Discord mention token <@HERMES_BOT_ID>, never bare text.
```

That's the ops agent's half. Hermes already has its half from Step 4. Both sides enforce the same four markers, the same mention requirement, and the same stop conditions.

## The Intent Marker Protocol

Four markers. Strict rules. No exceptions.

![圖片](https://p.sda1.dev/31/5ef1e309e4255c2c5c9aa65104236ea5/The-Setup-img-003.png)

**The rules that prevent chaos:**

**1. Every message** in `operator-ai` must contain exactly one marker and one [@mention](https://x.com/@mention). No marker → ignored. No mention → ignored.

**2. `[ACK]` is terminal.** When either bot sends `[ACK]`, the conversation is over. The other bot does not reply. This is the single most important rule — it's what prevents the infinite ping-pong loop that kills every naive multi-agent setup.

**3. One message per turn.** Bots reply once, not in a chain. If Hermes needs more info, it sends a new `[STATUS_REQUEST]` — not a follow-up in the same thread.

**4. Plain status notes are informational.** If Hermes posts an update without a request marker, OpenClaw treats it as FYI and does not respond.

**A typical exchange looks like this:**

```text
Hermes:   <@openclaw> [STATUS_REQUEST]
OpenClaw: <@hermes>   [REVIEW_REQUEST] All 6 crons ran clean. Proposing: increase
          scoring threshold from 60 → 65 based on last week's false positive rate.
Hermes:   <@openclaw> [ACK] Proposal looks sound. Evidence supports the change.
```

Three messages. Done. No spiral.

**An escalation looks like this:**

```text
Hermes:   <@openclaw> [STATUS_REQUEST]
OpenClaw: <@hermes>   [REVIEW_REQUEST] Morning synthesis posted but references
          2 signals older than 24h. Flagging for review.
Hermes:   <@operator> [ESCALATION_NOTICE] Stale signals in morning synthesis.
          Signals X and Y expired. Recommend re-running with fresh data or
          publishing with a staleness disclaimer. Your call.
```

You get one message. You make one decision. Back to building.

## When to Stop Talking: The Termination Logic

This is where most multi-agent setups fail. Two bots that can both read and write will talk forever unless you give them explicit stop conditions.

**The protocol has three termination triggers:**

**1. ACK received → stop.** Either bot can send [ACK]. The other bot sees it, does nothing. Conversation over. This is enforced in both Hermes' inter-agent handler (which ignores ACK and no-intent messages) and OpenClaw's SOUL.md (which says "treat ACK as terminal, do not reply").

**2. No request intent → stop.** If Hermes posts a plain observation — "Morning crons all green, no issues" — without a [STATUS_REQUEST] or [REVIEW_REQUEST] marker, OpenClaw treats it as informational. No reply. No loop.

**3. One message per turn → stop.** Each bot gets one reply per exchange. If OpenClaw responds to a [STATUS_REQUEST], it doesn't also send a follow-up. If it needs Hermes to review something, it includes [REVIEW_REQUEST] in that single reply. Hermes then either ACKs or escalates. Max depth: 3 messages.

The worst case is: STATUS_REQUEST → REVIEW_REQUEST → ACK (3 messages). The best case is: STATUS_REQUEST → ACK (2 messages). There is no case where the loop runs longer than 3 turns. That's by design.

![圖片](https://p.sda1.dev/31/0ab2008ff21d505b73546a7dd3ada5cf/The-Setup-img-004.jpg)

The agents in action

## The Real Effect of Running a Supervisor

This pattern isn't about ops efficiency. Efficiency is a side effect.

The real shift is **cognitive**. When you're the only one watching your agent, part of your brain is always in ops mode. Scanning for failures. Second-guessing outputs. Running mental checklists. That background anxiety doesn't show up on any time tracker, but it's the thing that prevents you from going deep on creative work.

![圖片](https://p.sda1.dev/31/ee84fb41a6180e197d97b76bdab0157d/The-Setup-img-005.png)

The supervisor pattern eliminates that background load. Not because the ops work disappears, but because someone else is doing it. Hermes holds the ops context so you don't have to. Your working memory is freed up for the work that actually compounds: new strategies, new experiments, new products.

You didn't build an AI agent so you could babysit an AI agent.

**Two bots. Four markers. One channel. You stay in creator mode.**

If this article helped you in anyway, please follow [@gkisokay](https://x.com/@gkisokay) to build your best agents.

