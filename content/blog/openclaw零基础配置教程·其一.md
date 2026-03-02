---
title: OpenClaw零基础配置教程·其一
date: 2026-03-02T02:10:03.794Z
---

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsn13YKicibSEAuk6d1uuOCAOicnKIAS9w9ewGJRpQ3HXYNVhNPHAbU1DTgibxy96ic7B0gHqia64eNEicDa21GTltKdEyxBbHsS8LPCcw/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=0)

本文面向电脑小白，手把手教你完成 OpenClaw 的基础配置与使用。我们将使用 Google Gemini 赠送的 300 美元免费 API 额度，并以 Telegram 频道作为消息推送渠道。

基本配置好之后大概是这样的：

我目前配置了三个agent，各自使用不同的模型，各自拥有独立的workplace、session和memory，主agent通过telegram bot绑定，另外两个新添加的agent均通过telegram群组绑定，可用于执行多样化任务。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsmZchOwYbGouQfC3fDt1A7qOEo4nVYlGLzsuzQGVskic6xTooibqFAPbkJ9ZFWIFt5yGQ6ffxMeeH9tNWmJZNoXEe8MKydIQqyvs/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=1)

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsnaeia3WiaEforoFBXMWTbT66PT2cf5icZ8XINiaq6TyxwoYfl2V46lUPmLrSEM0tgClNOAvgbgSOeIQHEennfceqgnibzTb9fiaTOmQ/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=2)

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKslXdGjHvYEvMMR5weibTFv4mT9qQLcKGc9fmfM4padj8cgvIzkibibVNPdv37y7ukicIOQicYefia5pBVicsNJS9T5S7icLkiaC3ILQibNMk/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=3)

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKsmUUFuxsDictNTsl47Snm8OYrYMT7h9ousjpPmuIwicwH06hia4oXtK89IB6VPia3DGtDvibbBDftEcic9IaBUUpHgnglGNDdeUZcUR8/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=4)

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsnaxfZQTvxfZ1DYdmT3pb0Wq9XXGIOqVxLHWZAVmkDNtK57nok4wdIicIu9SyKWkuHPfMI7eNl8d4cHszD8lh4ic5k6rtywUGeCE/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=5)

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsn3jzOt98Wp2jTk7zfsvHebulPH3GWqf2MPNY3nicSf46LwLwgibkRlcaicE63PicjLO0KACzpM1gAPxlsQt7mZPjUBicJRx3l5MbEw/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=6)

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKslaLEIx5av74lWtjdibg5qBoXPSddHiczJBuUnicYib63thl1tDGcOZibjQ4MYyOESicxzrWYvqCfPTqqpVrzx1CaFof4K3DNOSpfflA/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=7)



## 前言：为什么要折腾这些？

##  

**OpenClaw 是什么**

OpenClaw 是一款基于大语言模型的自主 AI Agent 框架，由开发者 Peter Steinberger 创建并开源。与普通的 AI 聊天工具不同，OpenClaw 不只是"回答问题"，而是能够主动执行任务——它可以接入你的文件系统、代码仓库、邮件、Slack、社交账号乃至 API 密钥，像一名真正的数字员工一样自主工作：自己跑测试、捕获 Bug、修复代码、提交 PR，或者管理客户请求、起草回复、安排跟进。你交代一件事，它会拆解步骤、调用工具、逐步完成，全程不需要人盯着。香港大学研究团队专门基于 OpenClaw 开发了 ClawWork 基准测试，涵盖 44 个职业的 220 项真实专业任务，测试结果显示其最强状态下的等效时薪超过 1500 美元——这不是概念，是被学术标准量化出来的生产力数据。

**为什么能爆火**

OpenClaw 上线后在 GitHub 上以前所未有的速度积累了超过 14.5 万颗 Star，Sam Altman 和 Mark Zuckerberg 先后公开表达关注，其创始人随即被 OpenAI 招募。它的爆火并不是靠营销，而是靠口口相传的真实体验：用户在 X 上自发分享，说它是"第一个真正感觉像魔法的工具"，说"我能想象的和它实际能做到的之间的鸿沟，从来没有这么小过"。这种感受的本质，是 OpenClaw 第一次让普通人直观感受到 AI 从"助手"跨越到"协作者"的质变——你不再需要精心设计提示词，只需要描述目标，它自己想办法完成。这个体验一旦发生，就很难再退回去。

**为什么要使用它**

使用 OpenClaw 最直接的理由是时间和金钱。一家设计公司部署 OpenClaw 管理客户沟通后，响应时间从 30 分钟压缩到 3 分钟，每周节省 12 小时，按 150 美元的计费时薪折算，相当于每周凭空多出了 1800 美元的有效产能。对于独立创业者，它打开了此前根本不现实的变现路径：在 Fiverr 接网站建设订单、提供内容与 SEO 服务、在 ClawHub 出售功能模块——有人 48 小时内收到了第一笔钱，有人睡前交代任务、醒来发现成品已经完成。但真正理性的使用逻辑不是"交给 AI 什么都行"，而是找到一个具体的、可重复的场景，把 OpenClaw 的能力约束进去，做成一个有定价、有流程、客户能看懂价值的服务。就像 F1 赛车的技术不是拿来日常开车的，但它验证了什么是可能的——OpenClaw 证明了自主 AI 可以真正承担专业工作，而你需要做的，是找到属于自己的那个切入点。

