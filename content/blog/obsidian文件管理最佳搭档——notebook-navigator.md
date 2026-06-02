---
title: Obsidian文件管理最佳搭档——Notebook Navigator
date: 2026-06-02T00:46:34.097Z
---

# [Obsidian文件管理最佳搭档——Notebook Navigator{gzh作者：徒手开榴莲}](https://mp.weixin.qq.com/s/gNawe6hXfPUGx45F5NridQ)

 

## 一、背景

作为一个 Obsidian 重度使用者, 侧边栏的一直是我的“意难平”

原因不仅是样式丑, 就连基本的排序都不支持(我甚至为此单独装了个插件, 算是差强人意)

原生文件管理器用久了还会有一个问题：

**文件越多，目录越乱。**

尤其是当笔记开始分成：

- • 素材
- • 草稿
- • 已发布
  - • 01xxx
  - • 02xxx
- • 归档
- • 模板
- • ...

层级一深，找一篇文章就要反复展开文件夹。

而 Notebook Navigator 做的事很简单：

**它不改变你原来的目录，只是在 Obsidian 里重新做了一个更好用的导航界面。**

你可以把它理解成 Windows 桌面上的快捷方式。

原文件还在原位置。

它只是让你更快找到、打开和管理这些文件。

------

### 作者简介

这个神似《越狱》中 T-Bag 的精神小伙，就是 Notebook Navigator 的作者——Johan Sanneblad, 拥有软件开发博士学位，曾为苹果、电子艺术、谷歌、微软、乐高、SKF、沃尔沃汽车、沃尔沃集团和雅马哈等公司从事创新开发工作

