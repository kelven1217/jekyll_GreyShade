---
layout: post
status: publish
published: true
title: 使用Privoxy让Dropbox智能代理上网
author:
  display_name: zengleipro
  login: zengleipro
  email: zengleipro@gmail.com
  url: ''
author_login: zengleipro
author_email: zengleipro@gmail.com
wordpress_id: 406
wordpress_url: http://brnjah.com/?p=406
date: '2011-03-21 22:29:07 +0800'
date_gmt: '2011-03-21 14:29:07 +0800'
categories:
- 未分类
tags: []
comments:
- id: 209
  author: kelven
  author_email: kelven1218@gmail.com
  author_url: http://kelven.me
  date: '2011-03-22 12:54:24 +0800'
  date_gmt: '2011-03-22 04:54:24 +0800'
  content: 哈哈 整理得很好呀。
- id: 210
  author: ZengLeiPro
  author_email: zengleipro@gmail.com
  author_url: http://localhost/zenglei
  date: '2011-03-22 13:31:38 +0800'
  date_gmt: '2011-03-22 05:31:38 +0800'
  content: '<a href="#comment-843" rel="nofollow">@kelven</a>: 刚把笔记本搬到办公室来试了一下，成功'
- id: 211
  author: sam
  author_email: samyang115@gmail.com
  author_url: ''
  date: '2012-04-09 11:44:54 +0800'
  date_gmt: '2012-04-09 03:44:54 +0800'
  content: 代理软件怎么用啊,可不可以再详细些,我一直在用这个软件,这个问题出现后就很麻烦
- id: 212
  author: ZengLeiPro
  author_email: zengleipro@gmail.com
  author_url: http://localhost/zenglei
  date: '2012-04-09 13:32:53 +0800'
  date_gmt: '2012-04-09 05:32:53 +0800'
  content: "<a href=\"#comment-882\" rel=\"nofollow\">@sam</a>: \bPrivoxy 本身不能实现代理的，你还是得自己找一个代理软件，再通过
    Privoxy 来实现智能切换。"
- id: 213
  author: sam
  author_email: samyang115@gmail.com
  author_url: ''
  date: '2012-04-09 16:22:07 +0800'
  date_gmt: '2012-04-09 08:22:07 +0800'
  content: '<a href="#comment-883" rel="nofollow">@ZengLeiPro</a>: 就是不会这个代理软件呢,能教下整个过程吗?不想放弃使用DROPBOX'
---
最近身边越来越多人对同步感兴趣，我给他们的建议就是坚持使用Dropbox，不使用国内的类似工具。理由很简单：不安全。不要以为自己是良民就没事，国内的网络环境已经不单是用恶劣可以形容的了，简直到了<a href="http://blog.sina.com.cn/s/blog_473d533601017oyy.html" target="_blank">神经质的状态</a>。

既然网络环境这么差，Dropbox当然不能幸免。要用好还是需要花些功夫的，这篇文章介绍的这个技巧我觉得不错，原文在墙外，为了以后给人推荐时省得麻烦，我就直接转过来了。

以下为转载。<a href="http://plusium.blogspot.com/2011/03/privoxydropbox.html" target="_blank">原文地址</a>

本文撰于2011/03/20，背景是，中国大陆到dropbox.com的http连接会被重置，但是https连接不受影响。如果背景改变了，则本文失效。本文原始链接：http://plusium.blogspot.com/2011/03/privoxydropbox.html

本文主题：令dropbox客户端的http请求经socks代理访问dropbox服务器，而https请求不经代理直接访问。如图：

![](http://lh3.ggpht.com/_EBKhIGWdptk/TYWwFpF_R1I/AAAAAAAAACU/xyvWjw2TWtc/1_thumb1.png?imgmax=800)

高手们只需看到这就行了。以下是详细操作说明。

目前在墙内，dropbox被关键字屏蔽（Wildcard: .dropbox.com），但是客户端还能正常使用，因为客户端和服务器之间使用的是https加密传输。但只有一处是没有使用https的，就是stork47.dropbox.com（在我这是这个地址，其他地方可能不一样）。这个服务器负责将服务器端（或其他客户端）发生的文件更新通知到其他客户端（我猜的，但应该差不多），然后其他客户端才会发起https请求去和服务器同步这些文件。实际中，是客户端每60秒向stork47.dropbox.com查询一次，看是否有文件需要更新。因为该请求没有使用https连接，导致连接一直被RESET，所以某台客户端的更新无法实时反映到其他客户端。

因为一般人可能没有这个需求，所以没多少人关注这个课题。像我以前也只是在家里和公司同步一些文件而已，没有实时更新的必要。有强烈需求的人，就设置让客户端全程走代理，可以解决上述问题，缺点是文件的更新速度受代理服务器速度的影响，大多数情况下没有直接连接的速度快。还有一部分人当需要更新时，直接重启客户端（甚至为此写了个脚本），因为客户端只在启动时才使用https连接检查更新，这样做的缺点显而易见。

最近用privoxy，发现它可以做到分流http和https，于是试验了一下，果然可以分流dropbox的客户端请求了。就是前面说的，让http请求走代理，而https请求不走。这样即满足了实时更新的需求，又兼顾了更新速度，可谓智能代理了。而且我搜索&ldquo;dropbox privoxy&rdquo;，google.com.hk前几页都没有关于这个方法的介绍，所以我这个便算原创了。至于是不是第一个，应该还有高人在，只是我没搜出来而已。因为privoxy还有不少替代方案我没有试过的，比如polipo之类。以下是操作步骤。

1. 需要准备的东西：dropbox客户端（还没注册的请点我的邀请链接注册）、代理软件、privoxy。privoxy的官网是http://www.privoxy.org/，不知道下哪一个的话就点这里直接下载win32下的3.0.17稳定版http://sourceforge.net/projects/ijbswa/files/Win32/3.0.17%20(stable)/privoxy-3.0.17.zip/download。该方案应该与平台无关，但是我只在windows 7下试验过。

2. 打开privoxy的配置文件config.txt，在最后面添加这几行：

```bash
for dropbox: http --> SOCKS Proxy(19841), https --> direct
  forward-socks5   .dropbox.com             127.0.0.1:19841 .
  forward          .dropbox.com:443         .
```

注意将19841修改为你自己的代理软件的端口。如果你的代理软件不是socks类型的，那么就不是加上面的几行，而是加这几行：

```bash
for dropbox: http --> HTTP Proxy(19842), https --> direct
  forward          .dropbox.com             127.0.0.1:19842
  forward          .dropbox.com:443         .
```

注意好多地方有半角的.号，不要弄丢了。

3. 启动privoxy，将dropbox的代理设置为HTTP 127.0.0.1:8118，就OK了。

如果有疑问可以留言讨论，如果有关于软件的其他用法的问题请另行google。