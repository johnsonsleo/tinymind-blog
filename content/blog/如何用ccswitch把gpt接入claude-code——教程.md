---
title: 如何用ccswitch把gpt接入claude code——教程
date: 2026-07-13T05:16:16.341Z
---

## [如何用ccswitch把gpt接入claude code——教程](https://x.com/Wangpici/status/2076230462696227209)

![图像](https://i.imgur.com/weyZ3qW.png)

codex的harness做的实在不行，但是gpt 5.6 确实是一条巨龙。突发奇想试了试把codex的gpt接入到claude code里面，提升非常巨大！

下面是把codex的gpt接入到claude code的教程：

第0步， 我们要用到 ccswitch，[https://github.com/farion1231/cc-switch/releases](https://github.com/farion1231/cc-switch/releases) 在这里下载 ，随便选一个你会用的安装包

![图像](https://i.imgur.com/OIRx0e3.png)

第1步 打开ccswitch，点击claude code的标志，然后点击这个+号来增加一个配置

![图像](https://i.imgur.com/u0ez2Am.png)

第2步，选择provider，我们选择codex

![图像](https://i.imgur.com/YOZdRMH.png)

然后我们选择使用chatgpt登录

![图像](https://i.imgur.com/UuQAE1n.png)

点击之后会马上弹出一个网页，如果你不小心关掉了网页，可以在这里重新打开

![图像](https://i.imgur.com/dqXoeOi.png)

在打开的网页里面点击这里来登录

![图像](https://i.imgur.com/NIpgss0.png)

如果点击之后网页提示 Codex 裝置代碼授權没打开，那么你可以点击跳转链接。如果你不小心关掉，那么它在这里：点击自己的账号

![图像](https://i.imgur.com/vruYmHJ.png)

然后点击设置

![图像](https://i.imgur.com/iNstSZi.png)

点击安全性与登入，然后拉到最下面打开Codex 裝置代碼授權

![图像](https://i.imgur.com/RUG56PA.png)

之后就可以在之前的界面里面正常输入代码了

![图像](https://i.imgur.com/XtyhMxa.png)

如果你不知道代码在哪，代码其实在这里

![图像](https://i.imgur.com/acpqtnT.png)

代码输完之后其实可以看到账号出现了，选中自己的账号吧

![图像](https://i.imgur.com/PVb2Col.png)

第2步，开始配置codex的模型

刚在的界面滚轮向下拉，可以看到模型映射，点击获取模型列表，可以拉下来所有的codex可用的模型

![图像](https://i.imgur.com/8TWkzNG.png)

拉完之后就可以看到下拉菜单了，开始选模型。

![图像](https://i.imgur.com/G0IK6uv.png)

我们这样配，给fable配5.6 sol，opus也配sol，sonnet配terra，haiku配luna，按照你的需求来配也可以！

![图像](https://i.imgur.com/im92Wh5.png)

之后不用改什么了，直接保存！

第3步，我们得打开路由！因为openai api格式和A\的格式不一样，所以需要路由！

点击这个设置

![图像](https://i.imgur.com/JuiBYIq.png)

点开这个路由界面

![图像](https://i.imgur.com/Jr3o97y.png)

打开路由总开关，然后再打开claude 的路由，如图所示

![图像](https://i.imgur.com/f7UWtFA.png)

ok了，我们回到主界面，点击启动，这时候我们的路由和配置都应该启动了

![图像](https://i.imgur.com/ZkdLMlj.png)

好了。这样就配置好了。

如果你是一次安装claude code，你还要在ccswitch里面打开这个，这样就不会跳认证了。

![图像](https://i.imgur.com/UDD5QYr.png)

第4步，打开claude code 试一试，可以看到有我们刚刚搞进去的模型了

![图像](https://i.imgur.com/gjDlsEB.png)

尝试chat一下尝试 chat 一下

![图像](https://i.imgur.com/buXZdec.png)

ok，正常回复了！完成了！