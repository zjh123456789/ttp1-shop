/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-10-25 18:56:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('11', '寂寞哥', '123', '普通管理员');
INSERT INTO `admin` VALUES ('12', '玛丽', '23', '超级管理员');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('5', '测试品5');
INSERT INTO `category` VALUES ('6', '测试品6');
INSERT INTO `category` VALUES ('7', '测试品7');
INSERT INTO `category` VALUES ('8', '测试品8');
INSERT INTO `category` VALUES ('11', '液晶电视');
INSERT INTO `category` VALUES ('12', '智能手机');
INSERT INTO `category` VALUES ('13', '个人电脑');
INSERT INTO `category` VALUES ('14', 'computer');
INSERT INTO `category` VALUES ('15', '服装产品');
INSERT INTO `category` VALUES ('16', '家用电器');
INSERT INTO `category` VALUES ('19', '测试分类');

-- ----------------------------
-- Table structure for `credit`
-- ----------------------------
DROP TABLE IF EXISTS `credit`;
CREATE TABLE `credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of credit
-- ----------------------------
INSERT INTO `credit` VALUES ('1', '青铜', '344', '1');
INSERT INTO `credit` VALUES ('2', '白银', '3452', '1');
INSERT INTO `credit` VALUES ('3', '黄金', '21111', '1');

-- ----------------------------
-- Table structure for `order_`
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `user_message` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES ('1', '201808241638122609867', '厦门市，集美区，集美大道，668号 ', 'Chery', '15110000001', null, '2016-12-30 00:00:00', null, '2018-10-19 10:39:50', null, '14', 'waitConfirm');
INSERT INTO `order_` VALUES ('2', '201810241647326966685', '思明区', '熊', '12345678909', null, '2018-10-24 16:47:32', '2018-10-24 16:54:13', null, null, '1', 'waitDelivery');
INSERT INTO `order_` VALUES ('3', '201810241729244821794', 'xiamen', '张三', '22222222222', null, '2018-10-24 17:29:24', '2018-10-24 17:42:12', '2018-10-24 17:53:41', null, '1', 'waitConfirm');
INSERT INTO `order_` VALUES ('4', '201810241736418706477', 'sssssssssssss', '', '', null, '2018-10-24 17:36:41', '2018-10-24 17:36:44', '2018-10-24 17:42:46', '2018-10-24 18:18:37', '1', 'delete');
INSERT INTO `order_` VALUES ('5', '201810251431344304398', '集美', 'xxx', '12398745621', null, '2018-10-25 14:31:34', '2018-10-25 14:31:37', null, null, '1', 'waitDelivery');

-- ----------------------------
-- Table structure for `order_item`
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_product` (`pid`),
  KEY `fk_orderitem_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('1', '13', '1', '1', '3');
INSERT INTO `order_item` VALUES ('2', '11', '2', '1', '2');
INSERT INTO `order_item` VALUES ('3', '12', '1', '2', '1');
INSERT INTO `order_item` VALUES ('4', '14', '1', null, '4');
INSERT INTO `order_item` VALUES ('5', '14', '1', '3', '1');
INSERT INTO `order_item` VALUES ('6', '14', '1', '5', '1');
INSERT INTO `order_item` VALUES ('7', '13', '1', null, '1');
INSERT INTO `order_item` VALUES ('8', '13', '1', '4', '1');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `original_price` float DEFAULT NULL,
  `promote_price` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '小机器人', null, '999', '99', '17', '2018-10-17 10:04:39');
INSERT INTO `product` VALUES ('2', '3', null, null, '78', '17', '2018-10-17 11:28:51');
INSERT INTO `product` VALUES ('4', '测试机器人3号', null, '888.8', '99', '17', '2018-10-17 13:46:22');
INSERT INTO `product` VALUES ('6', '测试商品1', '23232', '19.98', '99', '19', '2018-10-17 14:41:48');
INSERT INTO `product` VALUES ('8', '测试商品3', '3232', '333', '99', '19', '2018-10-17 14:42:30');
INSERT INTO `product` VALUES ('9', '测试商品4', null, '555', '99', '19', '2018-10-17 14:51:14');
INSERT INTO `product` VALUES ('10', '测试商品5', '32423', '19.98', '99', '19', '2018-10-17 14:56:03');
INSERT INTO `product` VALUES ('11', '测试商品6', '444', '19.98', '99', '19', '2018-10-17 14:56:33');
INSERT INTO `product` VALUES ('12', '测试商品6', '99.98', '19.98', '99', '19', '2018-10-17 14:59:32');
INSERT INTO `product` VALUES ('13', '测试商品8', '2323', '999', '99', '19', '2018-10-17 15:06:01');
INSERT INTO `product` VALUES ('14', '1号计算机', '99.98', '19.98', '99', '16', '2018-10-19 10:48:05');

-- ----------------------------
-- Table structure for `product_image`
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productimage_product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('9', '11');
INSERT INTO `product_image` VALUES ('8', '12');
INSERT INTO `product_image` VALUES ('5', '13');
INSERT INTO `product_image` VALUES ('6', '13');
INSERT INTO `product_image` VALUES ('7', '13');
INSERT INTO `product_image` VALUES ('10', '14');
INSERT INTO `product_image` VALUES ('11', '16');
INSERT INTO `product_image` VALUES ('12', '16');

-- ----------------------------
-- Table structure for `property`
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('1', '17', '颜色');
INSERT INTO `property` VALUES ('4', '17', '重量');
INSERT INTO `property` VALUES ('5', '17', '材质');
INSERT INTO `property` VALUES ('7', '16', '大小');
INSERT INTO `property` VALUES ('8', '16', '颜色');
INSERT INTO `property` VALUES ('9', '19', '适合人群');
INSERT INTO `property` VALUES ('10', '19', '颜色');
INSERT INTO `property` VALUES ('11', '19', '材质');

-- ----------------------------
-- Table structure for `property_value`
-- ----------------------------
DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `ptid` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property_value
-- ----------------------------
INSERT INTO `property_value` VALUES ('1', null, '11', null);
INSERT INTO `property_value` VALUES ('2', null, '10', null);
INSERT INTO `property_value` VALUES ('3', null, '9', null);
INSERT INTO `property_value` VALUES ('4', null, '11', null);
INSERT INTO `property_value` VALUES ('5', null, '10', null);
INSERT INTO `property_value` VALUES ('6', null, '9', null);
INSERT INTO `property_value` VALUES ('7', null, '11', null);
INSERT INTO `property_value` VALUES ('8', null, '10', null);
INSERT INTO `property_value` VALUES ('9', null, '9', null);
INSERT INTO `property_value` VALUES ('10', null, '11', null);
INSERT INTO `property_value` VALUES ('11', null, '10', null);
INSERT INTO `property_value` VALUES ('12', null, '9', null);
INSERT INTO `property_value` VALUES ('13', null, '11', null);
INSERT INTO `property_value` VALUES ('14', null, '10', null);
INSERT INTO `property_value` VALUES ('15', null, '9', null);
INSERT INTO `property_value` VALUES ('16', null, '11', null);
INSERT INTO `property_value` VALUES ('17', null, '10', null);
INSERT INTO `property_value` VALUES ('18', null, '9', null);
INSERT INTO `property_value` VALUES ('19', null, '11', null);
INSERT INTO `property_value` VALUES ('20', null, '10', null);
INSERT INTO `property_value` VALUES ('21', null, '9', null);
INSERT INTO `property_value` VALUES ('22', null, '11', null);
INSERT INTO `property_value` VALUES ('23', null, '10', null);
INSERT INTO `property_value` VALUES ('24', null, '9', null);
INSERT INTO `property_value` VALUES ('25', null, '11', null);
INSERT INTO `property_value` VALUES ('26', null, '10', null);
INSERT INTO `property_value` VALUES ('27', null, '9', null);
INSERT INTO `property_value` VALUES ('28', '13', '11', '纯棉');
INSERT INTO `property_value` VALUES ('29', '13', '10', '白');
INSERT INTO `property_value` VALUES ('30', '13', '9', '中学生');
INSERT INTO `property_value` VALUES ('31', '11', '11', 'ers');
INSERT INTO `property_value` VALUES ('32', '11', '10', 'rege');
INSERT INTO `property_value` VALUES ('33', '11', '9', 'reg');
INSERT INTO `property_value` VALUES ('34', '12', '11', null);
INSERT INTO `property_value` VALUES ('35', '12', '10', null);
INSERT INTO `property_value` VALUES ('36', '12', '9', null);
INSERT INTO `property_value` VALUES ('37', '7', '11', null);
INSERT INTO `property_value` VALUES ('38', '7', '10', null);
INSERT INTO `property_value` VALUES ('39', '7', '9', null);
INSERT INTO `property_value` VALUES ('40', '16', '11', '而为问问士大夫');
INSERT INTO `property_value` VALUES ('41', '16', '10', '而二位打算');
INSERT INTO `property_value` VALUES ('42', '16', '9', '而二位士大夫');
INSERT INTO `property_value` VALUES ('43', '4', '5', null);
INSERT INTO `property_value` VALUES ('44', '4', '4', null);
INSERT INTO `property_value` VALUES ('45', '4', '1', null);
INSERT INTO `property_value` VALUES ('46', '14', '8', null);
INSERT INTO `property_value` VALUES ('47', '14', '7', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `credit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Tom', '123', '男', '13323390789', '福建厦门', 'qq@.com', '1000');
INSERT INTO `user` VALUES ('8', 'Jerry', '123', '男', '123', '厦门', '123@qq.com', null);
INSERT INTO `user` VALUES ('11', '宝石', '12', '男', '12345', '北京', '12@qq.com', null);