##  



整个流程分三大块：

1. 搭环境

   —— 用 UTM 在 Mac 上创建一个干净的 macOS 虚拟机

2. 装工具

   —— 在虚拟机里安装 Homebrew、Git、Python、Node.js

3. 跑起来

   —— 配置 Gemini API + Telegram，启动 OpenClaw

预计总耗时：**2～3 小时**（大部分是等待下载）



**硬件选择：为什么 Mac Mini 是目前最合适的 24 小时主机**

![图片](https://mmbiz.qpic.cn/mmbiz_jpg/wr5ugPSSKsn9PDc3YVWa6xJdFKSpeoGywc3jn3ey40BYTX6BwOcJDQSAjBO4iaBwXuXGmViaTmiczUROJTBDdx9a83H4nILx2HkoHgXATDVRXY/640?wx_fmt=jpeg&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=8)

要让 OpenClaw 真正发挥价值，它需要能够持续运行——白天处理任务、夜里跑流程、随时响应触发器。这意味着你需要一台可以长期开着、功耗低、散热好、不影响日常使用的机器。综合这几个维度，Mac Mini 目前是普通用户能买到的最合适的选择。

首先是功耗。Mac Mini M4 的满载功耗仅在 25～35 瓦左右，待机时甚至低至个位数。对比之下，一台 Windows 台式机长期运行的功耗动辄 150 瓦以上。按国内平均电费 0.6 元/度计算，Mac Mini 全年 24 小时运行的电费大约在 150～200 元，几乎可以忽略不计。

其次是稳定性。macOS 对长时间运行的优化远好于 Windows——不会随机弹出更新重启、不会因为长时间不操作触发奇怪的系统行为。配合本文前面介绍的 Amphetamine 防睡眠工具，以及系统设置里「断电后自动启动」选项，即便偶尔断电，Mac Mini 也能自动恢复运行，几乎不需要人工干预。

第三是静音和体积。Mac Mini 在正常负载下几乎无风扇噪音，体积只有一本书大小，放在桌角、电视柜或路由器旁边都毫无压力，不占空间、不产生噪音，真正做到"放在那里忘掉它"。

当然，Mac Mini 也有局限：它没有内置显示器，首次配置需要外接屏幕，之后可以通过 SSH 或远程桌面管理，不再需要显示器。另外，如果你已经有一台 M 系列的 MacBook，也可以先用虚拟机方案验证工作流，等确认 OpenClaw 确实能给你带来稳定产出之后，再入手一台 Mac Mini 专门用于常驻运行——这是更稳妥的投入节奏。



## **第一章：搭环境——用 UTM 创建 macOS 虚拟机**

### 为什么要用虚拟机？

把 OpenClaw 跑在一个独立的虚拟机里，有几个好处：

- 不污染宿主机环境，出了问题直接删掉重来
- 可以 24 小时常驻运行，不影响日常使用
- 方便迁移和备份



这一部分的具体操作也可参考下面这段视频：

https://youtu.be/fooZAZsBmpg?si=QaId2Rp53eCsRtul



### **1.1 下载并安装 UTM**

UTM 是 Mac 上免费的虚拟机软件，支持 Apple Silicon（M 系列芯片）。

直接去官网下载：**https://mac.getutm.app**

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKskUplYiarKLGczjdmLKnCXbic6P17liaL8qyvqwHAywBKkDhbHXvBRtsbxkSkw10uldbsiaQibib0MjzIE3pk7Mpf6dDoGE4nqbdFmvw/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=9)

> 💡 App Store 也有 UTM，但需要付费。官网版完全免费，功能一模一样。



安装完成后打开，看到这个界面说明安装成功：

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKskkGlLeIHTia3FCZhjjVic9rVWoXiaqDYxYNaibk0gsK7U4YElg8YWsvkFRxY2aiaL3UyucVia7hgHGhWO6ib7t7kR1BPCktNdZcIiayUU/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=10)

###  

### **1.2 创建新虚拟机**

点击「**创建一个新虚拟机**」，进入配置向导。

**第一步：选择虚拟化类型**

弹出如下选择框：

这里我们选择「**虚拟化**」

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsnZ4ECuXODKQhpicQGYHQasQUNxrCHXLoIZZIpGt7UFvIh3asmjL6vZ31ricwto8UIxSAwpPl8cenWAvib2oY1fgialrUmiclywAT7k/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=11)

| 选项       | 特点                                    |
| ---------- | --------------------------------------- |
| **虚拟化** | 速度快，只能运行与宿主机相同的 CPU 架构 |
| **模拟**   | 速度慢，可运行其他架构                  |

Apple Silicon（M 系列）用户选「**虚拟化**」，速度更快。



**第二步：选择操作系统**

选择「**macOS 12+**」

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKslwZv1xlsADHf7RXxoljdK9fc1FbuoZHus07nK7t0P7TSuYZbQw8g5tWeh0Oo4Fqmpa8dQ20eyRaibEsicqhibJg5xQKlbBF9aj5s/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=12)



**第三步：配置硬件**