![图片](https://i.imgur.com/IjxEkJf.png)

------

## 二、概念解释

介绍功能之前，先把几个基础概念说清楚。

------

### 2.1 窗口命名

Notebook Navigator 主要分成两个窗口：

左侧叫 **导航窗口**。

右侧叫 **列表窗口**。

当前是双窗模式，水平方向。

后面演示也主要用这个模式。

![图片](https://i.imgur.com/h4xYFRL.png)

它也支持双窗模式的垂直方向。

![图片](https://i.imgur.com/qA9Rc4a.png)

简单理解：

**导航窗口负责选目录，列表窗口负责显示笔记。**

------

### 2.2 目录形成

Notebook Navigator 不会改动 Obsidian 原本的目录。

Obsidian 原来的目录还在。

插件只是额外生成了一个导航目录。

![图片](https://i.imgur.com/ZVNNRfg.png)

所以不用担心装了插件以后，把原来的 Vault 结构弄乱。

它只是多了一个更方便的入口。

------

## 三、核心功能

Notebook Navigator 功能不少。

下面这些，是作者觉得最值得优先了解的功能, 也是最核心的功能

------

### 3.1 双窗模式：左边选目录，右边看文章

![图片](https://i.imgur.com/obGFAQh.png)

左侧看目录。

右侧看当前目录下的文章列表。

相比原生文件管理器，它更适合笔记数量较多的情况。

------

### 3.2 隐藏文件显示：需要时再打开

它可以显示隐藏文件。

![图片](https://i.imgur.com/SzKNkJn.png)

![图片](https://i.imgur.com/pbPnhpo.png)

如果笔记内容比较多, 比如图片、或者临时文件等, 可以在此设置隐藏显示, 目录会比较清爽

------

### 3.3 排序规则：按你习惯排列文件

可以设置文件排序方式。

![图片](https://i.imgur.com/ygf8Y4A.png)

比如按名称、创建时间、修改时间等排序。

文章多了以后，这个功能很实用。

------

### 3.4 子文件显示：最值得打开的功能

这是我认为最核心的功能。

关闭时，只显示当前文件夹里的文章。

先看导航目录。

![图片](https://i.imgur.com/a9Fp2nZ.png)

再回到原本目录确认一下。

![图片](https://i.imgur.com/ZaxsbqE.png)

打开“显示子目录文件中的文件”之后：

![图片](https://i.imgur.com/PnsCvvd.png)

它会把子文件夹里的文章也一起显示出来。

再回到原目录看下：

![图片](https://i.imgur.com/lNF5H11.png)

这个功能适合多层级目录。

比如你点开“资源”这个大目录，就能看到下面所有子目录里的文章。

不用一层一层点进去找。

------

### 3.5 列表展示模式：横向、纵向都能切

列表窗口支持不同展示方式。

当前是双窗模式下的纵向布局。

![图片](https://i.imgur.com/NRaeoGN.png)

![图片](https://i.imgur.com/rClGJn3.png)

屏幕大，可以用左右布局。

屏幕窄，可以用上下布局。

按自己的使用习惯来就行。

------

### 3.6 标题位置设置：解决标题被挤压

如果 Vault 名字过长，或者列表窗口宽度不够，标题容易被压缩。

![图片](https://i.imgur.com/9iD0YvN.png)

这时候可以选择：

**显示在列表窗格。**

![图片](https://i.imgur.com/ftHhm3d.png)

效果如下：

![图片](https://i.imgur.com/TvkhR0D.png)



------

### 3.7 快捷方式：一拖、二点、三右键

快捷方式有三种添加方式。

第一种：直接拖过去。

第二种：点星标。

![图片](https://i.imgur.com/MjwsYNW.png)

第三种：右键添加。

![图片](https://i.imgur.com/XW57BnC.png)

使用前建议先设置快捷键。

![图片](https://i.imgur.com/PQBUJ7z.png)

不设置快捷键的快捷方式不快捷。

------

### 3.8 目录排序和标签排序

目录排序可以在导航窗口顶部设置。

选中排序之后，可以通过右侧上下箭头手动调整目录位置。

![图片](https://i.imgur.com/RHgsikA.png)

标签也可以设置排序方式。

![图片](https://i.imgur.com/yZ0Mq8o.png)

目录多、标签多的时候，这两个功能比较有用。

------

### 3.9 搜索：标题、标签、收藏都能用

Notebook Navigator 的搜索方式比较丰富。

第一种：当前目录下标题模糊匹配。

![图片](https://i.imgur.com/MsQKsjY.png)

第二种：搜索 + 标签。

输入标签前缀 `#` 即可。

当前搜索的是：

标题包含 `llm`，并且标签是 `clippings`。

![图片](https://i.imgur.com/ZxHeRZh.png)

第三种：把搜索结果收藏进快捷方式。

搜索完成后，点击右侧的星标即可。

![图片](https://i.imgur.com/pg3LYvA.png)

第四种：多标签高级搜索。

条件“且”：先按 `Command + 标签1`，再按 `Command + 标签2`。

![图片](https://i.imgur.com/rC1CoUn.png)

条件“或”：先按 `(Command + Shift) + 标签1`，再按 `(Command + Shift) + 标签2`。

![图片](https://i.imgur.com/0RnM9ey.png)

------

### 3.10 固钉：把常用笔记固定到顶部

固钉就是把文章固定在列表顶部。

![图片](https://i.imgur.com/dpgSA9A.png)

如果固定的内容比较多，可以打开这个开关：

让固钉内容只显示在所在文件夹顶部。

![图片](https://i.imgur.com/FtTkEhw.png)

这样不会所有固钉内容都混在一起。

------

### 3.11 自定义样式：图标、颜色、背景都能改

右键可以修改文件夹或笔记图标。

![图片](https://i.imgur.com/e9MabdH.png)

![图片](https://i.imgur.com/VTJpGSa.png)

样式可以复制给其他文件夹。

![图片](https://i.imgur.com/C8GSpye.png)

![图片](https://i.imgur.com/eZqsc7h.png)

设置里还有很多图标包可以下载。

![图片](https://i.imgur.com/7mOZr5c.png)

标签也可以加颜色。

![图片](https://i.imgur.com/pVCbnQV.png)

子文件夹可以继承父文件夹样式。

![图片](https://i.imgur.com/XWNeAJZ.png)

![图片](https://i.imgur.com/8vALJe9.png)

也可以调整根项目间距，让目录更清楚。

![图片](https://i.imgur.com/0uihBDH.png)

颜色和背景的设置类似，不做赘述。

![图片](https://i.imgur.com/lGV6fu9.png)

如果装了 Style Settings 插件，还可以进一步调整样式。

![图片](https://i.imgur.com/Qxl0I8b.png)

![图片](https://i.imgur.com/TpdWkjn.png)

最终效果如下：

![图片](https://i.imgur.com/fDmlqor.png)

样式功能不是刚需。

但如果你每天都打开 Obsidian，一个清楚顺眼的界面还是很舒服的。

------

### 3.12 添加元信息：让列表展示更多内容

Notebook Navigator 支持显示前置元数据。

![图片](https://i.imgur.com/lmmY4ze.png)

所谓前置元数据，就是 Markdown 文章源码模式最前面的信息。

![图片](https://i.imgur.com/ZDJrTzK.png)

比如我使用 `background` 字段，效果如下：

![图片](https://i.imgur.com/cHKlxYX.png)

这个功能适合笔记管理比较细的人。

比如可以给文章加上：

```
---
status: 草稿
type: 公众号文章
topic: Obsidian
---
```

这样列表里能看到更多辅助信息。

不过新手不用一开始就折腾这个。

------

## 四、其他

插设置项都是英文直译。

虽说都是汉字, 但如果没有有技术背景, 作为中国人就是很难理解

所以我的建议是：

**别一上来全配置。**

先用部分核心功能取悦自己,

用顺了一些，再慢慢探索其他功能。

------

## 五、结尾

Notebook Navigator 不是必装插件。

如果你只是偶尔记几条笔记，原生目录就够用。

但如果你的 Obsidian 已经开始放素材、草稿、项目、归档，文件越来越多，它就很值得尝试。

个人感觉, 搭配了 Notebook Navigator 的 Obsidian, 才像真正步入正轨