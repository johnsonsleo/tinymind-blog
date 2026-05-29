---
title: 这可能是 macOS 最好看的终端｜Ghostty 配置分享 + 必备插件全推荐
date: 2026-05-29T13:18:34.743Z
---

## [这可能是 macOS 最好看的终端｜Ghostty 配置分享 + 必备插件全推荐](https://x.com/justhalfbit/status/2059988985255215288)

![图像](https://i.imgur.com/9LYufjs.png)

我把用了五年的 iTerm2 + oh-my-zsh 全换掉了。

换完这套，我愿称之为 macOS 最强、最快、最好看的终端——秒开、彩虹渐变提示符、半透明毛玻璃窗口透出桌面壁纸。

不是旧方案不好，是太臃肿了。oh-my-zsh 自带 300 多个插件我只用 5 个，框架每次启动都要加载一堆东西，开个新窗口都要卡一下。这篇除了 Ghostty 本身，还有我每天在用的终端必备插件推荐，配置全部开源可以直接抄。

配合上一篇的 Alfred Workflow，⌘+Space → cc → 回车，Ghostty 弹出来直接进 Claude Code，开始 vibe coding。

![图像](https://i.imgur.com/yAnXGL2.png)

前边评论区有朋友问我的终端怎么配置的，这篇统一回答。讲 Ghostty 安装、必备插件推荐——每个插件是干嘛的、怎么用、使用场景是什么。配置方法我提供了一键安装脚本，复制一行命令 5 分钟装好，执行完就是跟我同款的终端环境：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/justhalfbit/ghostty-terminal-config/main/install.sh)
```

仓库地址：[https://github.com/justhalfbit/ghostty-terminal-config](https://github.com/justhalfbit/ghostty-terminal-config)

想手动安装的去仓库看 README，有完整的步骤说明。安装完之后打开 ~/.zshrc，每个插件都写了详细注释——是什么、怎么用、注意事项，忘了用法直接看这个文件就行。这篇文章只讲"为什么值得用"和"装完怎么玩"。

## 整体架构

这套方案一共三层：

- **Ghostty（终端模拟器）** — 窗口本身，半透明、GPU 加速、原生 macOS
- **Starship（提示符）** — 命令行那行彩色信息，路径、Git 分支、语言版本
- **zsh + 插件（Shell 增强）** — 补全、搜索、高亮、跳转，日常操作效率

三层互不依赖，你可以只装其中一层。但全装上之后的化学反应是最舒服的。

## Ghostty — 终端本身

Ghostty 是 Zig 语言写的新一代终端模拟器。原生 macOS、GPU 渲染、启动快、配置简单。对标 iTerm2 / Alacritty / Kitty，但更轻更现代。

官网：[https://ghostty.org](https://ghostty.org/)

**我的配置效果：**

- 半透明毛玻璃窗口——透出桌面壁纸，但不影响代码阅读
- Catppuccin Mocha 深色主题——配色柔和不刺眼
- Maple Mono NF 字体——支持 Nerd Font 图标显示
- 关掉再打开，标签页、分屏布局、窗口位置全部自动恢复

![图像](https://i.imgur.com/ktI7fFV.png)

**常用快捷键（装好就能用）：**

- ⌘+T — 新建标签页
- ⌘+D — 右侧分屏（竖分）
- ⌘+Shift+D — 下方分屏（横分）
- ⌘+] / ⌘+[ — 在分屏之间切换焦点
- ⌘+Shift+Enter — 当前分屏最大化/还原（写代码时临时全屏某个面板很爽）
- ⌘+W — 关闭当前分屏/标签
- ⌘+= / ⌘+- — 放大/缩小字体（临时调整，不改配置）
- ⌘+, — 快速打开配置文件
- ⌘+Shift+, — 重新加载配置（改完不用重启终端）

**和 iTerm2 比有什么不同？**

说实话功能上 iTerm2 更全（profile 系统、触发器、tmux 集成那些）。但 Ghostty 的优势是：

- 启动快——冷启动体感不到 0.5 秒，iTerm2 要等一下
- 配置简单——一个纯文本文件，不用在 GUI 里翻半天
- 原生渲染——GPU 加速，内存占用低很多
- 改配置即时生效——保存文件的瞬间终端就变了，不用重启

如果你不需要 iTerm2 那些高级功能（大部分人确实不需要），Ghostty 各方面体验都更好。

想预览所有内置主题？终端里输入 ghostty +list-themes，300 多个主题全列出来，挑个名字换上就行。

## Starship — 彩虹提示符

Starship 是用 Rust 写的跨平台提示符，替代 oh-my-zsh 的 theme，但快得多。

装 Starship 最大的理由就是**好看**。每次打开终端看到这条彩虹色信息条心情就很好，比 oh-my-zsh 那些主题高出好几个档次。而且好看的同时还实用——每个颜色块对应一类信息：

```plaintext
红色(用户) → 橙色(路径) → 黄色(Git) → 绿色(语言版本) → 紫色(时间)
```

一眼能看到当前目录、Git 分支、Node/Python/Rust 版本、时间。

![图像](https://i.imgur.com/cQE1Ed8.png)

**我的配置特点：**

- 基于官方 catppuccin-powerline 预设，多色渐变
- 加了换行——信息条完整展示在第一行，光标在第二行，你永远有一整行来输入命令
- Git 状态实时显示——有未提交的修改？有未推送的 commit？提示符上直接看到，不用每次 git status

## 三个 zsh 插件 — 不用 oh-my-zsh

oh-my-zsh 的问题是太重了。就算你只启用几个插件，它的框架本身每次启动都要加载一堆东西。其实我们只需要 3 个独立插件就够了，不需要一个框架帮你"管理"它们。

1️⃣ **zsh-autosuggestions — 输入命令不用打完**

你开始输入命令的时候，它会在光标后面用灰色显示一条历史命令建议。如果就是你想要的，按 → 键或者 Ctrl+F 一键接受整条命令。

比如你之前跑过 docker compose up -d，下次只要输入 dock 它就自动补出完整命令。日常 90% 的命令都是重复的，这个插件省掉的敲键盘次数比你想象的多。

![图像](https://i.imgur.com/RhNG0Q0.png)

2️⃣ **zsh-syntax-highlighting — 打错命令立刻知道**

你还没按回车，命令的颜色就告诉你对不对了：

- 命令存在 → 绿色
- 命令不存在（打错了）→ 红色
- 字符串 → 带引号高亮
- 路径存在 → 下划线

再也不用回车之后才发现 command not found。一边输入一边就能看到问题。

![图像](https://i.imgur.com/4JwHdNN.png)

3️⃣ **zsh-completions — Tab 补全更聪明**

系统自带的 Tab 补全只能补文件名和少数命令。zsh-completions 扩展了几百个命令的参数补全——git、docker、brew、kubectl 这些复杂命令的参数都能补全。

举个例子：git checkout 按 Tab，直接列出所有本地分支让你选，不用先 git branch 查一遍再手打分支名。docker run 按 Tab 能补出 --rm、-it、-v 这些参数，不用每次去翻文档。

按 Tab 弹出候选菜单，连续按 Tab 可以用光标在列表里移动选择。而且大小写不敏感，输入 cd dow 能补出 Downloads。

![图像](https://i.imgur.com/R3ZxroM.png)

## 五个现代 CLI 工具

1️⃣ **fzf — 模糊搜索（最值得装的一个）**

fzf 本质是一个通用的模糊过滤器，装完之后 zsh 里自动多了两个快捷键：

- Ctrl+R → 模糊搜索历史命令
- Ctrl+T → 模糊搜索当前目录下的文件

最常用的是 Ctrl+R。场景：你两小时前跑过一个很长的 Docker 命令，现在想再跑一次。以前要按 ↑ 一直翻，或者 history | grep xxx 去猜关键词。现在 Ctrl+R 弹出搜索框，输入你记得的任意片段（哪怕只记得中间几个字母），实时过滤，选中回车直接执行。

Ctrl+T 也很实用。比如你要 cat 一个文件但不记得完整文件名，输入 cat 然后按 Ctrl+T，弹出文件列表直接搜。

还有个隐藏用法：在命令后面输入两个星号再按 Tab 触发 fzf 补全。比如输入 cd ** 然后按 Tab，会弹出 fzf 搜索所有子目录；输入 kill ** 按 Tab，会列出所有进程让你选。

![图像](https://i.imgur.com/CeR60GK.png)

![图像](https://i.imgur.com/A2YD89d.png)

2️⃣ **zoxide — 智能跳转（用了回不去的那种）**

zoxide 会在后台默默记录你 cd 过的所有目录，按访问频率和时间排序。然后你用 z 命令代替 cd，只需要打路径里的几个关键字母：

```bash
z ghost    # 直接跳到 ~/UserData/GitHubProjects/ghostty-terminal-config
z obsi     # 直接跳到 ~/UserData/ObsidianProjects
z down     # 直接跳到 ~/Downloads
```

不用记完整路径，不用 Tab 一层层补全。你去过的目录它都记得，用得越多越准。

如果有重名冲突（比如多个目录都包含 "config"），用 zi 进入交互模式，配合 fzf 列出所有匹配项让你选。

一个小细节：zoxide 的数据会自动衰减。长时间没去过的目录权重会慢慢降低，不用手动清理。

⚠️ **注意**：不要设置 alias cd="z"，会出问题。直接用 z 就好，习惯很快就养成了。

![图像](https://i.imgur.com/CziXBhj.png)

3️⃣ **eza — 替代 ls（看一眼就不想用回系统 ls）**

系统自带的 ls 输出就是白花花一片文件名，什么信息都看不出来。eza 加了图标、颜色、目录优先排序，文件夹和文件一眼就能区分。

我配了三个别名覆盖系统命令：

- ls — 日常看文件列表，文件夹排前面，每个文件前面有对应类型的小图标
- ll — 详细信息（权限、大小、修改时间），按名称排序
- lt — 树形视图，展开两层目录结构，快速了解项目布局

![图像](https://i.imgur.com/L9D66Ay.png)

4️⃣ **bat — 替代 cat（终端里看代码终于有颜色了）**

系统 cat 输出的代码全是白色纯文本，看多了眼睛疼。bat 自动识别文件类型，加语法高亮——Python 是一套颜色，JavaScript 是一套颜色，JSON/YAML/Markdown 都有对应的高亮方案。

我用别名直接覆盖了 cat，用起来习惯完全一样，但输出好看多了。

日常场景：快速看一个配置文件 cat ~/.zshrc，注释、命令、字符串一眼就分清了。排查问题的时候特别明显，没颜色的纯文本真的看不动。

![图像](https://i.imgur.com/ZBr1aTN.png)

5️⃣ **yazi — 终端文件管理器（Finder 的键盘版）**

如果你经常需要在终端里浏览文件、移动文件、批量重命名，yazi 比反复 cd + ls 效率高太多了。

它是三栏布局：左边上级目录，中间当前目录，右边预览选中文件的内容。全键盘操作：

- j / k — 上下移动光标
- l — 进入目录 / 打开文件
- h — 返回上一级
- 空格 — 选中文件（可多选）
- d — 删除选中的文件
- r — 重命名
- p — 粘贴（配合 y 复制或 x 剪切）
- q — 退出

![图像](https://i.imgur.com/mZ8ArkZ.png)

用法：终端里输入 y 回车打开 yazi，浏览到目标目录，按 q 退出——终端自动就在那个目录了。省掉了 cd 那一步。

## 最终效果

配完之后你得到的是：

- 半透明毛玻璃终端窗口，透出桌面壁纸
- 彩虹色信息条，一眼看清路径/分支/语言版本
- 输入命令时灰色提示历史记录，按 → 直接补全
- 打错命令实时变红，打对变绿
- Ctrl+R 模糊搜索历史命令
- z + 几个字母跳到任何常去的目录
- ls 自带图标和颜色，cat 自带语法高亮
- 关掉再打开，所有标签页和布局自动恢复

这套配置我用了大半年，比之前 iTerm2 + oh-my-zsh 的体验好太多。启动快、配置简单、不臃肿。

配合上一篇搞好的 Alfred Workflow，开机到进入 coding 状态只需要几秒。终端本身就是生产力工具，配好了每天能省下不少碎片时间。

> [MacOS 必装 Top1：Alfred｜保姆级效率配置全拆解](https://x.com/justhalfbit/status/2058555006085980598)

## 总结

- iTerm2（功能多但重） → Ghostty（原生 + GPU） → 启动快 3-5 倍
- oh-my-zsh（框架 + 主题） → 3 个独立插件 + Starship → 加载快 + 好看
- 手动 cd 找目录 → zoxide 智能跳转 → 5 步变 1 步
- 按 ↑ 翻历史命令 → fzf Ctrl+R 搜索 → 从翻到搜
- 系统 ls / cat → eza / bat → 有颜色有图标

所有配置已开源，一键安装：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/justhalfbit/ghostty-terminal-config/main/install.sh)
```

仓库地址：[https://github.com/justhalfbit/ghostty-terminal-config](https://github.com/justhalfbit/ghostty-terminal-config)

README 里有完整的手动安装步骤、配置文件说明、快捷键速查表。⭐ 觉得有用请 star，问题和建议欢迎提 issue。

📋 关注 [@justhalfbit](https://x.com/@justhalfbit)，持续更新踩坑指南 🧩 懂半格，刚好够分享

有问题随时问，看到都回 💬 觉得有用？转给同样需要的朋友 🔄