推荐配置：

- 内存

  ：默认为4096 MiB（即 4GB），如果你的 Mac 有 16GB 或以上内存，可以调高到 12288MiB（即12GB）（macOS 宿主机日常运行只需要 3～4GB，把剩余的都交给虚拟机，虚拟机内的 OpenClaw 运行会更流畅。）



- CPU 核心

  ：保持「默认」即可



**第四步：导入 IPSW 恢复文件**

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKsnnCXEP7J9lrjSDx90tBzBo8ogytLcda6JeTiarQ8K1hE1icV8Ro71Wun50eliagqvAkY6A2KWb5nkfJicPp1Il0poZTJm1D91SLDc/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=13)



这一步需要 macOS 的 IPSW 恢复文件。

如果你没有现成的 IPSW 文件，直接点击继续即可，UTM 会自动从 Apple 服务器下载最新版本（文件较大，约 18GB，需要等待一段时间）。

> ⚠️ **注意**：下载过程中 Mac 不能睡眠，否则下载会中断。下一节会告诉你如何防止睡眠。



*第五步：配置存储空间*

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKslOoShc6ibcdgr9jSJgKyMsujrvm1iblibXX0vFIR8jpKR4n7MH1nnqys1A4UvE3dg07Y5ftMWoU0ZNkxMWoFWRXlret6SVP18icibg/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=14)

默认 **64 GiB**，对于轻度使用完全够用。如果你打算在虚拟机里存放较多文件或长期运行，可以根据宿主机的剩余空间适当调大，改为 **128 GiB**甚至更大也没有问题——UTM 的虚拟磁盘采用**动态分配**机制，即便你设置了 128 GiB 的上限，它实际占用的空间会随使用量逐渐增长，而不是一开始就把 128 GiB 全部从你的硬盘里划走。所以这个数字更像是"最多允许用多少"的天花板，而不是"马上要占用多少"的实际消耗。确认后点击「**继续**」。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKslDHEorT5PAlDeRlR8wcve0fSF3iaJNL2NJNMhat54DbqbVgOu8Arm3TK7VF7FT8bMmZtE9hu5rrMox3JPFuWkUqsiccD0iaNzeK4/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=15)

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKskia9v4xalWGZXVelV7giacovnwu0uDaN4sNw3txDWa5ymE7ic1hI2vbALoHmpeIHONmVSWpk0ABHD1c0hCicRy8aIYA4KroxFicMIM/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=16)

（我选择的是128GiB，可以看到，目前只用了54GB多一点）



### **1.3 防止 Mac 睡眠——安装 Amphetamine**

下载 IPSW 或安装系统时需要长时间运行，Mac 不能自动睡眠。

首先在系统设置 → 能耗里：

把「**显示器关闭时，防止自动进入睡眠**」打开。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsmFxvLasNwuMMQdyB9oJeKWH8vP88ab7icKrOm3Wcx9SNUCMEJubLdNe8TKJG55oBK3d9nhO2icWj0fcqKT1oBVXxSzad1gFpzib0/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=17)





但这个方法并不完全可靠，更推荐安装 **Amphetamine**：

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKsl3gyK2FFIPJZad06AQ9IhLuYOjRXJwWZjB9Xtcnva2eialjeBy2SqYAb3yTdhEdavlyqH2QoXiaJoTAaW8Ih5LNCOqWtEPUW6iac/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=18)

在 Mac App Store 搜索「Amphetamine」，免费下载。安装后点击菜单栏图标，开启「无限期保持唤醒」即可。



**Amphetamine的进阶用法：设置 UTM 触发器**

在 Amphetamine 设置 → 触发器中，可以添加一个「UTM trigger」：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsn64xu4Tse9lYb1VW3rzXPA3ns4ILhImeqgdyKXxLiaPR5jfSERwxccKULqc4yK081lics7oia5pZs0ico2P2EbwicFhjRdpd2yg6FQ/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=19)

**进阶用法：设置 UTM 触发器，让 Amphetamine 自动管理唤醒状态**

手动开关 Amphetamine 是一件容易忘记的事——你可能开着虚拟机却忘了开唤醒，也可能关了虚拟机却忘了关唤醒白白耗着。更优雅的做法是设置一个「触发器」：只要 UTM 在运行，Amphetamine 就自动保持 Mac 唤醒；UTM 退出后，自动恢复正常睡眠。全程不需要你动手。

**设置步骤如下：**

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKskwqv26u4XxkflXlo58CbRJJOF8EYc0lgBZXPSswMXGv1ZicVUWauFEiauJbwE3rGpy3PyEIshJza9KKQcOcVaWhaw8OU0laAol4/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=20)



打开 Amphetamine 菜单，点击「**设置…**」，进入设置窗口后切换到「**触发器**」标签页。勾选顶部的「**启用触发器**」，然后点击左下角的「**+**」按钮新增一个触发器。

在触发器类型里选择「**当 App 正在运行时**」，然后在 App 列表里找到并选中「**UTM**」。给这个触发器起个名字，比如直接叫「UTM trigger」，保存即可。

设置完成后，触发器列表里会出现这一条规则，右侧的勾选框保持打开状态。此后每次你启动 UTM，Amphetamine 会自动接管、阻止 Mac 睡眠；关闭 UTM，一切自动恢复。

