/*
Navicat MySQL Data Transfer

Source Server         : chenmin
Source Server Version : 50626
Source Host           : 127.0.0.1:3306
Source Database       : fruitsnet1

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2022-06-13 19:45:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fruit_enjoy
-- ----------------------------
DROP TABLE IF EXISTS `fruit_enjoy`;
CREATE TABLE `fruit_enjoy` (
  `e_id` int(11) NOT NULL,
  `f_id` int(11) DEFAULT NULL,
  `e_linkman` varchar(20) DEFAULT NULL,
  `e_local` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`e_id`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `fruit_enjoy_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `tb_fruits` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fruit_enjoy
-- ----------------------------
INSERT INTO `fruit_enjoy` VALUES ('1', '1', '张云雷', '海南东方');
INSERT INTO `fruit_enjoy` VALUES ('2', '2', '乔红琼', '山东临沂');
INSERT INTO `fruit_enjoy` VALUES ('3', '3', '陈永林', '湖北宜昌');
INSERT INTO `fruit_enjoy` VALUES ('4', '4', '石河林', '四川眉山');
INSERT INTO `fruit_enjoy` VALUES ('5', '5', '唐江福', '河北秦皇岛');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `f_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`r_id`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `tb_fruits` (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '回复chen:', '2', 'gyiuui');
INSERT INTO `reply` VALUES ('2', '回复chen:', '2', 'gyiuui');
INSERT INTO `reply` VALUES ('3', '回复cm:', '2', 'gsdhsdt');

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address` (
  `add_id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`add_id`),
  KEY `uId` (`uId`),
  CONSTRAINT `tb_address_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `tb_user` (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_address
-- ----------------------------
INSERT INTO `tb_address` VALUES ('3', '2', '吃香蕉不吐皮', '15555555555', '湖南麻阳县');
INSERT INTO `tb_address` VALUES ('7', '2', '吃西瓜不吐籽', '1555555555', '湖南科技职业学院');
INSERT INTO `tb_address` VALUES ('8', '1', '吃橘子不剥皮', '14444444444', '华南科技学院');
INSERT INTO `tb_address` VALUES ('9', '1', '吃瓜子不吐壳', '12388888888', '长沙市天心区');

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `a_id` int(20) NOT NULL AUTO_INCREMENT,
  `a_user` varchar(50) NOT NULL,
  `a_pass` varchar(50) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'chen', '123');
INSERT INTO `tb_admin` VALUES ('2', 'chenming', '123');
INSERT INTO `tb_admin` VALUES ('3', 'min', '123');
INSERT INTO `tb_admin` VALUES ('4', '123', '123');

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) DEFAULT NULL,
  `f_id` int(11) DEFAULT NULL,
  `goodsNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `u_Id` (`uId`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `tb_cart_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `tb_user` (`uId`),
  CONSTRAINT `tb_cart_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `tb_fruits` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_cart
-- ----------------------------

-- ----------------------------
-- Table structure for tb_collect
-- ----------------------------
DROP TABLE IF EXISTS `tb_collect`;
CREATE TABLE `tb_collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  PRIMARY KEY (`collect_id`),
  KEY `uId` (`uId`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `tb_collect_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `tb_user` (`uId`),
  CONSTRAINT `tb_collect_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `tb_fruits` (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_collect
-- ----------------------------
INSERT INTO `tb_collect` VALUES ('5', '1', '2');
INSERT INTO `tb_collect` VALUES ('7', '2', '1');
INSERT INTO `tb_collect` VALUES ('10', '2', '3');
INSERT INTO `tb_collect` VALUES ('11', '2', '5');

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `c_content` varchar(255) NOT NULL,
  `c_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `uId` (`uId`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `tb_comment_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `tb_user` (`uId`),
  CONSTRAINT `tb_comment_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `tb_fruits` (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES ('1', '1', '2', '很好', '2021-11-19 17:34:31');
INSERT INTO `tb_comment` VALUES ('2', '2', '2', '强力推荐', '2021-11-19 17:37:25');
INSERT INTO `tb_comment` VALUES ('3', '1', '3', 'ok', '2021-11-19 18:11:05');
INSERT INTO `tb_comment` VALUES ('4', '1', '2', 'ytr', '2021-11-19 18:11:31');
INSERT INTO `tb_comment` VALUES ('5', '1', '2', 'j', '2021-11-19 18:13:06');
INSERT INTO `tb_comment` VALUES ('6', '1', '2', '1', '2021-11-19 18:14:56');
INSERT INTO `tb_comment` VALUES ('7', '1', '8', 'fg', '2021-11-20 12:04:38');
INSERT INTO `tb_comment` VALUES ('8', '1', '7', 'wger', '2021-11-20 12:05:31');
INSERT INTO `tb_comment` VALUES ('9', '1', '2', 'jlkj', '2021-11-20 12:19:00');
INSERT INTO `tb_comment` VALUES ('10', '1', '2', '', '2021-11-20 14:32:20');
INSERT INTO `tb_comment` VALUES ('11', '2', '2', '123', '2022-06-02 09:26:37');

-- ----------------------------
-- Table structure for tb_fruits
-- ----------------------------
DROP TABLE IF EXISTS `tb_fruits`;
CREATE TABLE `tb_fruits` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(50) NOT NULL,
  `f_desc` varchar(200) DEFAULT NULL,
  `f_price` float(10,2) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `f_picurl` varchar(50) DEFAULT NULL,
  `f_sold` varchar(50) DEFAULT NULL,
  `f_origin` varchar(20) DEFAULT NULL,
  `f_appraise` varchar(50) DEFAULT NULL,
  `f_view` varchar(50) DEFAULT NULL,
  `f_tel` varchar(50) DEFAULT NULL,
  `f_message` longtext,
  `f_type` varchar(50) DEFAULT NULL,
  `f_stock` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_fruits
-- ----------------------------
INSERT INTO `tb_fruits` VALUES ('1', '泰国超甜水果玉米', '海南当季水果玉米，2021年1月9-12号采摘，超大超甜，粒大饱满心小！水份充足，口感细腻香甜软糯，单只：400-650g，联系电话18689627010', '4.00', '★★★★', 'f_img01.jpg', '2895', '海南东方市', '98', '152', '18689627010', '货源详情', '绿色水果', '999');
INSERT INTO `tb_fruits` VALUES ('2', '红富士红苹果货源', '山东优质红富士苹果大量上市，货源充足保证质量', '19.99', '★★★', 'f_img02.jpg', '2000', '山东临沂市', '1954', '29408', '13854937512', '山东恒丰水果销售基地：<br> \r\n&ensp;&ensp;山东红富士苹果供应基地 【138-549-37512】微-信同号，山东苹果销售基地，山东红富士苹果皮薄 汁多 颜色好 全国最脆的苹果 有机无公害苹果，苹<br>果是我县特产之一，常年供应不断层，新鲜苹果从每年的6月份供应至春节前，次年开始大量供应冷库苹果，随季节【苹果】【油桃】【西瓜】【毛桃】等<br>水果，货源充足，质量保证，价格随行就市，本基地包装齐全，物流体系完整，交通食宿方便，可发往全国各地，山东苹果是中国地理标志产品，有“苹果<br>之乡”的美誉。我县土质好，地势高，光照强，昼夜温差大，境内无客水流入。 苹果以其色泽鲜艳、清脆香甜而闻名于世，深受广大消费者的青睐,目前主<br>要以供应批发红富士苹果为主，有纸袋红富士、膜袋红富士、纸夹膜红富士【现库存红富士苹果】大量批发，规格齐全，有条红，有偏红，果面光滑，卖相<br>好，竭诚欢迎各地客商朋友前来咨询选购!欢迎来电咨询,我会及时向您提供真实信息和实地价格，绝不乱报价格，让您准确了解市场行情，把握商机，多赚<br>钱。 我们会提供装车、选果、包装、食宿、配货等一条龙服务； * 包装齐全，保鲜袋、网套、苹果专用纸箱、精品包装箱、塑料筐等 **我们诚心的希望您<br>的到访，我们会以信誉为你铺路搭桥，竭诚欢迎各地客商朋友前来咨询选购!<br>\r\n\r\n联系人：孙伟<br>\r\n\r\n电话：138-549-37512  183-694-08768<br>\r\n地址：山东省临沂市沂水县驻地<br>', '绿色水果', '856');
INSERT INTO `tb_fruits` VALUES ('3', '赣南吉橙信丰吉橙', '正宗赣南脐橙信丰县大塘镇果园新采果子，味道极佳', '3.00', '★★★★', 'f_img03.jpg', '2865', '湖北宜昌市', '2000', '25555', '13307471670', '橙子是我们生活中非常常见的一种水果，含有大量的糖和一定量的柠檬酸以及丰富的维生素C，营养价值非常的高。\r\n                    橙子的吃法也有很多，可以做冰糖橙子、盐蒸橙子、还可以直接食用。那么孕妇能吃橙子吗？它的功效与作用及好处都各有哪些呢？下面就让我们具体了解下吧。<br/>\r\n                    橙子的知识<br/>\r\n                    橙子（水果）<br/>\r\n                    橙子（学名：Citrus sinensis）是芸香科柑橘属植物橙树的果实，亦称为柳橙、甜橙、黄果、柑子、金环、柳丁。橙是一种柑果，它是种植了很久的混合品种，\r\n                    是柚子（Citrus maxima）与橘子（Citrus reticulata）的杂交品种，起源于东南亚。果实可以剥皮鲜食其果肉，果肉也可以用作****食物的附加物。\r\n                    果实的另一个重要用途为榨汁。营养学分析，橙子的生命力指数为13.8750，防病指数为132.50，属于有效范围。橙子的营养价值很高，可以有效地补充多种维生素。<br/>\r\n                    形态特征<br/>\r\n                    橙子又叫金环、黄果，属芸香科植物香橙的果实，原产于中国东南部，是世界四大名果之一。橙子有甜橙和酸橙之分，酸橙又名缸橙，味酸带苦，不宜食用，\r\n                    大多用来制取果汁，很少鲜食，一般鲜食以甜橙为主。橙子是一种芸香科柑橘，属于常绿乔木，是最具有代表性柑橘类果树，包括甜橙和酸橙两个基本种。\r\n                    枝条具刺。叶长椭圆形，叶柄长，翼叶发达。花单生、丛生或呈总状花序，白色，具反卷性。种子长椭圆形或卵圆形，表面具棱纹。橙子又称黄果。\r\n                    原产中国南部，南方各省均有分布，而以江西、四川、广东、****、等省栽培较为集中。15世纪初从中国传入欧洲，15世纪末传入美洲。<br/>\r\n                    营养成分<br/>\r\n                    橙子又名“黄果”、“金环”，为芸香科植物香橙的果实，原产于中国东南部，是世界四大名果之一。 橙子分甜橙和酸橙，酸橙又称缸橙，味酸带苦，\r\n                    有时甜中带酸，不宜食用，多用于制取果汁，很少鲜食。鲜食以甜橙为主。中国甜橙品种很多。甜橙果实为球形，上下稍扁平，表面滑泽，未成熟前色青，\r\n                    成熟后变成黄色果肉酸甜适度，汁多，富有香气，是人们喜欢吃的水果之一。橙子中含量丰富的维生素C、P，能增加机体抵抗力，增加毛细血管的弹性，\r\n                    降低血中胆固醇。高血脂症、高血压、动脉硬化者常食橙子有益。橙子所含纤维素和果胶物质，可促进肠道蠕动，有利于清肠通便，排除体内有害物质。\r\n                    橙皮性味甘苦而温，止咳化痰功效胜过陈皮，是治疗感冒咳嗽、食欲不振、胸腹胀痛的良药。橙子几乎已经成为维生素C的代名词秭归，中国脐橙之乡，\r\n                    现品种涵盖罗脐，纽荷尔，长虹，福罗斯特，中华红，二月红，伦晚，夏橙，九月红。本处专业从事秭归脐橙产地代办，秉承客户至上，力求双赢的宗旨，\r\n                    以合理的价格给客户提供优质的产品，以良好的精神面貌和专业素养处理好相关的各个环节，力争和每一位客户的合作都是舒心和愉快的。\r\n                    现秭归脐橙已大量上市，热忱欢迎新老客户前来洽谈合作，联系方式***********赵先生。<br/>', '绿色水果', '788');
INSERT INTO `tb_fruits` VALUES ('4', '耙耙柑', '果粒饱满，口感纯甜画渣，好吃不上火', '2.50', '★★★', 'f_img04.jpg', '210', '四川眉山市', '120', '396', '17381138192', '货源充足！', '绿色水果', '654');
INSERT INTO `tb_fruits` VALUES ('5', '巨峰葡萄', '果粒饱满，口感纯甜画渣，好吃不上火', '6.00', '★★★★', 'f_img05.jpg', '100', '河北秦皇岛市', '23', '173', '17610386873', '秦皇岛昌黎葡萄种植基地，9月份下的果，果实硕大、口感香甜，串大串整品相好，目前在冷库存放，每箱10斤-12斤，大概有100000多箱，<br>\r\n500箱起批，目前价格1.8-2.2元/斤。欢迎来电洽谈，现场看货，我们为新老客户提供装车、代收、发货一条龙服务，电话一起流一零三<br>\r\n八六把其三***********，联系人老林。<br>', '绿色水果', '2310');
INSERT INTO `tb_fruits` VALUES ('6', '砂糖桔', '个头比较均匀 3到5公分', '3.25', '★★', 'f_img06.jpg', '541', '广西桂林市', '500', '1094', '15977082929', '\r\n广西桂林沙糖桔，沃柑已经开始着色，现开始接受预定。本人专业代办，资源丰富，桂林12个县区均拥有丰富资源，带您直接跟果农谈价，免去中间环节，<br>\r\n给您最大利润。并提供洗果，打蜡，包装，运输一条龙服务。欢迎各地老板咨询，实地看果<br>', '绿色水果', '1250');
INSERT INTO `tb_fruits` VALUES ('7', '海南椰子', '自产自销', '5.00', '★★★', 'f_img07.jpg', '255', '海南文昌市', '124', '789', '13677251712', '货源详情', '绿色水果', '1620');
INSERT INTO `tb_fruits` VALUES ('8', '李师傅徐香猕猴桃', '稀缺个头，100%130克以上自家有机肥种植，口感绝佳！', '4.50', '★★★★', 'f_img08.jpg', '51', '陕西宝鸡市', '23', '217', '13430913784', '陕西眉县太白山下，李师傅自种徐香猕猴桃，口感佳，欢迎订购。', '绿色水果', '230');
INSERT INTO `tb_fruits` VALUES ('9', '赣南脐橙', '赣南脐橙皮薄多汁，入口即化，甜中带酸是赣南脐橙的特点', '3.00', '★★', 'f_img09.jpg', '112', '江西赣州市', '110', '204', '13699534108', '我们是脐橙的搬运工，没有生产厂家，只有种植基地，赣南产地，我们不存储，只有新鲜果，没有广告的浮夸效应，只有顾客由衷的肯定和支持，我保证<br>\r\n我家的脐橙不打蜡、不催熟、不打甜蜜素，绿色纯天然，是自然成熟的赣南脐橙，真正好吃的赣南脐橙，想尝鲜的微我，这是统货的价格；货源充足', '绿色水果', '1780');
INSERT INTO `tb_fruits` VALUES ('10', '砂糖橘', '盖膜的砂糖橘', '2.00', '★', 'f_img10.jpg', '98', '广西河池市', '78', '190', '18176185859', '不包邮，不打蜡，打蜡加2毛', '绿色水果', '1852');
INSERT INTO `tb_fruits` VALUES ('11', '藤稔 巨盛一号藤稔 巨盛一号葡萄 个大味美 质量保证 大量上市', '藤稔 巨盛一号葡萄 个大味美 质量保证 大量上市', '5.00', '★★★★', 'f_img11.jpg', '20', '山东聊城', '20', '102', '15166519658', '山东省聊城市东昌府区沙镇镇葡萄正在大量上市，供不应求。 葡萄果粒饱满，耐长途运输，晶莹剔透，口感一流。我们基地品种齐全，藤稔、红艳天、阳光玫瑰等应有尽有，是您合作的最好选择。\r\n\r\n    本基地常年与全国朋友合作，信誉极佳。有很好的合作基础，提供良好的住宿环境。期待新老客户光临合作、。有我们本着跟朋友们一起合作双赢、互利互惠的原则。诚心欢迎各位好友电话或**咨询联系。有意向的速速电话联系。\r\n\r\n   联系人董经理，电话***********。。**同电话。。。广交朋友，欢迎洽谈。   还会陆续发布信息，请**关注。', '绿色水果', '2230');
INSERT INTO `tb_fruits` VALUES ('12', '正宗阳山水蜜桃', '汁多甘甜', '60.00', '★★★', 'f_img12.jpg', '20', '江苏无锡市', '14', '199', '1581703763', '货源详情', '绿色水果', '465');
INSERT INTO `tb_fruits` VALUES ('13', '小棚西瓜8424', '小棚西瓜8424', '2.00', '★★', 'f_img13.jpg', '175', '浙江台州市', '50', '452', '18963134848', '联系18963134848', '绿色水果', '321');
INSERT INTO `tb_fruits` VALUES ('14', '香水柠檬', '1.5两起全青果。。。。', '6.00', '★★★', 'f_img14.jpg', '23', '广东惠州市', '21', '231', '13316382817', '货源详情', '绿色水果', '741');
INSERT INTO `tb_fruits` VALUES ('15', '哈密瓜小蜜25号', '专业种植，且货源充足', '3.60', '★★★★', 'f_img15.jpg', '147', '海南东方市', '100', '275', '13637531856', '十年专业种植，有150亩的产地，四季供应。', '绿色水果', '852');
INSERT INTO `tb_fruits` VALUES ('16', '黄金蜜一号', '糖分高，果径大', '2.50', '★★★★★', 'f_img16.jpg', '129', '山东聊城市', '109', '785', '15206646668', '联系我时，请说明在〈中国水果交易网〉看到的货源信息，谢谢!', '绿色水果', '963');
INSERT INTO `tb_fruits` VALUES ('17', '牛油果', '进口牛油果新鲜鳄梨 孕妇宝宝辅食 餐饮果茶店可定制', '11.00', '★★★', 'f_img17.jpg', '129', '国外进口', '78', '356', '17718471680', '广州江南进口水果市场 每日开柜 新鲜', '绿色水果', '123');
INSERT INTO `tb_fruits` VALUES ('18', '大兴庞各庄西瓜', '庞各庄l600西瓜皮薄，甜度可达到13-14.', '2.50', '★★★', 'f_img18.jpg', '121', '北京', '65', '521', '18310877801', '庞各庄l600西瓜皮薄，甜度可达到13-14\r\n\r\n\r\n\r\n大兴西瓜的特点\r\n\r\n \r\n\r\n在优异的生长环境下，从五月份开始，该品种的西瓜就已经进入蔓生期，并在适宜的温度下快速长大。\r\n\r\n \r\n\r\n至成熟期时，该瓜的单个果实重量，就可达到四到八千克，成为中大型的果实，而且其品质特点也非常的优秀。\r\n\r\n \r\n\r\n它的瓜皮翠绿且薄，瓜瓤呈粉红或桃红色，晶莹、鲜艳，它的果肉中，很少含有纤维，也就是我们常说的黄色的丝状物，所以口感上面更加的细腻爽口。\r\n\r\n \r\n\r\n更值得一提的是，****品种的西瓜要么脆硬，要么沙软，而此品种的西瓜是脆沙型的，非常难得。\r\n\r\n庞各庄l600西瓜皮薄，甜度可达到13-14\r\n\r\n\r\n\r\n大兴西瓜的特点\r\n\r\n \r\n\r\n在优异的生长环境下，从五月份开始，该品种的西瓜就已经进入蔓生期，并在适宜的温度下快速长大。\r\n\r\n \r\n\r\n至成熟期时，该瓜的单个果实重量，就可达到四到八千克，成为中大型的果实，而且其品质特点也非常的优秀。\r\n\r\n \r\n\r\n它的瓜皮翠绿且薄，瓜瓤呈粉红或桃红色，晶莹、鲜艳，它的果肉中，很少含有纤维，也就是我们常说的黄色的丝状物，所以口感上面更加的细腻爽口。\r\n\r\n \r\n\r\n更值得一提的是，****品种的西瓜要么脆硬，要么沙软，而此品种的西瓜是脆沙型的，非常难得。', '绿色水果', '456');
INSERT INTO `tb_fruits` VALUES ('19', '山东陆地油桃产地供应价格合理', '山东陆地油桃大量上市看货定价欢迎选购', '0.40', '★', 'f_img19.jpg', '133', '山东日照市', '67', '266', '13626331680', '货源详情', '绿色水果', '789');
INSERT INTO `tb_fruits` VALUES ('20', '滕祯（又名乒乓球）', '葡萄品种，滕祯（又名乒乓球），维多利亚', '4.50', '★★★★', 'f_img20.jpg', '142', '山东济南市', '71', '284', '13791712354', '山东省金乡县万亩葡萄园开园啦！品种有滕祯，维多利亚，红巴拉蒂，成熟度好，颗粒大，口感甜，量大，货优，欢迎各地客商前来选购，免代办费，一次合作，终生朋友，代办电话***********', '绿色水果', '753');
INSERT INTO `tb_fruits` VALUES ('21', '黄心水蜜桃', '各位老板大家好，自己家种了100多亩桃子，这个是新产品，外皮是红色的，里面果肉是黄色的，天然的非常甜，希望老板看到可以长期合作代理。18969288381', '0.80', '★★', 'f_img21.jpg', '147', '安徽阜阳市', '78', '254', '18969288381', '货源详情', '绿色水果', '951');
INSERT INTO `tb_fruits` VALUES ('22', '秋月梨', '秋月通体黄褐色，外观极其漂亮。果肉乳白色，果核小，可食率95%，耐贮藏，长期贮藏后无异味，特点是汁多甘甜，糖度均在13左右', '4.50', '★★★', 'f_img22.jpg', '138', '山东青岛市', '69', '276', '15966893233', '秋月梨的功效一般均值可以对咳嗽痰稠或无痰、咽喉发痒干疼者，漫性支气管炎、肺结核病人，高血压、心脏病、肝炎、肝硬化患者，饮酒后或醉酒未醒者尤其明显。', '绿色水果', '486');
INSERT INTO `tb_fruits` VALUES ('23', '甜瓜 甜宝甜瓜', '甜瓜   甜宝甜瓜  产地直供一手货源保质保量全国接单', '1.00', '★★★★', 'f_img23.jpg', '252', '河南漯河市', '126', '574', '17639570705', '货源详情甜瓜   甜宝甜瓜  产地直供一手货源保质保量全国接单', '绿色水果', '426');
INSERT INTO `tb_fruits` VALUES ('24', '半边红李子', '清脆脱核', '1.50', '★★', 'f_img24.jpg', '64', '云南昭通市', '30', '230', '15096824746', '有需要的老板请，***********我是果农', '绿色水果', '682');
INSERT INTO `tb_fruits` VALUES ('25', '荔枝运输储存专用气调保鲜袋防雾袋锦锐保鲜包装', '荔枝水果专用气调保鲜袋防雾袋锦锐保鲜包装', '7.80', '★★★', 'f_img25.jpg', '241', '广西柳州市', '221', '1420', '18905366600', '保持新鲜品质   降低包装成本   提高果蔬价格\r\n\r\n生产销售果蔬气调保鲜袋、硅窗袋、海产品呼吸袋、食品袋、有机肥免涨袋、花卉保鲜袋、药材保鲜袋、异型袋、保鲜盒、保鲜膜、酒类酿制专用气调膜、农膜棚膜地膜等多种保鲜包装\r\n\r\n \r\n\r\n    潍坊锦锐保鲜包装有限公司推出的“活性气调保鲜袋”，由于性能优越，因而能有效保持果蔬的良好品质、延长食品的保鲜期、降低包装成本、提高企业的经济效益，公司推出的果蔬气调保鲜袋采用独特的矿物质材料，以优质进口PE材料为基础，针对果蔬保鲜包装特有要求加工而成。该种保鲜袋将调节气体、保持水分和口感、预防水雾凝聚、抑制烂损等多功能集于一体，比普通保鲜袋延长1-3倍的保鲜期，具有持久保鲜作用。\r\n锦锐活性气调保鲜袋的保鲜原理包括：\r\n\r\n1.该保鲜袋具有生物透气功能能调节袋内氮气、二氧化碳、氧气的比例，保持袋内气体平衡、防止气体腐蚀。\r\n\r\n2.可抑制果蔬采收后的呼吸作用、减少蒸腾作用、降低萎蔫、保持水分和营养不流失。\r\n\r\n3.抑制多种病菌的滋生、防止果蔬烂损。\r\n\r\n4.具有防雾功能，可防止水汽在保鲜袋内凝结、避免果蔬和保鲜袋的袋壁接触，从而预防烂损问题的发生。\r\n在使用锦锐活性气调保鲜袋的过程中，要想取得良好的使用效果，还要注意正确的使用方法：\r\n\r\n1.应根据农业季节、天气情况，采收成熟度适当的水果、蔬菜，进行预处理后，再用高效保鲜袋包装。对有外伤的果蔬，应另行处理。\r\n\r\n2.将新鲜水果、蔬菜表面的水分晾干之后，放入高效保鲜袋内，尽量排空袋内空气，用扎线扎好（封口），放入冷库或****冷藏设施内。\r\n\r\n3.不同的水果、蔬菜，要分开包装，切忌混装。\r\n\r\n4.该种保鲜袋洗净、晾干后，可重复使用一个月，能节约资源和包装成本，有利环境保护。\r\n\r\n5.该种保鲜袋不可放入微波炉里加热。\r\n潍坊锦锐保鲜包装有限公司推出的果蔬高效气调保鲜袋可用于超市、果蔬配送中心、农产品出口企业等需要对鲜活农产品进行保鲜包装的场所，具体适用的场所有：\r\n\r\n1.冷库：使用锦锐高效保鲜袋包装新鲜果蔬，可延长果蔬的保鲜期、错开集中上市期、推迟果蔬的上市时间，从而提高果蔬的售价和利润。\r\n\r\n2.超市货架\r\n\r\n3.长途运输车辆或船只：目前，运送水果、蔬菜的车辆主要有冷冻货车和非冷冻货车两种。非冷冻货车运输主要以泡沫箱或蓝箱加冰袋运输，使用锦锐高效保鲜袋包装果蔬，可以减少一半以上的冰块，从而可以增加运输数量、降低运输成本、减少水果和蔬菜的损失。\r\n\r\n4.家庭：使用锦锐高效保鲜袋包装，可明显延长果蔬在冰箱里的保存时间、降低损耗。\r\n5.锦锐活性气调保鲜袋的应用对象广泛，适于多种农副产品的保鲜，如水果、蔬菜、鲜花、肉类、海产品、      茶叶、药材、奶酪面包、酒类酿制、有机肥等；可用于超市配送中心，冷库储存、常温储放、长途运输、果蔬基地、农业合作社、农副产品加工出口企业等需要保鲜的场所。', '绿色水果', '842');
INSERT INTO `tb_fruits` VALUES ('26', '五月脆', '清脆，甜度15左右', '4.00', '★★', 'f_img26.jpg', '252', '四川成都市', '165', '985', '13924876876', '个大，基本五钱以上口感好', '绿色水果', '1590');
INSERT INTO `tb_fruits` VALUES ('27', '元谋红提葡萄', '10亩红提葡萄，通货', '5.00', '★★★', 'f_img27.jpg', '300', '云南楚雄彝族自治州', '122', '1211', '18082910395', '云南元谋10亩优质红提葡萄上市，欢迎采购***********', '绿色水果', '3570');
INSERT INTO `tb_fruits` VALUES ('28', '澳洲红，八宝丹，小宝石，五月脆', '物美价廉', '2.50', '★★★★', 'f_img28.jpg', '60', '湖北襄樊市', '32', '210', '19171290982', '货源详情', '绿色水果', '1830');
INSERT INTO `tb_fruits` VALUES ('29', '金贵妃黄皮果', '山区种植阳光玫瑰，有机肥，果大产品优质。', '21.00', '★★★★★', 'f_img29.jpg', '456', '广东湛江市', '234', '2380', '18318592522', '广东省湛江市廉江市良垌镇金贵妃', '绿色水果', '2850');
INSERT INTO `tb_fruits` VALUES ('30', '买5送1百色金煌芒10斤装礼盒坏果包赔', '金煌芒又名甜心芒，是可以生吃的芒果，生吃做酸野放辣椒，放白糖都可，不酸口。熟了再吃肉嫩无丝，大口吃肉满足感爆棚。', '68.00', '★★★★★', 'f_img30.jpg', '353', '广西百色市', '300', '3210', '18977629623', '自家果园，现摘现发。包邮25省，下单后48小时内发出，快递中通、圆通随机发。新疆西zang内蒙古港澳台不发货。', '绿色水果', '1330');

-- ----------------------------
-- Table structure for tb_fruits_picurl
-- ----------------------------
DROP TABLE IF EXISTS `tb_fruits_picurl`;
CREATE TABLE `tb_fruits_picurl` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_id` int(11) NOT NULL,
  `picurl` varchar(100) NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fId` (`f_id`),
  CONSTRAINT `tb_fruits_picurl_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `tb_fruits` (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_fruits_picurl
-- ----------------------------
INSERT INTO `tb_fruits_picurl` VALUES ('1', '1', 'f_img01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('2', '1', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('3', '1', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('4', '1', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('5', '1', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('6', '2', 'apple01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('7', '2', 'apple02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('8', '2', 'apple03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('9', '2', 'apple04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('10', '2', 'apple05.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('11', '3', 'big_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('12', '3', 'small_img01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('13', '3', 'small_img02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('14', '3', 'small_img03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('15', '3', 'small_img04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('16', '4', 'f_img04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('17', '4', 'citrus01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('18', '4', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('19', '4', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('20', '4', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('21', '5', 'f_img05.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('22', '5', 'grape01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('23', '5', 'grape02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('24', '5', 'grape03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('25', '5', 'grape04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('26', '6', 'f_img06.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('27', '6', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('28', '6', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('29', '6', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('30', '6', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('31', '7', 'f_img07.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('32', '7', 'coconut.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('33', '7', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('34', '7', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('35', '7', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('36', '8', 'f_img08.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('37', '8', 'kiwi01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('38', '8', 'kiwi02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('39', '8', 'kiwi03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('40', '8', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('41', '9', 'f_img09.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('42', '9', 'orange01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('43', '9', 'orange02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('44', '9', 'orange03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('45', '9', 'orange04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('46', '10', 'f_img10.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('47', '10', 'sugar01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('48', '10', 'sugar02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('49', '10', 'sugar03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('50', '10', 'sugar04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('51', '11', 'f_img11.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('52', '11', 'wine01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('53', '11', 'wine02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('54', '11', 'wine03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('55', '11', 'wine04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('56', '12', 'f_img12.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('57', '12', 'peach01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('58', '12', 'peach02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('59', '12', 'peach03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('60', '12', 'peach04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('61', '13', 'f_img13.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('62', '13', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('63', '13', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('64', '13', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('65', '13', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('66', '14', 'f_img14.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('67', '14', 'lemon01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('68', '14', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('69', '14', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('70', '14', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('71', '15', 'f_img15.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('72', '15', 'Hami01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('73', '15', 'Hami02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('74', '15', 'Hami03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('75', '15', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('76', '16', 'f_img16.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('77', '16', 'peachs01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('78', '16', 'peachs02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('79', '16', 'peachs03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('80', '16', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('81', '17', 'f_img16.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('82', '17', 'avocado01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('83', '17', 'avocado02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('84', '17', 'avocado03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('85', '17', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('86', '18', 'f_img18.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('87', '18', 'watermelon01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('88', '18', 'watermelon02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('89', '18', 'watermelon03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('90', '18', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('91', '19', 'f_img19.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('92', '19', 'nectarine01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('93', '19', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('94', '19', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('95', '19', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('96', '20', 'f_img20.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('97', '20', 'TengZhen01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('98', '20', 'TengZhen02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('99', '20', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('100', '20', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('101', '21', 'f_img21.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('102', '21', 'juicy01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('103', '21', 'juicy02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('104', '21', 'juicy03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('105', '21', 'juicy04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('106', '22', 'f_img22.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('107', '22', 'pear01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('108', '22', 'pear02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('109', '22', 'pear03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('110', '22', 'pear04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('111', '23', 'f_img23.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('112', '23', 'melon01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('113', '23', 'melon02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('114', '23', 'melon03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('115', '23', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('116', '24', 'f_img24.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('117', '24', 'plum01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('118', '24', 'plum02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('119', '24', 'plum03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('120', '24', 'plum04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('121', '25', 'f_img25.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('122', '25', 'litchi01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('123', '25', 'litchi02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('124', '25', 'litchi03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('125', '25', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('126', '26', 'f_img26.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('127', '26', 'Crispy01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('128', '26', 'Crispy02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('129', '26', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('130', '26', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('131', '27', 'f_img27.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('132', '27', 'red01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('133', '27', 'red02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('134', '27', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('135', '27', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('136', '28', 'f_img28.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('137', '28', 'Australia01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('138', '28', 'Australia02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('139', '28', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('140', '28', 'fruits_img.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('141', '29', 'f_img29.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('142', '29', 'wampee01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('143', '29', 'wampee02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('144', '29', 'wampee03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('145', '29', 'wampee04.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('146', '30', 'f_img30.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('147', '30', 'mango01.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('148', '30', 'mango02.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('149', '30', 'mango03.jpg');
INSERT INTO `tb_fruits_picurl` VALUES ('150', '30', 'mango04.jpg');

-- ----------------------------
-- Table structure for tb_lunbo
-- ----------------------------
DROP TABLE IF EXISTS `tb_lunbo`;
CREATE TABLE `tb_lunbo` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_picurl` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_lunbo
-- ----------------------------
INSERT INTO `tb_lunbo` VALUES ('1', 'lunbo01.png');
INSERT INTO `tb_lunbo` VALUES ('2', 'lunbo02.jpg');
INSERT INTO `tb_lunbo` VALUES ('3', 'lunbo03.png');
INSERT INTO `tb_lunbo` VALUES ('4', 'lunbo04.jpg');

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_title` varchar(100) DEFAULT NULL,
  `n_content` longtext,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES ('1', '本站官方暂无提供APP下载，如您看到有我们的APP下载都是假冒，敬请注意下载到病毒木马APP', '本站暂无提供APP下载，如您在其它地方看到有我们的APP下载，谨防假冒病毒木马APP假冒，如我们APP上线，我们会在第一时间发布到我们的官网PC:www.guo68.com  手机：m.guo68.com , 需要手机操作与查看的，请使用m.guo68.com 跟APP一样的操作体验。');
INSERT INTO `tb_notice` VALUES ('2', '注意188shuiguo.com为高仿我站的钓鱼诈骗网站，请大家认准我们的域名:www.guo68.com', '注意188shuiguo.com为钓鱼诈骗网站，请大家认准我们的域名:www.guo68.com m.guo68.com guo68.com');
INSERT INTO `tb_notice` VALUES ('3', '老用户密码修改或找回不了，现在可以了', '最近有用户反馈修改或找回密码，输入密码确定后无反应，我们技术排查发现是系统bug，\r\n\r\n我们顺速修复了此bug，对此我们深感歉意！希望各位会员在使用平台中，有任何疑问第一时间向客服反应\r\n\r\n！我们及时处理！');
INSERT INTO `tb_notice` VALUES ('4', '骗子高发！大家一定注意！大量求购水果送样品，前去面谈的都是骗子', '骗子高发！大家一定注意！大量求购水果送样品，前去面谈的都是骗子！');
INSERT INTO `tb_notice` VALUES ('5', '紧急修复同货源受查看号码限制的BUG', '紧急修复同货源受查看号码限制的BUg\r\n\r\n紧急修复同货源受查看号码限制的BUg,现同一货源查看号码次数将不累计计数，号码查看将不受限制。');
INSERT INTO `tb_notice` VALUES ('6', '系统升级啦！新增收藏夹的功能，修复了老用户找回密码无限循环的BUG', '    系统升级啦！新增收藏夹的功能，可以把喜欢的货源收藏起来，方便下次查看。希望广大用户喜欢，赶快来体验吧！\r\n\r\n修复了老用户找回密码无限循环的BUG');
INSERT INTO `tb_notice` VALUES ('7', '江x康信息科技股份有限公司是骗子公司', '近两年，浙江台州、宁波等地出现了很多打着互联网+农产品产地直销的幌子，专门坑骗农户、农业企业的公司。浙江康联信息科技股份有限公司就是这样一家是骗子公司，其宣称自己在台州当地有线下农产品批发渠道。下面我跟大家说说我是如何被这个无良公司骗的。我在网上发布了销售鲜香菇的信息，浙江康联科技信息有限公司的业务员给我打电话说他们收鲜香菇，叫我过去谈。接待我的业务员跟我说他们公司是做农产品集中配送的，还拿出公司营业执照给我看，交谈中谈到了台州的鲜香菇价格、包装、运输，他们下订单，先交货款后发货等等，并且说他们有专门的冷藏车，只要是全国1400公里以内的都可以由他们直接派车到种植基地拉货。整个交谈过程他们表现的非常专业，很容易让人相信他们有实力。最后他们又说要合作得交13800元的质保金，以保证产品数量和质量，交易额达到30万元是可以退还的。考虑到押金可以退，他们能有这么大的销量，我就交了钱，跟他们签了合同。我回去之后一直催他们拿样品，下订单。这个业务员竟然说她不负责鲜茹，叫另外一个人打电话跟我联系，推拖着根本不拿样品，更没有意向下订单。后来直接把我拉黑了，电话也打不通了。我才意识到被骗了。我当天去了台州报案。但说你有合同就去法院打官司，要么多找一些受骗人一起到刑侦大队报****案。我为什么说浙江康联科技信息有限公司是骗子？1、我已经跟他们签了合同，他们****业务员又通过我在网上发布的信息找到我求合作卖香菇。他们明明已经有了供应商，收了保证金就晾一边，根本不想着跟已有的供应商合作，只想着再去找下一个行骗。2、受骗的不止我一个，他们的固定电话已经被很多人举报为了****电话。百度一下，或者搜一搜QQ群就能搜到很多人被这种骗子公司骗。这种骗子公司向农户、小型农业企业骗取保证金、服务费，却不提供任何服务。');
INSERT INTO `tb_notice` VALUES ('8', '关于老用户的积分与信息刷新功能的说明', '首先感谢您一直一来对《中国水果交易网》的支持与厚爱。因为平台新系统刚上线，我们还没有及时完成积分板块，因此您现在不能使用积分与查看积分，未来原有的积分我们会转换成《草莓》，可以在平台购买服务。关于信息刷新功能,后天以前上线。敬请关注用户中心的变化。');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_state` varchar(20) DEFAULT '待发货',
  `order_address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `uId` (`uId`),
  CONSTRAINT `tb_order_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `tb_user` (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('37', '1', '2021-12-12 15:59:20', '待收货', '华南科技学院');
INSERT INTO `tb_order` VALUES ('38', '1', '2021-12-12 15:59:22', '待收货', '华南科技学院');
INSERT INTO `tb_order` VALUES ('43', '1', '2021-12-12 15:59:26', '已发货', '华南科技学院');
INSERT INTO `tb_order` VALUES ('44', '2', '2021-12-12 13:52:20', '已收货', '湖南科技职业学院');
INSERT INTO `tb_order` VALUES ('45', '2', '2021-12-12 13:51:46', '已收货', '湖南麻阳县');
INSERT INTO `tb_order` VALUES ('46', '2', '2021-12-12 13:52:21', '待收货', '湖南科技职业学院');
INSERT INTO `tb_order` VALUES ('51', '2', '2021-12-12 13:51:47', '已收货', '湖南麻阳县');
INSERT INTO `tb_order` VALUES ('53', '2', '2021-12-12 13:52:23', '已收货', '湖南科技职业学院');
INSERT INTO `tb_order` VALUES ('57', '2', '2021-12-12 13:51:49', '待收货', '湖南麻阳县');
INSERT INTO `tb_order` VALUES ('58', '2', '2021-12-12 13:52:24', '已收货', '湖南科技职业学院');
INSERT INTO `tb_order` VALUES ('59', '2', '2021-12-12 13:51:50', '待收货', '湖南麻阳县');
INSERT INTO `tb_order` VALUES ('70', '2', '2021-12-12 13:52:26', '待收货', '湖南科技职业学院');
INSERT INTO `tb_order` VALUES ('71', '2', '2021-12-12 13:51:52', '已收货', '湖南麻阳县');
INSERT INTO `tb_order` VALUES ('72', '1', '2021-12-12 15:59:37', '待发货', '长沙市天心区');
INSERT INTO `tb_order` VALUES ('73', '2', '2021-12-12 13:51:54', '已收货', '湖南麻阳县');
INSERT INTO `tb_order` VALUES ('74', '2', '2021-12-12 13:52:28', '已收货', '湖南科技职业学院');
INSERT INTO `tb_order` VALUES ('75', '2', '2021-12-12 13:51:56', '待发货', '湖南麻阳县');
INSERT INTO `tb_order` VALUES ('82', '2', '2021-12-12 15:36:12', '待发货', '湖南科技职业学院');
INSERT INTO `tb_order` VALUES ('83', '2', '2022-06-02 09:24:22', '待发货', '湖南科技职业学院');
INSERT INTO `tb_order` VALUES ('84', '2', '2022-06-02 09:24:29', '待发货', '- - 请选择 - -');

-- ----------------------------
-- Table structure for tb_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_detail`;
CREATE TABLE `tb_order_detail` (
  `order_dId` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `goodsNum` int(11) DEFAULT NULL,
  `f_price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`order_dId`),
  KEY `order_id` (`order_id`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `tb_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_order` (`order_id`),
  CONSTRAINT `tb_order_detail_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `tb_fruits` (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_detail
-- ----------------------------
INSERT INTO `tb_order_detail` VALUES ('21', '37', '2', '1', '20');
INSERT INTO `tb_order_detail` VALUES ('22', '38', '4', '1', '3');
INSERT INTO `tb_order_detail` VALUES ('23', '43', '3', '2', '3');
INSERT INTO `tb_order_detail` VALUES ('24', '44', '5', '1', '6');
INSERT INTO `tb_order_detail` VALUES ('25', '45', '2', '1', '20');
INSERT INTO `tb_order_detail` VALUES ('26', '46', '8', '1', '5');
INSERT INTO `tb_order_detail` VALUES ('27', '51', '4', '1', '3');
INSERT INTO `tb_order_detail` VALUES ('28', '51', '2', '1', '20');
INSERT INTO `tb_order_detail` VALUES ('29', '53', '9', '2', '3');
INSERT INTO `tb_order_detail` VALUES ('37', '57', '5', '1', '6');
INSERT INTO `tb_order_detail` VALUES ('38', '57', '10', '2', '2');
INSERT INTO `tb_order_detail` VALUES ('39', '58', '3', '1', '3');
INSERT INTO `tb_order_detail` VALUES ('40', '58', '9', '1', '3');
INSERT INTO `tb_order_detail` VALUES ('41', '59', '6', '2', '3');
INSERT INTO `tb_order_detail` VALUES ('42', '59', '13', '1', '2');
INSERT INTO `tb_order_detail` VALUES ('53', '70', '5', '1', '6');
INSERT INTO `tb_order_detail` VALUES ('54', '71', '11', '1', '5');
INSERT INTO `tb_order_detail` VALUES ('55', '72', '4', '2', '3');
INSERT INTO `tb_order_detail` VALUES ('56', '72', '8', '4', '5');
INSERT INTO `tb_order_detail` VALUES ('57', '73', '1', '9', '4');
INSERT INTO `tb_order_detail` VALUES ('58', '73', '3', '1', '3');
INSERT INTO `tb_order_detail` VALUES ('59', '74', '4', '2', '3');
INSERT INTO `tb_order_detail` VALUES ('60', '74', '9', '3', '3');
INSERT INTO `tb_order_detail` VALUES ('61', '75', '10', '2', '2');
INSERT INTO `tb_order_detail` VALUES ('68', '82', '2', '1', '20');
INSERT INTO `tb_order_detail` VALUES ('69', '82', '5', '1', '6');
INSERT INTO `tb_order_detail` VALUES ('70', '84', '1', '4', '4');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `uId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `passWord` varchar(20) NOT NULL,
  `linkName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'chen', '123', '向宏水');
INSERT INTO `tb_user` VALUES ('2', 'cm', '123', '邓杰');
INSERT INTO `tb_user` VALUES ('3', 'ming', '123', '周思源');
INSERT INTO `tb_user` VALUES ('6', 'min', '123', '孙西文');
INSERT INTO `tb_user` VALUES ('7', 'mmm', '123', '小七');
