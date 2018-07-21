/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.5.57 : Database - db_groupitems
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_groupitems` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_groupitems`;

/*Table structure for table `tb_answer` */

DROP TABLE IF EXISTS `tb_answer`;

CREATE TABLE `tb_answer` (
  `aid` varchar(36) NOT NULL COMMENT '回答',
  `quid` varchar(36) DEFAULT NULL COMMENT '用户提问id',
  `answer` varchar(255) DEFAULT NULL COMMENT '回答',
  `adate` date DEFAULT NULL COMMENT '回答问题时间',
  `uid` varchar(36) DEFAULT NULL COMMENT '答复者',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_answer` */

/*Table structure for table `tb_detail` */

DROP TABLE IF EXISTS `tb_detail`;

CREATE TABLE `tb_detail` (
  `did` varchar(36) NOT NULL COMMENT '详情(identity)主键',
  `pid` varchar(36) DEFAULT NULL COMMENT '商品id',
  `outside` varchar(36) DEFAULT NULL COMMENT '外观',
  `paramid` varchar(36) DEFAULT NULL COMMENT '参数id(tb_param)',
  `advice` varchar(255) DEFAULT NULL COMMENT '推荐配件',
  `contain` varchar(255) DEFAULT NULL COMMENT '该商品内含物品',
  `notice` varchar(255) DEFAULT NULL COMMENT '注意事项',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_detail` */

insert  into `tb_detail`(`did`,`pid`,`outside`,`paramid`,`advice`,`contain`,`notice`) values ('123','1',NULL,'1','手机套+小米耳机','小米充电器一条,手机一部,贴膜一片,手机壳一个,蓝牙耳机一副','不能接触高温,水源');

/*Table structure for table `tb_evaluation` */

DROP TABLE IF EXISTS `tb_evaluation`;

CREATE TABLE `tb_evaluation` (
  `eid` varchar(36) NOT NULL COMMENT '商品评价',
  `uid` varchar(36) DEFAULT NULL COMMENT '评价用户',
  `edate` date DEFAULT NULL COMMENT '评价时间',
  `econ` varchar(255) DEFAULT NULL COMMENT '评价内容',
  `estar` int(11) DEFAULT NULL COMMENT '喜欢程度:1不满意,2一般,3满意',
  `pid` varchar(36) DEFAULT NULL COMMENT '商品主键id',
  `enum` int(11) DEFAULT NULL COMMENT '点赞人数',
  `image` varchar(36) DEFAULT NULL COMMENT '拍照评价',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_evaluation` */

insert  into `tb_evaluation`(`eid`,`uid`,`edate`,`econ`,`estar`,`pid`,`enum`,`image`) values ('1','1','1012-12-12','这款手机真棒,下次我还买',3,'1',34,NULL);

/*Table structure for table `tb_headline` */

DROP TABLE IF EXISTS `tb_headline`;

CREATE TABLE `tb_headline` (
  `hid` varchar(36) NOT NULL COMMENT '标签id',
  `parend_id` varchar(36) DEFAULT NULL COMMENT '父标签id',
  `image` varchar(36) DEFAULT NULL COMMENT '图片',
  `title` varchar(36) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_headline` */

insert  into `tb_headline`(`hid`,`parend_id`,`image`,`title`) values ('1','0',NULL,'手机,电话卡'),('10','0',NULL,'生活,箱包'),('11','1',NULL,'小米8'),('12','1',NULL,'红米5'),('13','1',NULL,'红米5 plus'),('14','2',NULL,'小米电视4A'),('15','2',NULL,'小米电视5A'),('16','2',NULL,'小米电视4X'),('17','3',NULL,'小米游戏本'),('18','3',NULL,'笔记本'),('19','3',NULL,'小米平板'),('2','0',NULL,'电视,盒子'),('20','4',NULL,'空气净化器'),('21','4',NULL,'车载空气净化器'),('22','5',NULL,'手表'),('23','5',NULL,'体重计'),('24','6',NULL,'平衡车'),('25','6',NULL,'行车记录仪'),('26','7',NULL,'小米路由器3'),('27','7',NULL,'小米路由器4'),('28','8',NULL,'小米移动电源'),('29','8',NULL,'小米插座'),('3','0',NULL,'笔记本,平板'),('30','9',NULL,'小米游戏耳机'),('31','9',NULL,'小米蓝牙项圈'),('32','10',NULL,'体温计'),('33','10',NULL,'血压计'),('4','0',NULL,'智能,家电'),('5','0',NULL,'健康,家居'),('6','0',NULL,'出行,儿童'),('7','0',NULL,'路由器,手机配件'),('8','0',NULL,'移动电源,插线板'),('9','0',NULL,'耳机,音箱');

/*Table structure for table `tb_image` */

DROP TABLE IF EXISTS `tb_image`;

CREATE TABLE `tb_image` (
  `iid` varchar(36) NOT NULL COMMENT '图片主键',
  `tname` varchar(36) DEFAULT NULL COMMENT '类型名称',
  `tid` varchar(36) DEFAULT NULL COMMENT '类型id',
  `image` varchar(36) DEFAULT NULL COMMENT '图片地址',
  `icon` varchar(66) DEFAULT NULL COMMENT '图片内容',
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_image` */

insert  into `tb_image`(`iid`,`tname`,`tid`,`image`,`icon`) values ('1','轮播图','1',NULL,NULL),('2','轮播图','1',NULL,NULL),('3','轮播图','1',NULL,NULL),('4','热门手机','2',NULL,NULL),('5','热门手机','2',NULL,NULL),('6','热门手机','2',NULL,NULL);

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `oid` varchar(36) NOT NULL COMMENT '订单主键',
  `total_money` double DEFAULT NULL COMMENT '总价',
  `ostatus` int(11) DEFAULT NULL COMMENT '订单状态:1未付款,2已付款,3未发货,4已发货,5交易成功,6交易关闭',
  `odate` date DEFAULT NULL COMMENT '订单生成时间',
  `uid` varchar(36) DEFAULT NULL COMMENT '用户主键',
  `postage` double DEFAULT NULL COMMENT '邮费',
  `paydate` date DEFAULT NULL COMMENT '付款时间',
  `senddate` date DEFAULT NULL COMMENT '发货时间',
  `receivedate` date DEFAULT NULL COMMENT '收件时间',
  `receiveName` varchar(36) DEFAULT NULL COMMENT '收件人姓名',
  `receiveAddress` varchar(255) DEFAULT NULL COMMENT '收件人地址',
  `receivePhone` varchar(36) DEFAULT NULL COMMENT '收件人电话',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_order` */

/*Table structure for table `tb_orderitems` */

DROP TABLE IF EXISTS `tb_orderitems`;

CREATE TABLE `tb_orderitems` (
  `orderitemid` varchar(36) NOT NULL COMMENT '订单中某一商品',
  `pid` varchar(36) DEFAULT NULL COMMENT '商品id',
  `pcount` int(11) DEFAULT NULL COMMENT '购买数量',
  `oid` varchar(36) DEFAULT NULL COMMENT '订单id',
  `price` double DEFAULT NULL COMMENT '该项总额',
  `pname` varchar(36) DEFAULT NULL COMMENT '商品名称',
  `image` varchar(36) DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`orderitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_orderitems` */

/*Table structure for table `tb_param` */

DROP TABLE IF EXISTS `tb_param`;

CREATE TABLE `tb_param` (
  `paramid` varchar(36) NOT NULL COMMENT '参数id',
  `name` varchar(36) DEFAULT NULL COMMENT '产品名称',
  `model` varchar(36) DEFAULT NULL COMMENT '产品型号',
  `weight` varchar(36) DEFAULT NULL COMMENT '产品重量',
  `wifi` varchar(36) DEFAULT NULL COMMENT '无线连接',
  `bluetooth` varchar(36) DEFAULT NULL COMMENT '蓝牙',
  `display` varchar(36) DEFAULT NULL COMMENT '显示屏',
  `workTemp` varchar(36) DEFAULT NULL COMMENT '工作温度',
  `storeTemp` varchar(36) DEFAULT NULL COMMENT '贮藏温度',
  `standard` varchar(36) DEFAULT NULL COMMENT '执行标准',
  `sound` varchar(36) DEFAULT NULL COMMENT '录音',
  `aperture` varchar(36) DEFAULT NULL COMMENT '相机光圈',
  `focal` varchar(36) DEFAULT NULL COMMENT '相机焦距',
  `wideAngle` varchar(36) DEFAULT NULL COMMENT '相机广角',
  `resolution` varchar(36) DEFAULT NULL COMMENT '相机分辨率',
  `pid` varchar(36) DEFAULT NULL COMMENT '商品编号',
  PRIMARY KEY (`paramid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_param` */

/*Table structure for table `tb_product` */

DROP TABLE IF EXISTS `tb_product`;

CREATE TABLE `tb_product` (
  `pid` varchar(36) NOT NULL COMMENT '商品id',
  `pname` varchar(36) DEFAULT NULL COMMENT '商品名称',
  `pnum` int(11) DEFAULT NULL COMMENT '库存数量',
  `marketPrice` double DEFAULT NULL COMMENT '市场价格',
  `shopPrice` double DEFAULT NULL COMMENT '价格',
  `pdesc` text COMMENT '商品简介',
  `pidentity` varchar(255) DEFAULT NULL COMMENT '商品亮点',
  `image` varchar(50) DEFAULT NULL COMMENT '商品图片',
  `create` date DEFAULT NULL COMMENT '加入商品时间',
  `pstatus` int(11) DEFAULT '0' COMMENT '商品状态:1正常,2下架,3删除',
  `hid` varchar(36) DEFAULT NULL COMMENT '标签类别id',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_product` */

insert  into `tb_product`(`pid`,`pname`,`pnum`,`marketPrice`,`shopPrice`,`pdesc`,`pidentity`,`image`,`create`,`pstatus`,`hid`) values ('1','小米手机',99,123,99,NULL,'轻巧',NULL,'2012-12-01',1,'11');

/*Table structure for table `tb_question` */

DROP TABLE IF EXISTS `tb_question`;

CREATE TABLE `tb_question` (
  `qid` varchar(36) NOT NULL COMMENT '提示问题主键',
  `question` varchar(36) DEFAULT NULL COMMENT '提示问题',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_question` */

insert  into `tb_question`(`qid`,`question`) values ('123','你的名字?'),('23','你的生日是?'),('231','你最喜欢的明星是谁?'),('234','你的父亲叫什么?'),('3453','你的母亲叫什么?');

/*Table structure for table `tb_quiz` */

DROP TABLE IF EXISTS `tb_quiz`;

CREATE TABLE `tb_quiz` (
  `quid` varchar(36) NOT NULL COMMENT '用户提问',
  `qucon` varchar(36) DEFAULT NULL COMMENT '提问内容',
  `pid` varchar(36) DEFAULT NULL COMMENT '针对某件商品提问',
  `qudate` date DEFAULT NULL COMMENT '提问时间',
  `qunum` int(11) DEFAULT '0' COMMENT '点赞数量',
  `uid` varchar(36) DEFAULT NULL COMMENT '提问者',
  PRIMARY KEY (`quid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_quiz` */

insert  into `tb_quiz`(`quid`,`qucon`,`pid`,`qudate`,`qunum`,`uid`) values ('433','什么时候能够补充货物','1','2012-12-01',3,'1');

/*Table structure for table `tb_reply` */

DROP TABLE IF EXISTS `tb_reply`;

CREATE TABLE `tb_reply` (
  `rid` varchar(36) NOT NULL COMMENT '回复评论',
  `uid` varchar(36) DEFAULT NULL COMMENT '回复人',
  `rcon` varchar(255) DEFAULT NULL COMMENT '回复内容',
  `rdate` date DEFAULT NULL COMMENT '回复时间',
  `eid` varchar(36) DEFAULT NULL COMMENT '回复评论id',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_reply` */

insert  into `tb_reply`(`rid`,`uid`,`rcon`,`rdate`,`eid`) values ('143','1','感谢你对小米手机的支持','2012-12-12','1');

/*Table structure for table `tb_store` */

DROP TABLE IF EXISTS `tb_store`;

CREATE TABLE `tb_store` (
  `sid` varchar(36) NOT NULL COMMENT '门店主键',
  `province` varchar(36) DEFAULT NULL COMMENT '省',
  `city` varchar(36) DEFAULT NULL COMMENT '市',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `telephone` varchar(36) DEFAULT NULL COMMENT '电话',
  `sname` varchar(36) DEFAULT NULL COMMENT '门店名称',
  `workdate` varchar(36) DEFAULT NULL COMMENT '营业时间',
  `bus` varchar(255) DEFAULT NULL COMMENT '附近公交',
  `image` varchar(36) DEFAULT NULL COMMENT '门店布置',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_store` */

insert  into `tb_store`(`sid`,`province`,`city`,`address`,`telephone`,`sname`,`workdate`,`bus`,`image`) values ('123123','浙江','杭州','杭州市江干区九堡镇千锋教育','13222222222','千峰小米受理网点','9:00~21:00','地铁4号线',NULL);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `uid` varchar(36) NOT NULL COMMENT '用户主键',
  `uname` varchar(36) DEFAULT NULL COMMENT '昵称',
  `username` varchar(36) DEFAULT NULL COMMENT '账号',
  `password` varchar(36) DEFAULT NULL COMMENT '密码',
  `usex` varchar(36) DEFAULT NULL COMMENT '性别',
  `uphone` varchar(36) DEFAULT NULL COMMENT '手机号',
  `uemail` varchar(36) DEFAULT NULL COMMENT '邮箱',
  `umoney` double DEFAULT '0' COMMENT '金额',
  `ubirthday` date DEFAULT NULL COMMENT '生日',
  `create` date DEFAULT NULL COMMENT '创建账号时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`uid`,`uname`,`username`,`password`,`usex`,`uphone`,`uemail`,`umoney`,`ubirthday`,`create`) values ('1','猫哥','qqq','123','male','13222222222','qwe@qq.com',999,'2013-01-03','2012-12-12');

/*Table structure for table `tb_user_question` */

DROP TABLE IF EXISTS `tb_user_question`;

CREATE TABLE `tb_user_question` (
  `uqid` varchar(36) NOT NULL COMMENT '用户与提示问题中间表',
  `qid` varchar(36) DEFAULT NULL COMMENT '提示问题id',
  `uid` varchar(36) DEFAULT NULL COMMENT '用户主键',
  `answer` varchar(50) DEFAULT NULL COMMENT '问题答案',
  PRIMARY KEY (`uqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_user_question` */

insert  into `tb_user_question`(`uqid`,`qid`,`uid`,`answer`) values ('11111','231','1','周星驰');

/*Table structure for table `tb_view` */

DROP TABLE IF EXISTS `tb_view`;

CREATE TABLE `tb_view` (
  `vid` varchar(36) NOT NULL COMMENT '概述',
  `vtitle` varchar(36) DEFAULT NULL COMMENT '概述标题',
  `image` varchar(36) DEFAULT NULL COMMENT '图片',
  `vcon` varchar(255) DEFAULT NULL COMMENT '概述内容',
  `pid` varchar(36) DEFAULT NULL COMMENT '商品id的概述',
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_view` */

insert  into `tb_view`(`vid`,`vtitle`,`image`,`vcon`,`pid`) values ('1234','小米手机S10',NULL,'这是一款非常优秀的手机','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
