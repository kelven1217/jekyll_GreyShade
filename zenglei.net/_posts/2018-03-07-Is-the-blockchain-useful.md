---
layout: post
status: publish
published: true
title: 区块链是否真的那么有应用价值？
date: '2018-03-07 17:30:00 +0800'
---

江宏的[第二篇区块链文章](http://1byte.io/cryptocurrencies-and-blockchains-consensus-and-decentralization/)解答了很多我之前的疑问，真的是牛。

以下内容是我的微信聊天记录整理的，比较乱，凑合看。

首先该看看他前面对区块链的三分钟讲解。简单来说，算力达到一定比例，这帮算力就可以故意制造假数据，而这些假数据和另外的真实数据就会产生分支，POW 机制下的货币就会根据谁产生了更长的交易记录来判断谁是应该保留下来的分支，然后抛弃其他分支，这就是算力风险。那难道区块链不能区分什么是真假？当然不能，他只能通过一种手段来裁定真假。大部分以比特币为代表的货币采用的是POW（proof of work）工作量证明机制，所谓的工作量，也就是体现成了算力。

举个例子，比特币运行到了现在这个时间点，忽然有两个人发起了两笔不同的记账，第一笔账：你的账户转了500个币给我。第二笔账：你的账号转了5个币给我，那么这个时候就出现了分支。怎么判断真假？方法是两个都先不当真，然后让这两个分支一直做后续的交易记录，然后看谁的交易记录做的更多，说明那一边的支持度更高，那就承认他，抛弃另一个分支。这种方式在大部分情况下是可行的，实际上比特币这么多年无时无刻不在产生分支，因为我说了，要篡改广播数据很简单。但是大部分窜改的分支都失败了，因为他们得不到算力的支持。我之前也被误导了，一直以为是要51%的算力来窜改才有可能改变记录，但是现在看来38%就有很大概率了。那么有能力达到那么大的算力的是谁？各大矿场，很容易联合起来造假。[2014 年时确实曾经有一个矿池 GHash 的算力超过了比特币网络的 50% 长达至少 12 个小时](https://www.extremetech.com/extreme/184427-one-bitcoin-group-now-controls-51-of-total-mining-power-threatening-entire-currencys-safety)，后来被ddos了。

>在 2016 年底的时候 75% 的比特币算力来自于新疆的一座建筑，Bitmain 回应质疑时称这座建筑有多个主人，所以并没有一家独大。2017 年中时，三个矿池控制了 50% 的算力。六个矿池控制了 75% 的算力，并且很可能多个大矿池被同样的人实际控制，这么少的人也很容易结成联盟。

这是比特币的情况，可想而知其他币是更糟。如果你用过比特币钱包转账，你应该会发现需要等待时间确认，这不仅仅是因为记账慢，而是要让整个算力的75%记了你这笔账，才比较保险。75%是每个交易者自己认为的安全线。如果我找你买东西，转给你5个币，但是只有30%的算力记了我的账，你就已经把东西给我了。那如果我当时转的这笔账是假记录，或者我真的转了，但是正好我在一个假分支上，后面被取消了，钱就回到我账户了，你就人财两空。那怎么分辨是不是在假分支上？其实没法分辨。我们假设你已经有38%的算力了，那么你发布了一条假记录，这时候你和真实交易记录产生了分支。我们就先把问题简单化，现在全网络就只有两条分支，你的假分支，和主链上的真分支，那么根据比特币的代码可以推算得出，系统要判断你这条数据分支和另一条哪条是真的，需要看看这两条分支谁先接着记录了80个区块，按照现在的算力和哈希值计算难度来算，需要14小时，但交易早就完成了，但后面被撤销了，而没人会等这么久。如果是买卖，早已人财两空。

那么这就是高风险的地方？只是其中一点。明白了这种工作量证明的判断方式你就可以自己想出来其他风险了。比如网络屏蔽：

>比如海底光缆故障，或者是某个国家的防火墙暂时切断了国际流量。如果被分隔开的是整个网络的一小部分，比如新西兰到澳大利亚之间的光缆断了，那么这个小的部分（新西兰）会因为缺乏算力而无法确认任何交易，直到重新和外界连接起来。如果是整个网络分成了算力相差不大的两部分，比如中国和其他国家，那么区块链会在这两部分分别有不同的分支。当恢复正常后，就会导致其中较短的分支被丢弃，而此时这个分支很可能已经很长，很多用户以为已经确认的交易会被取消。

这是他文章的一个例子，也很好。

只要有分支，较短的最终都将被丢弃了？不管多长，系统必须保证一致性。那么这很容易被操控吗？对普通人不容易。这也是中本聪当时论文的初衷，他觉得你要搞假交易是很难的，只要这个系统足够大，算力就将平均掉，正义终将胜利。但是实际上正在朝着相反方向走。

>很多人喜欢说区块链是 secured by math，意思是说它的安全性是有数学定理保证的，坚不可破的。让我们先忽略逆向计算哈希函数的难度是个猜想而不是定理这个细节，基于 PoW 的区块链的根本假设是恶意攻击者没法比所有诚实矿工都算得更快，所以它们的安全性是基于经济学而不是数学，然而垄断在市场中并不是异常现象。比特币在发展的过程中由于规模经济的原因（规模越大越容易降低挖矿成本）自然地走向了中心化。

>在其他因素不变的情况下，去中心是一个很有益的性质，然而它不是一个独立的变量。在计算和通讯技术没有突破性的发展之前，难以在互联网环境下实现大规模的高效、安全、可靠的去中心化系统。比特币、以太坊和目前主流的区块链在设计上选择了完全去中心化，所以每秒能处理的交易量基本都在个位数或小几十，安全性如本文所说存在着很大的问号，去中心化也因为规模效应被破坏。在去中心化的假设下设计的系统由于原来的假设不成立而变得中心化以后，意味着这些中心得不到应有的监管和保护，结果往往是集两者缺点于一身。

>尽管传统的机构和组织存在着各种各样的问题，但区块链的原理和设计假设难以说服我基于它的大规模去中心化系统会比受到监管、保护、制衡的中心机构更加可靠。我认为区块链未来在一些特定领域可能会成为创造出很高实际价值的工具，但是成功的系统会是多个设计维度平衡妥协的结果。对于去中心化有过于浪漫的想法，或者认为区块链会像互联网一样改变一切的人恐怕是会失望的。如果一个区块链的项目说他们在做一个完全去中心化，并且可以安全可靠地每秒处理十万交易的平台，请牢记一句被证明了无数遍的话：If something is too good to be true, it is too good to be true.

>目前试图提高区块链效率的项目几乎全是通过在一定程度上放弃去中心化来换取效率，而对很多应用场景来说这又有违使用区块链的初衷，并且一旦削弱了对去中心化的要求，往往会有其它更加简单可靠的方案。

如果他说的互联网技术和环境有了突破性发展呢？这种突破性发展目前并未看到。这是基础建设，是循序渐进。除非忽然冒出一个爱因斯坦，不然你就得从2G到5G，从52K到百兆光纤，慢慢来。

刚才说的这些都是基于比特币的POW证明机制，现在有别的方式，比如POS（proof of stack），steem就是这个好像，通过点赞和其他算法来实现证明，反正更多漏洞。但大多数币还都是 pow。只要你听到算力，就是pow。一般通过两种硬件来实现算力，一种是GPU，一种是ascii机，本质都是一样。这些技术缺陷其实大佬们不懂吗？肯定都理解比我们深刻，只是从来不说。

>我认为区块链未来在一些特定领域可能会成为创造出很高实际价值的工具，但是成功的系统会是多个设计维度平衡妥协的结果。对于去中心化有过于浪漫的想法，或者认为区块链会像互联网一样改变一切的人恐怕是会失望的。

这段话就是再说阿里京东的系统。在集中式数据库的背景下做一下分布式处理，再引入一点pow机制，本质还是企业中心化的，只是提高了一定安全性，而新闻可能也是公司公关文，抓抓热点。

最后摘抄腾讯区块链事业部总监的两段话，我觉得这才是未来的趋势：

>在以前，用原来的传统方式，机构之间的业务是要做中心化的清结算的，要对帐，这是需要耗时间的。但用区块链技术来记帐就自动完成了清结算，事后不需要做清结算动作。多方参与的业务，参与时需要有信任，联盟链就把这个痛点解决了，让信任成本降低，运作更透明，效率更高。

>但联盟链也会面临一些困难。现在不少公司做联盟链进程较慢，一是技术问题，另一个是大家对这个技术本身的认知问题，很多机构、行业对区块链这个事情的认知不是特别够，所以还在各方面的早期，技术需要提升，概念需要普及，认知要能够一致才行，多方面因素导致联盟链技术在推行过程中还需要时间。公有链因为TO C，且有经济刺激，再加上炒币，导致更快的吸引眼球，从而引起更多人关注。