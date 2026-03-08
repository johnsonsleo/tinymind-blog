---
title: deluge 2.2.0_3 libtorrent-1.2.20.0 可复现编译安装手册
date: 2026-03-02T14:09:06.977Z
---

# Deluge Meta 2.2.0_3 + libtorrent 1.2.20.0 可复现编译安装手册（避坑完整版）

## 1. 目标与结论

目标：在 macOS（Apple Silicon）上稳定跑通这一组合：

- `deluge-meta@2.2.0`（实际版本 `2.2.0_3`）
- 运行时 `libtorrent 1.2.20.0`
- Python `3.14`

本手册基于 **2026-03-02** 实机验证通过，最终核验结果为：

```bash
deluged --version
# deluged 2.2.0
# libtorrent: 1.2.20.0
# Python: 3.14.3
```


## 2. 这套组合为什么容易翻车（核心坑位）

根因不是单点，而是三层耦合：

1. Deluge 2.2.0_3 侧：绑定 `python@3.14`
2. libtorrent 1.2.20 侧：Python 绑定依赖 Boost.Python
3. Boost 1.76 侧：对 Python 3.14 有 API 兼容问题（需要补丁）

常见报错与修复：

- 报错：`boost/asio/io_service.hpp` not found
- 原因：用了新 Boost（如 1.90），而 libtorrent 1.2.20 代码依赖旧 API
- 修复：强制使用 `boost@1.76.0` + `boost-python3@1.76.0`

- 报错：`use of undeclared identifier 'PyEval_CallMethod'`
- 原因：Python 3.14 移除了该接口
- 修复：在 `boost@1.76.0` 构建中把 `PyEval_CallMethod` 替换为 `PyObject_CallMethod`

- 报错：`InvalidVersion: '1.2.20-private-tmp-...'`
- 原因：libtorrent Python egg-info 在临时目录名下触发版本解析失败
- 修复：CMake 参数改为 `-Dpython-egg-info=OFF`

- 报错：`SystemError: type Boost.Python.enum has the Py_TPFLAGS_HAVE_GC flag but has no traverse function`
- 原因：Boost.Python 1.76 的 enum 类型在 Python 3.14 下触发更严格检查
- 修复：`boost-python3@1.76.0` 构建时移除 `Py_TPFLAGS_HAVE_GC` 标志

- 现象：`/private/tmp` 文件夹不停创建/消失
- 结论：正常。`brew/pip` 编译期临时目录行为，安装完成会清理


## 3. 最稳复现路径（推荐）

> 推荐原因：避免再次手工 patch 公式。

### 3.1 已验证公式快照位置

已上传到 GitHub 快照目录：

- `https://github.com/johnsonsleo/tinymind-blog/tree/main/deluge-meta-2.2.0_3-lt1.2.20-formula-snapshot`

关键公式文件直链：

- `https://github.com/johnsonsleo/tinymind-blog/blob/main/deluge-meta-2.2.0_3-lt1.2.20-formula-snapshot/boost%401.76.0.rb`
- `https://github.com/johnsonsleo/tinymind-blog/blob/main/deluge-meta-2.2.0_3-lt1.2.20-formula-snapshot/boost-python3%401.76.0.rb`
- `https://github.com/johnsonsleo/tinymind-blog/blob/main/deluge-meta-2.2.0_3-lt1.2.20-formula-snapshot/libtorrent-rasterbar%401.2.20.rb`
- `https://github.com/johnsonsleo/tinymind-blog/blob/main/deluge-meta-2.2.0_3-lt1.2.20-formula-snapshot/deluge-meta%402.2.0.rb`

### 3.2 一键复现安装（建议直接照抄）

```bash
set -e

# 0) 准备本地 tap
brew tap-new local/deluge-legacy 2>/dev/null || true

# 1) 用快照覆盖公式（关键）
SNAP='/Users/administrator/Downloads/deluge-meta-2.2.0_3-lt1.2.20-formula-snapshot'
TAP_FORMULA='/opt/homebrew/Library/Taps/local/homebrew-deluge-legacy/Formula'
mkdir -p "$TAP_FORMULA"
cp "$SNAP"/*.rb "$TAP_FORMULA"/

# 2) 可选：卸旧包（不删 plist）
brew uninstall --ignore-dependencies deluge-meta@2.2.0 libtorrent-rasterbar@1.2.20 boost-python3@1.76.0 boost@1.76.0 2>/dev/null || true

# 3) 按顺序安装（顺序很重要）
brew install --build-from-source local/deluge-legacy/boost@1.76.0
brew install --build-from-source local/deluge-legacy/boost-python3@1.76.0 || true
brew install --build-from-source local/deluge-legacy/libtorrent-rasterbar@1.2.20
brew install --build-from-source local/deluge-legacy/deluge-meta@2.2.0

# 4) 固定版本，防止升级冲掉
brew pin local/deluge-legacy/boost-python3@1.76.0
brew pin local/deluge-legacy/libtorrent-rasterbar@1.2.20
brew pin local/deluge-legacy/deluge-meta@2.2.0
```

