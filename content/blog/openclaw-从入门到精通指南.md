---
title: OpenClaw 从入门到精通指南
date: 2026-03-12T20:55:58.322Z
---

> 我们整理这个文档的本意是帮助那些想试试 OpenClaw 的朋友，当然 OpenClaw 本身更新也非常快速，我们也尽量让本文档保持最新，如发现和最新有出入也欢迎联系我们修改，请轻喷。另外我们的文档大部分都是基于实际体验测试来手动编写的，可放心使用。整理不易，感谢支持🙏



# 关于作者

[本文实时更新-一个头发茂密的 AI 博主，欢迎关注苍何，一起玩 OpenClaw，回复：OpenClaw，加入交流群](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe)



![](<https://p.sda1.dev/31/0c36e4613151053635620dbf85359ba3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-%E6%89%AB%E7%A0%81_%E6%90%9C%E7%B4%A2%E8%81%94%E5%90%88%E4%BC%A0%E6%92%AD%E6%A0%B7%E5%BC%8F-%E6%A0%87%E5%87%86%E8%89%B2%E7%89%88.bmp>)



# **第一部分：OpenClaw 理论知识**



> 理论部分，不想看的可以直接跳过到其他部分哈。

## 1. **第一章：OpenClaw 是什么？**



* **OpenClaw 是**一个开源的个人 AI Agent（智能体）框架，由奥地利开发者 Peter Steinberger 于 2025 年底发布，2026 年 1 月在技术圈爆红。它标志着 AI 从"对话工具"向"自主执行者"的范式转变。它不是一个 App，而是一个&quot;住在电脑里的 AI 管家&quot;。



地址是：https://openclaw.ai/



![](<https://p.sda1.dev/31/06380354c27e5bbc36a4d685e9f23118/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-2.png>)



* **创始人**：OpenClaw 的创始人 **Peter Steinberger** 是奥地利知名连续创业者：

1. 职业经历：曾创立 PSPDFKit 公司，开发出全球领先的 iOS PDF 处理框架，客户包括苹果、Adobe 等科技巨头

2. 退休与回归：2021 年以约 1.19 亿美元出售 PSPDFKit 股份后宣布退休，四年后因"创作欲望"重返技术领域

3. 开发理念：OpenClaw 最初只是他 2025 年底的"周末项目"，初衷是为自己打造一款能自动化处理日常事务的工具，没想到在 GitHub 发布后迅速爆红

Steinberger 的技术背景（深耕底层系统开发）解释了 OpenClaw 为何在架构设计上如此注重本地优先和系统级操作能力。





* **命名变迁史**：三天两次改名的传奇（Clawbot→Moltbot→OpenClaw）

第一阶段：Clawd / Clawdbot（2025年11月-2026年1月26日）

Claw：龙虾的爪子，致敬 Anthropic Claude 加载界面中的卡通龙虾形象

Clawd：与 Claude 谐音，暗示项目基于 Claude 模型构建



爆红数据：发布后 24 小时内 GitHub 斩获 9,000 Star，一周内突破 60,000 Star：

![](<https://p.sda1.dev/31/a3a9961c8bfe57cbae0fc40c17f0a987/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_2026-02-03_145505_470.png>)





第二阶段：Moltbot（2026年1月27日-1月29日）

改名原因：Anthropic 法务团队于 1 月 27 日发出"友好建议函"，指出 Clawd/Clawdbot 与 Claude 商标过于相似，存在侵权风险。



改名风波：更名过程堪称"数字抢劫案"：

1. Steinberger 在凌晨 5 点的 Discord 会议中决定改名

2. twitter 账号 @clawdbot 在10秒内被加密货币抢注机器人占领，立即发布虚假的 $CLAWD 代币钱包地址

3. Steinberger 误操作将个人 GitHub 账号而非组织账号重命名，导致原用户名 @steipete 被机器人抢走

4. 假币市值一度飙至 1600 万美元后暴跌 90%，Steinberger 不得不多次发推辟谣："永不发币"



新名寓意：Moltbot 取自 Molt（蜕皮），象征龙虾蜕壳成长，寓意项目的进化与蜕变

![](<https://p.sda1.dev/31/d65bbc1cd9bb35d73632dbfe0518d66d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-0d35bcf3fbec7d3d7c9a0146d66374d6.png>)



第三阶段：OpenClaw（2026年1月30日至今）

最终定名：团队吸取前两次教训，在改名前完成了：

1. 全球商标检索（确保无冲突）

2. 域名购买与社交账号保护

3. 社区投票确认



命名含义：

Open：强调开源、开放、透明的理念

Claw：保留龙虾爪元素，致敬项目起源，象征"抓取"和处理数字任务的能力





* **为什么它火了？**

OpenClaw 在 2026 年 1 月的爆发并非偶然：

1. 时机精准：正值 AI 从"对话"向"Agent"转型的临界点，市场渴望能真正"干活"的 AI

2. 硬件联动：项目推动了 Mac mini（尤其是 M4 版本）的热销，因为用户需要一台 24 小时开机的低功耗设备作为宿主

3. 名人背书：AI 大神 Andrej Karpathy（前 Tesla AI 负责人、OpenAI 创始成员）发推称赞这是"最接近科幻'起飞'的场景"

4. 社交实验：基于 OpenClaw 构建的 Moltbook（AI Agent 专属社交网络，只有 AI 能发帖，人类只能围观）引发全网热议



## 2. 第二章：核心特性与差异化优势

> **实用方便：**
>
> **我认为这是最重要的一点，也是它为什么会爆火的根本原因。它让普通人第一次真实的看到了未来世界的雏形。虽然现在它还相当不完善，但却是实实在在的能让普通人也看到未来世界的样子。**
>
> 传统 AI：被动响应，数据上云。 采用“一问一答”模式，每一步都需要用户确认。由于文件必须上传至第三方云端，处理复杂任务时既繁琐又存在隐私泄露风险。
>
> OpenClaw：本地指令，自主闭环。 真正做到"一句话搞定一整件事"。任务调度、文件处理、工具执行均在本地完成，原始文件本地驻留不上传。相比传统AI需将完整文件提交至云端处理，OpenClaw仅需向模型传输必要的指令和上下文，显著降低数据暴露范围。配合本地大模型（如Ollama）可实现完全离线运行，满足高隐私场景需求。



> **24×7小时驻留性：**
>
> * 传统AI：按需启动，用完即走。每次使用需打开特定App或网页，对话结束后进入"休眠"状态，无持续监听能力，无法执行定时或触发式任务。
>
> * OpenClaw：常驻后台，随时待命。作为系统守护进程持续运行，通过Gateway架构实时接收来自各平台的指令，可执行定时任务（如"每天早上8点检查邮件"）和事件驱动操作（如"文件夹有新文件时自动处理"）。



> **高扩展性：**
>
> * 传统AI：封闭生态，受限于厂商。仅能使用官方提供的插件或功能，用户无法自定义能力边界，新功能需等待厂商更新。
>
> * OpenClaw：模块化Skill，社区驱动。通过以Markdown为接口定义的Skill包扩展功能，Skill包含描述文件（SKILL.md）及可选的执行脚本、二进制工具等，支持从ClawHub市场一键安装，或自行开发私有Skill。



> **跨平台矩阵：**
>
> * 传统AI：封闭App，割裂体验。必须在特定网页或App内使用（如打开ChatGPT网页），无法融入用户已有的工作流程和通讯工具。
>
> * OpenClaw：与平台无关，无缝嵌入。通过Gateway架构接入用户日常使用的通讯平台（Discord/Telegram/飞书/企业微信等），在不改变用户习惯的情况下提供服务。



## 3. 第三章：系统架构与核心组件

* **“大脑”：模型层：**

你可以自定义你的”大脑“，OpenClaw 并不固定使用某一个 AI。你可以给它接入 Claude、chatGPT或者国产的 DeepSeek等任何支持OpenAI API协议的大模型。



* **“手脚”：执行器：**

这是OpenClaw区别于普通聊天机器人的核心组件。它能直接管理你电脑里的文件系统、终端和浏览器。当"大脑"规划好任务步骤后，执行器就像手一样去实际操作——翻找硬盘、点击网页、运行命令，完成具体动作。



* **“外联部”：接入适配器 ：**

它决定了你通过什么渠道跟你的AI交流。无论你是用Discord这种通讯平台，还是用飞书这种办公软件，OpenClaw都能听懂。它既负责把你的指令传进去，还可以把干完活的结果送出来。



* **“档案室”：持久化记忆：**

它拥有长效记忆。即使重启电脑，它依然会记得你。它还会把你的操作偏好、常用文件路径、甚至之前的对话重点都存在本地的“档案袋”里。



## 4. **第四章：应用场景与潜力分析**

### 4.1、应用场景

并不是所有事情都适合交给OpenClaw去做，任何需要不断做决策，不断进行调整的事情都不适合交给它来完成。反之，我们就可以推出它适合帮我们来做什么，那就**规则明确、可机械执行、步骤标准化的任务。**

比如：文件整理，定时发送消息/邮件，监控文件夹/网页的变化并总结通知，简历/文档的初次筛选。

### 4.2、潜力分析

1. 从“助理”到“数字分身”：随着它对你本地文件和操作习惯的记忆加深，它会越来越像你。未来，它可能在你开会时，自动帮你过滤不重要的邮件，并模仿你的口吻回复那些“收到请回复”的消息。

2. 私有化 AI 生态的基石： 随着大家对数据隐私的重视，OpenClaw 这种“任务调度与数据存储在本地、模型推理可自主选择”的模式，将成为企业和家庭构建私有 AI 的标准方案。

3. Skill 商店的爆发：想象一下，未来你可以在ClawHub社区下载别人分享的"一键报税Skill"、"一键剪辑Skill"，像安装手机App一样简单地扩展你的AI能力。



## 5. 第五章：现存挑战与局限性

* **配置门槛较高：**

根据个人能力不同，第一次配置可能就需要花费数小时，期间还会遇到各种问题。



* **持有成本与 Token 消耗：**

实现 24×7 全天候响应需租用云服务器或保持本地设备常开，这是一笔开销。而OpenClaw 又属于“重 Token 消耗”应用，且与国内大模型的适配度不及国外大模型，但使用国外大模型会产生较高的 API 费用，那这又是一笔开销。



* **权限安全隐患：（千万千万不要在自己的主电脑上部署！！！）**

因为OpenClaw 拥有极高的文件管理与命令执行权限。在“自主闭环”的同时，若指令存在歧义或模型误解（如误删、误操作），可能导致不可逆的数据损失或财产风险。



> OpenClaw 绝非 AI Agent 的终极形态，而是 Agent 的一个很好的过渡形态。目前 OpenClaw 依旧有不少问题，比如耗费大量 token，记忆问题等。
>
> 
>
> 我们不一定是需要 OpenClaw，我们真正需要的是一个能懂我们的 Agent 私人助理，私人化的 AI 伙伴未来一定是很大的趋势。



***

# 第二部分：小白一键部署篇



> OpenClaw 你可以部署在自己的电脑上，也可以部署在各个大厂提供的平台。对小白特别友好，无需配置模型，无需购买服务器，甚至无需复杂的配置，只需要动动手点点就好了。不过置换的是，你需要购买平台对应的会员之类的。



## 1、扣子 OpenClaw



打开：https://www.coze.cn/



注册登录后，按照箭头选择一键部署：



![](<https://p.sda1.dev/31/ae125a9332be2ae6361521e9f17a3612/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-O1W4b7rDtol2WzxiW8Pczqg5nEh.png>)

3 分钟快速部署：

![](<https://p.sda1.dev/31/2905ec563e778b44c7994a62a880679c/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Uk3Ub6l0AorK2HxOgxBcRZXhn1d.png>)



当前「OpenClaw 部署」仅面向个人高阶版、个人旗舰版、企业标准版以及企业旗舰版用户开放限时体验。



![](<https://p.sda1.dev/31/d2c22360a69d821f4dbed8b8a09d204e/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-1.png>)



最低可以购买高阶版，99 一个月，然后就可以体验了。



![](<https://p.sda1.dev/31/d15e9855bcb845370d170ebf91236f6c/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image.png>)



选择模型和版本后，就能一键部署了，部署好了之后：

![](<https://p.sda1.dev/31/c17d5f46c4fd6b90f6868976998aeed4/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-KytjbsZSwoOcDKxoPLEcUm4RnCh.png>)

如果需要配置飞书渠道，可以参考如下配置：



点击配置，去创建：

![](<https://p.sda1.dev/31/b33ba09c332cf93ab794885bf8cd2ea4/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Re0NbvoqAo2urNxPSNVcqWRlnEf.png>)



做个授权，等待个几秒钟，机器人就创建成功了，可以按照这个视频来做配置：



[Coze配置](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-Sb07dWseMoy8RExNFtpcG9FOn9c)



在飞书里面就可以使用扣子的小龙虾了。

![](<https://p.sda1.dev/31/ca1e9d41745a94017bfc177319a7a92b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-URhcbrfgWoJPyHxxumpc1hhInGc.png>)





可以用来做啥呢？可做的还蛮多的，比如可以做数字人。



我只用丢一张照片，然后丢一张任意照片，就能让 OpenClaw 克隆该形象：

![](<https://p.sda1.dev/31/56c9a804241c49923c04227811bfdc48/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Dw6nbwR5XoaEHsx9QdHcDu1Knhd.png>)

然后传任意一个语音文件丢给 OpenClaw，就能克隆这个声音。

![](<https://p.sda1.dev/31/497bc28e918fbf49a01353321147cdf4/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-FRuGbMkddoH0hvxSsOPc53WsnNf.png>)

然后用刚才克隆的形象和声音组合，让 OpenClaw 搜集今天的 AI 新闻，给我们来做个数字人播报：



[扣子openclaw-1.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-OmtAdrpy8oUkAWxHswTcSYURn5c)



橘子一岁的照片配合这个磁性的声音，好魔幻，好魔幻，哈哈哈哈。

不恶搞自己的博主不是好博主，豁出去了，把我的🐶照片克隆一下：

![](<https://p.sda1.dev/31/1d4bf4a7590758c8cf8833a3e12ffc25/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-OytxbUHoDoTVWixFM4yczei4n8g.png>)

我的声音就不克隆了，不够性感，还是继续用这个美女的声音。

> 保命神明，仅用作交流学习，大家请谨慎使用，注意安全。



[扣子openclaw-2.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-XxU5dLrxjorrqDx12rwcTfkknIg)



还是不够刺激？抖音上看到有些梗，有些有趣的爆款视频，也想复刻？

那就配合之前给大家分享的抖音视频下载 Skills，自动下载视频，提取视频中的音频，利用数字人技能自动克隆音色及形象。

比如，我想在抖音上刷到这个懂王的视频。

![](<https://p.sda1.dev/31/968ff857b17de0b6251186912827d3a1/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-AkORbW8seorKI6xlZwQc0IPWnte.png>)

我直接丢给抖音链接给我的扣子 OpenClaw，让他先帮我无水印下载该视频：

![](<https://p.sda1.dev/31/2acb088eed8816f80c681b2a406388a7/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-A0Ikbcc5KoS4ZBxpE9BcJjv1nIc.png>)

然后让小龙虾提取音频：

![](<https://p.sda1.dev/31/2ec0a868e34dc0716a5a94c42fd83a91/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-WOZWbkHNwo55DzxCXThcEbF4nvd.png>)

然后克隆声音：

![](<https://p.sda1.dev/31/0ce1fafe4f8abf91279d62568c227f60/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-KbsbbaD4hoRH01xNRq9ca7ienZe.png>)

但当我想要克隆懂王形象的时候，不让克隆了。

![](<https://p.sda1.dev/31/ef1cf46c5c73f382ff21e61ed2734d46/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-TsPMbiiLhoocm8xCUqCcqHCTn8t.png>)

ok，那就用自己的形象，懂王的声音，来生成一段数字人视频不😂



[扣子openclaw-3.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-Qz2ldl4SuocyRtxR7NwcvdWvnlc)





扣子他们还搞了个 Agent 交流平台，目前已经有 13634 多个 Agent 了。

![](<https://p.sda1.dev/31/b16f800c4ab81e8d142dd6abfd97cf67/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-KcElb0NqQodk6Lxa2vWcIHvknMb.png>)

我们也可以把自己的小龙虾注册上去，然后发帖子和别的小龙虾一起互动玩起来。

注册也很简单，你可以像我一样给这个提示词：

```java
你去这里 https://instreet.coze.site/skill.md 注册一个InStreet 账号，然后发帖推广一下苍何这个 AI 博主，并夸下他
```

![](<https://p.sda1.dev/31/16a440c55d946d38a093a17fb1e92031/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-PYTzbCJtzo91Lmxw61jcOk6FnQc.png>)

我的虾就立马发了贴夸我的帖子，并且有别的虾来评论了：

![](<https://p.sda1.dev/31/25c4dc484c8c55a0c9243210ebba51ef/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-VSYqb9dRNo3DqHxNvLNcJoE1nxb.png>)

大家都可以吧自己的小龙虾注册上去玩玩。

然后是需要安装数字人 Skills，我用的是国内比较出名的飞影数字人，在 clawhub 中搜索下  flyworks-avatar-video：

![](<https://p.sda1.dev/31/2bf09f22a737d613d48869788c153335/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-VhLtbTcmEoZQPKx52EVc1FQanng.png>)

然后下载这个技能压缩包在电脑：

![](<https://p.sda1.dev/31/fa5ade228d90bc832caa3921fb5c2812/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-SS5abZXAPo9jUVxtfbgcWQbunNf.png>)

然后在飞书 bot 中把这个安装包发给扣子小龙虾，让他自己安装下：

![](<https://p.sda1.dev/31/45753bda540628560a0b329dc9c4b11c/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-BmvEbQewQotHAkxLfTTcchAXnHg.png>)

> PS：所有的外部技能安装都可以用这种方法。

需要配置一个 API，你可以打开下面的链接：

```java
https://hifly.cc/p/NJb1xnB5OZhYFbHp
```

注册后，点击个人中心获得 API：

![](<https://p.sda1.dev/31/1af6be7e5a78a45527ab1de4cd91c629/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-T12Rbyzg9oam4KxEBpWcp6ylnmb.png>)

你可以看到上面消耗的额度什么的，你用这链接注册理论上是有 1000 积分可以体验。

不过要想生成视频，就需要买个什么小龙虾套餐，要 249 一个月，填个邀请码「sc8OpCT1Zfs」能多获得 5000 积分，加起来差不多可以生成 88 分钟的视频。如果是体验够玩了我觉得。

![](<https://p.sda1.dev/31/5f22b43f52733245605b2aba0a353d4a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-BhHeb8F5Qob7eDxV2mpcaSg2neg.png>)

然后把你的 key 丢给 openclaw，让他配置下，接下来，你就可以克隆，然后生成数字人玩了。

说到扣子，很多人还停留在过去仅仅能做智能体的时代，现在的扣子让人感觉不一样了。

前端时间推出了技能商店，给创作者能直接通过技能赚钱，我也发了好几个技能上去：

![](<https://p.sda1.dev/31/76ddafa140ceef7c1e9e29b3fa433c8a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-LLAUbkFrAoHvICxCSQdcpboTnOv.png>)

当然，我的技能目前还都是免费的，大家可以在扣子上直接免费使用。

除此，扣子还推出了扣子编程，能用自然语言做应用，给很多不懂代码但是想用 AI 做应用的小白一个很好的入口。

除了做应用，还可以用嘴做工作流，做 Agent，做技能等。

![](<https://p.sda1.dev/31/ce76b8c583471360b67dcbeb1fe953ee/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-K5fMb7u29oHhqDx6o2IclRuUnZb.png>)

其实他这个扣子小龙虾也是通过扣子编程的方式搭建的一个应用：

![](<https://p.sda1.dev/31/1c42950345505ae213b5ea9288b169c4/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Uo4Zb1AwOoeB6RxnrFvcAAVFnIe.png>)

你是可以直接在这里改小龙虾的各种配置，以及安装技能，看使用情况等，都是非常方便的：

![](<https://p.sda1.dev/31/47ee30c0c75480f83ab14c708b434a3f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-KEpbbH7skon1kdxyUz8cAHqFnt6.png>)



我也专门写了一篇公众号文章，感兴趣的也可以去看看。



https://mp.weixin.qq.com/s/WlRQmZuI5DsMOWvos4JD8Q





## 2、Kimi OpenClaw



打开 Kimi 官网：https://www.kimi.com/



点击 Kimi Claw，简称 kimi 版小龙虾。

![](<https://p.sda1.dev/31/590635e568e861ffe6f2abfb265e636f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-I8WQb1oX4oEDk9xFyPncQmqrnXc.png>)



当你用你粗壮的大拇指点击创建时，等待个 1 分多钟就部署好了。



![](<https://p.sda1.dev/31/0f221b2bf725fed6e5e112143599f71f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-OSTubfctPooXd8xlGo5c71q1nOd.png>)



然后就可以在浏览器里面直接召唤出小龙虾。



![](<https://p.sda1.dev/31/1e86055df89a7c5c5ce3404c991fb40a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-YImHbZmhKo8t2gx1awAcBMmMnxd.png>)



在右侧可以手动对自己的龙虾改名和重启，这个相当于在云端给每个人开了个沙箱环境，然后在这个独立的环境中装了个 OpenClaw。



> 不过这个一键部署仅支持 Allegretto 及以上计划，大概 200，我之前买了所以就能直接创建。



这里自动配置的 Kimi K2.5 Thinking 模型会自动关联 Kimi Code 会员权益额度。



在使用记录这里也能看到具体的使用：



![](<https://p.sda1.dev/31/a3457ca0705a5101ab16fb9c14c69f8d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-MuNBbvLnSoXwMmxx9mEcW9ginjf.png>)



如果已经有自己的 OpenClaw，也可以通过安装 Kimi 插件的方式实现在 Kimi 里和 OpenClaw 聊天。



说实话，这个配置插件的方式只是多了一种渠道罢了，我这里就没把自己的龙虾关联过来，而是重新新建了一个。



毕竟新建一个干干净净的环境，想装啥 skill 就装啥，不用担心和自己本地的龙虾配置冲突，用起来反而更省心。



并且在飞书上做了集成，也就是我现在飞书上直接召唤 KimiClaw，整个配置过程，花了 3 分钟不到。



![](<https://p.sda1.dev/31/d22ceb3aa778fbc7573532329d577d7d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-HOYlbFXnOo7PvdxPfPvcgH6zndd.png>)



然后把小龙虾拉进群聊，大家一起吹水。



![](<https://p.sda1.dev/31/c88c7a3efe3563b7c15006f43edc2c34/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Ws36bm84HoqLTbxL8vIcRIqDnRe.png>)



整个过程丝滑到有些怀疑人生，对小白来说简直太友好。



> 飞书如何快速接入，教程我放在文章后面吧，感兴趣的可以移步。



当在飞书里对话时，它会先给你个回复表情，代表已收到，还挺有用的，不然每次等待回复的过程以为挂了导致会重复发送。

![](<https://p.sda1.dev/31/d378cb7169414f9a4a2906d5e96baa12/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-HE7VbNOHeoZiwxxNxjWcXCi0n3c.png>)



ClawHub 是专门为小龙虾提供的 skill 仓库，这里有非常多好用的 skill。

> 地址：https://clawhub.ai/

![](<https://p.sda1.dev/31/14e69d01270ac2054081d31d89f6c5aa/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-WBq3bFq70oQJpIxFzrpcHzQ7nUe.png>)

在 KimiClaw 里，从 ClawHub 获取技能很简单，只需要跟他说需要的需求，就能快速安装好。



比如我的小红书封面图技能，下达指令后，快速安装，然后就可以直接使用这个技能生成小红书精美封面图片了。



![](<https://p.sda1.dev/31/51486dcdc273718a472875203e5c808c/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-UKBvbThgLoDIyKxfjd7cPfrXnAe.png>)



除了这种方式，对于一些没有上到 ClawHub 的技能，也可以直接把 GitHub 项目地址丢给他，也能一键安装。



比较有意思的是，KimiClaw 可以打开浏览器后截图发我想要的信息，比如我想看看苹果最新官网有啥新东西，于是就可以直接问他。



![](<https://p.sda1.dev/31/1c156d836f397d6b6bd3a82b7dea4f3d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-EpIhbapN9o4knhxAxtBcs6ldnnh.png>)



基于此，我还发现一个比较好玩的玩法，就是你不用去装什么 API，你可以通过这种方式来监控你关注账号的最新动态。



![](<https://p.sda1.dev/31/cbefe35de2b8db06d80b3080ec58498e/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-BA87bTk6FoF1VPx33ELc6Z08n2b.png>)



他能够去查看最新的动态通过浏览器访问截图然后分析的方式，想想我们人不也是这样？打开，查看，这是绝对安全的方式，也不需要配置 API：



![](<https://p.sda1.dev/31/a603b823ce5edae328adddcd071a53b8/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-I8Jeb4qKMojhxoxGRCLcqemjnkg.png>)



你可以一个定时任务，比如设置每 2 分钟就去截图一次，看看有没有更新。



![](<https://p.sda1.dev/31/8517d1430d8d5fc2a890b7961df7bb0a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-AJpMb9uMXocxfJx9hTRcB5ibnFd.png>)



拿这个来监控奥特曼，据说这家伙，2 月份从 19 号之后又要搞事，频发产品。



最近看 40W 推特大 V AlexFinn 的分享自己过去几周使用 OpenClaw，我觉得还挺有帮助的，他分享到自己用 OpenClaw 来构建第二大脑系统。



![](<https://p.sda1.dev/31/a2926db3f8f496e673843cbbd294e00b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-GgHFb1Srwo9PCUx6qNqcJPdKnOe.png>)

因为 OpenClaw 能保存记忆，完全可以把你的所有思考，所有想做的事情，都给 OpenClaw，当你真正想要应用的时候，你只需要问 OpenClaw，就能拿到结果。

比如当我在飞书中下达这个指令，它会帮我自动开发好这套系统。

```java
我想构建一个第二大脑系统,可以查看我们所有的笔记、对话和记忆。请用Next.js构建出来，请直接给我应用。
```

![](<https://p.sda1.dev/31/9e3e8fcb2eb377a3d8e35cdea5c09e54/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-K9QTbPfZfos40fxF5YpcrgZvnjh.png>)

接下来，我只需要把我的所思所遇所想通通丢给 KimiClaw：

```java
今天看到一句话，帮我记下： 挣钱，靠手脚，拼的是眼力和体力，勤奋最重要。 赚钱，靠资本，拼的是脑力和心力，认知最重要。
```

![](<https://p.sda1.dev/31/25a505553720d248a4fa0ee5c230ef37/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-ScQhbcvWHoo603xhQ9HcpYPynpf.png>)

由于我的 OpenClaw 是运行在 Kimi 提供的云环境中，所以他给了我一个云服务本地的地址，我打不开，让它自己帮我整个 HTTP 服务器。

![](<https://p.sda1.dev/31/7147ff97196b48f9e50cd9511eea86ce/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-TjAkb2pUgo5qpwxl4DHc3QvUnUf.png>)

但可惜，服务地址并打不开，估摸着是无法操控服务器开启端口，也到是有办法，可以部署到 vercel，或者让它截个图，先一饱眼福吧。

![](<https://p.sda1.dev/31/00ff112a60dbf2b59b69bbb1a5775bc3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-VorUbcmZtoz6plxcxvlc58DGnHd.png>)

打开看看这个由 K 2.5 生成的页面，我是一眼就认出来了，哈哈。

![](<https://p.sda1.dev/31/e25b1c19e1a9b6d1ce94ff10bf61265c/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-ZtbjbJypGooMLVx7tMMcq7PZn2b.jpg>)

稍微观察下就能发现，它把我和它的任务记录也都记录出来了👍。

以后有什么，直接丢给它，做第二大脑太舒服了。

下面介绍下接入飞书机器人步骤，非常简单，直接在 KimiClaw 里面提问说怎么接入飞书，它会一步步教你。

**第一步，创建飞书机器人**

访问飞书开放平台：[https://open.feishu.cn/app，点击创建应用：](https://open.feishu.cn/app%EF%BC%8C%E7%82%B9%E5%87%BB%E5%88%9B%E5%BB%BA%E5%BA%94%E7%94%A8%EF%BC%9A)

![](<https://p.sda1.dev/31/972cc44bc5a7809e24371c895a461984/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-OjMUbaNqRoBLDjxCAvjc6OULnMc.png>)

填写应用名称和描述后就直接创建：

![](<https://p.sda1.dev/31/8ff2292edc60e847f13e05d3969b5f91/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-NqenbMkKuo8qjLxQX0Pccn5SnnX.png>)

点击添加应用能力，添加机器人。

![](<https://p.sda1.dev/31/8774680faeb6552eec4f026203654e6d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-F8AcbHf7noaX24xowtucahdmnHd.png>)

**第二步，配置权限**

需要至少开通以下的权限：

![](<https://p.sda1.dev/31/cfee2798b0cd11bd2e2b51d96e4385f5/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-BQM9bb7RYojz1sxpWEfctScNn8f.png>)

可以在权限管理-开通权限这里选择需要的权限手动开通：

![](<https://p.sda1.dev/31/dd5d426cf9a4f09fdbc7c46fa618eded/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-RPpPbmMvJoBNWHxZSGTcSaKznhg.png>)

也可以直接导入以下权限配置即可：

```java
  {
  "scopes": {
    "tenant": [
      "aily:file:read",
      "aily:file:write",
      "application:application.app_message_stats.overview:readonly",
      "application:application:self_manage",
      "application:bot.menu:write",
      "contact:user.employee_id:readonly",
      "corehr:file:download",
      "event:ip_list",
      "im:chat.access_event.bot_p2p_chat:read",
      "im:chat.members:bot_access",
      "im:message",
      "im:message.group_at_msg:readonly",
      "im:message.p2p_msg:readonly",
      "im:message:readonly",
      "im:message:send_as_bot",
      "im:message.reactions:read",
      "im:resource"
    ],
    "user": ["aily:file:read", "aily:file:write", "im:chat.access_event.bot_p2p_chat:read"]
  }
}
```

![](<https://p.sda1.dev/31/8c9f2dfa31e0ab81b34c43d13f7be943/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-KxQSb5P4ooNzMux2p5pcc46wnIb.png>)

**第三步，找到 App ID 和 App Secret**

在凭证与基础信息中找到 App ID 和 App Secret，这个在飞书配置的时候会需要。

![](<https://p.sda1.dev/31/4a2b8084e434507745b7e139fba09a91/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-HnWVbBLsHo7SIUxIu2GcpzPtnye.png>)

然后把 App ID 和 App Secret 发给 KimiClaw

**第四步，事件与回调**

在 KimiClaw 重启后，在飞书配置页点「事件与回调」，使用 **长连接** 接收事件，点击【保存】。保存后添加事件：im.message.receive\_v1

![](<https://p.sda1.dev/31/04c6b626675656b238c736b246d458b5/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Ck8obfE9Zo4Vvoxgr1WcXZpxnUe.png>)

待重启后，接下来就可以直接在飞书中使用了。

在飞书中的 bot 和 web 里的 bot 是同一个，消息也是通的。



## 3、飞书openclaw



> **2026 年 3 月 31 日 24:00 时（北京时间）**免费部署、每日免费 100 万 Tokens 额度！每日限量 10 万名，



![](<https://p.sda1.dev/31/a7c0bbd236fa236596ed9ef30339a73c/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-3.png>)



主打一分钟极限部署，有手就行。如果部署的早的话，每天都有免费额度，如果找不到额度了，可能已经活动结束了，早不熟早优势。



可以电脑上点击链接：https://miaoda.feishu.cn/



点击创建：



![](<https://p.sda1.dev/31/3fb67b6fbcf85ab5be5f7fa3effb25cb/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-4.png>)



进行一键配置就好了，当然你也可以直接手机打开飞书，搜索「**妙搭**」，然后手机上点几下就配置好了。



![](<https://p.sda1.dev/31/40f6e06ceba93bd19e89596604befbb9/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_2026-03-11_104757_649.jpg>)



不到一分钟，就安装配置好，并且丝滑的链接上了飞书。

![](<https://p.sda1.dev/31/f0941eb48c9a76bbb59305368a374b20/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Y3Nbb3Uv4oGUqNxpAoZcnHcLngb.jpg>)

在飞书秒搭也能看到刚才创建好的 OpenClaw，同时也能删除和管理 OpenClaw。

![](<https://p.sda1.dev/31/66eee085f3be71bd91406c6d3befddae/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-CaEwbDeLvoCsV2xa2VRcxqI1nm3.png>)

比如当你的 OpenClaw 坏了，或者想定制一些什么功能，你就能直接在秒搭上修改了，比如我让我的小龙虾每次完成任务后都来个”已完成，苍何大大🩷”

![](<https://p.sda1.dev/31/ee13ca5a6f70256e5bc288cb90d98fb4/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-OmZ6ba4tcoiYatxjtCCcgxZhnmh.png>)

我打开飞书开放平台，也看到了刚才自动创建的这个飞书机器人，可以说，体验丝滑到极致了。

![](<https://p.sda1.dev/31/191997c9e1d023a8485c8027751331d5/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-FvltbbCw7orPdkx10IPcnqWVnlc.png>)

和别的小龙虾不一样的是，在对话页面多了「快捷指令」和「设置」按钮，当点击快捷指令，会有 2 个功能：

> /new：新建一个会话
> /stop：阻断当前对话

![](<https://p.sda1.dev/31/fddfc6c6133b28f0ede571a73fb46d6b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Td1Obi2CeoBPwqxZnx9cXZcMnrg.png>)

讲真，这 2 功能还挺方便的，经常聊多了会出现上下文污染，有 /new 就可以重新开始一个对话。

出现龙虾瞎搞或者和预期不符时，也可以快速的用 /stop 命令制止他。

当你点击设置的时候，实际上就会崩到飞书秒搭小龙虾的设置界面了。

![](<https://p.sda1.dev/31/ead96e139ef5592d02ea48a7c60492f6/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-A4cRblKbEoXPABxCkk0c8x21n8d.png>)

核心二，就是当小龙虾出问题，你得找得到地方排查问题，修复问题，或者配置，你可以在秒搭上找到你🦞，点击管理：

![](<https://p.sda1.dev/31/28015f06f85e7bc4799bf952500e72db/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-CZa1bt8FMo8JTKxxZ6xcf4PDnFd.png>)

可以自定义你的小龙虾，也可以添加技能什么的：

![](<https://p.sda1.dev/31/252f8fd851ef6a457a86751aa1a7ff56/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-UNHGbKgXGooqRCxYIurcod4On8N.png>)

核心三，就是要能自定义自己想要的 Skills，方法还是很多的，我比较直接暴力的用法是，把技能打包，直接飞书丢给 OpenClaw，然后让他自己安装。

![](<https://p.sda1.dev/31/90660c5c5455b20442e9338ebbf5e866/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-T63Ibr08lolBdcx6XWncOgivnnd.png>)

比如我安装好了我自定义的生图技能，就能让 OpenClaw自由调用了：

![](<https://p.sda1.dev/31/8e15d20c9052c812ad5682d84b598dbe/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-MM5gbWVFMofa6NxCe4ZcVOdTnWd.png>)



可以干啥呢？



比如可以一句话创建飞书多维表格：



[飞书秒搭 openclaw-7.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-LRcMdk5RzoFMJUx9kHWcnkwJnyg)



当然了，生成飞书的待办也是一句话需求，比如我把公司发票和会议纪要丢给他，OpenClaw 直接帮生成待办，并用文档发给我。



[飞书秒搭 openclaw-8.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-URg7dz94BoLBgPxrOE9cDDuAnOd)



然后基于待办生成飞书的日程，AI 时代的办公就是这么朴实无华。



[飞书秒搭 openclaw-9.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-ZSzVdHobSoVTrMxtL1gc7v1MnWI)



如果这还只是小打小闹，那基于这些元能力，配合上自定义加装的技能，可玩性就非常大了。



我安装上了 douyin-downloader 抖音视频下载及解析技能，配合我的视频深度解析 skill：canghe-volcengine-video-understanding。



就能直接将爆款抖音视频链接生成公众号文章，并保存在飞书文档中，配图会截取视频部分图片及生图，真正做到一键操作。



[飞书秒搭 openclaw-4.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-B1tldY5Fco6XOvxg61icEKfknoc)



抖音视频链接直接可以通过技能下载：

![](<https://p.sda1.dev/31/ea4c5d0b915ad31d49c9bb7fcac59f1d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-OSp2by9GDoHH8ex493EcNHpCnCR.png>)

解析视频，截取视频图片，生成公众号文章，放到飞书文档，一波流操作：

![](<https://p.sda1.dev/31/b1ae6b9241beae26592e76d444025061/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-OgUPb4HuMo82fsxYVjDcDlUDnad.png>)

非常的丝滑，给个任务给 OpenClaw，这家伙就什么都帮我干好了。





原文详细地址：https://mp.weixin.qq.com/s/QKO0jbqol9LVbuhH9DQx-g

飞书官方教程：[ 【飞书妙搭】全网最简单的 OpenClaw 真一键部署来了！｜限时免费，含高级玩法](https://larkcommunity.feishu.cn/wiki/LY1swuqTaiEOQ0kHXxzcoegMn4f)



## 4、腾讯OpenClaw——WorkBuddy



官网地址：https://www.codebuddy.cn/work/



这是腾讯 CodeBuddy 团队开发的一款桌面端 Agent，也可以用飞书、企业微信直接连接。



简单来说 WorkBuddy 是 AI 原生桌面 Agent，能自主完成很多的办公类自动化操作。像什么数据分析，做 PPT，文件管理，通通都可以完成。

![](<https://p.sda1.dev/31/f8ab61f5dce8bdba4106d7a0294db6d7/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-IvqUb2kiRo70k2xm9HTcWCAInVd.png>)

不过不同的是，WorkBuddy Claw 可以通过企业微信、飞书、钉钉、QQ等日常 IM 工具中，通过手机直接指挥 WorkBuddy 干活。

![](<https://p.sda1.dev/31/c4bc185458915c74c1a000671b173d8e/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-EzOmbSMdBolx4Exqi6AcoPGAnRg.png>)



打开 WorkBuddy，点击右上角个人按钮，选择「claw 设置」：

![](<https://p.sda1.dev/31/f21e5ec8ceb036c25ae2d6a4dc0fadf7/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Vy5wbSzTNocMUTx8XyOcaKZ0nQe.png>)

选择飞书集成：



![](<https://p.sda1.dev/31/72fef4b687dca85b18ff2f8e7d723912/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-EbFxbd0dcoD17LxQ5VacvcJxnRg.png>)

可以看到需要这 2 个参数，下面就是需要去飞书开放后台搞到这 2 参数。

![](<https://p.sda1.dev/31/51c277909ae605c5bd0b5eef066aec3a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-OHOTbyVOboPOVtxYNCucPBKbnCe.png>)

打开飞书开放后台，选择企业自建应用，创建企业自建应用：

![](<https://p.sda1.dev/31/d9bd14e0b8f805165aee118a56ee8822/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Rb3vbcbaBoDLCcxbOzvcTMzOnIh.png>)

飞书开放后台地址如下：



```java
https://open.feishu.cn/app?lang=zh-CN
```

添加应用能力，选择添加一个机器人：

![](<https://p.sda1.dev/31/07a8b112bf8f5ca58675536b93d58d19/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-QSDwbP8kaoDNYAxcCLNcUWXPn5e.png>)

然后批量导入应用权限：

![](<https://p.sda1.dev/31/6c88576fc9d3f0c3df451a8d4aa38bcd/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-AKKebzZGZoGoQ8xrVsaciU0unFh.png>)

把这个权限全部复制到指定的地方就好。



```java
{
  "scopes": {
    "tenant": [
      "contact:contact.base:readonly",
      "docx:document:readonly",
      "im:chat:read",
      "im:chat:update",
      "im:message.group_at_msg:readonly",
      "im:message.p2p_msg:readonly",
      "im:message.pins:read",
      "im:message.pins:write_only",
      "im:message.reactions:read",
      "im:message.reactions:write_only",
      "im:message:readonly",
      "im:message:recall",
      "im:message:send_as_bot",
      "im:message:send_multi_users",
      "im:message:send_sys_msg",
      "im:message:update",
      "im:resource",
      "application:application:self_manage",
      "cardkit:card:write",
      "cardkit:card:read"
    ],
    "user": [
      "contact:user.employee_id:readonly",
      "offline_access",
      "base:app:copy",
      "base:field:create",
      "base:field:delete",
      "base:field:read",
      "base:field:update",
      "base:record:create",
      "base:record:delete",
      "base:record:retrieve",
      "base:record:update",
      "base:table:create",
      "base:table:delete",
      "base:table:read",
      "base:table:update",
      "base:view:read",
      "base:view:write_only",
      "base:app:create",
      "base:app:update",
      "base:app:read",
      "board:whiteboard:node:create",
      "board:whiteboard:node:read",
      "calendar:calendar:read",
      "calendar:calendar.event:create",
      "calendar:calendar.event:delete",
      "calendar:calendar.event:read",
      "calendar:calendar.event:reply",
      "calendar:calendar.event:update",
      "calendar:calendar.free_busy:read",
      "contact:contact.base:readonly",
      "contact:user.base:readonly",
      "contact:user:search",
      "docs:document.comment:create",
      "docs:document.comment:read",
      "docs:document.comment:update",
      "docs:document.media:download",
      "docs:document:copy",
      "docx:document:create",
      "docx:document:readonly",
      "docx:document:write_only",
      "drive:drive.metadata:readonly",
      "drive:file:download",
      "drive:file:upload",
      "im:chat.members:read",
      "im:chat:read",
      "im:message",
      "im:message.group_msg:get_as_user",
      "im:message.p2p_msg:get_as_user",
      "im:message:readonly",
      "search:docs:read",
      "search:message",
      "space:document:delete",
      "space:document:move",
      "space:document:retrieve",
      "task:comment:read",
      "task:comment:write",
      "task:task:read",
      "task:task:write",
      "task:task:writeonly",
      "task:tasklist:read",
      "task:tasklist:write",
      "wiki:node:copy",
      "wiki:node:create",
      "wiki:node:move",
      "wiki:node:read",
      "wiki:node:retrieve",
      "wiki:space:read",
      "wiki:space:retrieve",
      "wiki:space:write_only"
    ]
  }
}
```



![](<https://p.sda1.dev/31/4d9eb16d15c27d5030f56cf4edd84edb/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-X6ejbYof0o2YpBx7x3jcXtIgnEb.png>)

点击下一步，确认申请开通权限。

![](<https://p.sda1.dev/31/332eacc8d38445626360e2cc60ca31e7/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-EYavbPcXDozfbUx95p1cqznonH9.png>)

下面是获取应用凭证，选择「凭证与基础信息」，复制 App ID 和 App Secret：

![](<https://p.sda1.dev/31/fd31048ec08081c1e15b350b0a152bf3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-OlQkboDdcoxs8ExZza4cBuKBnsd.png>)

并填入到刚才 WorkBuddy 飞书的对应配置处。

![](<https://p.sda1.dev/31/4300406a08a3cfdcee74abe690e3783a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Ok3lbHzDpobar4x9kFMcvs3Ynwf.png>)

点击注册后即可获得一个 Webhook 地址，复制这个地址：

![](<https://p.sda1.dev/31/a1e58c834c1861bd98f7f3c46344156a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-V7lYbqdbfoc0xixL6hCcDXxknVh.png>)

回到飞书开放平台，找到刚才新建的应用，配置「事件与回调」：

![](<https://p.sda1.dev/31/1f91baab5cbb204b63794b86244ca33d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-UL5YbkTr7ow09Vx76fQctba1n0d.png>)

> 这是个关键配置，需要订阅机器人长链接接收事件和卡片回调。这一步的作用是让 openclaw 在飞书内具备收发消息的能力。

选择将事件发送至开发者服务器，黏贴刚才的 Webhook 地址。

![](<https://p.sda1.dev/31/ed175f724bc9f327149bf95926284735/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-K0fDbjiaEog6ZqxS0i1c1O0NnPb.png>)

然后添加接收事件：

![](<https://p.sda1.dev/31/35a982341eb5ce105ca724c99d5d600d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-PIbFbYfQuoMBebxo1Iscnnmwnmb.png>)

搜索「接收消息」，点击立即添加：

![](<https://p.sda1.dev/31/a3a25c8de89325b076d5719909dab701/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-QhtXbNuxPoRghBxc8cgcpETanLg.png>)

接下来，进行回调配置，同样是同样页面，选择「回调配置」，同样将回调发送至开发者服务器，黏贴刚才的 Webhook 地址：

![](<https://p.sda1.dev/31/2b299fe51ba1e6935c8cbf6cd9a0961a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-WLembYCdMoWAGGx52iJchbKmnBc.png>)

需要添加「卡片回传交互」这个回调：

![](<https://p.sda1.dev/31/777c62fcdb19bdd26cf8dfb6c2c7b723/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-DF6Cb6RtwovmDVxWkY9c8v04nVf.png>)

最后就直接发布一下这个应用，先点击创建一下版本：

![](<https://p.sda1.dev/31/3d06050abde387b520efd745fc005421/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-WMbbbb856oGMuEx4A72curyondc.png>)

版本号和描述填下就可以发布了：

![](<https://p.sda1.dev/31/17782a1337839cf855ce244a11b5cffd/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-MvQPb6k1lotSJhxh3skc9HLXnCc.png>)

在飞书中点击打开应用即可和小龙虾开始对话了。

![](<https://p.sda1.dev/31/cadd754188721c3dde283812d61d383b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-HRRJbK8Jfo71kqxlvj0chpo5nth.png>)

在飞书中开始对话，就可以看到能操控 WorkBuddy 了，而且默认的 claw 文件夹就是用户的 /WorkBuddy/Claw 文件夹。

![](<https://p.sda1.dev/31/5d950cf566d842d76f09b99a9a94c052/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-V6q8bXoCTopzGwx1fffcD3jNnRd.png>)



那可以做啥呢？比如，我在手机飞书上，让 WorkBuddy 帮我把所有 png 格式的图片转为 jpg：

> 为了方便演示，我把手机在 mac 上做了个镜像。



[workbuddy-3.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-OJivdcwcJoBp9ZxBKDWcmAjSnoe)



WorkBuddy 能处理复杂任务，比如进行多个 PDF 报销发票自动识别、分类并汇总金额。



[workbuddy-1.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-A0PmdLd4ToqPpWxLqsGcPLudnjg)



其中给的指令是：

```java
请帮我处理叫做“团建设报销”文件夹里的报销发票单，图片是付款明细
请生成一个报销简述，包含以下信息：
- 日期
- 商家名称
- 消费金额
- 消费类别（餐饮/交通/住宿/其他）
- 备注

并按照如下示例排序：2025.12.01  深圳前海数码大厦团建聚餐 消费金额：100 元
最后帮我汇总金额，分别按照支付的明细和发票的明细金额，如有异常，帮我特殊标注
除了最终直接输出给我外，还要以一个excel交付
```

WorkBuddy 会自动帮忙整理好，并计算出金额，最终给一个 Excel 交付结果。

我发现在 WorkBuddy 中有不少的 SKill，可一键安装。

![](<https://p.sda1.dev/31/d5e4768361e82ec899669898f49eae2d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-PnZebdhomosbKDx7bSLcYTdCn3e.png>)

当然，也可以通过手动的方式，把 skill 放入到项目文件夹中的{. codebuddy/skills} 下面。

比如我安装了canghe-image-gen skill，然后基于此，让 WorkBuddy Claw 帮我产出小红书图片和文案。

![](<https://p.sda1.dev/31/785affa45922c4efadf3a5a510de84b3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Rd1mbEJZPorv3nx6eL8caqaWnie.png>)

在手机飞书指挥着 WorkBuddy Claw 帮我开发企业官网，所有的素材来源是在我的电脑文件夹中，包括图片和企业官网素材。

![](<https://p.sda1.dev/31/21b7d61bcbefb572bf6d1b8a34d06262/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-EzhVbRNYBoW0CcxfZ6AciWkwnud.png>)

这个过程我还特意录了个视频，大家可以看看，不得不说，还是太方便了。



[workbuddy-4.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-Uh5JdxeZ7os17gx8jQjcMLv5nPd)



WorkBuddy 就像是个我的数字员工，我的需求通过手机下发给它，就能帮我完成。

WorkBuddy 使用场景还蛮多的，比如可以将外语音视频一键转为中文速记，你只需要说清楚自己的需求就好了。



[workbuddy-2.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-R85adIMm6oWdLOxLvJccbfjdnzg)



WorkBuddy Claw 的安装使用更省心，也不用什么服务器，你的电脑就是你的服务器，你只需要在这里简单下载下。

```java
地址：https://www.codebuddy.cn/work/
```

![](<https://p.sda1.dev/31/fb6d7ece32383ea0828245ea997a420a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-RaNdbQW4OoS6Ijx6seTcBk7RnGf.png>)

然后就可以上手使用，配置飞书也几乎没什么门槛，主打一个方便。

![](<https://p.sda1.dev/31/8aa7c9d0d014ef9440ba5f8fb2bb2d0d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-TMK7bquVUojGqIxJhzDcRNhBnic.png>)

你不需要购买模型了，因为 WorkBuddy 已经内置了全球顶尖的模型。

![](<https://p.sda1.dev/31/08e4944c25aec3faa97b6a238f72db01/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Sopbb0u5roeGcYxUOYKcgRcGnsg.png>)

> 我这里用的是国内版，只有国内模型，国际版现在还没上线。

和 Openclaw 不同的是，安全问题还是有保证的，只会对指定的文件夹做改动。

现在大家完全可以去试试，腾讯大好人，**只要是 CodeBuddy 国内版用户，无论新老，一次性赠送 5,000 Credits，这是注册即有，无门槛**。

```java
领取地址：https://www.codebuddy.cn/profile/usage 
```

领完你就可以用手机遥控 AI 干活了。



教程：https://mp.weixin.qq.com/s/ZqtEClaUAm8463ItxgmIAg



## 5、火山 ArkClaw



地址：https://www.volcengine.com/



![](<https://p.sda1.dev/31/6965b3741ab6632a971a25f7c98f4310/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-6.png>)



点击「立即体验」：



![](<https://p.sda1.dev/31/d57691a185681ffa2b186f0620f1a8d6/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-7.png>)



点击「立即创建」：



![](<https://p.sda1.dev/31/df953418af1667fc66348fc2effb084b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-5.png>)



等待一会会，预计 1-2 分钟



![](<https://p.sda1.dev/31/aee69d6258500a6e80205a00b5e44724/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-11.png>)



文档完善中。。





## 6、智谱**AutoClaw**



**地址：https://autoglm.zhipuai.cn/autoclaw/**



![](<https://p.sda1.dev/31/3071af39f33f7de8002750d473e02280/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-10.png>)



文档完善中。。



## 7、 百度 OpenClaw



完善中



## 7、 腾讯  QClaw



完善中





***

# **第三部分：进阶篇**



> 这一部分是，你可以配置自己的服务器，可以自定义大模型，可以选择你喜欢的 bot 方式，甚至你可以本地部署，适合有一定基础的朋友。



对于不懂代码的小白，不想折腾的，推荐你直接到腾讯云上傻瓜式配置好了，不用敲命令行了，甚至都不需要配置飞书。



几个点点点操作就行了🐶



https://cloud.tencent.com/

![](<https://p.sda1.dev/31/b3898ed4775fdf057389134289382e5a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-d0a071e14239c0042e90ad30cba7be24.png>)





**纯新手小白，最推荐的配置顺序：1.1→2.1→3.2**

## 1. **第一步：环境部署**

### 1.1 云端部署

目前用云服务是性价比最优的方式，买个电脑好几千，一台云服务器先租个一个也也才二三十。



选个 2  核 2 G 就差不多了，像阿里云/腾讯云/火山或者任意 VPS 都可以支持。



我为了图省事，用的腾讯云新出的 Lighthouse，免去安装环境和依赖，直接就有 OpenClaw 模板（也就是说，你不需要再自己去下载OpenClaw了）。



当然你也可以用阿里、火山的，甚至可以用扣子、kimi 等，现在各个大厂都有自己的小龙虾了。



#### 例：腾讯云

腾讯云网址：https://cloud.tencent.com/

点击”立刻体验“

![](<https://p.sda1.dev/31/aa6908e60ea748199a07a0d19ce2142a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-e9966587db1bc9a2a6fc0e82c43940e8.png>)







点击”立刻体验“后你会看到此界面，往下滑

![](<https://p.sda1.dev/31/32ed2b1ef15d5149a151001b7197ec5c/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-9.png>)



选左下角2核2G即可

![](<https://p.sda1.dev/31/b17e6b3029c4787c3a4db1870566985b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-55171f404a11b005a5259fcb92984c28.png>)



确认信息2核2G20M（Linux），地域选硅谷

点击立刻购买即可

![](<https://p.sda1.dev/31/74cbd1e4fdb0d9ff5bc1fbf65968c900/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-de4b91fa87500049185cd0517ec29d93.png>)

> 你可以选择关闭自动续费。



购买完成后，1.先点击你的头像 2.再点开”站内信“查看你购买的服务器的公网IP地址，默认用户名和密码

![](<https://p.sda1.dev/31/73d27351c18e2e5f5b6254c34ecb9285/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-b66c77f5adf89a1ff5c849aeac19a336.png>)



然后用 SSH 客户端连接服务器，我这里用的是 Xterminal。（后面我都将以它为例）

![](<https://p.sda1.dev/31/92e6fe7a9c8be7802325222ac3f8809c/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-2390ecc2ccee5c8ddc472c098eaac63b.png>)



没有 SSH 客户端也可以直接点击页面这里的登录进去。

![](<https://p.sda1.dev/31/d2498765e83044ca93fec636dbafd156/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-20cfdb05f328471a16343e5db8e885cd.png>)



打开Xterminal软件，点击”新建SSH“



![](<https://p.sda1.dev/31/2c8bd0334290df302c5cf7437353c251/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-fc03b6776daf9fdac74104ce46d18b43.png>)



点击”新建SSH“后你会看到：

* 名称：随便取

* 地址：刚刚让你在”站内信“里找的”公网IP地址“

* 端口：默认22，不用管

* 登录用户：也是刚刚让你在”站内信“里找的”默认用户名“

* 登录密码：购买服务器时，你自己设置的

然后点击”创建“即可

![](<https://p.sda1.dev/31/9ff018e51d50e50ba4b1c3ca13893c2f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-e60c12292ed76dc0ee6d8ce9dc373b7c.png>)



这里我用了腾讯云的应用模板就不需要再安装了，OpenClaw已经安装好了，只需要检查一下即可。



**检查OpenClaw是否安装成功：**入如下命令查看 OpenClaw 版本：



来自热心网友@杨若昀

> 腾讯云很多给的是ubuntu用户，要先转到root用户sudo -i@

```bash
openclaw --version
```

如果出现”2026.1.29“类似的一串数字，代表安装成功

![](<https://p.sda1.dev/31/fbacf188b42e54f2df51ba442e55d8e5/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-8.png>)

> 好，至此”第一步：环境部署“完成，进入”第二步：配置模型“吧



#### 例：百度智能云

https://cloud.baidu.com/product/BCC/moltbot.html



注册→绑定个人身份证

![](<https://p.sda1.dev/31/921259166bd63eec57093756a8a2ca28/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-484f134ca6b030840d81309c799dc23f.png>)







创建实例：名称你随机生成或者自己取都行，但密码要记得自己设置。

![](<https://p.sda1.dev/31/3e198e80987b44dabfc86067cdcd2788/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-57abb6d81716dca1bc706a5f2ac81999.png>)







创建完实例之后，点击进入实例详情页面

![](<https://p.sda1.dev/31/6bac9ded1025813113a931e56c95d378/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-b7278d85a79f1e6fb208abffe761ca87.png>)







应用管理→应用配置→一键开通

![](<https://p.sda1.dev/31/ac087176b29751da00afd4536c5f13a3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-f3b9a36f7e7b10fbbad4b18abc883b6d.png>)







一键放行

![](<https://p.sda1.dev/31/1dd85868b6a90862e5b6da12ef9b1ddf/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-360a67b7a61bbf3d6418694f72a0034e.png>)







“已放行”代表上一步成功

模型配置：下拉选择模型，你可以选择你想要的模型，点击  “ 应⽤模型配置”  后，系统会自动创建千帆 APIKey 进行实例内配置。

![](<https://p.sda1.dev/31/c2aa2fd468dd3397d81f803826a78531/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-762b9fb66a7fe45160c7b8d1fcf26558.png>)







执行成功

![](<https://p.sda1.dev/31/4ee6506c3e7cdc56267d6e073e8a9ff5/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-efb00a092770642ea032731024666330.png>)







你可以在这里选择你的接入方式，可以将OpenClaw 接⼊飞书 / 钉钉 / 企业微信 / QQ

接入飞书和QQ的操作分别在3.2和3.3有详细教程

![](<https://p.sda1.dev/31/49b9838d4cfc249749c90fd900b54fcc/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-17.png>)







Skills的配置：LS 默认提供百度搜索、百度百科  Skills  配置，您可以按需选择，并点击  “ 应用 ” 。

若您想要配置其他 Skills，可清空输⼊框内容，自行输入  Skills（Skills 可参考输入框右侧  “ 获取更多  Skills” ，前往 OpenClaw 官网网站获取）

![](<https://p.sda1.dev/31/9bccc9599f66d59ae1129cfa01d53a04/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-16.png>)







若您想要在 OpenClaw  官网网站与 OpenClaw 聊天，您可以点击  “ 获取网站地址 ” ，点击网站地址跳转至OpenClaw 官网网站

![](<https://p.sda1.dev/31/cbd21dd1dd32390794672c0a7cd74c01/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-13.png>)



![](<https://p.sda1.dev/31/6cd5a0c6b00dfca519d1ad563b67ed62/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-6bd871e1448b46b192ff38f51c3bc441.png>)

![](<https://p.sda1.dev/31/fccc20a0ea0aeda804f474100631fae6/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-15.png>)







#### 例：火山方舟

为什么选择火山方舟 Coding Plan？

因为OpenClaw 原本需要 Anthropic Claude 或 OpenAI GPT 的 API，国内开发者将面临网络和成本的双重门槛，但火山方舟 Coding Plan 直接提供了国内多款顶级编程模型（Doubao-Seed-Code、Kimi-K2.5、DeepSeek-V3.2、GLM-4.7）。它还支持 Auto 模式，平台会根据场景自动选择最优模型。



**兼容主流工具：**持 Claude Code、Cursor、Cline、OpenCode、Codex CLI、Kilo Code、Roo Code 等主流 AI 编程工具，通过兼容 Anthropic API 和 OpenAI API 协议实现无缝接入。

**稳定算力保障：**托火山方舟超大资源池，告别排队和卡顿。

**性价比极高：**ite 套餐：适合轻量化使用，每5小时最多约1,200次请求，首月优惠价 8.9元 Pro 套餐：适合高强度开发，每5小时最多约6,000次请求，首月优惠价 45元（原价 200 元）。OpenClaw 是"Token 大户"，Agent 模式下消耗是普通对话的 5-10 倍。火山方舟提供充足的 Token 额度，基本实现"Token 自由"。

**部署简单：**个架构只需一台 2C4G 的云服务器，飞书长连接模式不需要公网回调地址，安装只需一行命令。



> 火山方舟 Coding Plan活动界面：https://www.volcengine.com/activity/codingplan

“立即注册”→实名认证→“立即订阅”

![](<https://p.sda1.dev/31/9de236bbcfba8332f3c256ad48dc1361/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-2be124d4713dc613a6fb4b740d11418e.png>)







Lite 套餐：适合轻量化使用，每5小时最多约1,200次请求，首月优惠价 9.9元。

Pro 套餐：适合高强度开发，每5小时最多约6,000次请求，首月优惠价 49.9元（原价 200 元）。

![](<https://p.sda1.dev/31/af9ec50aa8ea18c71f0cc1cb318728f2/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-14.png>)







OpenClaw+火山方舟 Coding Plan的联合推广页面：https://www.volcengine.com/activity/clawdbot

登录/注册→购买部署

![](<https://p.sda1.dev/31/b9c4a82fabe69fbac1ae20fa9bdb7724/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-3853d4684ccccc58029d067fe5bda1ba.png>)







“地域”：可选上海，广州，北京，雅加达

“套餐规格”：2核2G就可以，想追求更流畅的可以选2核4G

“登录密码”：自己设置，要记得
“自动续费”：看你个人，可选择勾选

![](<https://p.sda1.dev/31/66e8abaaa7e7f06efbf846834cab914b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-69d622b2c79726b83abaab01591e5045.png>)







向下滑
“高级配置”：可以配置模型和选择接入方式

模型支持：豆包，deep seek，千问，kimi......
接入方式可选择：飞书，企业微信，钉钉（3.2有接入飞书教程）

![](<https://p.sda1.dev/31/193c7047f89df4278d1a1f19b22d1881/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-12.png>)

配置好之后就可以购买了







### 1.2 本地部署

**再次强调千万！千万！千万！不要用自己的主电脑部署，权限太高，风险太大。**

你可以选择Mac Mini/闲置主机进行部署

#### Windows电脑

我使用的电脑配置如下：Windows 11 64 位



在Windows上安装OpenClaw有两种方式：一种是直接把OpenClaw安装在Windows系统上，另一种是通过Windows上的Linux子系统进行安装（WSL）。

这里直接给结论，不要用第一种方式直接在Windows系统上安装OpenClaw，而是要选择第二种WSL的方式安装，不然你会遇到很多麻烦。（而且，WSL的安装方式是官方推荐的安装方式）。



好，接下来就是具体的步骤了。
***第一步***
点击键盘上的“win”，在搜索栏中搜索PowerShell

![](<https://p.sda1.dev/31/5297dcdec216b182ab9c947bd6c871f3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-22.png>)

然后点击“以管理员身份运行”

![](<https://p.sda1.dev/31/9856e3ba5edef521f694eb8bc685b5d7/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-e435c25ae6cf78c673c43255d68a4363.png>)

如果PowerShell打不开，也可以用CMD（命令提示符）,同样也是用“以管理员身份运行”

然后输入

```bash
wsl --install
```

这个命令的意思是安装WSL，安装好之后，它会让你重启电脑，那你就重启一下电脑。



***第二步***

重启完之后再次打开PowerShell/CMD的界面，再输入这个命令：

```bash
wsl --install ubuntu-24.04
```

这个命令是安装Ubuntu Linux发行版。



下载完之后，需要你创建一个用户名和密码（自己设置即可）

![](<https://p.sda1.dev/31/483b728c2b2aadb35ad8c5f4a33a9dec/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-c37dc78fe9e9f65b5931c3bb6ea98afa.png>)



设置好之后，能看到这个有颜色的一行，就说明成功进入了Linux的系统界面了。

![](<https://p.sda1.dev/31/8b2efd59daa36f015d97bcabfd7927b6/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-17f0f30a68baa32bd23f94c62431da5d.png>)



接下来我们的所有操作就得在这里进行了，如果不小心退出了，可以再次点开PowerShell/CMD的界面，输入“wsl”，再回车，重新进入Linux的系统界面


***第三步***
接下来在Linux的系统界面输入以下命令（下载OpenClaw）

```bash
curl -fsSL https://openclaw.ai/install.sh | bash
```

这是官方推荐的一键安装脚本，它的好处是可以直接帮你处理环境依赖关系，比如它检测到你没有安装node.js，它会自动帮你安装它。

![](<https://p.sda1.dev/31/b6a708ac1cfdaed84b1389259dac4612/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-20.png>)



需要注意两点：

1.记得在这里输入你刚刚设置的密码

![](<https://p.sda1.dev/31/81bf5405f4b54d4d3b9b14d382cf2f11/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-21.png>)

2.当你发现电脑半天没反应，没有输出的时候，看看是不是有这个单词“Installing”，它的意思是正在安装，期间没有任何输出，是正常情况，请稍等。

![](<https://p.sda1.dev/31/c3b6c1f946ddaf220225672e8ed96517/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-19.png>)



当出现这个欢迎界面的时候，就说明已经安装好了

![](<https://p.sda1.dev/31/112e3ca52eed074927781e2fc4945541/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-18.png>)



```bash
openclaw dashboard
```



会跳出控制台。如果没跳出，可以复制这个网址，用浏览器打开。

![](<https://p.sda1.dev/31/f9a5d304dc387621a9c3e17f8dae49f9/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-e7bd2b71647ae12d8d1224f1d0c2fd8c.png>)



然后依次选择 Setting（设置）＞Config（配置） > Authentication，点击菜单下方的 Raw。

![](<https://p.sda1.dev/31/6cc8b815d6c05a4aa3387ac25bcd7b5d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-1ed70f3ee50f8aa25ba4bb22ea7a2a6a.png>)



复制以下配置信息，替换原"agents": {...},部分，并将baseUrl及 apikey 替换为你自己的。

```bash
{
  "models": {
    "mode": "merge",
    "providers": {
      "bailian": {
        "baseUrl": "https://coding.dashscope.aliyuncs.com/v1",
        "apiKey": "YOUR_API_KEY",
        "api": "openai-completions",
        "models": [
          {
            "id": "MiniMax-M2.5",
            "name": "MiniMax-M2.5",
            "reasoning": false,
            "input": ["text"],
            "cost": {
              "input": 0,
              "output": 0,
              "cacheRead": 0,
              "cacheWrite": 0
            },
            "contextWindow": 196608,
            "maxTokens": 32768
          }
        ]
      }
    }
  },
  "agents": {
    "defaults": {
      "model": {
        "primary": "bailian/MiniMax-M2.5"
      }
    }
  },
  "gateway": {
    "mode": "local"
  }
}
```

配置完成后，单击右上角 **Save** 保存配置，再单击 **Update**。



> 好，至此”第一步：环境部署“完成，进入”第二步：配置模型“吧



## 2. **第二步：配置模型**



> 这里是为了突出流程的完整性，你也可以直接跳转到 3.2 直接操作。



### 2.1 内置 API 模型

OpenClaw 支持非常多的 API 模型，比如 OpenAI、Anthropic、kimi、GLM 都是内置支持的。

![](<https://p.sda1.dev/31/bf87aa354e94717a71ced555d045b5e1/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-fd664355ce4b721e5aeef75be42e8ff7.png>)

当然除了内置的，还支持**自定义 API（详细见2.2）**，这里我们用内置API模型——Kimi 2.5为例



#### 例：Kimi 2.5

![](<https://p.sda1.dev/31/9a77e2b463343bea8ca0424aca009d3b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-dd24e0c0ebb406d316ab8b5ffc00024c.png>)

那如何使用，第一步，搜索 kimi code：https://www.kimi.com/code

![](<https://p.sda1.dev/31/26e341b9f68ea4bb4e1eb4105cdea8f0/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-106080dc09e98a43884369a5e8767f53.png>)

![](<https://p.sda1.dev/31/0845f6daf86e0236e6091efe88ebcc7b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-20260225200043.png>)



第二步，购买优惠套餐 plan，说实话，目前 OpenClaw 消耗 token 还挺大的，最好买个套餐划算一些，我买的是 Allegretto 套餐。

![](<https://p.sda1.dev/31/0c9af5f4d981d34f9feacf17cc2bece0/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-37f30b81112bbfdd28c3af8018ef0fc8.jpg>)







第二步，打开控制台，创建 API key。名字随便取。

![](<https://p.sda1.dev/31/69d7942ba3124e0e98c318fc94173255/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-2c134e4de232ee22faf5f2be75e996c9.png>)



这个APIkey一定！一定！要复制下来，因为一般你点完”完成“之后，你就再也无法查看你的API key了，如果你忘记了你的API key，那就只能重新创建一个了。复制完后，找地方先存起来，后续在”第四步：OpenClaw配置“的时候会用到

![](<https://p.sda1.dev/31/6d1f92f31e377ef9486986ce4dab08ec/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-b99fd9a2bc55061fafda92249058b91e.png>)

> 好，至此”第二步：配置模型“完成，进入”第三步：配置Bot“吧



### 2.2 自定义 API（非内置API模型）

自定义 API，模型选择更多，也更灵活一些。但会多出一些步骤，对小白来说较为困难。如果你是小白还是建议你就用“内置API模型”，跟着教程2.1“例：Kimi2.5”做。



openclaw 部署在服务器中，也可以修改配置文件的方式配置，配置文件位于 \~/.openclaw/openclaw.json，OpenClaw 启动时会自动读取。

1、**打开配置文件**

使用文本编辑器打开配置文件。如果文件不存在，编辑器会自动创建：

```bash
# 方式1：使用 vim 编辑器（适合熟悉 vim 的用户）
# vim ~/.openclaw/openclaw.json
```

```bash
# 方式2：使用 nano 编辑器（更简单，适合新手）
nano ~/.openclaw/openclaw.json
```



添加配置，将 baseurl，apikey 及模型替换为自己的 API：

```java
{
  "meta": {
    "lastTouchedVersion": "2026.2.1",
    "lastTouchedAt": "2026-02-03T08:20:00.000Z"
  },
  "models": {
    "mode": "merge",
    "providers": {
      "bailian": {
        "baseUrl": "https://dashscope.aliyuncs.com/compatible-mode/v1",
        "apiKey": "DASHSCOPE_API_KEY",
        "api": "openai-completions",
        "models": [
          {
            "id": "qwen3-max-2026-01-23",
            "name": "qwen3-max-2026-01-23",
            "reasoning": false,
            "input": ["text"],
            "contextWindow": 262144,
            "maxTokens": 65536
          },
          {
            "id": "qwen3-coder-plus",
            "name": "qwen3-coder-plus",
            "reasoning": false,
            "input": ["text"],
            "contextWindow": 131072,
            "maxTokens": 32768
          }
        ]
      }
    }
  },
  "agents": {
    "defaults": {
      "model": {
        "primary": "bailian/qwen3-max-2026-01-23"
      }
    }
  },
  "gateway": {
    "mode": "local",
    "auth": {
      "mode": "token",
      "token": "test123"
    }
  }
}
```



保存退出即可。







#### **附：阿里云百炼**



**第一步：开通 Coding Plan**



打开阿里云百炼平台，找到 Coding Plan 订阅入口。



![](<https://p.sda1.dev/31/aaa7b7486e0945dcc324f1817a85e8f6/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-20260225200043-1.png>)



选择你需要的套餐：



![](<https://p.sda1.dev/31/1672f6117af0c7b071109b45451d6990/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-20260225200228.png>)



**第二步：获取 API Key**



开通后，在百炼控制台获取你的 API Key。



![](<https://p.sda1.dev/31/b4b7b2ea100447d339b2114fe5c8338b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-20260225200522.png>)







#### 附：jiekou API



API 的话你可以试试 [http://JieKou.AI](https://t.co/NwZxkyFy3m)，在稳定性上优势比较明显，现在也第一时间接入了Claude Opus 4.6，可以用支付宝支付，充多少用多少，也不需要魔法，还是比较方便的。
接入的模型也非常齐全，最新的claude-opus-4.6，gpt-5.2-codex都有，除了按量，也可以购买订阅包，算下来价格是官方API 的75折。
现在填写邀请码 & 注册 & 绑定 Github就能免费获得 $3的使用，获取链接如下：

https://jiekou.ai/referral?invited_code=SK640I



![](<https://p.sda1.dev/31/7bbe300a017d1e2f66cf97f06e361e34/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-6719f4f37e93492773bdf3913bf47c51.jpg>)

![](<https://p.sda1.dev/31/70006c11c58837a7bc900f605890c45b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-781100b1fe724fa2ec5652f5726a1547.jpg>)





#### 附：Atlas Cloud

如果你希望稳定，性价比高的 API 平台，可以试试之前给大家推荐过的 Atlas Cloud。

地址：https://www.atlascloud.ai?ref=AXZ9S7

毕竟它主打的是企业级 API 聚合，拥有 300+ 知名大模型， Qwen、DeepSeek、Kimi、MiniMax等知名大模型一网打尽。总结下来是：**稳定、易用、低价。**

![](<https://p.sda1.dev/31/84f5f9e6230785cb97aad10d54e07a82/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-7185a4af4e40fa2da438b194bafd367b.png>)







那该如何使用呢？注册登录后，打开控制台，新建 API 密钥。

![](<https://p.sda1.dev/31/65550315e5a8af4517c08093714d28e7/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-9f8ef7f821ab1a5282243388733637c8.png>)







填写名称后，点击创建：API 密钥的名称：随便取。

![](<https://p.sda1.dev/31/3c4a4aa49a7529f6bbd49c1b9aa3ea8d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-80ca322543a57733ace87b4bb862b3d5.png>)







复制这个API密钥，然后找地方先存起来，后续在”第四步：OpenClaw配置“的时候会用到。

![](<https://p.sda1.dev/31/ea6c28fa019fc83715ce537a092668e3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-56bbd4c116886aebd5d6f6adf383dbb1.png>)



#### 例：DeepSeek开放平台

如果你不想用或用不了Atlas Cloud的话，我将以DeepSeek为例，给你演示怎么做。



DeepSeek开放平台：https://platform.deepseek.com/api_keys



DeepSeek 的 API 调用是**按量付费**的，你的账户余额必须大于 0 才能正常调用接口。

如果账户没钱或余额不足，API 请求会直接失败，所以提前充值是保证服务可用的必要操作。



其他大模型也是同理，你要去找到对应网址去充值，然后获取API keys

![](<https://p.sda1.dev/31/f2fa619a44bad4f6a87835ccb5debf1f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-440b6579ec0e97f162932e383ee8a177.png>)







如果你只想先试试，可以就先花个10块钱玩一下

![](<https://p.sda1.dev/31/37376f6705c7fdf7a3cdf4684256c7b2/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-23.png>)







保证账号有余额之后，点击”API keys“，然后点”创建 API key“

![](<https://p.sda1.dev/31/f42ad081ce225f9f540142b27697146f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-c55cd786e98f0577e517e70ad52bf641.png>)







API key的名称：随便取。然后这个APIkey一定！一定！要复制下来，因为一般你点完”关闭“之后，你就再也无法查看你的API key了，如果你我忘记了你的API key，那只能重新创建一个了。

复制完后，找地方先存起来，后续在”第四步：OpenClaw配置“的时候会用到

![](<https://p.sda1.dev/31/0794c0d33f1506f5c3c00ff51c6e66a5/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-142cfb3780bee5729b42d1663005602e.png>)

> 好，至此”第二步：配置模型“完成，进入”第三步：配置Bot“吧





## 3. 第三步：配置Bot+OpenClaw的配置

### 3.1 什么是配置Bot？如何选择？

配置Bot这一步实际上是选择你的接入方式，那“接入方式”又是什么呢？
就是你想用哪个"聊天软件"或"界面"来跟这个 AI 机器人（OpenClaw）对话。

国内：QQ，企业微信，飞书，钉钉等

国外：Discord，Telegram等



> 国内目前最丝滑的就是飞书的机器人，大家可以重点配置关注。



自定义API模型OpenClaw配置前置动作：

如果你在”第二步：配置模型“中选择了”自定义API“，那么你需要自行按照如下配置修改。（绿色是你需要修改的地方，看不懂的，不知道每个空该填什么的可以去问AI）（如果是Kimi2.5或其他内置API模型的可跳过此步骤）

```plaintext
{
    "models": {
        "providers": {
            "xxx": {
                "baseUrl": "https://api.atlascloud.ai这里填你自己 API  base的地址",
                "apiKey": "在这里粘贴你的API Key",
                "api": "anthropic-messages",
                "models": [
                    {
                        "id": "claude-opus-4-5-20251101",
                        "name": "Claude Opus 4.5",
                        "reasoning": true,
                        "input": [
                            "text"
                        ],
                        "contextWindow": 200000,
                        "maxTokens": 4096
                    }
                ]
            }
        }
    },
    "channels": {
        "telegram": {
            "enabled": true,
            "botToken": "在这里粘贴你的Bot Token",
            "profiles": [
                "default"
            ]
        }
    },
    "agents": {
        "defaults": {
            "model": {
                "primary": "xxxx/claude-opus-4-5-20251101"
            }
        }
    }
}
```

### 3.2 例：飞书+Kimi2.5

#### 配置Bot（飞书）

创建飞书机器人。访问飞书开放平台：https://open.feishu.cn/app，点击创建应用：

![](<https://p.sda1.dev/31/dbcc99ee2ad5a52663c7ddefc1db01ef/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-337ba5b98ac3009aa5f3ea2706ab5fc4.png>)







填写应用名称和描述后就直接创建：

![](<https://p.sda1.dev/31/ab877843e050ce031418ef1e5260fc08/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-25.png>)



创建完成后：在“凭证与基础信息”中找到 App ID 和 App Secret，把它俩复制下来。

![](<https://p.sda1.dev/31/e897b16ba2439969702cb65ee4df00be/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-VIrLbhtgRoHwmUxQRq5ctwIxnPg.png>)







然后，登录你的腾讯云：https://console.cloud.tencent.com/lighthouse

![](<https://p.sda1.dev/31/357522e2d27b2d9f7b1992d783b9faa0/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-36b6c3d5c68a839b8393239507005cc7.png>)







进入后，点击“应用管理”

![](<https://p.sda1.dev/31/6ff247f5d14f13be985b5de8eb2861b0/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-b59fa682e98543be64cbe02c2f31e27c.png>)







操作如图所示：

![](<https://p.sda1.dev/31/2824663fb72df781c12084bbbe0396b7/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-3b0579da1188660f6c4f3ad773686777.png>)

![](<https://p.sda1.dev/31/a8b51ebd3d258c9ed5edf11ded051026/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-a120684b6b2e6d034520936c895ce729.png>)







配置权限。需要至少开通以下的权限：

![](<https://p.sda1.dev/31/fc7c789d55370208c1976ca388175f42/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-189315102c4a2a17321699041356a6a2.png>)







可以在权限管理-开通权限这里选择需要的权限手动开通：

![](<https://p.sda1.dev/31/676a40313abc79d6ab0e9e446e7f9939/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-35c43466a57b1a1b1c91c03e34c3d429.png>)







也可以直接导入以下权限配置：

![](<https://p.sda1.dev/31/55ad5e31691267e00bcc6cd01b1b07a2/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-c06cff8d1fa242229f52240809363d38.png>)

```json
{
  "scopes": {
    "tenant": [
      "contact:user.base:readonly",
      "im:message",
      "im:message:send_as_bot",
      "im:resource"
    ],
    "user": [
      "im:message",
      "contact:user.base:readonly"
    ]
  }
}
```

![](<https://p.sda1.dev/31/01eab5f9944384bc314508328f5f6119/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-c854b95837334f37e3f41e388251db02.png>)

成功后就会显示这6个权限

![](<https://p.sda1.dev/31/a334e90417b9e54c0347d1c6ae16796d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-24.png>)







操作如图所示，需要添加应用能力，为应用添加机器人的能力：

![](<https://p.sda1.dev/31/1068a2e99238a380c7bfff3e7fdc4f29/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-DbO0bRwhUoFCObx5LCdceqHNnbf.png>)







 

操作如图所示：

![](<https://p.sda1.dev/31/dda4d4d24f7e9e060e379f39240943ee/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-bfa4a134936ff3feb60fb86a28725b87.png>)

![](<https://p.sda1.dev/31/33cb328d7c655fbef2588caeecf4423d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Pa3TbcMlWo7TMYxX92Mcnv7knmh.png>)







然后添加一下下面几个事件：

![](<https://p.sda1.dev/31/a35585a3b31694a904bf3fd4dd33c524/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-U3B2bgrYDoKWEHxlkpJcoPiCnAe.png>)

![](<https://p.sda1.dev/31/d12c1b8b1eeceaba86771f5d8d557293/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-aa13cee54a05cb026308207b339a1103.png>)

![](<https://p.sda1.dev/31/32cfad68713cf5855115ddb75e65c97d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-31a83191d7e202d2bec969b75dcecd92.png>)







然后创建版本，这两种方式都能进入。

![](<https://p.sda1.dev/31/21453871af060cdf0bbc84b6ea25f91e/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-PUiebtAm8olofCxo8aic8a5dnYf.png>)

![](<https://p.sda1.dev/31/5cc7e9f22000d57e6f7f5c83b2fa5156/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-df597d524a99e7b1b0dfb80794d72de8.png>)







保存然后发布应用。

![](<https://p.sda1.dev/31/cfbe2c15a7543e530f75efefed0daea3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-d219137289ae7b21f0fbb4fd2b070792.png>)

![](<https://p.sda1.dev/31/93fd07c1b3ae42e395a9e0e5d7bcb0ae/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-bde9a0a5211266f46ce253365778bdf0.png>)





