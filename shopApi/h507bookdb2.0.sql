-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-03-02 17:40:23
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `h507bookdb`
--

-- --------------------------------------------------------

--
-- 表的结构 `b_book`
--

CREATE TABLE `b_book` (
  `book_id` int(11) NOT NULL,
  `book_title` varchar(255) NOT NULL,
  `book_author` varchar(255) NOT NULL,
  `book_price` float NOT NULL,
  `book_pudate` int(11) NOT NULL,
  `book_status` char(5) NOT NULL,
  `book_desc` text NOT NULL,
  `cate_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_book`
--

INSERT INTO `b_book` (`book_id`, `book_title`, `book_author`, `book_price`, `book_pudate`, `book_status`, `book_desc`, `cate_id`) VALUES
(1, '荒野求生', '《荒野求生》编辑组译', 18.5, 1480490660, 'true', '<p>\r\n　　“求生意识、寻找水源、生活技能、制作工具、建避难所、应对天气、辨别方向、医学常识”——贝尔格里尔斯手把手教你荒野求生八要素。<br>\r\n\r\n　　他在Discovery频道主持的《荒野生存》（Man vs.Wild）热播至今。<br>\r\n　　他与《怀斯曼生存手册》的作者一样，曾是英国皇家特种部队成员。<br>\r\n　　他21岁执行跳伞任务时身受重伤，几近瘫痪，23岁征服珠峰。<br>\r\n　　他曾经跨越结冰的北大西洋、曾经举办高空晚宴破世界纪录。<br>\r\n　　他是《登上珠峰的人》、《面对冰封的海洋》等畅销书的作者。<br>\r\n　　他挑战过世界上*危险的环境，他是世界上*可爱的疯子，天生的冒险家。</p>', 3),
(2, '三生三世', '唐七', 78.5, 1480490660, 'false', '<div class="descrip"><span id="content-all"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 那一世，大荒之中一处荒山，成就她与他的初见。 <br>　　桃花灼灼，枝叶蓁蓁，妖娆伤眼。 <br>　　记忆可以封存，可心有时也会背叛，忘得了前世情缘，忘不了桃林十里，亦忘不了十里桃林中玄衣的少年。 <br><br>　　这一世，东海水晶宫，他们不期而遇。 <br>　　不是每个人都能看透这三生三世的爱恨交织，只要你还在，只要我还爱，那么，这世间，刀山火海，毫不畏惧。 <br>　　有些爱，藏在嘴边，挂在心尖。 浮生若梦，情如流水，爱似桃花…… <br></div>', 3),
(3, 'Effective Objective-C 2.0', 'Matt Galloway', 88.5, 1480490660, 'true', '<p>　　《Effective Objective-C 2.0：编写高质量iOS与OS X代码的52个有效方法》是C++开发大师Scott Meyers亲自担当顾问编辑的“Effective Software Development Series”系列丛书中的新作。从语法、接口与API设计、内存管理、框架等7大方面总结和探讨了Objective-C编程中52个鲜为人知和容易被忽视的特性与陷阱。书中包含大量实用范例代码，为编写易于理解、便于维护、易于扩展和高效的Objective-C应用提供了解决方案。<br>　　《Effective Objective-C 2.0：编写高质量iOS与OS X代码的52个有效方法》共7章。第1章通论与Objective-C的核心概念相关的技巧；第2章讲述的技巧与面向对象语言的重要特征（对象、消息和运行期）相关；第3章介绍的技巧与接口和API设计相关；第4章讲述协议与分类相关的技巧；第5章介绍内存管理中易犯的错误以及如何避免犯这些错误；第6章介绍块与大中枢派发相关的技巧；第7章讲解使用Cocoa和Cocoa Touch系统框架时的相关技巧。</p>', 1),
(4, '第一行代码 Android 第2版', '郭霖', 9.8, 1480490660, 'false', '《第一行代码 Android 第2版》被Android开发者誉为Android学习经典。全书系统全面、循序渐进地介绍了Android软件开发的知识、经验和技巧。 第2版基于Android 7.0对第1版进行了全面更新，将所有知识点都在新的Android系统上进行重新适配，使用全新的Android Studio开发工具代替之前的Eclipse，并添加了对Material Design、运行时权限、Gradle、RecyclerView、百分比布局、OkHttp、Lambda表达式等全新知识点的详细讲解。 本书内容通俗易懂，由浅入深，既适合Android初学者的入门，也适合Android开发者的进阶。>', 1),
(5, '我的世界（4册）', '艾阁蒙集团', 138.5, 1484270172, 'true', '<div class="descrip"><span id="content-show" style="display: none;">《我的世界 新手导航》：<br>如果你是一个新手，第一次进入这个充满未知的新世界时，危机总是如影随形。官方攻略手册第一本《新手导航》指导你学习如何寻找资源、建立住所、合成工具、制造盔甲和武器来抗击怪物，保护自己。遵照《我的世界》专家的建议，以及开发者Jeb和创始人Notch的亲身指导，这本书将带你一步步走向成功。<br>《我的世界 建筑指南》：<br>在《我的世界》中，只有想不到的，没有不能创造的，官方攻略手册第二本《建筑指南》里包含各类建筑技巧，以及专业建筑团队——FyreUK循序渐进的指导。你将学会如何建造房屋、桥梁、船舶、空岛和过山车，惊奇的建筑不胜枚举。借由这本书，你将很快成为顶尖建筑师，就在弹指一挥间！<br>《我的世界 战斗指南》：<br>身为一名喜爱探险的冒险者，在《我的世界》中，你从不孤单，敌人的威胁永远与你相伴。官方攻略手册第三本《战斗指南》将教你认识敌人，保护自己，抵抗所有攻击型生物和敌对的玩家。在这里，你可以学习搭建堡垒、合成盔甲、布设陷阱，加上各位专家的悉心指导，你将立即成为所向披靡的勇者，傲视《我的世界》！</span><span id="content-show-all" style=""><p><b>《我的世界 新手导航》</b>：</p><p>如果你是一个新手，第一次进入这个充满未知的新世界时，危机总是如影随形。官方攻略手册第一本《新手导航》指导你学习如何寻找资源、建立住所、合成工具、制造盔甲和武器来抗击怪物，保护自己。遵照《我的世界》专家的建议，以及开发者Jeb和创始人Notch的亲身指导，这本书将带你一步步走向成功。</p><p><b>《我的世界 建筑指南》</b>：</p><p>在《我的世界》中，只有想不到的，没有不能创造的，官方攻略手册第二本《建筑指南》里包含各类建筑技巧，以及专业建筑团队——FyreUK循序渐进的指导。你将学会如何建造房屋、桥梁、船舶、空岛和过山车，惊奇的建筑不胜枚举。借由这本书，你将很快成为顶尖建筑师，就在弹指一挥间！</p><p><b>《我的世界 战斗指南》</b>：</p><p>身为一名喜爱探险的冒险者，在《我的世界》中，你从不孤单，敌人的威胁永远与你相伴。官方攻略手册第三本《战斗指南》将教你认识敌人，保护自己，抵抗所有攻击型生物和敌对的玩家。在这里，你可以学习搭建堡垒、合成盔甲、布设陷阱，加上各位专家的悉心指导，你将立即成为所向披靡的勇者，傲视《我的世界》！</p><p><b>《我的世界 红石指南》</b>：</p><p>官方攻略手册第四本《红石指南》的一切知识将指引你通往无奇不有的红石世界。从最基本的采掘红石、逻辑电路到更多的高级机械。本书循序渐进，由浅入深地提供指导，让你对红石世界充满向往，伟大的红石工程师和他们的团队创造出创意非凡的作品，定能帮你脑洞大开！让你真正成为一个无所不能的大师。</p></span><div class="section_show_more"></div></div>', 2),
(6, '给你自己一分钟', '斯宾塞·约翰逊', 25, 1484270172, 'true', '<p>??从前有个年轻人，他始终在追求更大的成功——更出色的事业，更幸福的家庭。他从早忙到晚，认为勤奋是通向成功的必经之路。直到有一天，他发现疲惫焦虑的生活，原来看不到尽头。他开始怀疑自己：是我想要的太多，还是努力得不够？付出一定会有收获吗？工作与生活真的可以兼顾吗？外在的成功与内心的成就可以同时实现吗？……带着数不清的问题，苦恼的他去请教一位智者。智者的答案很简单——留给自己一分钟。这也许是改变你人生的一分钟。</p><p>??斯宾塞博士通过通俗易懂的寓言，配合简单明了的总结金句，说明了一个简单的道理。现代快节奏生活中，我们会花很多时间在工作、人际上，却没时间审视自己的需求，以致迷失自己。用一分钟审视自己、照顾自己、调整心态，获得内在的满足感，才能更好地照顾别人，在工作和家庭中游刃有余。</p><p>心灵愈疗书《给你自己一分钟》同款周记手账，内含年历、月计划、周计划、时间表和愿望清单，细化生活的每一分钟，记下更好的自己。</p>', 3),
(7, '写给儿童的中国历史', '陈卫平', 177.5, 1486893557, 'true', '<p>\r\n	本书以近百篇精彩故事、上千幅插画贯串上古至现代的中国历史，为儿童描绘一个完整具体的轮廓，以儿童的生活经验与历史因果相结合，叙史故事化、新鲜的文字妙喻再加上写实精美的插画，足以唤起儿童对历史的兴趣；精彩有趣的故事不仅带给孩子想象与创造的空间，真实的历史更给孩子思考与判断的智慧，是一部让孩子认识自己、喜欢历史、见贤思齐的经典巨作。\r\n</p><p>\r\n	联系我们：微信：buyintongshu 微博：@步印童书馆 电话：010-62829507\r\n</p><p>\r\n	联系我们：微信：buyintongshu 微博：@步印童书馆 电话：010-62829507\r\n</p>', 3),
(8, '心若淡定，便是优雅', '张其姝', 16.4, 1486894123, 'true', '<p><b>&nbsp;遇到一个有故事的女子，就像目睹一场花事。它热热烈烈盛放，无所顾忌，由生到死。</b><b></b></p><p><b>&nbsp;从古至今的美女很多，美而慧的女子也不少。</b><b></b></p><p><b>&nbsp;美而慧，又有故事的女子，那便是一出传奇了。</b><b></b></p><p><b>&nbsp;本书讲述了</b><b>26</b><b>个奇女子的故事，中间还穿插了作者身边一些女子的故事。</b><b></b></p><p><b>&nbsp;两个时空、两种人生，相互交织，互相呼应。</b><b></b></p><p><b>&nbsp;在她们的飞扬与落寞中，我们看到了她们或成功、或失败的原因；于她们的美丽与哀愁中，我们会明白一些道理、一些真理。</b><b></b></p><p><b>&nbsp;愿她们的人生历程，成为你我的指路明灯。</b><b></b></p>', 3),
(9, '简单断舍离生活', '山下英子', 27.7, 1486949363, 'true', '<div class="descrip"><span id="content-all"></span>★余裕让生活变美：空间的宽裕、时间的充裕，还有人际关系的从容就是“余裕”，这种余裕就是为生活带来情趣的“美”。作者正是因为舍弃了多余的物品而常年身心愉悦哟。&nbsp;\r\n<div>★首次自住宅大公开。作者以自己的家居为例，展示了每个空间（客厅、厨房、浴室、卫生间、桌边、玄关、卧室）的“断舍离”过程和结果，连自己的内衣也毫不避讳地展示呢，真是诚意满满哦！ &nbsp;</div>\r\n<div>★舍弃那些不快乐、不需要、不适应的东西，你的人生将发生巨变：做到所有东西都可以一步取出；随处放置纸巾；用三分法管理工作；将餐桌作为工作桌……</div></div>', 3),
(10, '学会自己长大', '和云峰 ', 23.5, 1486949363, 'true', '<p>\r\n　　走吧，走吧，人总要学会自己长大。任何人都不能代替你成长，你的人生需要被你自己掌控。这是一本关于成长的书，涉及青少年成长过程中无法避开的七类问题：自我问题、学习问题、情绪问题、行为问题、人际关系问题、情感问题和目标生涯规划问题，是北大博士和云峰老师为青少年量身打造的青春自助手册。<br>\r\n\r\n书中没有倚老卖老的姿态，没有千篇一律的说教，完全是平等而真诚的态度，充满着机智诙谐的幽默。如果阅读时，书中的一些言语打动了你，一些文字启发了你，那么这些都仅仅是一个开始，最重要的是你要把这些知识运用到你的生命中去。再好的方法也需要你的执行，每天学习一点点，每天改变一点点，坚持下去，一年后，变化超乎你的想象！<br>\r\n 相信在这本书中你能找到解决问题的方法，帮你顺利度过美好而富有挑战的青春期。</p>', 2),
(11, '不如去闯', '李柘远', 29.1, 1486949667, 'true', '<p>《不如去闯》是“90”后双料学霸李柘远写给年轻人的人生使用手册，让年轻人从此走上进阶开挂之路。本书内容囊括求学中遇到的趣事，工作中遇到的瓶颈以及自励心的建立。内容对年轻人有着实际引导作用，但又不会让人感到枯燥乏味。是一部少见的励志与趣味并存的散文集。<br>\r\n本书不是单纯的学习方法的罗列，而是给处于迷茫期的你点明方向。不仅是学生，对于当下的年轻人，本书也可以帮助你建立自励心和规划力。同时，书中的小故事介绍了美国当地及校园生活的风土人情，可以为读者打开视野，了解到更多书本上没有的有趣的经历。</p>', 3),
(12, '聪明女人背小包', '横田真由子', 30.6, 1486950043, 'true', '<div class="descrip"><span id="content-all"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 想轻装出门吗？只要试试改背小包，便会让你顿显优雅高贵的气质。带着小包，你可以轻轻送送出门，可以离开每天走过的一成不变的路，走不同的地方看看。会让您拥有积极向上的好奇心。视野拓宽了，您便能够找到许多美好的事物。例如，无意邂逅一位一直想见到的人，这样的好运也往往只会找到比平时靓丽的人。那些总是美丽而温柔的人，往往都只有几件特别上品的随身物品。生活在自己钟爱的物品中，如果一个人能够获得这样的生活，自然会拥有高贵大度的气质。最重要的，就是要找到对自己来说什么是最重要的，这是一种能力。你不再需要"不停地丢弃"东西。</div>', 3),
(13, '王小波文集八卷本', '王小波', 197.5, 1486950241, 'true', '<span id="abstract-show"><br>	王小波系列图书：<br>	★《王小波文集八卷本》（裸书脊精装插图典藏版）包括 <br>	《黄金时代》《白银时代》《青铜时代》《黑铁时代》《红拂夜奔》《沉默的大多数》《我的精神家园》《爱你就像爱生命》  <br>	  <br>	★文学界不可逾越的王小波，知识群体必读作品。  <br>	近二十年来，他被无数文艺青年青睐，影响了70后、80后，  <br>	今天，他的文字将被90后，甚至00后所拥趸，只为那颗自由的灵魂。  <br> <br>	这套书适合喜欢王小波的文艺青年、知识群体再读；  <br>	适合时时被影响，却从未去翻阅的伪粉丝细读；  <br>	值得**次接触王小波的小鲜肉初读。  <br> <br>	★王小波早期作品手稿首次曝光  <br>	王小波早期作品手稿，保存下来的仅有六篇，分别是《绿毛水怪》《战福》《这是真的》《歌仙》《这辈子》《变形记》, 这些手稿是首次曝光，原汁原味展示出作家早期手稿状态。  <br> <br>	★李银河老师亲自校勘、精选  <br>	长篇小说（全）、中篇小说（全）、短篇小说（全）、未竟稿（精选）、杂文全集、书信全集。</span>', 3),
(14, '畅销的原理', '马修·威尔科克斯', 33.8, 1486950393, 'true', '<p>瞬息万变的商业世界，人们面临着越来越多的商品，越来越丰富的销售模式，也逐渐习惯各式各样的营销手段，甚至开始生成抗体。在这样背景下，我们要怎样让自己的想法和产品脱引而出？怎样深刻地感染消费者、唤醒消费者的认同、影响消费者的选择呢？</p><p>本书用来自全球数千名科学研究人员的成果，精准地为我们提供了答案，推演出能够让你在营销和推广中应用的科学原理。为我们揭秘人类的大脑如何做出决策、选择商品，如何对特定的内容产生脑电波，又如何天生地具有哪些敏感的触发器。我们会看到六百万年来大脑决策系统的进化路径，以及这种进化如何塑造了人类的选择系统。不用惊讶，人类是非理性的动物，而只要掌握了这些非理性的人性触发器，你的产品、你的内容，和你的品牌必定会一炮而红。</p>', 3),
(15, '那片星空，那片海', '桐华', 22.4, 1486950526, 'true', '<div class="descrip"><span id="content-all"></span><p>&nbsp; &nbsp; 《那片星空，那片海》，超人气华语作家、影视制作人桐华2015梦幻爱情小说。</p>\r\n<p>&nbsp; &nbsp; &nbsp;那个人，是我眼里的璀璨星空；那个人，是我心底的无垠大海。</p>\r\n<p>&nbsp; &nbsp; 爱情和人生一模一样，永远都是鲜花与荆棘同在。如果我的爱情是鲜花，我愿意拥抱它的美丽芬芳；如果我的爱情是荆棘，我也会毫不犹豫地拥抱它的尖锐疼痛。</p>\r\n<p>&nbsp; &nbsp; &nbsp;因为，当我拥抱鲜花时，是吴居蓝用甜蜜和微笑为我种下的美丽芬芳；当我拥抱荆棘时，他的整个胸膛早已长满了用自己鲜血浇灌的荆棘。</p>\r\n<p>如果我们的相拥只能隔着荆棘，那么我愿意用力、更用力一点地抱紧他！即使荆棘刺穿我的肌肤，刺进我的心脏，只要能距离他近一点、更近一点！</p></div>', 3),
(16, '沙丘', '弗兰克.赫伯特', 46.9, 1486950880, 'true', '<p><b>&nbsp; &nbsp;</b>哥白尼提出了“日心说”，我们才知道这个世界并不是宇宙的中心；哈勃用望远镜揭开了河外星系的神秘面纱，我们才知道宇宙中还有千亿个银河系；“自由号”发现了黑洞的存在，我们才知道也许宇宙之外还有宇宙，我们只是永恒中一颗微小的沙粒。<b>&nbsp;</b></p><p>一切会思考的机器都被摧毁后，宇宙的焦点重回人类之间的争夺。行星厄拉科斯——人类梦寐以求、竞相抢夺的“香料”的产地，在这里上演着权术与背叛、恐惧与仇恨、希望与梦想的太空歌剧。人们常常用另一个名字称呼这颗干旱的星球——沙丘。家破人亡、颠沛流离的少年保罗在这里抗争着他的宿命。在命运面前，他是如此的渺小，却又如此的强大。</p>', 3),
(17, '一起长大慢慢变老', '水淼', 19.3, 1488435622, 'true', '<div class="descrip"><span id="content-all"></span><p class="NewStyle16">这世间还有比“一起长大 慢慢变老”更浪漫的事吗？</p>\r\n<p class="NewStyle16">程云，三十三岁还单着，爱情早已从日用品变成奢侈品。她虽然看起来很幸福，其实内心中有一道伤口一直不能愈合。直到她遇见了命中注定的“他”，她从开始抗拒<span style="font-family: Calibri;">“</span><span style="font-family: 宋体;">姐弟恋</span><span style="font-family: Calibri;">”</span><span style="font-family: 宋体;">到最终接受幸福的安排</span>。</p>\r\n<p class="NewStyle16">爱情没有早晚，我们终究都会幸福。</p></div>', 3),
(18, '是我把你弄哭了吗？', '布鲁克·巴克 Brooke Barker', 38.5, 1488436253, 'true', '<div class="descrip"><span id="content-all"></span>这本书会偷偷告诉你很多关于动物们的让人心酸又忍不住想笑的冷知识，都是那些蠢萌动物朋友们偷偷藏起来的小秘密：长颈鹿每天只睡半小时，猪永远看不到天，短吻鳄的大脑比奥利奥饼干还要轻，大象跳不起来……这些妙趣横生的小知识配上呆萌可爱的小插图，让人一读就停不下来！</div>', 2),
(19, '不怕，萌就行', '漫友文化', 33.2, 1488436603, 'true', '<div class="descrip"><span id="content-all"></span>今天悄悄喜欢的人对自己笑了，有朋友寄来肉干，院子里种了很久的花终于开了……满满的欢喜要向谁说呢？当生活出现糟心的一面，比如说早上闹钟还没响就被吵醒了，午餐订外卖少了东西，*喜欢的球队输了一场比赛……要怎么办？翻开这本手帐本，傲娇的喵星人、暖心的汪星人、面瘫的藏狐、圆滚滚的“肥啾”、博物君科普到烦的戴胜……各种萌萌的小动物将陪伴你，一起和你面对生活里开心、平淡、难过的事情！用这本书一起来给生活加入“萌”的调料，将这一点点的“小确幸”集合起来，治愈自己，化解孤独和焦虑！</div>', 2),
(20, '看不见的岛屿', '朱迪斯.莎兰斯基', 70.4, 1488436784, 'true', '<div class="descrip"><span id="content-show">2009年“世界*美的书”金奖<br>2010年美国国家公共电台（NPR）年度挚爱选书<br>2011年德意志联邦共和国设计奖<br>2011年全球红点传达设计大奖<br>诸多荣誉成就孤独美学的典范之作<br>献给无法置身一探究竟却爱躺在沙发上阅读深思的书虫，<br>也献给一直在路上，热爱冒险的行者。<br> <br>德国艺术家、作家朱迪斯·莎兰斯基，以精湛的绘图工艺和引人入胜的文字，描述五十多座你未曾到访也永不能游历的遥远孤岛，完美呈现地理、文学与艺术之美。</span></div>', 3),
(21, '睡不着', 'Tango 著', 24, 1488437064, 'true', '<div class="descrip"><span id="content-all"></span><p>\r\n	　　除了音乐和文字，还有什么能让你感到轻松喜悦，嘴角上扬的？<br>\r\n　　新浪微博红人TANGO三年来夜夜一幅幽默画，陪伴无数睡不着的人度过无眠之夜。源源不断的创意和坚持，让人在看懂之后会心一笑，成为粉丝每晚必看的治愈源泉。<br>\r\n　　轻松、温暖、无厘头的奇思妙想，帮你重新发现藏在每个角落的欢乐。<br>\r\n　　其实，活着可以是一件很有趣的事情。\r\n</p></div>', 3),
(22, '如何听懂音乐', '（美）艾伦·科普兰，曹利群 译', 35.9, 1488437244, 'true', '<div class="descrip"><span id="content-all"></span><p>《如何听懂音乐》不仅是一本深入浅出、趣味十足的音乐普及读物，更是一部真正的经典作品。</p>\r\n<p>音乐描述的世界比较抽象，听音乐并不等同于听懂音乐。“听懂”需要经过学习和训练。只有掌握足够的聆听方法和技巧，才能得到更多的愉悦。</p>\r\n<p>如果你是初探音乐领域的爱好者，在《如何听懂音乐》里，从贝多芬和莫扎特开始，从喜爱的歌剧和乐剧开始，从电影音乐和当代电子乐开始，扎实地入门吧。</p>\r\n<p>如果你已对音乐有所体会，那就跟随美国伟大的作曲家一起，从音乐的节奏、旋律、和声、音色中，深入探寻乐曲里的奥义。</p>\r\n<p>听懂音乐，从这本书开始。</p></div>', 3),
(23, '你要么出众，要么出局', '李尚龙', 28.7, 1488437386, 'true', '<div><span id="content-show"><br>　　本书是百万畅销书作家、中国优质新偶像李尚龙写给千万年轻人的成长激励之书。 <br>　　全书41篇作者亲历、亲闻的故事，如同41个特写镜头，把生活的现实、功利、残酷拆开来给你看，为你提供全新的观察生活和审视自己的视角，告诉你年轻时没有安稳平淡的中间选项，你要么大汗淋漓地出众，活出耀眼且丰盛的自己，要么小心翼翼地出局，被迫面对人生的遗憾和后悔。 <br>　　多篇火爆朋友圈的正能量好文《舒适区终有一天会毁掉青春》《寂寞是*好的增值期》《忙起来多好，因为闲下来更累》《下班后的生活，决定了人的一生》《弱者看平台，强者造平台》《别怕麻烦人，好的朋友都是麻烦出来的》等也都收录在本书当中。 <br><br>　　精选语录： <br><br>　　时光，不会辜负每一个平静努力的人。</span></div>', 3);

-- --------------------------------------------------------

--
-- 表的结构 `b_category`
--

CREATE TABLE `b_category` (
  `cate_id` int(11) NOT NULL,
  `cate_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_category`
--

INSERT INTO `b_category` (`cate_id`, `cate_name`) VALUES
(1, '技术'),
(2, '动漫'),
(3, '文学');

-- --------------------------------------------------------

--
-- 表的结构 `b_comment`
--

CREATE TABLE `b_comment` (
  `comment_id` int(11) NOT NULL,
  `comment_content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `b_images`
--

CREATE TABLE `b_images` (
  `image_id` int(11) NOT NULL,
  `image_name` varchar(500) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_images`
--

INSERT INTO `b_images` (`image_id`, `image_name`, `book_id`) VALUES
(2, '1.jpg', 1),
(3, '3.jpg', 3),
(4, '4.jpg', 4),
(5, '2.jpg', 2),
(6, '6.jpg', 6),
(7, '5.jpg', 5),
(8, '7.jpg', 7),
(9, '8.jpg', 8),
(11, '9.jpg', 9),
(12, '10.jpg', 10),
(13, '11.jpg', 11),
(14, '12.jpg', 12),
(15, '13.jpg', 13),
(16, '14.jpg', 14),
(17, '15.jpg', 15),
(18, '16.jpg', 16),
(19, '17.jpg', 17),
(20, '18.jpg', 18),
(21, '19.jpg', 19),
(22, '20.jpg', 20),
(23, '21.jpg', 21),
(24, '23.jpg', 23),
(25, '22.jpg', 22);

-- --------------------------------------------------------

--
-- 表的结构 `b_order`
--

CREATE TABLE `b_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_order`
--

INSERT INTO `b_order` (`order_id`, `user_id`, `order_addtime`) VALUES
(1, 1, '2017-01-16 04:10:24'),
(2, 1, '2017-01-16 04:10:24'),
(4, 1, '2017-01-16 04:10:24'),
(5, 1, '2017-01-16 04:10:24'),
(6, 1, '2017-01-16 04:10:24'),
(7, 1, '2017-01-16 04:10:24'),
(8, 1, '2017-02-20 06:12:33'),
(15, 1, '2017-03-02 08:35:50'),
(16, 1, '2017-03-02 08:37:07');

-- --------------------------------------------------------

--
-- 表的结构 `b_orderdetail`
--

CREATE TABLE `b_orderdetail` (
  `orderdetail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `book_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_orderdetail`
--

INSERT INTO `b_orderdetail` (`orderdetail_id`, `order_id`, `book_id`, `book_num`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 1, 1),
(4, 2, 2, 1),
(5, 4, 4, 1),
(6, 5, 4, 3),
(7, 6, 4, 1),
(8, 7, 4, 1),
(9, 8, 4, 1),
(11, 15, 17, 1),
(12, 16, 17, 1),
(13, 16, 19, 1);

-- --------------------------------------------------------

--
-- 表的结构 `b_relatebook`
--

CREATE TABLE `b_relatebook` (
  `bookrelate_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `relate_bookid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_relatebook`
--

INSERT INTO `b_relatebook` (`bookrelate_id`, `book_id`, `relate_bookid`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 2, 1),
(5, 2, 3),
(6, 2, 4),
(7, 3, 1),
(8, 3, 2),
(9, 3, 4),
(10, 4, 1),
(11, 4, 2),
(12, 4, 3),
(13, 5, 1),
(14, 5, 2);

-- --------------------------------------------------------

--
-- 表的结构 `b_user`
--

CREATE TABLE `b_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_tel` char(11) NOT NULL,
  `user_sex` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_user`
--

INSERT INTO `b_user` (`user_id`, `user_name`, `user_password`, `user_tel`, `user_sex`) VALUES
(1, 'tom', 'e10adc3949ba59abbe56e057f20f883e', '13890879001', 'w');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `b_book`
--
ALTER TABLE `b_book`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `book_title` (`book_title`);

--
-- Indexes for table `b_category`
--
ALTER TABLE `b_category`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `b_comment`
--
ALTER TABLE `b_comment`
  ADD PRIMARY KEY (`comment_id`,`user_id`,`book_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `b_images`
--
ALTER TABLE `b_images`
  ADD PRIMARY KEY (`image_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `b_order`
--
ALTER TABLE `b_order`
  ADD PRIMARY KEY (`order_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `b_orderdetail`
--
ALTER TABLE `b_orderdetail`
  ADD PRIMARY KEY (`orderdetail_id`,`order_id`,`book_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `b_relatebook`
--
ALTER TABLE `b_relatebook`
  ADD PRIMARY KEY (`bookrelate_id`);

--
-- Indexes for table `b_user`
--
ALTER TABLE `b_user`
  ADD PRIMARY KEY (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `b_book`
--
ALTER TABLE `b_book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `b_category`
--
ALTER TABLE `b_category`
  MODIFY `cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `b_comment`
--
ALTER TABLE `b_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `b_images`
--
ALTER TABLE `b_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- 使用表AUTO_INCREMENT `b_order`
--
ALTER TABLE `b_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `b_orderdetail`
--
ALTER TABLE `b_orderdetail`
  MODIFY `orderdetail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `b_relatebook`
--
ALTER TABLE `b_relatebook`
  MODIFY `bookrelate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `b_user`
--
ALTER TABLE `b_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 限制导出的表
--

--
-- 限制表 `b_comment`
--
ALTER TABLE `b_comment`
  ADD CONSTRAINT `b_comment_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `b_book` (`book_id`),
  ADD CONSTRAINT `b_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`user_id`);

--
-- 限制表 `b_images`
--
ALTER TABLE `b_images`
  ADD CONSTRAINT `b_images_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `b_book` (`book_id`);

--
-- 限制表 `b_order`
--
ALTER TABLE `b_order`
  ADD CONSTRAINT `b_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