### 3.3 启动与核验

```bash
# 重载 launchd（保留你原来的 plist）
launchctl unload ~/Library/LaunchAgents/com.deluge.deluged.plist 2>/dev/null || true
launchctl unload ~/Library/LaunchAgents/com.deluge.web.plist 2>/dev/null || true
launchctl load ~/Library/LaunchAgents/com.deluge.deluged.plist
sleep 2
launchctl load ~/Library/LaunchAgents/com.deluge.web.plist
sleep 2

# 版本核验（必须看到 1.2.20.0）
deluged --version
/opt/homebrew/opt/deluge-meta@2.2.0/libexec/bin/python -c 'import libtorrent as lt; print(lt.__version__)'

# 端口与 WebUI 核验
lsof -nP -iTCP -sTCP:LISTEN | rg 'deluged|deluge-web|:58846|:8112'
curl -I http://127.0.0.1:8112
```

### 3.4 双栈环境的额外一步（建议保留）

在 `libtorrent 1.2.20` 下，如果 `listen_interface` 留空，Deluge 可能只绑定 IPv4。

如果你的机器同时有公网 v4 / v6，建议在首次启动后显式指定活跃网卡名，例如 `en0`：

```bash
deluge-console "config -s listen_interface en0"
deluge-console "config listen_interface"

uid=$(id -u)
launchctl kickstart -k "gui/$uid/com.deluge.deluged"
sleep 2

lsof -nP -iTCP -sTCP:LISTEN | rg 'deluged|:36881'
lsof -nP -iUDP | rg 'deluged|:36881'
```

预期现象：

- `listen_interface` 显示为 `en0`
- `36881` 同时出现 `IPv4` 与 `IPv6` 监听

如果你的活跃接口不是 `en0`，把命令里的 `en0` 换成实际接口名即可。

预期关键输出：

- `deluged --version` 包含 `libtorrent: 1.2.20.0`
- venv 的 `lt.__version__` 输出 `1.2.20.0`
- `curl -I` 返回 `HTTP/1.1 200 OK`


## 4. 无快照时的“纯网络重建”流程（备用）

> 只有在快照丢失时才建议走这条，步骤更多、出错概率更高。

### 4.1 准备本地 tap 与提取基础公式

```bash
brew tap-new local/deluge-legacy 2>/dev/null || true
brew extract --version=1.76.0 boost local/deluge-legacy
brew extract --version=1.76.0 boost-python3 local/deluge-legacy
```

### 4.2 拉取 deluge-meta 2.2.0_3 公式并改依赖

```bash
curl -L \
  https://raw.githubusercontent.com/Amar1729/homebrew-deluge-meta/deluge-meta-2.2.0_3/Formula/deluge-meta.rb \
  -o /opt/homebrew/Library/Taps/local/homebrew-deluge-legacy/Formula/deluge-meta@2.2.0.rb

perl -0777 -i -pe 's/class DelugeMeta < Formula/class DelugeMetaAT220 < Formula/; s/depends_on "libtorrent-rasterbar"/depends_on "libtorrent-rasterbar\@1.2.20"/' \
  /opt/homebrew/Library/Taps/local/homebrew-deluge-legacy/Formula/deluge-meta@2.2.0.rb
```

### 4.3 Boost/Boost.Python 关键补丁点