------

**解决一个真实痛点：默认图标根本看不出来有没有在工作**

Amphetamine 默认的菜单栏图标是一个胶囊形状的药丸，激活状态和未激活状态的差别极其细微，根本分不清到底有没有启动。这对于一个"状态是否开启"非常关键的工具来说，体验相当糟糕。

**强烈建议换成更直观的图标。**进入 Amphetamine 设置 → **外观**，找到图标选项，里面有一系列可选图标：

从截图里可以看到选项包括 Pill、Molecule、Coffee Carafe、Owl、**Eye（眼睛）**、**Sun & Moon**、**Zzz!!!**等。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsmLLeeBn7FmFbNWxPFNufGF9CAk7yiaoElMUnFCIFoPFP9P4Lb2gN4TnFgYWwGSn3NDXLL97aExh2zriagUrlKtpUxLYcz8fqeVU/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=21)

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKslqpseDrMC6qqF1RfLbniba3lWqibE0OHSLicwNwKuOj9X8MJVjWC1zlacIDXH7YO2Fa2jcyJECrEunX034hBummbfHeic2Iu1KU8s/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=22)



推荐两个最直观的：

- Eye（眼睛）

  ：睁眼 = 保持唤醒，闭眼 = 允许睡眠，一眼就懂

- Zzz!!!

  ：有 Zzz 的大字出现 = 正在睡眠或未激活，激活后图标变化明显，对比强烈

选好图标后，你在菜单栏扫一眼就能立刻判断当前状态，不用再靠猜。

###  

### **1.4 用 LuLu 给 OpenClaw 装上"围栏"**

在你把 OpenClaw 真正跑起来之前，有一件事必须先做：给它装一道出站防火墙。

OpenClaw 是一个自主 Agent，它会主动浏览网页、读取邮件、处理文档——而这些外部内容，恰恰是攻击者的注入点。安全研究人员已经记录了真实的攻击案例：有人把恶意指令藏在 Moltbook 上的一条公开帖子里，试图劫持用户的 OpenClaw 去掏空加密钱包。攻击者从未直接接触 OpenClaw，只是在它会读取的内容里埋下了钩子。这种攻击叫做**间接提示词注入**——OpenClaw 越能干、权限越大，这个风险就越不能忽视。

防御这个风险最直接的方法，是控制 OpenClaw 能连接哪些网络地址。推荐安装 **LuLu**，这是 Objective-See 出品的免费 macOS 出站防火墙。

**下载地址：https://objective-see.org/products/lulu.html**

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsmR4J50gk4WMClbX7Jx0ZIMrJL7YmwiaKfVUHIicUa0U3HFicrWHK3LduuFMerC538rBJAbY9Ekr07nKgrFrmSL5dKia3ohqHKpenw/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=23)

安装后，针对已知的高风险域名设置**永久拒绝规则**：

- ```
  moltbook.com
  ```

  （已有提示词注入攻击案例记录）

如截图所示，LuLu 已将 UTM 虚拟机内对 `moltbook.com`的访问标记为「**阻止**」，这条规则会永久生效，无需每次确认。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKskCPn34VQ7A00GDnNEsm5lJDLVBtE3ribibSibt70LXNd5Wk9Exic3BM8iaB90Foh3XO8kAcbvibwsUiciaicPicWITmbn3JhtWkPHbcjMgs/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=24)



对于其他陌生域名，LuLu 的默认行为是**每次弹窗询问**——OpenClaw 想连接任何新地址时，你都会看到一个弹窗，由你决定放行还是拒绝。这个机制的价值在于：即便 OpenClaw 被某个恶意页面注入了指令、试图偷偷连接外部服务器，你仍然是那个拍板的人，它绕不过去。



## **第二章：装工具——在虚拟机里配置开发环境**

##  

虚拟机安装完成并启动后，我们需要在里面安装 OpenClaw 运行所需的工具链。

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKsksRfMllcibib9ZoW0K0Uede0xPnicZbReQhicl8YCrNW0OvQic1bxicsQa0shnFhnczTbLRTClxpzGY6hGVicGcHrsibdEptON5BZagpQ/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=25)

虚拟机安装完成后会自动重启，进入和新 Mac 一样的初始设置向导——语言、时区、网络，和你第一次开机的流程完全相同。

**关于 Apple ID 登录：**设置向导会询问是否登录 Apple ID。这台虚拟机是专门用来跑 OpenClaw 的工具机，**建议跳过不登录**。登录 Apple ID 会触发 iCloud 同步、查找我的 Mac 等一系列服务，对于一台纯工具用途的虚拟机来说完全没有必要，反而会产生额外的网络请求和后台活动。直接点「稍后设置」跳过即可。

**关于用户名：这里有一个很容易踩的坑。**设置向导会让你创建一个本地账户，填写用户名时，**不要使用 openclaw、claw、claude 等与工具名相关的词**。macOS 会把这个用户名用于生成家目录路径（如 `/Users/openclaw`），而 OpenClaw 在运行时会频繁读写自身的配置文件和路径——一旦路径里出现了和工具名相同的字符串，某些脚本或配置解析会产生意想不到的冲突。

