---
title: deluge-plugin-install-playbook
date: 2026-03-02T02:01:48.560Z
---

# Deluge 插件丝滑安装手册（macOS / Deluge 2.2.0）

## 目标

下次安装任意 Deluge `.egg` 插件时，尽量走稳定路径，避免再次踩到这次遇到的坑。

适用环境（本机已验证）：

- macOS
- Deluge 2.2.0（Homebrew）
- `deluged` / `deluge-web` 由 `launchd` 管理

---

## 这次踩到的坑（结论）

1. Web UI 上传插件时，文件可能被错误保存为：
   - `~/.config/deluge/plugins/[object FileList]`
   - 这不是合法插件文件名，Deluge 通常无法正确识别。

2. `deluge-console plugin -i ...` 有时会报错（例如 `NoneType can't be awaited`）：
   - 这不一定代表插件没装上。
   - 需用 `plugin -l` / `plugin -s` 复核最终状态。

3. 端口问题与插件无关：
   - 端口范围由 `core.conf` 的 `listen_ports` 控制（例如 `[6881, 6891]`）。

---

## 推荐安装流程（稳定版）

### 1) 先拿到插件文件，再复制到插件目录（不要依赖 Web 上传）

```bash
PLUGIN_URL="https://github.com/ratanakvlun/deluge-ltconfig/releases/download/v2.0.0/ltConfig-2.0.0.egg"
PLUGIN_EGG="/tmp/$(basename "${PLUGIN_URL%%\?*}")"
PLUGIN_DIR="/Users/administrator/.config/deluge/plugins"

curl -L "$PLUGIN_URL" -o "$PLUGIN_EGG"
mkdir -p "$PLUGIN_DIR"
cp -f "$PLUGIN_EGG" "$PLUGIN_DIR/"
```

### 2) 清理错误文件名（如果有）

```bash
rm -f "/Users/administrator/.config/deluge/plugins/[object FileList]"
```

### 3) 重启 Deluge 服务让它重扫插件

```bash
uid=$(id -u)
launchctl kickstart -k "gui/$uid/com.deluge.deluged"
sleep 2
launchctl kickstart -k "gui/$uid/com.deluge.web"
```

### 4) 用 `deluge-console` 复核插件是否被识别

```bash
AUTH_LINE=$(head -n1 /Users/administrator/.config/deluge/auth)
DELUGE_USER="${AUTH_LINE%%:*}"
DELUGE_PASS=$(echo "$AUTH_LINE" | cut -d: -f2)

deluge-console -d 127.0.0.1 -p 58846 -U "$DELUGE_USER" -P "$DELUGE_PASS" "plugin -l"
```

你应在输出里看到插件名（例如 `ltConfig`）。

### 5) 启用插件

```bash
deluge-console -d 127.0.0.1 -p 58846 -U "$DELUGE_USER" -P "$DELUGE_PASS" "plugin -e ltConfig"
deluge-console -d 127.0.0.1 -p 58846 -U "$DELUGE_USER" -P "$DELUGE_PASS" "plugin -s"
```

`plugin -s` 里出现 `ltConfig` 即为启用成功。

---

## 一键安装脚本（通用）

保存为 `install-deluge-plugin.sh` 后执行：

```bash
#!/usr/bin/env bash
set -euo pipefail

PLUGIN_SOURCE="${1:?Usage: install-deluge-plugin.sh /abs/path/plugin.egg|URL [PluginId]}"
PLUGIN_ID="${2:-}"
PLUGIN_DIR="$HOME/.config/deluge/plugins"

if [[ "$PLUGIN_SOURCE" =~ ^https?:// ]]; then
  PLUGIN_BASENAME="$(basename "${PLUGIN_SOURCE%%\?*}")"
  PLUGIN_EGG="${TMPDIR:-/tmp}/$PLUGIN_BASENAME"
  curl -L "$PLUGIN_SOURCE" -o "$PLUGIN_EGG"
else
  PLUGIN_EGG="$PLUGIN_SOURCE"
  PLUGIN_BASENAME="$(basename "$PLUGIN_EGG")"
  if [[ ! -f "$PLUGIN_EGG" ]]; then
    echo "ERROR: file not found: $PLUGIN_EGG" >&2
    exit 1
  fi
fi

mkdir -p "$PLUGIN_DIR"
cp -f "$PLUGIN_EGG" "$PLUGIN_DIR/$PLUGIN_BASENAME"
rm -f "$PLUGIN_DIR/[object FileList]"

uid="$(id -u)"
launchctl kickstart -k "gui/$uid/com.deluge.deluged"
sleep 2
launchctl kickstart -k "gui/$uid/com.deluge.web"
sleep 1

AUTH_LINE="$(head -n1 "$HOME/.config/deluge/auth")"
DELUGE_USER="${AUTH_LINE%%:*}"
DELUGE_PASS="$(echo "$AUTH_LINE" | cut -d: -f2)"

echo "== Available plugins =="
deluge-console -d 127.0.0.1 -p 58846 -U "$DELUGE_USER" -P "$DELUGE_PASS" "plugin -l"

if [[ -n "$PLUGIN_ID" ]]; then
  echo "== Enabling plugin: $PLUGIN_ID =="
  deluge-console -d 127.0.0.1 -p 58846 -U "$DELUGE_USER" -P "$DELUGE_PASS" "plugin -e $PLUGIN_ID" || true
fi

echo "== Enabled plugins =="
deluge-console -d 127.0.0.1 -p 58846 -U "$DELUGE_USER" -P "$DELUGE_PASS" "plugin -s" || true
```

使用示例：

```bash
bash install-deluge-plugin.sh \
  "https://github.com/ratanakvlun/deluge-ltconfig/releases/download/v2.0.0/ltConfig-2.0.0.egg" \
  ltConfig
```

---

## 针对 ltConfig 的已验证结果（本机）

- 可识别版本：`ltConfig-2.0.0.egg`
- 推荐来源：`https://github.com/ratanakvlun/deluge-ltconfig/releases/download/v2.0.0/ltConfig-2.0.0.egg`
- 插件文件应位于：
  - `/Users/administrator/.config/deluge/plugins/ltConfig-2.0.0.egg`
- 避免保留错误文件名：
  - `/Users/administrator/.config/deluge/plugins/[object FileList]`

---

## 快速排障清单

1. `plugin -l` 里没有插件名：
   - 先确认 `.egg` 在 `~/.config/deluge/plugins/`
   - 重启 `deluged` + `deluge-web`
   - 删除 `[object FileList]`

2. `plugin -i` 报错：
   - 忽略该报错，改走“直接复制 + 重启 + plugin -l/-s 验证”

3. Web 页看不到插件入口：
   - 先确认 core 已启用：`plugin -s`
   - 再重启 `deluge-web`

4. 查日志：
   - `~/Library/Logs/deluge/deluged.err`
   - `~/Library/Logs/deluge/deluge-web.err`

---

## 下次新开对话可直接贴的请求模板

```text
按我这份《deluge-plugin-install-playbook.md》执行插件安装。
插件来源：/abs/path/xxx.egg 或 https://example.com/xxx.egg
请直接完成：复制到插件目录、重启服务、识别并启用插件、最后给我验证结果。
若失败，请按文档的排障清单继续处理到成功。
```

