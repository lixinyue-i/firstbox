/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50610 (5.6.10)
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50610 (5.6.10)
 File Encoding         : 65001

 Date: 20/06/2024 17:05:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `goods_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `goods_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `unitprice` decimal(10, 2) NOT NULL COMMENT '价格',
  `quantity` int(11) NOT NULL COMMENT '商品数量',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `pic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '照片位置',
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `goods_name`(`goods_name`) USING BTREE,
  INDEX `unitprice`(`unitprice`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `pic`(`pic`) USING BTREE,
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`goods_name`) REFERENCES `goods` (`goods_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `car_ibfk_2` FOREIGN KEY (`unitprice`) REFERENCES `goods` (`unitprice`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `car_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `car_ibfk_4` FOREIGN KEY (`pic`) REFERENCES `goods` (`photo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('bi01', '狼毫毛笔', 199.00, 2, '1', 'images/bi/1.jpg');
INSERT INTO `car` VALUES ('bi02', '兼毫毛笔', 29.00, 3, '1', 'images/bi/2.jpg');
INSERT INTO `car` VALUES ('bi03', '羊毫毛笔', 199.00, 4, '1', 'images/bi/3.jpg');
INSERT INTO `car` VALUES ('bi04', '大明笔庄', 35.00, 1, '1', 'images/bi/4.jpg');
INSERT INTO `car` VALUES ('bi05', '大明笔庄九狼一羊', 99.20, 2, '1', 'images/bi/5.jpg');
INSERT INTO `car` VALUES ('mo04', '墨水', 12.00, 1, '1', 'images/mo/4.jpg');
INSERT INTO `car` VALUES ('yan03', '砚台', 13.00, 2, '1', 'images/yan/3.jpg');
INSERT INTO `car` VALUES ('zhi02', '纸张', 1.00, 1, '1', 'images/zhi/2.jpg');
INSERT INTO `car` VALUES ('zhi03', '纸张', 4.00, 2, '1', 'images/zhi/3.jpg');
INSERT INTO `car` VALUES ('zhi04', '纸张', 5.00, 1, '1', 'images/zhi/4.jpg');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `goods_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类别分类',
  `unitprice` decimal(10, 2) NOT NULL COMMENT '商品单价',
  `stock` int(11) NOT NULL COMMENT '商品库存数量',
  `factory` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生产厂家',
  `photo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品封面照片',
  `details` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情介绍',
  `add_time` datetime NOT NULL COMMENT '商品上架时间',
  `change_time` datetime NULL DEFAULT NULL COMMENT '商品信息更新时间',
  `goods_state` int(11) NOT NULL COMMENT '商品当前状态',
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `goods_name`(`goods_name`) USING BTREE,
  INDEX `unitprice`(`unitprice`) USING BTREE,
  INDEX `goods_id`(`goods_id`, `goods_name`, `unitprice`) USING BTREE,
  INDEX `photo`(`photo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('bi01', '狼毫毛笔', '笔', 199.00, 99, '厂家1', 'images/bi/1.jpg', '狼毫毛笔', '2024-01-01 00:00:00', '2024-01-02 00:00:00', 0);
INSERT INTO `goods` VALUES ('bi02', '兼毫毛笔', '笔', 29.00, 99, '厂家1', 'images/bi/2.jpg', '兼毫毛笔', '2024-01-01 00:00:00', '2024-01-02 00:00:00', 0);
INSERT INTO `goods` VALUES ('bi03', '羊毫毛笔', '笔', 199.00, 99, '厂家1', 'images/bi/3.jpg', '羊毫毛笔', '2024-01-01 00:00:00', '2024-01-02 00:00:00', 0);
INSERT INTO `goods` VALUES ('bi04', '大明笔庄', '笔', 35.00, 99, '厂家1', 'images/bi/4.jpg', '狼毫毛笔', '2024-01-01 00:00:00', '2024-01-02 00:00:00', 0);
INSERT INTO `goods` VALUES ('bi05', '大明笔庄九狼一羊', '笔', 99.20, 99, '厂家1', 'images/bi/5.jpg', '狼毫毛笔', '2024-01-01 00:00:00', '2024-01-02 00:00:00', 0);
INSERT INTO `goods` VALUES ('mo01', '墨水', '墨', 7.00, 2000, '厂家3', 'images/mo/1.jpg', '墨', '2024-02-02 00:00:00', '2024-03-02 00:00:00', 0);
INSERT INTO `goods` VALUES ('mo02', '墨水', '墨', 9.00, 2000, '厂家3', 'images/mo/2.jpg', '墨', '2024-02-02 00:00:00', '2024-03-02 00:00:00', 0);
INSERT INTO `goods` VALUES ('mo03', '墨水', '墨', 13.00, 2000, '厂家3', 'images/mo/3.jpg', '墨', '2024-02-02 00:00:00', '2024-03-02 00:00:00', 0);
INSERT INTO `goods` VALUES ('mo04', '墨水', '墨', 12.00, 2000, '厂家3', 'images/mo/4.jpg', '墨', '2024-02-02 00:00:00', '2024-03-02 00:00:00', 0);
INSERT INTO `goods` VALUES ('yan01', '砚台', '砚', 29.00, 10000, '厂家4', 'images/yan/1.jpg', '砚', '2024-05-01 00:00:00', '2024-07-01 00:00:00', 0);
INSERT INTO `goods` VALUES ('yan02', '砚台', '砚', 35.00, 10000, '厂家4', 'images/yan/2.jpg', '砚', '2024-05-01 00:00:00', '2024-07-01 00:00:00', 0);
INSERT INTO `goods` VALUES ('yan03', '砚台', '砚', 13.00, 10000, '厂家4', 'images/yan/3.jpg', '砚', '2024-05-01 00:00:00', '2024-07-01 00:00:00', 0);
INSERT INTO `goods` VALUES ('yan04', '砚台', '砚', 15.00, 10000, '厂家4', 'images/yan/4.jpg', '砚', '2024-05-01 00:00:00', '2024-07-01 00:00:00', 0);
INSERT INTO `goods` VALUES ('zhi01', '纸张', '纸', 9.00, 1000, '厂家2', 'images/zhi/1.jpg', '纸', '2024-02-01 00:00:00', '2024-03-01 00:00:00', 0);
INSERT INTO `goods` VALUES ('zhi02', '纸张', '纸', 1.00, 1000, '厂家2', 'images/zhi/2.jpg', '纸', '2024-02-01 00:00:00', '2024-03-01 00:00:00', 0);
INSERT INTO `goods` VALUES ('zhi03', '纸张', '纸', 4.00, 1000, '厂家2', 'images/zhi/3.jpg', '纸', '2024-02-01 00:00:00', '2024-03-01 00:00:00', 0);
INSERT INTO `goods` VALUES ('zhi04', '纸张', '纸', 5.00, 1000, '厂家2', 'images/zhi/4.jpg', '纸', '2024-02-01 00:00:00', '2024-03-01 00:00:00', 0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_state` int(11) NOT NULL,
  `totalPrice` decimal(10, 2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creationTime` datetime NOT NULL,
  `pay_time` datetime NOT NULL,
  `ship_time` datetime NULL DEFAULT NULL,
  `receipt_time` datetime NULL DEFAULT NULL,
  `receipt_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `sex` int(11) NULL DEFAULT NULL COMMENT '男为1，女为0',
  `birth` date NULL DEFAULT NULL COMMENT '出生日期',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `creationTime` datetime NOT NULL COMMENT '用户注册时间',
  `power` int(11) NULL DEFAULT NULL COMMENT '0是普通用户，1是管理员',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_id`(`user_id`, `address`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '久坐少女没有臀', '12345678', 0, '2024-04-01', '广东海洋大学', '001', '100@163.com', '2024-06-18 10:36:44', 0);
INSERT INTO `user` VALUES ('1111', '普通用户', '11111111', NULL, '2024-06-14', '广东省湛江市麻章区海大路广东海洋大学', '13686510357', 'gk190100@163.com', '2024-06-18 10:40:08', NULL);

SET FOREIGN_KEY_CHECKS = 1;