取个普通的名字就好，比如你的英文名、`admin`、`dev`都没问题。这个细节在设置时只要三秒钟，事后改起来却非常麻烦，请务必留意。

（如果登录了Apple ID，在 设备 中会有显示）

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKskBNcPSMuKEokFz0Ak9FjNg9nib6HJH6qjSgQWwOy0e7jhL7F3bHI9MBcuNJxdd6r9xiarjgeROZaxknyTAF218GcUZBEpN4y6OU/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=26)





成功登录虚拟机后，我们打开虚拟机里的**终端（Terminal）**，开始操作。

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKsm3kZp8qZkMyvrkRb39PFeicPq8hJgjsq4RQw6K1ibPwKQ6dsg9PI7bbIwX3WajdVOPO8DsWk6obrzYDderjoeUwJa2EB94g0T3c/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=27)



> 💡 终端在哪里？打开 Launchpad（现改名为App），搜索「终端」或「Terminal」即可找到。



### 2.1 安装 Homebrew（包管理器）

**Homebrew 是什么，为什么要用它**

如果你用过 iPhone，你一定熟悉 App Store——想装什么软件，搜索、点安装，完事。Homebrew 就是 macOS 命令行世界里的 App Store，只不过它管理的是开发者工具和命令行程序，而不是图形界面的 App。

它由 Max Howell 在 2009 年创建，目前是 macOS 上使用最广泛的包管理器，GitHub 上超过 42000 颗 Star，几乎是每一台开发机的标配。它的 Slogan 是"macOS 缺失的包管理器"——这句话说得很准确，因为 macOS 原生并不提供一个统一的方式来安装和管理命令行工具，而 Homebrew 填补了这个空白。

**它具体解决什么问题**

在没有 Homebrew 的年代，安装一个命令行工具意味着：去官网找下载页、辨别自己的系统版本和架构、下载压缩包、解压、手动把文件移到正确的系统目录、配置环境变量……每一步都有出错的可能，出了问题也不知道从哪查起。

有了 Homebrew，安装 Git 就是一行命令：

`brew install git`



更新到最新版本：

`brew upgrade git`



不想要了，干净卸载，不留残余文件：

`brew uninstall git`



Homebrew 会自动处理依赖关系——某个工具依赖另外三个库，它会自动一并安装，你不需要知道这件事的存在。

**它把文件装在哪里**

这是 Homebrew 设计上的一个亮点。它不会把文件散落到 macOS 的系统目录里，而是统一安装在 `/opt/homebrew/`（Apple Silicon 机器）或 `/usr/local/`（Intel 机器）下面，与系统自带的工具完全隔离。这意味着：Homebrew 装的东西绝对不会影响系统稳定性，卸载 Homebrew 也能做到完全干净，不留任何痕迹。

**一个值得记住的命令**

`brew doctor`

这是 Homebrew 的自检命令。任何时候你觉得环境出了问题、工具行为不正常，先跑一下这个命令，它会告诉你哪里有问题、怎么修。看到 `Your system is ready to brew.`就说明一切正常。养成定期跑一下的习惯，能省去很多排查时间。

> 💡 **一句话记住 Homebrew 的价值：**它让"安装开发工具"这件事从一个需要查教程、容易出错的手工活，变成了一行命令的事。后续我们安装 Git、Python、Node.js，全部通过它完成，你会很快感受到这种便利。



**2.1.1 在终端输入以下命令即可安装brew**

**`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`**



在 macOS 上（尤其是使用了 M1/M2/M3 等 Apple Silicon 芯片的 Mac），Homebrew 安装完成后需要一小步手动设置。



以下是验证和配置的完整步骤：

### **2.1.2 检查是否需要配置环境变量 (PATH)**

在 Homebrew 安装脚本跑完的最后，终端通常会输出一段名为 **==> Next steps:**的提示。如果你使用的是近几年的 Mac（M 系列芯片），Homebrew 会被安装在 `/opt/homebrew`目录下，你需要告诉你的终端去哪里找它。

请在终端中依次输入以下两条命令并回车（直接复制粘贴即可）：

**（1）将 Homebrew 写入终端配置文件：**

`echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile`



（2） 让配置立即生效：

`eval "$(/opt/homebrew/bin/brew shellenv)"`



### **2.1.3 验证安装是否成功**

配置好环境变量后，你可以通过以下两个命令来“验明正身”：

**（1）查看版本号**

在终端输入：

**`brew -v`**

***\*成功表现\**：终端会返回类似 `Homebrew 4.x.x`的字样。如果看到了版本号，说明系统已经成功认出了 Homebrew！**



**（2）运行“全身体检”**

Homebrew 自带了一个非常贴心的自检工具，专门用来检查环境配置是否有冲突或遗漏。在终端输入：

**`brew doctor`**

**成功表现**：如果终端返回 `Your system is ready to brew.`，那就说明一切完美，你可以放心大胆地安装任何软件了。

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKsmzdWPibuSibsPMgCKVjXhEpduvFO0zKLrNSbjS3iaRbdIhWdFp5Y60OficzX4EyqqpkJdODS6ouUVjFrqsTyIybkTaSKLELWQ8enw/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=28)

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKsm7ibav57yANicW5r6mUSh14jXHELx6OicQW3J64rAdX9zbWIymwJXRSAUWmy5ECEjxv81icb3zSGMAicIy2Fgj1iaYg2uG6ibzahTnfk/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=29)





