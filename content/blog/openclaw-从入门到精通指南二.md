---
title: OpenClaw 从入门到精通指南(二)
date: 2026-03-12T20:58:29.684Z
---

#### OpenClaw的配置

在服务器中输入如下命令：

```bash
openclaw onboard
```

选择 Yes 接受风险：

![](<https://p.sda1.dev/31/103ddfbc45137ee2f344cf3a3328ff1a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-9a951cf275cab8e1338d89e248a7a790.png>)







然后选择：QuickStart（快速开始）

![](<https://p.sda1.dev/31/a4a271349e5770e326fe99b0296cbc9b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-E7EEbDqTYorhU8xFT1mc1Z4hnIb.png>)





接下来是选择模型，我这里选择：Moonshot AI

![](<https://p.sda1.dev/31/cde9422db26813b14d6e8461d0f47941/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-LfzlbgNiGoTJQYx4KQUc4gvwnmb.png>)







选择Kimi Code API key，黏贴刚才的 key 过来：

![](<https://p.sda1.dev/31/c226a588087b884a0d609351f455bc0f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-OdHtbecNPogDkUxSUKXcL4Orngd.png>)







选择默认模型为：kimi-code/kimi-for-codi（OpenClaw 的内置列表是动态更新的，可能当你看到这篇教程时，已经找不到对应的精确名称了，如果出现这种情况请去问AI）

![](<https://p.sda1.dev/31/814fa98ce98a2e86b43728318574387a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Hnq1bnyN1oe3oExsW8mctz83nid.png>)







继上面一步，然后选择配置飞书：

![](<https://p.sda1.dev/31/f3c872ff5232811d9725abfafca041c6/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-27.png>)







几个步骤已经说的非常清楚了：

![](<https://p.sda1.dev/31/9fc04f07828b018ea2770a99769de1e3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-E6hnbUoM3oAv4ZxDI8McsKhKnTf.png>)







如图进行选择：

![](<https://p.sda1.dev/31/951a26d42c271d60560eac0ec388e35d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-26.png>)







选择使用 skills：Yes

![](<https://p.sda1.dev/31/ab92d2528bcce912b5a7b53ac1cec1f3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-VtIwbJMZqomZs7xxJKzcByT2nCe.png>)







按图进行选择即可。这里可以自定义安装很多依赖，可以先不装。

![](<https://p.sda1.dev/31/e5dd3835ac0f8241d66540e6d6f2eb8e/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-28.png>)







hooks 这里选择：session-memory

![](<https://p.sda1.dev/31/70b739b66af37005403b18ce265b322e/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-T7JXbE1t6ohCNwxIEUlcyACsnMh.png>)







重启 gateway 服务：

![](<https://p.sda1.dev/31/c8391a73958f3ab8fc19278a82a4aaf6/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-NKDwbuJMNoq48FxOwaxcIyNPnGh.png>)







选择打开 TUI，就会在服务器上打开界面，到此为止，所有配置选项都已经安装完毕了。

![](<https://p.sda1.dev/31/542a36a10d48b2a8ed7bd99e8d13b577/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-S8kqb9Ouxomsrrx2QFBcKVVknVh.png>)







然后就可以在对话框中进行提问交互啦，问下他现在是什么模型，右下角也会显示 token 的用量。

![](<https://p.sda1.dev/31/5f5df7135dcc8c9e45d1942bdf4eea07/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-N8Febmd1HorOXHx65jncT8fUnDc.png>)







这个时候打开飞书也能直接对话了：

![](<https://p.sda1.dev/31/6e3614d8cca016065e3f8b0f652305a7/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-T65SbXx4goDjorxZcmCcVa3An9b.jpg>)

> 好，至此你已经完全安装配置好OpenClaw了，快去使用吧！



### 3.3 例：QQ+Kimi2.5

#### 配置Bot（QQ）

登录你的腾讯云：https://console.cloud.tencent.com/lighthouse

![](<https://p.sda1.dev/31/6285702b8504ad85e3966932f1bbccf8/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-36b6c3d5c68a839b8393239507005cc7-1.png>)







进入后，点击“应用管理”

顺手点一下右上角的“复制”，把IP地址复制下来，存一下，等下要用

![](<https://p.sda1.dev/31/4e26161b1e3d61fcc1ff75331daa28fe/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-b59fa682e98543be64cbe02c2f31e27c-1.png>)







操作如图所示：

![](<https://p.sda1.dev/31/f0ae9410281bf1ac5876a05ca7b1a767/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-3b0579da1188660f6c4f3ad773686777-1.png>)

三个空填完之后，先别关，再打开一个新的网页。







前往QQ开放平台：https://q.qq.com/#/ 一定要先注册！先注册！然后再登录（因为它不是QQ登录，所以一定要先注册！！！）



按步骤注册完之后，登录

![](<https://p.sda1.dev/31/6cc7970db05a5f0f5ef78fd6e35cc4b8/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-63387de44ce13f57f9408a6a4be3ff1d.png>)





登陆成功后，点击“机器人”，然后“创建机器人”

![](<https://p.sda1.dev/31/626c077cc2754e3719f68766fb99623e/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-87b5ad26bb02ecec5289d3d3ebd7e403.png>)







自己创建吧，按自己喜好填写

![](<https://p.sda1.dev/31/b47ed10984c263cfe54bc873c5fabc73/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-598905a5a4b9e39d8dbd55818c2944d9.png>)





成功之后，就能看到它了。然后点击它，进入机器人详情。

![](<https://p.sda1.dev/31/be5e876c91faed53d2d881a342ef68b2/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-bd00a7c806928c0013600fcd016e85e0.png>)







之后操作如图所示：

![](<https://p.sda1.dev/31/a071a2350be7176cfb223b5958feaaeb/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-e3ed2b23f24e54ae8f4aa17b66bad61e.png>)





把自己添加进去

![](<https://p.sda1.dev/31/fd2e45a68521d1191c197bff3ef7a77f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-aacc92bc1860f805fbed2571a5563551.png>)





用你的QQ扫码加机器人好友吧

![](<https://p.sda1.dev/31/fe3091fbe98367ed28d3a154e34fdc32/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-8ad520b6a8827e851c7c2b6f9871e755.png>)

加上好友后，此时你们还无法对话，因为它目前只是一具空壳，给它配置上了OpenClaw之后，你就可以跟它愉快的对话啦





之后操作如图所示：

IP白名单里填写刚刚让你复制下来的云服务器的IP地址

![](<https://p.sda1.dev/31/e356e4f1a2ec7c51838c50f2a6d7370e/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-02dc7a623bddc119098acdd9a2d9c519.png>)







接着，再“管理”→“开发管理”

复制下来机器人的ID和密钥（注：机器人的密钥生成之后一定要存下来，因为你一旦关闭后，你的机器人密钥，就再也看不到了，如果忘记了，那下次就只能重置了。）

![](<https://p.sda1.dev/31/47a7b6bf38a6080c4ffc535bfd9160c3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-b62ff353ddde6ffd1297789443ca8171.png>)







好，接下来返回刚刚没关闭的腾讯云服务器，完成填写。

![](<https://p.sda1.dev/31/0595127743aff54e7468b6af0c1d44d0/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-0a03fefc22300045bcc11bb3b2ef8c70.png>)







#### OpenClaw的配置

接下来去服务器中输入如下命令：

```bash
openclaw onboard
```

选择 Yes 接受风险：

![](<https://p.sda1.dev/31/91f362b8ed7ef60d4d8f76a2c15411e3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-9a951cf275cab8e1338d89e248a7a790-1.png>)







然后选择：QuickStart（快速开始）

![](<https://p.sda1.dev/31/13e9e7a6d5d7f984bdb10a26e51cf9c2/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-E7EEbDqTYorhU8xFT1mc1Z4hnIb-1.png>)







接下来是选择模型，我这里选择：Moonshot AI

![](<https://p.sda1.dev/31/f51dd048f7bcfddc1548544e45e0a961/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-LfzlbgNiGoTJQYx4KQUc4gvwnmb-1.png>)







选择Kimi Code API key，黏贴Kimi的 key 过来：

![](<https://p.sda1.dev/31/683b061002ef7ecf585eebd15617e381/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-OdHtbecNPogDkUxSUKXcL4Orngd-1.png>)







选择默认模型为：kimi-code/kimi-for-codi（因为OpenClaw 的内置列表是动态更新的，可能当你看到这篇教程时，已经找不到对应的精确名称了，如果出现这种情况请去问AI你该怎么选择）

![](<https://p.sda1.dev/31/46a8fc762299b0d75d4f00901913b7e4/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Hnq1bnyN1oe3oExsW8mctz83nid-1.png>)







选择通道（接入方式）：QQ

![](<https://p.sda1.dev/31/55de8a9278ecebae10d70cbf0ec73749/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-30.png>)





填写你QQ机器人的ID和密钥

![](<https://p.sda1.dev/31/fa4b86b9528d3c300ded2e97999ef066/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-88ef7969af4831eddae173832bb7dba6.png>)







接着，按照图片选择即可：

![](<https://p.sda1.dev/31/28167cd31b7d4d949e837ed0b4f80118/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-VtIwbJMZqomZs7xxJKzcByT2nCe-1.png>)







这里可以自定义安装很多依赖，可以先不装。

![](<https://p.sda1.dev/31/1abc44f06786c8add10cebc6d24fa827/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-29.png>)







hooks 这里选择：session-memory

![](<https://p.sda1.dev/31/821c1cec28cda2b540eb2bba030ddb17/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-T7JXbE1t6ohCNwxIEUlcyACsnMh-1.png>)







重启 gateway 服务：

![](<https://p.sda1.dev/31/17e40c7728093c8a04178e687b9e8260/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-33.png>)







选择打开 TUI，就会在服务器上打开界面，到此为止，所有配置选项都已经安装完毕了。

![](<https://p.sda1.dev/31/8f5ee8b9f9d06025893536c7d5b6bc29/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-32.png>)







然后就可以在对话框中进行提问交互啦，右下角会显示它的模型和 token 用量。

![](<https://p.sda1.dev/31/f4412b1e2c9b03fa7e335a4ae871b92b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-31.png>)

也可以不聊，直接按“Ctrl + C”退出，直接去QQ找它聊天：

![](<https://p.sda1.dev/31/4efb13733759739a9d113a37b492955e/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-612c7f18eb0fe6161091d5b1ab175dbc.png>)

> 好，至此你已经完全安装配置好OpenClaw了，快去使用吧！

### 3.4 例：Discord

注：这部分内容“Discord”写自2026.1.28，比较“过时”了，当时还叫“Clawbot/Moltbot”（现在已经统一叫OpenClaw了），还把它放过来是为了给想用“Discord”的人一个参考。

在后半部分“Clawdbot（OpenClaw）的配置”中，在现版本中应该“clawdbot”都改成“openclaw”



#### 配置Bot（Discord）

前往 Discord Developer Portal：https://discord.com/developers/applications

先点左边”Applications“，再点右边”New Application“，然后随便给它取个名字

![](<https://p.sda1.dev/31/868f54234cc107f10754f447daff6b80/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-f4c36cba0a72f3a45dbf2315129a530e.png>)







创建好应用后，选择 Bot> Reset Token > copy（一定要复制下来，然后存起来，依旧是”第四步：OpenClaw配置“中要用到）

![](<https://p.sda1.dev/31/f4c7d032eafe8a3882e9aef1f61381b8/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-61cf1d9771739ba227b7daf5ab9c3015.png>)







下滑页面，打开 Message Content Intent的选项并保存

![](<https://p.sda1.dev/31/eaa27c8a34b959d34b11f87d18ae6f9a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-d7c911d9efdbf594b33a6650af0b218c.png>)







OAuth2 URL Generator中选择 bot

![](<https://p.sda1.dev/31/b9d35a82221b2dcf26ddfd535a107fd3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-92e9191e4b82f9c7c9b2e3d345f6a160.png>)







下滑页面，在 Bot Permissions 中勾选 Send Messages 和 Read Message History。

![](<https://p.sda1.dev/31/d8320f237a0773df6352c9d83d218acf/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-116c5532d4b3e459e60d9185b842819d.png>)







继续下滑页面，复制 bot 邀请链接。

![](<https://p.sda1.dev/31/374d7143418cdfbc52ec7d1612a1ff69/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-30cf2e0393cb5892110cc137386be4af.png>)







然后在浏览器中打开这个链接，然后选择一个自己的服务器，相当于把机器人 bot 加入到 server 中。

![](<https://p.sda1.dev/31/5a280a415ba7b35580d0b830c1a23537/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-24a63d247ecfb3384ed7d2c4c6b16c7c.png>)







这时候确认下刚才我们给 bot 的 2 个权限。

![](<https://p.sda1.dev/31/f3fe35bd99494a9379ef6349e2e091b6/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-99f7860129e83e68ad7581bd076332e5.png>)







打开 Discord：https://discord.com/channels/服务器ID/频道ID

然后输入框中@就可以看到刚才添加的机器人 bot。

![](<https://p.sda1.dev/31/dffee17c2ddaa63d9b88e185bf508d71/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-2e35c4ee339159012953a9e3d832a678.png>)







#### OpenClaw 的配置

在服务器中输入如下命令：

```bash
openclaw onboard
```

选择 Yes 接受风险：

![](<https://p.sda1.dev/31/d29e25d48acfe1e1996a9206b3214629/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-3c53697f2b48d2af724ce50e02b5d611.png>)







然后选择：QuickStart

![](<https://p.sda1.dev/31/9aea1e19aff3c9bd66d30a83133f2f38/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-E7EEbDqTYorhU8xFT1mc1Z4hnIb-2.png>)







接着是选择模型供应商的配置，如果上一步已经配置了第三方 API 就不用再配了

也可以选择自带的 API：比如选 GLM 4.7, 输入 key，只需要选择默认模型就好了。

![](<https://p.sda1.dev/31/5c08ae6d3081fd53ce2467df9049087a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-QfZBbfiSCo9IDKxyXhZcQ7OenAh.png>)







接下来是选择 channel，这里选择 Discord

![](<https://p.sda1.dev/31/162fb67ddd16ede6c630b6379b7e5c92/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-GDambOpQBoE5I0xGOLicZP11nwe.png>)







还挺贴心的，把如何获取 token 也做了说明。把之前我们创建的 bot 的 token 复制进来。

![](<https://p.sda1.dev/31/d3f9f807e59d1d3edce211e24ae09490/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-UFccbfj3Uo93A5xoDofc9Bp8nsf.png>)







然后页面按照这个做选择：

![](<https://p.sda1.dev/31/87273aa2b8806e88bf1a7d3e362ab771/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-UHqnbRo2dol6TCxS7w2cJwJ7nbh.png>)







这里可以自定义安装很多依赖，可以先不装。

![](<https://p.sda1.dev/31/fbe13961d53519156c279bb67ff1219a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-34.png>)







hooks 这里选择：session-memory

![](<https://p.sda1.dev/31/96fb91cef393e741b46c4be75cdb3bbd/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-T7JXbE1t6ohCNwxIEUlcyACsnMh-2.png>)







然后就可以在对话框中进行提问交互啦，右下角还会显示你使用的模型和 token 的用量。

![](<https://p.sda1.dev/31/975e5d78dd8ecbd2b2f9f61e9a322095/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-PBq4bKwQ5oVrkqxX66lcMEZqnjk.png>)







但这并没结束，因为我们要通过 discord 来指挥 OpenClaw。

先退出 OpenClaw，然后在服务器停止服务：

```bash
systemctl --user stop openclaw-gateway.service 
```







然后重新启动：

```bash
openclaw gateway --port 18789 --verbose
```

![](<https://p.sda1.dev/31/63d034f6bfcef98ab6dc34dd55018028/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-GENQb6nJEo2lY3xuAB2csOtdnMb.png>)







启动成功后，返回 Discord，与 bot 进行对话后拿到配对码。

是点击 bot 进行私聊，而不是@聊天。

![](<https://p.sda1.dev/31/ee921267c34e676917a51f7552663370/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Vu9rbVs2poEmeFx8UoqctxZ5nHg.png>)







![](<https://p.sda1.dev/31/17bbbaad3c0670634bcd458f7ff7d458/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-HRapbPYWHolu7Txtrt6clHdQnmh.png>)







紧接着返回服务器命令行，你需要按下Ctrl+C（Windows）或者Command+C（MacOS）终止 Gateway 服务。

然后粘贴并运行如下命令进行配对，把 Pairing code 替换为上面的“Pairing code”后面的内容。

```bash
openclaw pairing approve discord <Pairing code>
```







然后再次启动 Gateway

```plaintext
openclaw gateway --port 18789 --verbose
```







如果你想要让它在服务器中静默启动，而不是关闭终端就停止服务了，你可以输入以下命令：

```plaintext
nohup openclaw gateway --port 18789 --verbose > /dev/null 2>&1 &
```







在 discord 中@机器人，可以看到有回复了：

![](<https://p.sda1.dev/31/cbd4ecf48d0e0ba9eb8be694f4099919/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-IkrbboivooZC2extUnTcryUIn4b.png>)







然后服务器也能看到有回复了：

![](<https://p.sda1.dev/31/aa3905cf29dfe14c6f72a88373b6c70e/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-GZ7BbfgRzoCAjgxmMuVcyV3Onsh.png>)

> 好，至此你已经完全安装配置好Clawdbot（OpenClaw）了，快去使用吧！



### 3.4 例： 接入微信



这部分可参考教程，目前体验还需要优化，正在优化中，争取配置为 skill，人人都可以稳定接入，可以关注先。



https://mp.weixin.qq.com/s/UFyb7OXERFo1N1GJzBGrIA





### 3.6 如何重启



```java
# 先先退出 openClaw，然后在服务器停止服务：
systemctl --user stop openclaw-gateway.service

# 然后重新启动：
nohup setsid openclaw gateway --port 18789 --verbose > /dev/null 2>&1 &
```



***

# 第四部分：OpenClaw打造智能体军团



建设中。



# 第五部分：OpenClaw的实际应用场景

## 例1：定时任务

跟别的AI不同的一点，OpenClaw可以主动给你发消息，可以是定时的，也可以是不定时的。（2026.2.6日测试，QQ目前不支持主动给你发消息，但飞书可以）

你可以让它每天早上在你出门前定时给你发今天的天气，用不用带伞、加减衣物，需不需要注意雾、霾等天气；

也可以让它每天晚上给你发消息，提醒你睡觉，再顺便讲一个睡前故事......

![](<https://p.sda1.dev/31/28f46bf62c14df4b9aca513c5556b7e9/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-1422412504849629deb3b1a648d4365b.png>)

![](<https://p.sda1.dev/31/34bb02a600dac39823a115e7b94a6b11/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-c2a2e0e0e1e33dac91c1c91698c9ac90.png>)



## 例2： Skill 即插即用

Kimi K 2.5 配合 OpenClaw，我直接让它给我下载了我自己开发的小红书 skills：

![](<https://p.sda1.dev/31/5fa37bace5fa7758be2c2ed4e9a3b11e/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Kct4bNieGoZdaDxVuqCcli8Dnmd.png>)





因为这个 skill 需要 API，我直接让它放在环境变量中。

![](<https://p.sda1.dev/31/58da930e5d1a7e62db87ba765262699c/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-QZyAbbVyDo7keCx5By9cBu6LnZc.png>)







然后直接输入需求：生成小红书封面图，主题为：「腊八节南北方习俗」

OpenClaw 就帮我生成好了这个小红书的封面图：

![](<https://p.sda1.dev/31/e6e4fbe5affbbd961925bbe38857cf96/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-EnQvbD7KkouzTcx75dMc10TDnkg.jpg>)

这操作简直不要太方便，还要什么 APP？Agent 帮我自动调用 skills 完成结果。



## 例3：自然语言驱动复杂工作

你可以在飞书中丢给文章给 kimi k2.5，一键转换为网页，给一个可访问的链接：

![](<https://p.sda1.dev/31/0840c926bdcbcf001a2e0aaf9274d626/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-UpcWbWNZ2ox7R6xsszbckTqynHc.png>)

打开这个链接后，就看到网站了：

[打开后的网站.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-F2VAdGztFoJIiOxwyqscYeJ3nBe)

我仿佛看到了未来的形态，我们不需要一个又一个的 APP，我们真正需要的是能干活的 Agent。

它会自己去调用工具，最终给一个满意的结果。

这或许是我认为OpenClaw 最有价值的地方。



## 例4：收集整理信息

你可以在 discord 中用@bot 的方式来远程指挥 Clawdbot（OpenClaw） 干活。



比如，我直接来一个问题：

```plaintext
我搜集整理一下最新的关于Clawdbot 的信息，告诉我该怎么配置和使用，并
给我在 GitHub 或者 X 上找出 10 个最佳实践。
```



我录了一个视频，大家可以感受一下，非常刺激：



可以看到 Clawdbot（OpenClaw） 会自行去搜索，并且给到我想要的信息，最牛 X 的是，这家伙居然给我推荐了相关的 discord 社区，我靠，真贴心。

[社区推荐.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-G3Nida6oFoqs7pxgAvIcIEzVnXd)

然后我又直接在手机上，让 Clawdbot （OpenClaw）帮我把刚刚找到的结果保存在电脑指定的文件夹，我的要求如下：

```plaintext
你把刚刚生成的信息保存成markdown文档，放在我的电脑claw文件夹下，
你需要新建这个文件夹 
```

[演示.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-BkLQdF2NXosLo3xfRe3cxGYFn37)







我喝了几口水的功夫，Clawdbot（OpenClaw）就已经帮我把事情做好了。

![](<https://p.sda1.dev/31/a91d3d8634c1a39d577121dc596ab462/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Vgx7bZxQOo6eLwx0JEOcpwnenmh.png>)



而它又可以和“定时任务”结合起来，比如，让他每天早上9点都整理一份发给你。



## 例5：OpenClaw重塑工作流



> Openclaw + OpenCode 才是 vibe coding 的最棒组合！



我真的实现了躺在床上指挥 AI Agent 来 Coding，并自动发布到 GitHub ，然后自动部署到Vercel。



用 Openclaw+ OpenCode+GitHub+Vercel 实现了网站的开发，部署上线。



这个过程全程是由 Openclaw 在我的私人服务器完成的。



这已经不是 vibe coding 了，我大胆的来造一个新名词吧，姑且就叫 Agent Coding。



也许后面，人们会有更加炫酷的名字，但这一切都不重要了。



我很兴奋，为了防止你说我在瞎扯淡，我决定公布所有我和 Openclaw 的聊天记录。



我全程并没有使用什么高深的技术，也没有操作过服务器，我全程是用最简单的提示词来完成的。



这个项目是Openclaw全自主完成的：

![](<https://p.sda1.dev/31/4659ada02a1b6fc40837323cf29f056f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-CCvbbxY3Qojg6XxGhHfcCIV1njc.png>)



游戏完全可用：

![](<https://p.sda1.dev/31/4e9d294024292c6e01dbd32cea9b317a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-GOPibRKXVorvCyxvtjfcrM52nLg.png>)



下面是我和 Openclaw 的全部聊天。

先安装 opencode：

![](<https://p.sda1.dev/31/e12a9c6332eb6bfb0bcd7d972c8a668d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-TqD8bqjB1oMp1qxIJy0cQYZhnef.png>)







新建目录用做项目目录：

![](<https://p.sda1.dev/31/8d5a08c2c0afa25ecf4d535d085e9fda/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Jv0GbCeYTolL34x8LdVcQohUnnc.png>)







切换目录，启动 opencode：

![](<https://p.sda1.dev/31/a1b0b3f6fa20c89defc575d924054e4d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-EREhbdurjon7D4xolBncCwmZnhg.png>)







用 opencode 来开发贪吃蛇游戏：

![](<https://p.sda1.dev/31/14bf2ef66ec80bb29281ef0cc6efa435/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-QwzJb3m24od87zxvP3Sc3yB7ny2.png>)







提供我的 GitHub 信息，让他连：

![](<https://p.sda1.dev/31/7ed27bb852b8c27787afd89a98cd7825/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Rms1b9zPioOZNNxFx1AcnLhxng2.png>)







按照它给的提示，创建一个 token，权限就给仓库权限，直接丢给他 token。

![](<https://p.sda1.dev/31/6630a8f6241b115a55782b24f5e8879a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-RrPsb8pHDoHItQxc56rcfUewn6g.png>)

这里一定记得开启部分权限，防止它瞎搞。







它说已经推送好了：

![](<https://p.sda1.dev/31/99c7b92b7e8cbcd8367175dffc16a753/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-RyAhbZHZmo4a9jxiV90cz4donML.png>)







我打开 GitHub 看下，果然有了，已经自动将代码推送到 GitHub 了。

![](<https://p.sda1.dev/31/54cb1198cfe007510e4fcf8e7368341d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-MAEDbAn20oPsIex4rrzcPnTtntd.png>)







然后让它部署到Vercel，方便得到一个可访问的网页链接：

![](<https://p.sda1.dev/31/90d743d95f1eb4808cbcc92577ac33c3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-WxppbQImBoy3SBx5P7WceQ7Knyh.png>)







同样按照要求，给个 token，就已经完成了自动部署。

![](<https://p.sda1.dev/31/e96706273be4d4f5446a9742d8685579/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-PXR5bxURCo2CkaxzIr9cnaFfnGg.png>)







🐂🍺，就已经完成了全链路的自动化，真的麻了，兄弟们，虽然只是跑通了闭环，但Openclaw 想象空间真的无限。



我甚至直接让但 Openclaw 记录下这个过程，并写一篇文章，推送到刚才这个仓库，这个由 Agent 自主开发部署的仓库。



提示词；这个过程太棒了，我打算写一篇文章，你帮我直接根据你刚才的步骤，生成一篇文章，标题是：用 Openclaw+ OpenCode+GitHub+Vercel 实现 Agent Coding，最好是有流程图详细解释下这个步骤

![](<https://p.sda1.dev/31/6545b3e028e251db15d83fd67bc50bf0/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Wv4Nbsc7moQFYOxFijpc7GIBnpe.png>)







然后打开 GitHub 看，也已经有了描述：

![](<https://p.sda1.dev/31/467c3c9c02c039d5d8d36ecd97f2930f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-DfVIb5vpuoh6XrxTsDRclBRunZf.png>)

下面，我把 Openclaw 生成的教程也贴出来，方便大家看看。Openclaw 的应用仿佛打开了潘多拉魔盒，未来，coding 的范式是不是可以变为 agent coding，每一个人都有一个专属 agent，帮我们 coding，或者做任何我们希望做的事情。



***



**以下是OpenClaw自己生成的记录：**



**🐍 贪吃蛇游戏 + Agent Coding 完整教程**

> 本文档由 **「OpenClaw AI Agent」** 全程自动生成，记录从需求到上线的完整开发流程。

📱 **「在线试玩」**: https://myopencode.vercel.app
📝 **「项目源码」**: https://github.com/freestylefly/snake-game
🤖 **「生成工具」**: OpenClaw + OpenCode + GitHub + Vercel

***

**用 OpenClaw + OpenCode + GitHub + Vercel 实现 Agent Coding**

> 从零开始，让 AI Agent 帮你写代码、管理版本、自动部署，全程无需离开终端！

**📋 概述**

本文将介绍如何构建一个完整的 **「AI 驱动开发工作流」**：

本文将介绍如何构建一个完整的 **「AI 驱动开发工作流」**：

* **「OpenClaw」** - AI 助手运行平台，协调所有工具

* **「OpenCode」** - AI 编程助手，自动生成代码

* **「GitHub」** - 代码托管和版本管理

* **「Vercel」** - 自动化部署和托管

通过这个工作流，你只需要告诉 AI 要做什么，剩下的代码编写、提交、部署全部由 Agent 自动完成。

***

**🔄 完整流程图**

```plaintext
┌─────────────────────────────────────────────────────────────────────────────┐│  AgentCoding完整工作流 │└─────────────────────────────────────────────────────────────────────────────┘
     ┌──────────────┐     │   用户需求    │  "帮我创建一个贪吃蛇游戏并部署上线"     └──────┬───────┘            │            ▼┌──────────────────────────────────────────────────────────────────┐│  Step1:环境准备(OpenClaw协调) ││  ┌─────────────┐┌─────────────┐┌─────────────┐ ││  │安装OpenCode││安装GitHubCLI││安装VercelCLI│ ││  │(AI编程)││(代码托管)││(自动部署)│ ││  └──────┬──────┘└──────┬──────┘└──────┬──────┘ │└─────────┼────────────────┼────────────────┼──────────────────────┘   ││ │   ▼▼ ▼┌──────────────────────────────────────────────────────────────────┐│  Step2:AgentCoding(OpenCode) ││  ┌─────────────────────────────────────────────────────────┐     ││  │用户:"创建一个贪吃蛇游戏"│ ││  │││ ││  │▼│ ││  │  ┌─────────────────────────────────────────────────┐    │     ││  ││OpenCodeAIAgent││ ││  ││┌──────────┐┌──────────┐┌──────────┐││ ││  │││生成HTML││生成CSS││生成JS│││ ││  │││index.html││style.css││game.js│││ ││  ││└──────────┘└──────────┘└──────────┘││ ││  │  └─────────────────────────────────────────────────┘    │     ││  └─────────────────────────────────────────────────────────┘     │└──────────────────────────────────────────────────────────────────┘          │          ▼┌──────────────────────────────────────────────────────────────────┐│  Step3:代码管理(GitHub) ││  ┌──────────────────────────────────────────────────────────┐    ││  │1.gitinit初始化仓库│ ││  │2.gitadd.添加文件│ ││  │3.gitcommit-m"Initial commit"提交│ ││  │4.创建GitHub仓库(通过API)│ ││  │5.gitpush-uoriginmaster推送到远程│ ││  └──────────────────────────────────────────────────────────┘    │└──────────────────────────────────────────────────────────────────┘          │          ▼┌──────────────────────────────────────────────────────────────────┐│  Step4:自动部署(Vercel) ││  ┌──────────────────────────────────────────────────────────┐    ││  │1.vercel--token<TOKEN>登录并关联│ ││  │2.自动检测项目类型(静态网站)│ ││  │3.构建并上传到VercelCDN│ ││  │  4. 分配域名: https://myopencode.vercel.app  │ ││  └──────────────────────────────────────────────────────────┘    │└──────────────────────────────────────────────────────────────────┘          │          ▼     ┌──────────────┐     │   网站上线    │  🎉 访问链接，游戏可玩！     └──────────────┘
```

***

**🛠️ 详细步骤**

**第一步：环境准备**

**1.1 安装 OpenCode（AI 编程助手）**

```plaintext
# 安装 OpenCodenpm install -g opencode-ai
# 验证安装opencode --version
```

**1.2 安装 GitHub CLI（代码管理）**

```plaintext
# 下载并安装curl -fsSL https://github.com/cli/cli/releases/download/v2.63.2/gh_2.63.2_linux_amd64.tar.gz | tar -xz -C /tmpcp /tmp/gh_2.63.2_linux_amd64/bin/gh /usr/local/bin/
# 验证gh --version
```

**1.3 安装 Vercel CLI（自动部署）**

```plaintext
# 安装 Vercel CLInpm install -g vercel
# 验证vercel --version
```

***

**第二步：创建项目目录**

```plaintext
# 创建项目目录mkdir -p ~/myopencodecd ~/myopencode
# 初始化 Git 仓库git init
# 配置 Git 用户信息git config --global user.email "your@email.com"git config --global user.name "yourname"
```

***

**第三步：Agent Coding（核心步骤）**

**方式一：使用 OpenCode 交互模式**

```plaintext
# 启动 OpenCode（需要 PTY 模式）# 在 OpenClaw 中使用：bash pty:true workdir:~/myopencode command:"opencode"
```

然后在 OpenCode 中输入：

```plaintext
创建一个贪吃蛇游戏，使用 HTML5 Canvas，包含完整的游戏逻辑、得分系统和响应式设计
```

**方式二：使用 OpenCode 非交互模式**

```plaintext
# 直接运行任务opencode run "Create a complete Snake game using HTML5 Canvas, CSS, and JavaScript"
```

**方式三：手动创建（备用方案）**

如果 OpenCode 运行有问题，可以直接创建文件：

**「index. html:」**

```plaintext
<!DOCTYPE html><html lang="zh-CN"><head>    <meta charset="UTF-8">    <meta name="viewport" content="width=device-width, initial-scale=1.0">    <title>贪吃蛇游戏</title>    <link rel="stylesheet" href="style.css"></head><body>    <div class="container">        <h1>🐍 贪吃蛇游戏</h1>        <div class="game-info">            <div class="score">得分: 0</div>            <div class="high-score">最高分: 0</div>        </div>        <canvas id="gameCanvas" width="400" height="400"></canvas>        <div class="controls">            <p>使用方向键 ↑↓←→ 控制蛇的移动</p>            <button id="startBtn">开始游戏</button>            <button id="pauseBtn">暂停</button>            <button id="restartBtn">重新开始</button>        </div>        <div id="gameOver" class="game-over hidden">            <h2>游戏结束!</h2>            <p>最终得分: 0</p>            <button id="playAgainBtn">再玩一次</button>        </div>    </div>    <script src="game.js"></script></body></html>
```

**「style. css:」**

```plaintext
* {    margin: 0;    padding: 0;    box-sizing: border-box;}
body {    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;    background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);    min-height: 100vh;    display: flex;    justify-content: center;    align-items: center;    color: #fff;}
.container {    text-align: center;    padding: 20px;    background: rgba(255, 255, 255, 0.05);    border-radius: 20px;    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);}
h1 {    background: linear-gradient(45deg, #00d4aa, #00a8e8);    -webkit-background-clip: text;    -webkit-text-fill-color: transparent;}
#gameCanvas {    border: 3px solid #00d4aa;    border-radius: 10px;    background: #0a0a0a;}
```

**「game. js:」** (完整游戏逻辑代码)

***

**第四步：推送到 GitHub**

**4.1 提交代码**

```plaintext
# 添加所有文件git add .
# 提交git commit -m "Initial commit: Snake game with HTML5 Canvas"
```

**4.2 创建 GitHub 仓库并推送**

**「方式一：使用 GitHub CLI」**

```plaintext
# 登录 GitHubecho "YOUR_GITHUB_TOKEN" | gh auth login --with-token
# 创建仓库gh repo create snake-game --public --description "A classic Snake game"
# 推送git push -u origin master
```

**「方式二：使用 API 直接创建」**

```plaintext
# 通过 API 创建仓库curl -X POST https://api.github.com/user/repos \  -H "Authorization: token YOUR_GITHUB_TOKEN" \  -H "Accept: application/vnd.github.v3+json" \  -d '{    "name": "snake-game",    "description": "A classic Snake game built with HTML5 Canvas",    "private": false  }'
# 添加远程仓库并推送git remote add origin https://username:token@github.com/username/snake-game.gitgit push -u origin master
```

***

**第五步：部署到 Vercel**

**5.1 使用 Vercel CLI 部署**

```plaintext
# 进入项目目录cd ~/myopencode
# 使用 token 部署vercel --token YOUR_VERCEL_TOKEN --yes --prod
```

部署成功后，会输出类似：

```plaintext
Production: https://myopencode-xxx.vercel.app
```

**5.2 关联 GitHub 仓库（可选）**

Vercel CLI 会自动检测并关联 GitHub 仓库，实现自动部署：

* 每次 push 到 GitHub，Vercel 自动重新部署

* 支持预览部署（Pull Request）

***

**🎯 完整命令速查表**

***

**💡 核心优势**

**1. 「全程自动化」**

* 从需求到上线，无需手动编写代码

* AI Agent 理解自然语言，自动生成完整项目

**2. 「无缝集成」**

* OpenClaw 作为中控，协调所有工具

* GitHub 管理版本，Vercel 自动部署

**3. 「即时反馈」**

* 几分钟内从想法到可访问的网站

* 每次修改自动重新部署

**4. 「可扩展性」**

* 可以轻松扩展到更复杂的项目

* 支持 React、Vue、Next. js 等框架

***

**🔧 常见问题**

**Q 1: OpenCode 卡住不响应？**

**「解决」**: 使用非交互模式或直接用 GPT/Claude 生成代码后手动保存

**Q 2: GitHub 推送失败？**

**「解决」**: 检查 token 权限，需要 `repo` 权限

**Q 3: Vercel 部署失败？**

**「解决」**: 确保项目结构正确，静态网站不需要额外构建配置

***

**🚀 进阶玩法**

**自动评论到 PR**

```plaintext
# OpenCode 审查代码后自动评论gh pr comment <PR_NUMBER> --body "$(cat review.md)"
```

**定时自动更新**

```plaintext
# 使用 cron 定时让 AI 更新网站内容cron action:add job:{  "schedule": {"kind": "cron", "expr": "0 9 * * 1"},  "payload": {"kind": "agentTurn", "message": "更新网站内容"}}
```

**多 Agent 协作**

```plaintext
# 同时运行多个 OpenCode 处理不同任务bash pty:true background:true command:"opencode '设计前端界面'"bash pty:true background:true command:"opencode '编写后端 API'"
```

***

**📊 实际案例数据**

本次贪吃蛇项目：

* **「开发时间」**: \~5 分钟（Agent 生成代码）

* **「代码行数」**: \~400 行（HTML/CSS/JS）

* **「部署时间」**: < 10 秒

* **「最终链接」**: https://myopencode.vercel.app

***

**📝 总结**

通过 **「OpenClaw + OpenCode + GitHub + Vercel」** 的组合，我们实现了一个完整的 AI 驱动开发工作流：

1. **「说」** - 告诉 AI 你要什么

2. **「写」** - AI 自动生成代码

3. **「存」** - 自动提交到 GitHub

4. **「上线」** - 一键部署到 Vercel

这种工作流特别适合：

* 快速原型开发

* 个人项目

* 学习新技术

* 自动化重复任务

***

**🔗 相关链接**

* OpenClaw: https://docs.openclaw.ai

* OpenCode: https://opencode.ai

* GitHub: https://github.com

* Vercel: https://vercel.com

* 本案例 GitHub 仓库: https://github.com/freestylefly/snake-game

* 在线演示: https://myopencode.vercel.app

***

**🤖 OpenClaw 生成过程实录**

本文档并非人工编写，而是由 **「OpenClaw AI Agent」** 在开发过程中自动生成：

**生成流程**

1. **「需求提出」** - 用户："帮我把整个过程写成一篇文章"

2. **「Agent 分析」** - OpenClaw 分析刚才的操作历史，提取关键步骤

3. **「内容生成」** - 自动编写完整教程，包含流程图、代码示例、速查表

4. **「自动推送」** - Agent 直接将 README 提交到 GitHub 仓库

**真实的开发时间线**

```plaintext
21:49 - 用户："帮我安装 opencode"21:53 - 创建项目目录 myopencode21:56 - 启动 opencode（交互模式）21:57 - OpenCode 卡住，改用直接创建文件21:58 - 贪吃蛇游戏代码生成完成22:05 - 用户提供 GitHub 账号 freestylefly22:10 - 创建 GitHub 仓库并推送代码22:13 - 用户要求部署到 Vercel22:20 - Vercel 部署成功，游戏上线22:28 - 用户："写一篇文章记录这个过程"22:31 - README 自动生成并推送到 GitHub
```

**核心指令**

整个开发过程只用了几个简单的自然语言指令：

**「全程无需编写任何命令，只需用自然语言描述需求！」**

***

***本文档由 OpenClaw AI Agent 全程自动生成 | 2026-02-03***



## 例6：Openclaw＋Seed2.0 Skills 做 AI 漫剧

微信公众号：苍何（2026.3.2日内容）

最近玩 Openclaw 又玩的跟个疯狗似的，给我的小龙虾装了很多实用技能，可以自动写小红书图文，可以自动写作，配图，生成封面等。

![](<https://p.sda1.dev/31/fb9eebf751223cc02b10f23c6fc761a6/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-caae7c4e9e409a098f1d68249010f844.png>)







但感觉生活还是很无趣，于是又花了一些时间，开发了个 AI 漫剧视频生成 Skills，给小龙虾使用。

准确的说，这是个基于字节 Seed2.0 的技能包，有以下子技能。

![](<https://p.sda1.dev/31/83a66b0b6f3f5303c9f225c30a5d1809/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-7a9a7ea7aec9f63ccfff55fc59d907f5.png>)

**「seedance-video」**：文生视频、图生视频，seedance 1.5 Pro 版本还自带音频生成，属于基本盘。

> 等seedance 2.0 的 API 出来，也会第一时间接入。

**「manga-style-video」**：8 种漫画风格一键切换。日式治愈系、吉卜力、国风水墨、美式卡通、铅笔素描、水彩、Q版萌系。

**「manga-drama」**：这个是核心，漫剧生成器。丢一张主角图进去，自动给你编排分镜短剧。

**「volcengine-video-understanding」**：火山视频理解，生成完还能分析效果，看看情感表达到不到位。底层用的是 doubao-seed-2.0-code 的能力。

说白了，从写脚本到出视频到验收，一条龙全包了。

比如直接一句话调用 manga-drama 技能生成视频。

![](<https://p.sda1.dev/31/cd8dc388e0072bb162caafd9d56cfb87/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-23cbaf836892b2590f6aa9d2f0e97b01.png>)

稍微控制一下提示词，就能生成比较精致的动漫风格的视频了，其中我给的提示词是：

> 动漫风格视频，一名长发高中少女漫步在盛开的樱花树下。粉色的花瓣在微风中缓缓飘落。明媚的春季阳光洒下，产生柔和的镜头光晕效果。侧向跟踪镜头，怀旧氛围，高画质，控制在20M 以内，并以视频文件预览的方式直接发给我

![](<https://p.sda1.dev/31/1ec4d15480650b5e4b30f25fc88d76ae/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-39be17326db73b63e41ae80c18b9e816.png>)

这个视频目前使用的是 seedance 1.5 Pro，等 2.0 的 API 出来效果会更好 ：

[微信视频.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-IqZBdYpvpooiXcx8JQ9cdnl9nUe)







可以使用一张图片，直接生成漫剧分镜视频，生成脚本到主角再到分镜视频，manga-drama 都能一次性完成。

![](<https://p.sda1.dev/31/42bfae5ca7ae5adf6c9e99ee477b4e93/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Y2TobfPbQoH3V0xIVU9cXh3Ynkg.png>)

我录了个视频，大家可以看下这个流程：

[微信视频2.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-Bjckdk8Hno1GB7xH13AcXdvDnEe)







生成的分镜视频合成了下是这样的：

[微信视频3.mp4](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-L9lgdBAQGox2tyxid7Mcnu0znzg)







> 后面考虑迭代的方向就是让这几个视频能连一块组成丝滑的视频。

我把整个 Skills 都也开源到了 GitHub 我的 Skills 仓库：

![](<https://p.sda1.dev/31/8cfbebc51135501d389684a6c011ffe9/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-AKq9bhTWzoLeEQx7eEQcqaKLnzf.png>)

> 去公众号搜索“苍何”，然后私信回复：canghe-skill，可获取我的所有技能包。

使用的话也非常简单，你只需要让你的 openclaw 自己安装下我的技能就好了。

![](<https://p.sda1.dev/31/afde600c25e15c415103088158a3a56d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-YYkdbHBajoQ6NUxTgMmc9lSunCh.png>)







**实战：一张图到一套漫剧，怎么跑的？**

光说不练假把式，直接上流程。不过在此之前，得申明一点，这个过程将会非常费 token，我自己小龙虾用的是火山的 Coding Plan 套餐。

![](<https://p.sda1.dev/31/3acb0a893e94e0bd41848e1243cb09d9/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-T9vVbx70EoXs7OxolDocjRPFnV9.png>)

3 月起新用户首购是 9.9，还有裂变活动：被推荐的用户还可叠加10% 推荐福利，8.9 即可购买。

![](<https://p.sda1.dev/31/317a9275bc3352fb292ee366b96b0635/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-LOoSb17IqoXmaWxhYY2cM971npe.png>)

里面模型也挺多的，主要原因是我想用 doubao-seed-2.0-code 的 Agent 和 VLM 能力，之前也做过一次测评，目前表现是非常不错的。

![](<https://p.sda1.dev/31/931c445615f0425f193d97dae35162c0/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-VCnmb7PPSoOTmKxSsl9cf5zInah.png>)

能理解长达 2 小时的视频，并调用剪辑 skill 进行混剪。

![](<https://p.sda1.dev/31/196922582d83acb949e4736a36223d43/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Yob8bHF2foLbWDxsIWscMyJhnwg.png>)

还可自定调用各种 Skills 和 Agent 由视频转公众号文章。

![](<https://p.sda1.dev/31/427c3a1982a83ef142c3a5786b8bd520/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-BOFqbX5FLofFLux7wepcAy8VnPb.png>)

因为 seed2.0 具备更强的多模态理解能力和 Agent 能力，特别是在多模态感知，长视频理解，对 Skills 的理解和应用上表现不错。



在我们的整个流程中需要调用不少的 Skills，以及需要理解视频，所以目前来看，doubao-seed-2.0-code 是最合适的。



火山的 Coding Plan 上就可以直接用 doubao-seed-2.0-code，而且性价比也是挺高的，特别对新用户几乎是白菜价，hh。



**第一步：剧本逻辑编排**

漫剧视频第一步，得有个像样的分镜脚本。



谁来写？Openclaw 后端配置的大模型。



我这里接的是 doubao-seed-2.0-code，负责生成分镜逻辑、编排场景顺序。



比如我想做一个「少年仗剑走天涯」的国风漫剧。



它会自动帮我拆成：开场独白、拔剑出鞘、对决场景、雨中沉思、结尾定格。



每一幕都带详细的画面描述和镜头指令，省心到离谱。

![](<https://p.sda1.dev/31/663dcd31a6aad03b62e3c59ade8a739d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-EvpybzENkoYWejxCi1bcBPrln6g.png>)

**第二步：主角设定 + 风格选择**

脚本有了，需要生成漫剧主角，会调用 canghe-image-gen  skill 来生成主角形象，这个 skill 是支持 Google API 及第三方 API 的。



无论是用最新的香蕉 2.0，还是使用 seedream 5.0，生图都轻松。



需要选风格。manga-style-video skill 提供了 8 种预设风格，每种都内置了专业提示词。



不用自己调参，选一个就完事。



我这次选的是国风水墨，配合「仗剑少年」的主题刚刚好。

![](<https://p.sda1.dev/31/a294f01d360bb96c1d01ad1f20e21b2b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-FkK2basK1o0QJdxdDabcWvytnvg.png>)

你还别说，吉卜力风格也很绝，改天再试试。

**第三步：漫剧生成**

重头戏来了。



manga-drama 这个 Skill，是整套工作流里最让我惊艳的。



操作贼简单：丢一张主角图进去，它自动帮你编排整套分镜。



内置了 5 种分镜类型：

主角登场、动作场景、情感表达、互动场景、结尾定格。

每一幕的构图、镜头角度、光影氛围，全都安排得明明白白。

![](<https://p.sda1.dev/31/86344e04333450965874edbe1c620aaa/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-BvefbCBfioPZOQxbakCcNJrjnIh.png>)

不过当前是有一些待优化的地方都，传参考图，会中断链接，问题不大，后续我再修复下。



**第四步：效果验收**

视频生成完，还没完事。



volcengine-video-understanding 可以对生成的视频做内容分析。



这里基于 seed2.0 的视频理解能力，还是非常方便的。



情感表达到不到位？场景衔接顺不顺？它都能给你反馈。



相当于自带了一个「AI 质检员」，省得自己一帧一帧去看。

![](<https://p.sda1.dev/31/f81b1c97afce955cd76e0dee99c50560/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-RooybnGhooQLJbxdqgRc0xIonne.png>)

整套流程跑下来，从一张图到一套完整漫剧视频，我这边大概十来分钟搞定。



**写在最后**

Openclaw 的可玩性还是很多的，但也确实废 token。



Openclaw 的最佳使用方式是搭载自己的 Skills 技能包，而非是让自己的小龙虾在 ClawHub 中一顿瞎找。



现在的 Skill 太多了，但唯有那些对自己有用的技能才值得被收藏。



更推荐每个人都维护自己的技能仓库：把个人方法论、模板、脚本和领域默认配置沉淀为可版本化资产，而不是长期依赖单一公共基线。



说实话，等 Seedance 2.0 的 API 正式放出来，这套漫剧工作流还能再上一个台阶。



到时候画面一致性、角色连贯性都会好很多，想想就有点期待。



感兴趣的可以先玩起来，我的技能包都开源了，公众号私信回复 canghe-skill 就能拿到。



## 例7、数字人



玩 OpenClaw 继续没停，试过让小龙虾做漫剧，爆款抖音视频一键做公众号，试过连接微信等。

但依旧觉得，不够好玩。

这不，又花了一些时间，给我的🦞装上了「数字人」技能，它能一键克隆任意声音，克隆形象，然后生成数字人视频。

![](<https://p.sda1.dev/31/3b5ae51f5d54e57b26dfaad843624ef4/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-NNivbu8DCo50AIxhVK9cV9NjnPb.png>)

我只用丢一张照片，然后丢一张任意照片，就能让 OpenClaw 克隆该形象：

![](<https://p.sda1.dev/31/271d627d1b9e918e265c77b2e05c2131/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-XWisbST8zooDDexwKNjc2uB6nLb.png>)

然后传任意一个语音文件丢给 OpenClaw，就能克隆这个声音。

![](<https://p.sda1.dev/31/4969db4955c082af269abf9f54a50b07/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Gt0jbigivoE22nxR2KOc1O9qnfb.png>)

然后用刚才克隆的形象和声音组合，让 OpenClaw 搜集今天的 AI 新闻，给我们来做个数字人播报：

扣子openclaw-1

橘子一岁的照片配合这个磁性的声音，好魔幻，好魔幻，哈哈哈哈。

不恶搞自己的博主不是好博主，豁出去了，把我的🐶照片克隆一下：

![](<https://p.sda1.dev/31/2f2e02f0d2834757ce6d62ff5e2da260/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-S3VvbBZijoJuKfxjRu9c8tz1nZg.png>)

我的声音就不克隆了，不够性感，还是继续用这个美女的声音。

> 保命神明，仅用作交流学习，大家请谨慎使用，注意安全。

扣子openclaw-2

还是不够刺激？抖音上看到有些梗，有些有趣的爆款视频，也想复刻？

那就配合之前给大家分享的抖音视频下载 Skills，自动下载视频，提取视频中的音频，利用数字人技能自动克隆音色及形象。

比如，我想在抖音上刷到这个懂王的视频。

![](<https://p.sda1.dev/31/75da8d1c07b37d1c3f08e15197d53d68/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-LV2ibA7q0ojhlPxJFSncWg3Rntc.png>)

我直接丢给抖音链接给我的扣子 OpenClaw，让他先帮我无水印下载该视频：

![](<https://p.sda1.dev/31/bdc6b419655e1398612f0cac51c4912a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-D0tqbRbFYoP7FOx1js4ccisenhg.png>)

然后让小龙虾提取音频：

![](<https://p.sda1.dev/31/b35ca0a98ef3df6d1635a3550621d1fe/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-GJBYbWaR9oMREKxpkWCcEKeJnAd.png>)

然后克隆声音：

![](<https://p.sda1.dev/31/3fc1ac42da028b250858a8b10b3638d9/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-FxtAbuJV6oVic6x4Dijc5Tsknrg.png>)

但当我想要克隆懂王形象的时候，不让克隆了。

![](<https://p.sda1.dev/31/16b920399c0a23ab8eb6d3dd4ed6a7de/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-J45wbvqwEoTpRqxN2NhcMtO1nac.png>)

ok，那就用自己的形象，懂王的声音，来生成一段数字人视频不😂

扣子openclaw-3

我特么把自己看笑了，哈哈哈哈。

其实，数字人的应用场景还是非常多的，以前玩数字人，去各种平台一顿点点点，现在 OpenClaw 中，口喷完成的感觉太酷了。

> 我把全部的技能和步骤都打包好了，你只需要点我左下角的狗头像，发个暗号，就可领取，暗号为：openclaw知识库

下面讲下我是如何实现的，首先你得有个小龙虾 OpenClaw。

我这次是用的扣子小龙虾，体验相当丝滑，速度非常快，对小白来说极度友好。

可能很多人还不知道，你打开扣子平台，你就能在这个上面看到，毫不犹豫的点一下：

![](<https://p.sda1.dev/31/e24e50d2926bf02cf12d0ba718631172/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-RIfqbXz5ao8b1rxBioGcWg65n0b.png>)

```java
地址是：https://www.coze.cn/
```

然后你就享受 3 分钟快速部署的乐趣吧：

![](<https://p.sda1.dev/31/942a7330149ead02ca7031709f1350f8/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-U3ZPbdHfyosF5cxHrlwcjO8fnMN.png>)

选择模型和版本后，就能一键部署了，部署好了之后：

![](<https://p.sda1.dev/31/22663946990b4fce9f1ce73bfdd9e844/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-BEqwbHONyooLgSx75yacJyBgnlg.png>)

如果需要配置飞书渠道，可以参考如下配置：

点击配置，去创建：

![](<https://p.sda1.dev/31/62608d26251810ff0e834a296a7248d1/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-In07bLlBGotWhix3ZRucIHjUnpf.png>)

做个授权，等待个几秒钟，机器人就创建成功了，出现个教程页面：

![](<https://p.sda1.dev/31/9b259fec8306ef046c4979184ffa02f2/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-OAERbr10ooZY57xO2LNcFnUynqe.png>)

去飞书开放平台，在事件配置→ 订阅方式中选择“使用长连接接收事件”：

> 你点击蓝色字会直接跳转到对应的配置页面

![](<https://p.sda1.dev/31/0735922bc22fbe75ae888134f1b0fde2/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Gb0nbMTp0ohIVQxsLCfcIgPgndf.png>)

然后创建和发布一下版本，最后需要进行飞书配对。在飞书中搜索机器人名称，并发送任意消息

机器人会回复配对码，复制配对码文案。

![](<https://p.sda1.dev/31/b7f134a5c3102c3fb6c504e8e6aa44c8/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-IaQ3bZVTRoKIo7xjALrcYKuxnHU.png>)

然后到扣子里面黏贴就 ok 了：

![](<https://p.sda1.dev/31/207bcb71c3c67ffba70633a5f382ebf5/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-WSzSbgTSko2D6lxNWnuc57r2n6c.png>)

在飞书里面就可以使用扣子的小龙虾了。

![](<https://p.sda1.dev/31/43b53d34dd9963c91bfe336704e52bf3/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-U9KJbYB7EozKjHxSQeNcg9Xfnvg.png>)

扣子他们还搞了个 Agent 交流平台，目前已经有 13634 多个 Agent 了。

![](<https://p.sda1.dev/31/0e9d9e9aaae50291d0fb2b2c7767edb2/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-RjKvb8fB0ojFVUxs0KKc7Strn6d.png>)

我们也可以把自己的小龙虾注册上去，然后发帖子和别的小龙虾一起互动玩起来。

注册也很简单，你可以像我一样给这个提示词：

```java
你去这里 https://instreet.coze.site/skill.md 注册一个InStreet 账号，然后发帖推广一下苍何这个 AI 博主，并夸下他
```

<https://cdn.canghecode.com/blog/20260311164140.png>

我的虾就立马发了贴夸我的帖子，并且有别的虾来评论了：

![](<https://p.sda1.dev/31/5d3f02c321bacb0758d2d5ad2e560b2b/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Fqrtb3nkmowU79xsRfacy9N9nRh.png>)

大家都可以吧自己的小龙虾注册上去玩玩。

然后是需要安装数字人 Skills，我用的是国内比较出名的飞影数字人，在 clawhub 中搜索下  flyworks-avatar-video：

![](<https://p.sda1.dev/31/a5fcb73ee431bb9f0e7a2658e9761b89/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-DlSObivqjoUKcCxSNHXcDCXOnVd.png>)

然后下载这个技能压缩包在电脑：

![](<https://p.sda1.dev/31/8d03f71b52f6eaf1b6ceb70c821baf18/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-M7dJbIF3wocCSOxr5Bdcvenknpe.png>)

然后在飞书 bot 中把这个安装包发给扣子小龙虾，让他自己安装下：

![](<https://p.sda1.dev/31/23db834cd733d5d09a6e78ecdafaafd5/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-VBGMbHygYofdWxxWfGDciLtXn7c.png>)

> PS：所有的外部技能安装都可以用这种方法。

需要配置一个 API，你可以打开下面的链接：

```java
https://hifly.cc/p/NJb1xnB5OZhYFbHp
```

注册后，点击个人中心获得 API：

![](<https://p.sda1.dev/31/40927ce1ee63aa300c567e7541ebd2cc/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-N0OlbDY11oyDsRxSAhZcOOSln5g.png>)

你可以看到上面消耗的额度什么的，你用这链接注册理论上是有 1000 积分可以体验。

不过要想生成视频，就需要买个什么小龙虾套餐，要 249 一个月，填个邀请码「sc8OpCT1Zfs」能多获得 5000 积分，加起来差不多可以生成 88 分钟的视频。如果是体验够玩了我觉得。

![](<https://p.sda1.dev/31/8c886a4797f0b3c7f0890109d140da94/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-X1p0bpLt3ofbu4xaonNcwif4nSc.png>)

然后把你的 key 丢给 openclaw，让他配置下，接下来，你就可以克隆，然后生成数字人玩了。

说到扣子，很多人还停留在过去仅仅能做智能体的时代，现在的扣子让人感觉不一样了。

前端时间推出了技能商店，给创作者能直接通过技能赚钱，我也发了好几个技能上去：

![](<https://p.sda1.dev/31/6b911f5e3720c9f8d85540848207c908/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-RvCabs8USoX19Cx2IJkcNDxmnCe.png>)

当然，我的技能目前还都是免费的，大家可以在扣子上直接免费使用。

除此，扣子还推出了扣子编程，能用自然语言做应用，给很多不懂代码但是想用 AI 做应用的小白一个很好的入口。

除了做应用，还可以用嘴做工作流，做 Agent，做技能等。

![](<https://p.sda1.dev/31/f869694706511224927fa8270c3adccd/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-D4pQbYjSmoZgU9xcfTMcoObCnyb.png>)

其实他这个扣子小龙虾也是通过扣子编程的方式搭建的一个应用：

![](<https://p.sda1.dev/31/9225ba8d2625a91c59a89ad595e79912/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-Wuh8biYe9oxrvHxPcNQc2Riznue.png>)

你是可以直接在这里改小龙虾的各种配置，以及安装技能，看使用情况等，都是非常方便的：

![](<https://p.sda1.dev/31/4f529dbd96902493ad1915aeac13e996/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-FrbWbGOPYod0mdxHmvncjOI3n0b.png>)

幸运的是，扣子今晚也邀请我，来聊一聊小龙虾，我也会毫无保留的分享，我这段时间研究小龙虾的一些经验。

![](<https://p.sda1.dev/31/97fdddd3909c84106b575fa51e355b81/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-R3Qob7lPlopfHYxD5a6csiNLnff.jpg>)

大家如果感兴趣也可以去扣子官方视频号或特工宇宙官方视频号观看。



## 例 8、 传入发票自动解析入飞书多维表格发票系统



给我的小龙虾安排了个狠活，现在我只需要丢一张发票给他，就能自动利用 PaddleOCR Skills 解析，然后传入到飞书多维表格，做了一套发票自动管理系统。

![](<https://p.sda1.dev/31/7570681db55731e44596891bdd4dfd2c/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-45.png>)



给大家做个分享。



### 背景



每个月报销发票都是个头疼事，一张一张手动录入太痛苦了。正好看到 PaddleOCR 上了 ClawHub，就想着能不能自动化一下。

### 做了什么



简单来讲，我现在只需要把发票 PDF 发给 OpenClaw，它就能：

1. **自动解析** - 用 PaddleOCR Skills 提取发票信息（号码、日期、金额、税率这些）

2. **自动上传** - 把 PDF 存到飞书云空间

3. **自动录入** - 把所有字段写入飞书多维表格

全程不用手动填表，30秒搞定一张发票。

### 技术栈

* **PaddleOCR**  Skills- 文档解析能力，基于文心大模型体系训练

* **OpenClaw** - Agent 编排和自动化执行

* **飞书多维表格** - 数据存储和管理

### 实际效果

录了两张发票测试，识别准确率 100%，连表格结构都能完整提取。最爽的是，以后只要扔文件就行，剩下的事 **OpenClaw** 全包了。



![](<https://p.sda1.dev/31/3c13cbfc0e25a847a5451e1ea5540bd8/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-44.png>)

### 如何搭建



1、安装 **PaddleOCR**  Skills



给你的小龙虾 **OpenClaw 说：**



> 帮我下载这个技能：<https://clawhub.ai/Bobholamovic/paddleocr-doc-parsing>



他就会自动安装这个技能：



![](<https://p.sda1.dev/31/dbda329e4fc262ab0ee4531c398b91e1/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-43.png>)



2、配置一下 API



可以直接问 **OpenClaw 怎么配置：**



![](<https://p.sda1.dev/31/530f031da120c20279d50e9985e85162/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-42.png>)



其实核心就是去官网申请个 KEY 和填入个API\_URL。



打开 PaddleOCR 官网后，选择上传一个发票 PDF 附件：



![](<https://p.sda1.dev/31/73f391f63e15bb22424843e248db8526/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-41.png>)



解析后，点击左上角这里的 API：



![](<https://p.sda1.dev/31/a3badb6060f23faf09feb6970d7265b1/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-40.png>)



需要简单填写手机号验证，然后就可以看到API\_URL 和 TOKEN 了。



![](<https://p.sda1.dev/31/5415c5a69d11441c005abfca8ff0e1f4/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-39.png>)



复制这 2，然后到小龙虾中让他帮你自动配置：



![](<https://p.sda1.dev/31/decd5dee04ccffc82cfb7312fe28e37a/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-38.png>)



接下来，你上传个 PDF 发票，就能解析了，PaddleOCR的准确率贼高，几乎识别出他能识别到的，并以 JSON 的形式给返回，然后 openclaw 会转为结构化数据给我。



![](<https://p.sda1.dev/31/0dff3011cd03ca98713be9aed5fd3965/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-36.png>)



接下来输入这一串提示词，让 openclaw 把这些字段传入到飞书多维表格中，建立发票系统：



> 帮我将该信息存入到飞书多维表格，我希望有的字段是：发票号码、发票类型、开票日期、开票人、购买方名称、购买方统一社会信用代码、销售方名称、销售方统一社会信用代码、开户银行、银行账号、合计费用项目名称、合计费用单价、合计费用数量、合计费用金额、合计费用税率、合计费用税额，以及上传发票附件到附件字段。



![](<https://p.sda1.dev/31/919027ec49aa717e439f550e1359da7d/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-37.png>)



需要简单授权，就能创建哈飞书多维表格



![](<https://p.sda1.dev/31/d6acb08f003adc473f5944f05f9acc63/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-35.png>)



这个时候会有一些字段不符合要求，特别是附件，他没法直接上传，需要先传到飞书，再以超链接传过去。你自己稍微手动改下，就 ok 了。



然后跟 openclaw 说，让他以后传发票，都解析后传入到这个系统。



> 我整体修改了下《发票管理》 多为表中的字段类型和名称，请你以后按照这个要求，我只需要上传发票附件给你，你就借助PaddleOCR 技能帮我做解析后，把相应字段对应的存储到《发票管理》这个飞书多维表格，ok 吗？



![](<https://p.sda1.dev/31/f7451e35fa7a2d6f7feab6c2682f2315/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-49.png>)



以后，你只需要往 openclaw 丢一个发票，他就自动解析后放入发票管理系统了。



太方便了。



![](<https://p.sda1.dev/31/692678c097c67a175923326bb76c0e79/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-47.png>)



### 一点感想



以前觉得文档解析这种能力要自己调 API、写代码，现在发现 PaddleOCR 已经以 Skill 的形式直接上架了 ClawHub，在 openclaw 直接传个发票就能用。



这种「能力即插即用」的感觉挺棒的——文心大模型的能力正在通过 Skill 进入开发者工具链，变成可以直接调用的组件。

如果你也在用 OpenClaw，推荐试试这个 Skill：👉 https://clawhub.ai/Bobholamovic/paddleocr-doc-parsing





# 第六部分：好用 Skills 推荐



可以看我们的另外一个文档，每天都会更新好用的 Skills。



![](<https://p.sda1.dev/31/b7f91a50def1fae17bf04354d9dd024f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-48.png>)



地址：

[ 🐲🦞扫盲版-给不会使用的同学看](https://my.feishu.cn/wiki/THLNw1vWCiXJD6kvomlcYpu5nRe?from=from_copylink)



我也把我遇到的一些好用的技能放在了 GitHub，大家可以直接下载，并一键使用。



![](<https://p.sda1.dev/31/570e210bf042c785de16c9a8c383379f/OpenClaw%20%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E7%B2%BE%E9%80%9A%E6%8C%87%E5%8D%97-image-46.png>)



快速安装（推荐）

`npx skills add freestylefly/canghe-skills`

注册插件市场

在 Claude Code 中运行：

/plugin marketplace add freestylefly/canghe-skills



当然你也可以直接下载：



[canghe-skills.zip](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-CDpgdKN2xo6aPjxJx3CcdFcEnzc)



## 1、OCR 识别 Skills



这是一个用于高级文档解析的技能，支持提取表格、公式、图表和布局信息。需要配置 PaddleOCR API 才能使用。



clawhub 地址：<https://clawhub.ai/Bobholamovic/paddleocr-doc-parsing>



[paddleocr-doc-parsing.zip](https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe#share-Bc7bdjMZDo6jLExVlCAcKgUPnhh)





# 第七部分：资源推荐



1、小龙虾 skill 整理开源仓库：

https://github.com/VoltAgent/awesome-openclaw-skills



2、精选案例库：

https://github.com/hesamsheikh/awesome-openclaw-usecases



3、进阶实用技能仓库

[ 🐲🦞扫盲版-给不会使用的同学看](https://my.feishu.cn/wiki/THLNw1vWCiXJD6kvomlcYpu5nRe?from=from_copylink)



4、技能仓库整理：



https://github.com/VoltAgent/awesome-openclaw-skills



5、目前从几千个问题里筛选出来的典型问题合集（主要是针对火山 arkclaw 相关的）

[ 【QA合集】火山ArkClaw龙虾 ToP100  V1.2](https://lishu100.feishu.cn/wiki/DU57wlbPxiOfNqk3M1OcFT0pn6f)



也感谢噬幻、蜗牛对文档的贡献。



感谢苍何的 AI 博主朋友们对文档的大力支持，都是很优秀的博主，大家可以关注学习干货：
