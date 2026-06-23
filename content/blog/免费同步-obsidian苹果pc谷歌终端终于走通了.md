---
title: 免费同步 Obsidian（苹果PC+谷歌终端）终于走通了
date: 2026-06-23T13:04:53.266Z
---

## [Syncthing 免费同步 Obsidian（Mac + Android）终于走通了！](https://x.com/Cander_zhu/status/2066500295970959677)

![图像](https://i.imgur.com/DKRrLtR.png)

今天下午我狠下心，花整整半小时 把 Syncthing + Obsidian 同步从头到尾又跑了一遍。

结果第一遍就翻车了——文件夹路径设置错误，同步出来全是乱码，手机端打开一堆乱七八糟的文件，差点崩溃。

后来我直接把两边设备上的文件夹全部删掉，重新从零开始一步步配置……这次终于彻底走通了！下面是我亲测成功的最稳方案 + 避坑记录，Mac + Android 的朋友可以直接抄作业。

以下是完整、可直接复现的成功流程，附上我这次实测的避坑经验。

为什么推荐 Syncthing？

- 完全免费
- 实时双向同步
- 数据完全在自己设备之间传输（不经过云服务器）
- 支持 Mac / Windows / Linux / Android
- 插件、主题、.obsidian 配置都能同步

核心架构： Mac Obsidian ↔ Syncthing（P2P）+ Git 做版本备份（双保险）（可选，但我当前暂未启用）

**完整配置流程（已实测成功）**

**1. Mac 端安装**

**推荐使用 Homebrew 安装。**

打开终端：

```text
brew install syncthing

#安装完成后启动：
brew services start syncthing

检查是否运行：
brew services list

#查看 Syncthing 是否监听端口：
lsof -i :8384

#正常会看到：
syncthing xxxx TCP localhost:8384 (LISTEN)
```

备选方式（官网下载）：

- 去 Syncthing 官网下载 Mac 对应压缩包
- 解压后直接运行 syncthing 可执行文件

💡***注意***：当使用可执行文件启动的时候，需要你在系统设置 -> 隐私与安全性 这里设置“仍然打开”，不然启动不成功，属于临时运行，每次重启 Mac 都要重新启动。 浏览器打开：[http://localhost:8384](http://localhost:8384/)

![图像](https://i.imgur.com/7n0ny7b.png)

这就是 Syncthing 的控制面板，后续所有配置都在这里完成。

**2. Android 端安装**

推荐安装 Syncthing-Fork（社区维护版，更稳定），在google play 直接搜索。

这是目前安卓社区最活跃的版本。安装后打开应用。

**3. 设备互联**

- 电脑端：Actions → Show ID，复制 Device ID（也可手机扫二维码）

![图像](https://i.imgur.com/K7CagmX.png)

- Android：添加设备 → 粘贴 ID/直接扫电脑端端设备二维码，就会看到电脑端有弹窗出现。

![图像](https://i.imgur.com/zi1T8Gx.png)

- Mac 确认接受

![图像](https://i.imgur.com/C14kySA.png)

到此，我们就完成了两台设备的互相信任。接下去就是创建同步目录了。

**4.添加 Obsidian 文件夹**

**这次踩的坑：**第一次我把整个 Documents 文件夹加进去了，同时在手机端设置目录路径时设置出错，导致同步出现大量乱码和隐藏文件冲突。

正确做法：

- 在电脑端的 Syncthing 面板点击 Add Folder
- **Folder Label：**Obsidian（随你自己）
- **Folder Path：**只选择独立的 Vault 文件夹，（例如 /Users/你的用户名/Documents/Obsidian）
- **重要：**不要把整个 Documents 或 iCloud 文件夹加进去，只同步独立的 Vault 文件夹！

![图像](https://i.imgur.com/YrAwGvk.png)

**5. 共享给 Android**

编辑 Folder → Sharing → 勾选 Android 设备 → 保存

![图像](https://i.imgur.com/zldCPDB.png)

**6. Android 接受并选择路径** 接受共享后，选择保存位置（推荐新建 /storage/emulated/0/Obsidian），

如果你手机端已经安装了Obsidian并已创建Vault，那就直接使用路径填写。

![图像](https://i.imgur.com/aV49ZDO.png)

**提示：手机的路径都是**/storage/emulated/0开始，后面就是你具体的文件路径，我的是在Documents/doc，所以填写的时候就是“/storage/emulated/0/Documents/doc”。

**7. 等待首次同步**

我这次重新配置后，30多篇笔记大概花了 10 秒左右 完成同步，之后就非常丝滑。

**8. 在 手机端中打开Obsidian**

选择你的Vault仓库，就可以看到从电脑端同步的内容了。

**实测验证**

- Mac 新建笔记 → Android 几秒内出现
- Android 编辑或新增 → Mac 自动更新
- 插件和主题也正常同步

**常见问题 & 我的避坑经验**

**Q：出现乱码或同步失败？** 最常见原因是文件夹路径设置错误。

解决办法：删掉两边对应文件夹，重新添加干净的 Vault 文件夹（我今天就是这么解决的）。

**Q：必须同一 WiFi 吗？** 不需要。只要两台设备能上网即可。

**Q：一台离线会怎样？** 会等对方上线后再同步，不会丢数据。

**Q：安全吗？** 比云盘更安全（完全点对点）。重要 Vault 建议配合 Git + GitHub Private 仓库做版本控制。

**最终推荐架构**

- **实时同步：**Syncthing
- **版本控制 + 异地备份：**Git + GitHub Private Repo（可选，但我当前暂未启用）

花了半小时实测后，我更加确认：**对于不想付费的用户，Syncthing 是目前 Mac + Android 上最稳、最自由的 Obsidian 同步方案**。

虽然第一次配置可能会踩一两个坑，但走通之后真的很香。

你目前用什么方案同步 Obsidian？ 欢迎在评论区分享你的配置，或遇到过什么坑，我可以一起讨论。