[`boost@1.76.0.rb`](https://github.com/johnsonsleo/tinymind-blog/blob/main/deluge-meta-2.2.0_3-lt1.2.20-formula-snapshot/boost%401.76.0.rb) 需确保：

- `without_libraries` 包含 `"wave"`
- `cxxflags` 含 `-Wno-enum-constexpr-conversion`
- `install` 中加入：

```ruby
inreplace "boost/python/call_method.hpp", "PyEval_CallMethod(", "PyObject_CallMethod("
```

[`boost-python3@1.76.0.rb`](https://github.com/johnsonsleo/tinymind-blog/blob/main/deluge-meta-2.2.0_3-lt1.2.20-formula-snapshot/boost-python3%401.76.0.rb) 需确保：

- 依赖 `python@3.14`
- `install` 中加入：

```ruby
inreplace "libs/python/src/object/enum.cpp", /\s*\| Py_TPFLAGS_HAVE_GC\n/, "\n"
```

### 4.4 libtorrent 1.2.20 自定义公式关键点

[`libtorrent-rasterbar@1.2.20.rb`](https://github.com/johnsonsleo/tinymind-blog/blob/main/deluge-meta-2.2.0_3-lt1.2.20-formula-snapshot/libtorrent-rasterbar%401.2.20.rb) 关键参数必须包含：

- `depends_on "boost@1.76.0"`
- `depends_on "boost-python3@1.76.0"`
- `depends_on "python@3.14"`
- CMake:
  - `-Dpython-bindings=ON`
  - `-Dpython-egg-info=OFF`  ← 这是避免 InvalidVersion 的关键
  - `-DBOOST_ROOT=...boost@1.76.0`
  - `-DPython3_EXECUTABLE=.../python3.14`


## 5. 故障排查速查表

### 5.1 `brew install boost-python3@1.76.0` 最后 link 冲突

现象：

- 提示与 `boost-python3 1.90.0` 的 `libboost_python314.*` 冲突

处理：

```bash
# 方案A（推荐，最小侵入）：忽略 link 报错，只要 @1.76.0 装好了即可
brew --prefix boost-python3@1.76.0

# 方案B（需要完全切换默认库链）
brew unlink boost-python3
brew link --overwrite boost-python3@1.76.0
```

### 5.2 `deluged --version` 起不来 / import libtorrent 报错

先看这两个命令：

```bash
/opt/homebrew/opt/deluge-meta@2.2.0/libexec/bin/python -c 'import libtorrent as lt; print(lt.__version__)'
deluged --version
```

- 如果第一条都挂，先修 `boost-python3@1.76.0`（enum.cpp 补丁）
- 如果第一条 OK 但第二条挂，检查 `deluge-meta@2.2.0` 是否重装后正确链接

### 5.3 launchd 已载入但网页打不开

检查顺序：

```bash
launchctl list | rg 'com\.deluge\.(deluged|web)'
lsof -nP -iTCP -sTCP:LISTEN | rg ':8112|:58846|deluge'
tail -n 100 ~/Library/Logs/deluge/deluged.err
tail -n 100 ~/Library/Logs/deluge/deluge-web.err
```


## 6. 本机当前已验证状态快照

```bash
brew list --versions | rg '^(deluge-meta@2.2.0|libtorrent-rasterbar@1.2.20|boost@1.76.0|boost-python3@1.76.0|python@3.14)'
# boost-python3@1.76.0 1.76.0
# boost@1.76.0 1.76.0
# deluge-meta@2.2.0 2.2.0_3
# libtorrent-rasterbar@1.2.20 1.2.20
# python@3.14 3.14.3_1

brew list --pinned | rg 'deluge-meta@2.2.0|libtorrent-rasterbar@1.2.20|boost-python3@1.76.0'
# boost-python3@1.76.0
# deluge-meta@2.2.0
# libtorrent-rasterbar@1.2.20
```


## 7. 插件安装额外提醒（ltConfig 曾踩过的坑）

Deluge 2.2.0 + Python 3.14 环境下：

- `ltConfig-0.3.1-py3.6.egg` 这类旧 egg 通常不兼容（Python ABI 不匹配）
- 插件必须同时兼容：
  - Deluge 2.x API
  - Python 3.14
  - 当前 libtorrent 绑定

建议每次先确认插件发布说明里是否明确支持 Deluge 2.2 / 新 Python。


## 8. 回滚/清理（仅在需要时）

```bash
# 停服务
launchctl unload ~/Library/LaunchAgents/com.deluge.deluged.plist 2>/dev/null || true
launchctl unload ~/Library/LaunchAgents/com.deluge.web.plist 2>/dev/null || true

# 卸载构建链（会影响当前可用环境）
brew uninstall --ignore-dependencies deluge-meta@2.2.0 libtorrent-rasterbar@1.2.20 boost-python3@1.76.0 boost@1.76.0

# 可选：去掉 pin
brew unpin deluge-meta@2.2.0 libtorrent-rasterbar@1.2.20 boost-python3@1.76.0
```

---

如果下次要重装，优先走第 3 章“快照复现流程”。
这是目前成功率最高、改动最少、最省时间的一条路径。