**2.2 安装 Git**

**Git 是什么，为什么要安装它**

如果说 Homebrew 是包管理器，Git 则是另一种东西：**版本控制系统**。但这个词对非开发者来说过于抽象，换一个更直观的说法——Git 是一台时光机，专门用来记录代码的每一次变化，并允许你在任何历史节点之间自由穿梭。

不过对于我们安装 OpenClaw 这个具体目的来说，Git 的"时光机"功能暂时用不上，我们需要它的原因只有一个：**从互联网上下载项目代码**。

**GitHub 和 Git 的关系**

几乎所有的开源软件，包括 OpenClaw，都把代码托管在 GitHub 上。GitHub 是一个代码托管平台，而 Git 是与它交互的工具。你可以把 GitHub 理解成一个巨大的代码仓库网站，而 Git 是你手里的钥匙和搬运车——没有 Git，你就没办法把 GitHub 上的代码"搬"到自己的机器上。

最常用的命令只有一个：

`git clone https://github.com/某个项目的地址.git`

`clone`的意思就是"克隆"——把远程仓库里的全部代码完整复制一份到本地。运行完这条命令，项目的所有文件就出现在你的当前目录里了，可以直接使用。

**为什么不直接下载 ZIP？**

GitHub 确实提供手动下载 ZIP 压缩包的选项，但用 Git clone 有几个明显优势：

第一，**更新方便**。项目发布了新版本，你只需要进入项目目录，运行 `git pull`，它会自动找出哪些文件变了、只下载变动的部分，几秒钟完成更新。ZIP 的话，你得重新下载整个包、解压、覆盖——繁琐且容易出错。

第二，**许多项目的安装脚本依赖 Git**。OpenClaw 的依赖安装流程默认你已经用 git clone 拉取了代码，目录结构和权限都按此预设。用 ZIP 解压的方式有时会导致路径或权限不对，产生莫名其妙的报错。

第三，**跟踪来源**。git clone 下来的代码带有完整的版本信息，你随时可以用 `git log`查看当前运行的是哪个版本、哪天发布的，出了问题也方便定位。



💡 **一句话记住 Git 的作用：**它是你从 GitHub 取代码的工具。对于现在的我们，记住 `git clone`这一个命令就够用了，其他功能以后慢慢探索。



**2.2.1 想要安装Git，在终端输入以下命令即可：**

**`brew install git`**



不过，在M系列芯片的MacOS中，“安装成功”不代表“正确安装”，我们要确保系统优先调用的是 Homebrew 下载的原生版本，而不是系统自带的老版本。

我们可以在终端中输入：

**`which git`**

*正确路径应为*：`/opt/homebrew/bin/git`

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKsnPj7ufjgXjgr3WBdGZN2fAia2sM8vTrlSJ0vldicNZpP7iclUsDa5mChLJ3cJW5YhtdaVa6KZOiaUY6Yaf8uZ0CwrPNdfegfrVZ10/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=30)



```
如果输入which git，输出结果为：/usr/bin/git ，则这说明你的终端目前还在优先使用 macOS 系统自带的“老旧版本” Git，而没有切换到 Homebrew 为你准备的“新鲜版本”。
请按照以下步骤操作，彻底解决路径问题：
```

### （1）确认 Homebrew 版 Git 确实存在

在终端输入：

**`ls /opt/homebrew/bin/git`**

- 如果显示了路径，说明安装没问题，只是系统没看到它。
- 如果显示 `No such file or directory`，请先运行 `brew install git`。



### （2）将 Homebrew 路径置顶

我们要确保你的 shell 配置文件（zsh）正确加载了 Homebrew 环境。即便你之前运行过类似命令，建议再执行一次这组“强力组合拳”：

**首先，写入配置文件：**

**`echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc`**

**然后，强制刷新当前终端配置**：

**`source ~/.zshrc`**



### （3）再次验证

现在再次运行那两个检查命令：

1. **检查路径**：

`which git`

**预期结果**：`/opt/homebrew/bin/git`(这就对了！)

**2. 检查版本**：

`git --version`

**预期结果**：通常版本号会比系统自带的（通常是 2.3x）要新，比如 `git version 2.4x.x`。

### 为什么会出现这种情况？

macOS 系统为了稳定性，在 `/usr/bin`目录下放了一个“替身” Git（实际上是 Xcode 的一部分）。当你在终端输入 `git`时，系统会像翻字典一样从左到右查找环境变量 `$PATH`。如果你没把 Homebrew 的路径放在最左边，系统翻到第一个 Git 就直接用了。

> **小贴士**：后面安装完python3之后，可以顺便检查一下 Python。输入 `which python3`，如果返回的是 `/usr/bin/python3`，说明 Python 也存在同样的问题。按照上面的方法操作后，Python 应该也会自动修正为 `/opt/homebrew/bin/python3`。



**2.3 安装 Python**

**Python 是什么，以及为什么 macOS 自带的 Python 不够用**

**Python 是什么**

