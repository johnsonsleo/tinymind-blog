---
title: 微信收藏被加密锁死？frida逆向迭代解密生成种图表可视化报告
date: 2026-04-18T12:37:01.552Z
---



## [微信收藏被加密锁死？我用frida逆向6轮迭代解密2000条数据，生成7种图表可视化报告](https://x.com/GoSailGlobal/status/2044732194309177579?s=20)

![图像](https://i.imgur.com/2r1gltk.png)

微信收藏是很多人的数字仓库，十年积累下来几千条收藏，但这些数据被锁在加密数据库里，连导出都做不到。用 Claude Code 写了一个 Skill，从加密的微信 Mac 本地数据库端到端解密，最终生成一份包含 7 种图表的交互式可视化报告。光密钥提取这一步就迭代了 6 轮，踩了 8 个坑

## 为什么微信收藏数据这么难拿

微信 Mac 4.x 的收藏数据存在本地的 favorite.db 里，用的是 SQLCipher 4 加密。AES-256-CBC 加密，HMAC-SHA512 校验，PBKDF2 跑 256000 轮派生密钥。这套加密方案意味着即使拿到了数据库文件，没有密钥也完全打不开

更麻烦的是密钥不以明文存储在任何配置文件里。它在微信运行时由系统级函数 CCKeyDerivationPBKDF 动态派生，用完就留在内存里，不会写到磁盘上。想拿到密钥，只能在运行时拦截这个函数调用

![图像](https://i.imgur.com/xPbqzXg.png)

## 6 轮密钥提取迭代：从暴力扫描到精准 Hook

整个项目最难的部分是密钥提取，前 5 轮全部失败，第 6 轮才找到正确方法

第 1 轮尝试用 C 写内存扫描工具，在微信进程的 RW 内存区域搜索 x'hex' 格式的密钥。扫描完毕，0 keys found。WeChat 4.x 根本不用这种格式存密钥

第 2 轮改思路，从 DB 文件头提取前 16 字节的 salt，在内存里搜索这段 salt 字节序列，取紧邻的 32 字节当密钥。找到了匹配，但解密失败。仔细看发现匹配到的是 ASCII 字符串 "matchinfo" 和 "optimize"，是 SQLite 内部函数名，不是密钥

第 3 轮上了 HMAC 暴力验证。遍历整个内存空间每个 8 字节对齐的位置，把那 32 字节拿去跑 HMAC-SHA512 校验。扫了 4.2GB 内存，89M 个候选位置，跑了 347 秒，没找到。事后分析是过滤条件太激进，跳过了含 ASCII 字符或零字节的区域，结果把真正的密钥位置也过滤掉了

第 4 轮去掉所有过滤条件，把对齐从 8 字节放宽到 4 字节。215M 个候选，跑了 817 秒，还是没找到。这时才意识到根本原因：内存里存的是 PBKDF2 派生后的 derived key，不是原始的 enc\_key。在内存里扫描原始密钥这条路本身就走不通

第 5 轮换方向，试 DYLD\_INSERT\_LIBRARIES 注入和 lldb 调试器附加。DYLD 注入被 macOS 直接阻止，captured\_keys.log 是空的。lldb 返回 "Not allowed to attach to process"。task\_for\_pid 返回错误码 5。全是 SIP 和 Hardened Runtime 的保护

第 6 轮找到了突破口：把微信从 /Applications 复制到桌面，用 ad-hoc 签名去掉 Hardened Runtime 限制，然后用 frida 以 spawn 模式启动微信，hook 系统库的 CCKeyDerivationPBKDF 函数。这个函数是所有 PBKDF2 密钥派生的入口，hook 它就能在密钥生成的瞬间截获完整参数：密码、salt、轮数、派生结果。匹配 favorite.db 的 salt 后，拿到了正确的 enc\_key，解密成功

![图像](https://i.imgur.com/rUoiNiw.png)

## 8 个关键踩坑点

密钥提取成功后，后续的解密、解析、可视化又踩了一连串坑

SIP 阻止签名是第一个坑。/Applications 目录下的 App 受 SIP 保护，签名操作直接报错。解决方案是把微信复制到 ~/Desktop 再签名，绕过 SIP 的路径保护

sudo 启动微信导致数据目录错位是第二个坑。用 sudo 启动微信后，进程以 root 身份运行，数据目录变成了 /var/root 下面的路径，访问不到用户自己的收藏数据。去掉 sudo 以普通用户身份运行就好了

第三个坑是 favorite.db 的密钥在微信启动时不会加载。第一次跑 frida 捕获了十几个 PBKDF2 调用，但没有一个的 salt 能匹配 favorite.db。微信只在用户打开收藏页面时才加载这个数据库。frida 运行期间必须手动点开微信的收藏页面

WeChat 4.x 表结构变化是第四个坑。3.x 版本用 FavItems 和 FavDataItem 两张表，4.x 改成了 fav\_db\_item 单表，content 字段是 XML 格式。解析逻辑需要检测表名自动适配

XML 内容解析的坑最多。文章标题在 pagetitle 不在 title 里，聊天记录要从 datalist 下面的 dataitem 逐条提取 datadesc 再拼接，视频标题在 dataitem 内部的 datatitle。HTML 实体编码也没统一处理，一堆 需要用 html.unescape 解码

JS 模板字符串引号冲突导致了一个隐蔽的 bug。图片加载失败时的 onerror="[this.style](https://this.style/).display='none'" 在 Python f-string 生成 JS 模板字符串时产生了引号嵌套错误，导致整个收藏浏览区的 JS 静默失败，页面没有任何报错但功能全部失效。用 " 替代内层引号解决

最后一个坑是 file:// 协议下 inline onclick 事件不工作。浏览器安全策略限制，改用 event delegation 通过 addEventListener 在父元素上监听点击事件

![图像](https://i.imgur.com/MRQvlyr.png)

## 可视化报告：7 种图表 + 交互浏览

解密解析完成后，生成的是一个单文件 HTML 报告，内联了所有 ECharts 依赖，可以直接分享

报告顶部是统计仪表盘，显示收藏总数、时间跨度、日均收藏量、来源数量。亮点发现区会自动标注最忙的一天、最爱的来源、主力收藏类型

月度趋势用折线加面积图展示，能看出哪些月份收藏特别密集。内容类型分布用甜甜圈图，一眼看出文章占比最大。来源 Top 15 用水平柱状图排列，哪些公众号被收藏最多一目了然

活跃热力图是最有意思的一张，按星期和小时两个维度展示收藏行为。能看出深夜和周末是收藏高峰期。配合小时柱状图和星期柱状图，行为模式非常清晰

词云从所有收藏的标题和描述中提取关键词生成。标签云展示微信收藏的自定义标签分布

报告底部是完整的收藏浏览区，支持按内容类型筛选、按标签筛选、全文搜索、排序和分页。点击任何一条收藏会弹出详情弹窗，显示完整内容、原文链接、来源和标签信息

![图像](https://i.imgur.com/t5xsOgR.png)

## 做成 Claude Code Skill：一句话跑完全流程

手动跑完一遍这个流程需要十几个步骤，把它封装成 Claude Code Skill 之后，在 Claude Code 里说一句"微信收藏可视化"就能自动执行全部流程

Skill 的执行逻辑分五步。第一步确认数据源，已有解密 DB 就跳过密钥提取。第二步密钥提取，自动复制微信、签名、启动 frida hook，等用户打开收藏页面后匹配 salt 获取密钥。第三步解密数据库，逐页 AES-256-CBC 解密加 HMAC-SHA512 校验。第四步解析数据，自动识别 WeChat 3.x 和 4.x 的表结构差异，解析 10 种收藏类型的 XML 字段。第五步生成报告，输出单文件 HTML

整个项目开源在 GitHub，包含完整的解析脚本、报告生成器和模拟数据生成工具

项目地址：[github.com/zhuyansen/wx-favorites-report](https://github.com/zhuyansen/wx-favorites-report)

![图像](https://i.imgur.com/1Hn1oGI.png)

## 技术选型和已知限制

密钥提取用 frida 17.x，这是唯一能绑过 macOS SIP + Hardened Runtime 保护的方案。数据库解密用 PyCryptodome，纯 Python 实现，不需要编译 SQLCipher。数据解析用标准库 sqlite3 加正则匹配 XML，没有引入额外依赖。可视化用 ECharts 5.x CDN 版本加 echarts-wordcloud 插件，全部内联到 HTML 里

已知限制有几个。图片和视频的原始内容存在微信 CDN 上，是加密格式，报告里只能显示文字信息和公众号文章缩略图。密钥提取只支持 macOS，需要 frida 环境。每次微信大版本更新后可能需要重新签名桌面副本

这个项目的核心价值是把微信收藏从一个被加密锁死的黑盒变成了可检索、可分析、可分享的结构化数据。十年收藏的 2000 条内容，终于能看到全貌了

---

这个工具太强了！我已经把我微信收藏的143条数据全部成功解析了出来。这个做出来的网站是skill内置的，但是数据反正都在本地，自己想怎么分类整理都可以。

Mac电脑是唯一的限制。

收藏夹不再吃灰，是AI时代给我最强的体感之一。

小红书、X、微信，已经全部打通了。。。太强了！



> ![图像](https://i.imgur.com/QltpRDX.png) ![图像](https://i.imgur.com/HWxuzsP.png) ![图像](https://i.imgur.com/iCBExBg.png) ![图像](https://i.imgur.com/jpZndOX.png) 

---

我靠！其实这个工具不止能够解析微信收藏！还能够解析所有的朋友圈和聊天记录！

秘钥实时更新，能够直接做监控某些群聊的每日日报了，能够过滤大量的垃圾信息，提取高质量内容，每天当皇帝就行了。

我接下来就去找前阵子那些整理微信聊天记录的提示词去了，他们在我原来的win电脑上面吃灰了，得重新找。。。

![图像](https://i.imgur.com/qWZvU0d.png)