Python 是目前世界上最流行的编程语言之一，在人工智能、数据分析、自动化脚本领域几乎是绝对的主流。OpenClaw 的核心就是用 Python 写的——它的主程序、任务调度、API 调用逻辑，全部依赖 Python 来运行。没有 Python，OpenClaw 就是一堆打不开的文本文件。

**macOS 不是已经有 Python 了吗？**

确实有，但这里有一个很多新手会踩的坑，值得专门说清楚。

macOS 系统内置的 Python 版本极其古老，长期停留在 **Python 2.7**，而 Python 2 已经在 2020 年正式宣告停止维护——没有安全补丁、没有新特性、大量现代库不再支持它。用 Python 2 跑 OpenClaw，就像试图用一台 2008 年的手机运行现代 App，根本跑不起来。

从 macOS Monterey 开始，Apple 逐渐把系统内置的 Python 升级到了 **Python 3**，但这个版本依然存在几个根本性的问题：

**第一，版本严重滞后。**Apple 内置的 Python 3 通常落后于官方最新版本一到两年，因为 Apple 会把它和操作系统捆绑在一起发布，更新频率远低于 Python 官方的发布节奏。OpenClaw 和它依赖的许多库需要较新版本的 Python 特性，用系统内置版本很可能在安装依赖时就直接报错。

**第二，不能随意修改。**系统内置的 Python 属于 macOS 操作系统的一部分，苹果对它做了保护。你没有权限往里面安装新的库，也没有权限修改它的配置。而 OpenClaw 需要通过 `pip`安装大量第三方库，这件事在系统 Python 上根本做不到。

**第三，路径混乱。**当你的机器上同时存在系统 Python 和自己安装的 Python，两者可能产生冲突——你明明以为在用新版本，实际上某些命令调用的还是系统那个旧版本。这类问题排查起来非常耗时，而且报错信息往往让人看不出根本原因。

**为什么用 Homebrew 安装的 Python 才是正确答案**

通过 Homebrew 安装的 Python 有几个关键优势：

它安装在 `/opt/homebrew/`下面，与系统 Python 的路径完全隔离，两者互不干扰。你对它有完整的控制权，可以自由安装任何库、修改任何配置。版本是最新的稳定版，通过 `brew upgrade python`随时可以更新。最重要的是，`pip`可以正常工作——这是安装 OpenClaw 所有依赖库的核心工具。

这就是为什么你在终端里看到 `which python3`返回的是 `/opt/homebrew/bin/python3`，而不是 `/usr/bin/python3`——前者是 Homebrew 版本，后者是系统版本，我们要用的是前者。

> 💡 **一句话总结：**macOS 自带的 Python 是苹果留给自己用的，不是留给开发者用的。我们需要一个自己能完全掌控的 Python 环境，Homebrew 安装的版本正是为此而生。



**2.3.1 在终端输入以下命令即可安装python3**

**`brew install python`**



**2.3.2** 验证 Python 3

在终端输入

`which python3`

- **正确路径**：`/opt/homebrew/bin/python3`

  

2.3.3 验证python版本

输入 `python3 --version`，目前主流应该是 `Python 3.12`或更高。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKslhdrOZpt7jlGYc9zBv6gFdiatDetUibpuW7qibdFRpu29gw4b2Uu0f8nxOTJk9D3vo2XXGTaIiakgVYOMXTxOicwchP6bSoNEdnIaI/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=31)



**2.3.4** **验证 Pip (Python 包管理器)**

安装 Python 时会自带 `pip3`，它是你以后下载 AI 依赖库的工具：

`pip3 --version`

**注意**：输出的末尾括号里应该带有 `(python 3.1x)`，确保它指向的是你刚装的那个 Python。

![图片](https://mmbiz.qpic.cn/mmbiz_png/wr5ugPSSKsnOHLjYFakT6xy7J5j61dhmvRicyjpl72kg6iavG8zibPtvicLiablS3MJ5E9DyIyaYibPZqt6VhYlj5VDtar88tqPQ4SAvanD203aVo/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=32)



**2.4 安装 Node.js**

**Node.js 是什么，为什么 OpenClaw 离不开它**

**Node.js 是什么**

要理解 Node.js，得先说一句背景知识：JavaScript 最初是一门只能在浏览器里运行的语言，它的存在意义就是让网页变得可以交互——点按钮有反应、表单能验证、页面能动起来。Chrome、Firefox、Safari 里都内置了一个 JavaScript 引擎，网页里的 JS 代码由浏览器来执行，出不了浏览器这个沙盒。

2009 年，Ryan Dahl 做了一件事：他把 Chrome 的 JavaScript 引擎（V8）从浏览器里抽出来，让它能够直接在操作系统上运行。这个东西就叫 **Node.js**。从此，JavaScript 不再被关在浏览器里，它可以读写文件、访问网络、操作数据库，做任何一门"正经"编程语言能做的事。

用一句话解释：**Node.js 让 JavaScript 从一门"网页语言"变成了一门"通用编程语言"**。

**为什么 OpenClaw 需要 Node.js**

OpenClaw 是一个复杂的系统，它的架构并非全部用 Python 写成。它的前端界面、部分工具调用逻辑、以及与外部服务交互的模块，使用的是 JavaScript/TypeScript 编写，需要 Node.js 来执行。更关键的是，OpenClaw 依赖大量来自 **npm**的第三方包——npm 是 Node.js 的包管理器，类似于 Python 世界里的 pip，是全球最大的开源软件注册表，托管了超过 200 万个软件包。没有 Node.js，npm 就无法运行，OpenClaw 的这部分依赖就装不上，整个系统就跑不起来。

简单说：**Python 负责 OpenClaw 的大脑和调度，Node.js 负责它的工具层和界面层，两者缺一不可。**

**为什么要装 22 版，而不是最新版或者其他版本**

这是一个很值得细说的问题，背后涉及 Node.js 的版本管理机制。

Node.js 的版本分两种：**普通版**和 **LTS 版（Long-Term Support，长期支持版）**。普通版更新快、新特性多，但维护周期短，可能只有几个月；LTS 版则会获得 **30 个月**的官方维护，期间持续提供安全补丁和 Bug 修复，稳定性有保障。Node.js 官方的惯例是用**偶数版本号**作为 LTS 版本，比如 v18、v20、v22，奇数版本（v19、v21）是过渡版，不会进入 LTS 周期。

**Node.js 22 是目前的 LTS 主力版本**，于 2024 年 10 月正式进入 LTS 阶段，官方维护期延续到 2027 年 4 月。选它的理由：

一是**稳定性经过验证**。LTS 版本在正式发布前经历了数月的生产环境测试，已知问题基本被修复，用于长期运行的服务器和工具是最合适的。

二是**OpenClaw 的依赖库对它做了适配**。OpenClaw 及其生态里的主流 npm 包都明确声明支持 Node.js 22，在这个版本上安装依赖不会出现兼容性警告或报错。如果你装的是最新的奇数版（比如 v23），部分库可能尚未适配，安装时会弹出警告，甚至某些功能会出现异常行为。

三是**更新周期可控**。用 LTS 版本意味着你不需要频繁升级——在将近三年的维护期内，`brew upgrade node@22`只会给你推送安全补丁，而不会突然把你的环境升级到一个行为完全不同的大版本，破坏现有配置。

> 💡 **一句话记住选版本的原则：**跑服务用 LTS，尝鲜用最新版。OpenClaw 是要 24 小时稳定运行的服务，选 LTS 的 22 版是最稳妥的选择。



**2.4.1 安装Node.js** 

**在终端输入以下命令：**

**`brew install node@22`**



**2.4.2 验证Node.js是否安装成功**

**在终端输入**

**`node -v`**

**成功表现**：返回类似 `v20.x.x`或 `v22.x.x`的版本号。



2.4.3 如果有问题，可在终端运行如下命令：

（1）**写入配置文件**（让系统知道去哪里找 node）：

**`echo 'export PATH="/opt/homebrew/opt/node@22/bin:$PATH"' >> ~/.zshrc`**



（2）**立即刷新配置**（让修改立刻生效）：

**`source ~/.zshrc`**



2.4.4 再次验证

在终端输入：

`node -v`



再输入：

`which node`

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsmgpScLrPFJCxy3pBMTN4YQnxKVKC0RGrphIfOTzIEYGKNRvPsZYMaxJIZdYfWtbuB0cMLPowXqvFTAbIwIxdlB0yicgricsVsw0/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=33)

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKskB10iaP1NrMUSQ5pWIBDpcicnE8zEttHaLz4ibDYLGutBgR2zbxDH4mN94GriaVDKNmObsTo4qHHgxHANRTI3V2pzaxZvHiaOYIxZs/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=34)

### 进阶验证：跑一个“Hello World”

如果你想百分之百确定 Node 引擎可以正常工作，可以直接在终端运行一行代码：

**`node -e "console.log('Node 环境已就绪！当前架构：' + process.arch)"`**

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wr5ugPSSKsl7Gic5Fy7KwPuu9datG2ibVrNG0SMHU3dVcIaL5nFSmVPtImKbwy6h81rIwPL5s7rtShwSEZsDgibPayma7eLWTvrpib0F2RlIUZk/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=35)



完成 Node.js 的安装和验证后，我们的开发环境就算正式搭建完毕了。回顾一下这一路走过来的步骤：用 UTM 创建了一台独立的 macOS 虚拟机、用 Amphetamine 和 LuLu 分别解决了防睡眠和网络安全的问题、在虚拟机里依次装好了 Homebrew、Git、Python 和 Node.js，并对每一步都做了验证。这些工作看起来繁琐，但它们是后续一切的地基——地基打得扎实，后面才不会反复返工。

如果你跟着做到这里，终端里四条验证命令全部输出了正确结果，恭喜你，最难的部分已经过去了。接下来的工作会直观很多：拉取代码、填写配置、启动服务，基本上是照着填空。

**下一篇**，我们将正式进入 OpenClaw 的安装与配置：通过官方一键脚本把 OpenClaw 拉取到本地、申请并配置 Google Gemini API、创建 Telegram Bot 并完成频道绑定，最终让 OpenClaw 真正跑起来——不是在命令行里闪过几行输出，而是亲眼看到它通过你的 Telegram 频道发出第一条消息。

我们下篇见。