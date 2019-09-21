/*
Navicat MySQL Data Transfer

Source Server         : localhost_90
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : customersupport3

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2018-12-24 13:21:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `adminname` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `accountNonExpired` tinyint(1) NOT NULL,
  ` accountNonLocked` tinyint(1) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `UserPrincipal_Username` (`adminname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'Nicholas', 'password', '0', '0', '1', 'test1@123.com');
INSERT INTO `admin` VALUES ('2', 'Sarah', 'drowssap', '0', '0', '1', 'test2@123.com');
INSERT INTO `admin` VALUES ('3', 'Mike', 'wordpass', '0', '0', '1', 'test3@123.com');
INSERT INTO `admin` VALUES ('4', 'admin', '123456', '0', '0', '1', 'test4@123.com');
INSERT INTO `admin` VALUES ('5', 'John', 'green', '0', '0', '1', 'test5@123.com');
INSERT INTO `admin` VALUES ('6', 'guest', 'guest', '0', '0', '1', 'test6@123.com');

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `attachmentId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimeType` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fileUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `studentId` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`attachmentId`),
  KEY `ticketId` (`studentId`),
  CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('2', 'test', 'mp3', 'test', '23');
INSERT INTO `attachment` VALUES ('3', 'test', 'test', 'test', '23');
INSERT INTO `attachment` VALUES ('4', 'test', 'test234', 'tst', '24');
INSERT INTO `attachment` VALUES ('6', 'tst', 'tes', 'ts', '41');
INSERT INTO `attachment` VALUES ('7', 'tes', 'tes', 'twes', '41');
INSERT INTO `attachment` VALUES ('10', '4_微信图片编辑_20181028201955.jpg', 'image/jpeg', '/upload/4_微信图片编辑_20181028201955.jpg', '62');
INSERT INTO `attachment` VALUES ('11', '4_电子科技大学学报 2018 碳感知 何怀文(修订3 提交).pdf', 'application/pdf', '/upload/4_电子科技大学学报 2018 碳感知 何怀文(修订3 提交).pdf', '63');
INSERT INTO `attachment` VALUES ('12', '4_机器学习1.pdf', 'application/pdf', '/upload/4_机器学习1.pdf', '64');
INSERT INTO `attachment` VALUES ('13', '4_网络拓扑图.vsd', 'application/vnd.visio', '/upload/4_网络拓扑图.vsd', '64');
INSERT INTO `attachment` VALUES ('14', '4_CPE5044(proof).pdf', 'application/pdf', '/upload/4_CPE5044(proof).pdf', '65');
INSERT INTO `attachment` VALUES ('15', '4_s2.pdf', 'application/pdf', '/upload/4_s2.pdf', '65');
INSERT INTO `attachment` VALUES ('16', '6_我的家乡.ppt', 'application/vnd.ms-powerpoint', '/upload/6_我的家乡.ppt', '82');
INSERT INTO `attachment` VALUES ('17', '6_上项目到github步骤.txt', 'text/plain', '/upload/6_上项目到github步骤.txt', '85');
INSERT INTO `attachment` VALUES ('18', '6_c67b4d901494289cfb15445a8e11660c.jpg', 'image/jpeg', '/upload/6_c67b4d901494289cfb15445a8e11660c.jpg', '86');
INSERT INTO `attachment` VALUES ('19', '6_我的家乡.ppt', 'application/vnd.ms-powerpoint', '/upload/6_我的家乡.ppt', '87');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cellphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  KEY `UserId` (`adminId`) USING BTREE,
  KEY `ticketId` (`studentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('23', '1', '黄宗泽', '中国香港新界区', '2018-12-22 15:33:59', '15338261500', null, '1');
INSERT INTO `student` VALUES ('24', '2', '钟嘉欣', '中国香港钵兰街区', '2018-12-18 15:07:51', '15338261775', '不公开', '1');
INSERT INTO `student` VALUES ('25', '3', '薛凯琪', '中国香港渔村区', '2018-12-17 21:05:06', '15338261500', '男', '1');
INSERT INTO `student` VALUES ('26', '4', '周柏豪', '中国香港铜锣湾区', '2018-12-17 20:06:38', '15338261777', '男', '1');
INSERT INTO `student` VALUES ('27', '5', '林峰', '中国香港下街区', '2018-12-17 21:05:10', '15338261776', '男', '1');
INSERT INTO `student` VALUES ('28', '6', '梁朝伟', '中国香港上下九区', '2018-12-17 21:05:13', '15338261779', '男', '1');
INSERT INTO `student` VALUES ('29', '1', '何伟志', ' 中国广东省中山 市石歧区          ', '2018-12-17 21:05:25', '15338261799', '男', '1');
INSERT INTO `student` VALUES ('41', '2', '周柏豪', '中国香港铜锣湾区', '2018-12-17 21:05:26', '15338261777', '男', '1');
INSERT INTO `student` VALUES ('42', '3', '林峰', '中国香港下街区', '2018-12-17 21:05:26', '15338261776', '男', '1');
INSERT INTO `student` VALUES ('43', '4', '梁朝伟', '中国香港上下九区', '2018-12-17 20:06:39', '15338261779', '男', '1');
INSERT INTO `student` VALUES ('46', '5', '何伟志', ' 中国广东省中山 市石歧区          ', '2018-12-18 15:12:51', '15338261500', '男', '1');
INSERT INTO `student` VALUES ('47', '1', '黄子华', '中国香港九龙区', '2018-12-17 23:38:22', '15338261500', '男', '1');
INSERT INTO `student` VALUES ('49', '2', '黄宗泽', '中国香港新界区', '2018-12-17 23:38:22', '15338261500', '男', '1');
INSERT INTO `student` VALUES ('50', '3', '钟嘉欣', '中国香港钵兰街区', '2018-12-17 23:38:28', '15338261775', '女', '1');
INSERT INTO `student` VALUES ('51', '4', '薛凯琪', '中国香港渔村区', '2018-12-17 23:38:29', '15338261500', '男', '1');
INSERT INTO `student` VALUES ('54', '4', '梁朝伟', '中国香港上下九区', '2018-12-17 23:38:24', '15338261779', '男', '1');
INSERT INTO `student` VALUES ('55', '1', '何伟志', ' 中国广东省中山 市石歧区          ', '2018-12-17 23:38:24', '15338261799', '男', '1');
INSERT INTO `student` VALUES ('56', '2', '黄宗泽', '香港新界区', '2018-12-18 14:57:25', '15338261500', '男', '1');
INSERT INTO `student` VALUES ('58', '3', '黄宗泽', '中国香港新界区', '2018-12-17 21:05:35', '15338261500', '男', '0');
INSERT INTO `student` VALUES ('59', '4', '钟嘉欣', '中国香港钵兰街区', '2018-12-17 20:06:45', '15338261775', '女', '0');
INSERT INTO `student` VALUES ('60', '5', '薛凯琪', '中国香港渔村区', '2018-12-17 23:38:27', '15338261500', '男', '1');
INSERT INTO `student` VALUES ('61', '6', '周柏豪', '中国香港铜锣湾区', '2018-12-17 23:38:27', '15338261777', '男', '1');
INSERT INTO `student` VALUES ('62', '4', '林峰', '中国香港下街区', '2018-12-17 23:38:27', '15338261776', '男', '1');
INSERT INTO `student` VALUES ('63', '4', '梁朝伟', '中国香港上下九区', '2018-12-17 20:06:50', '15338261779', '男', '0');
INSERT INTO `student` VALUES ('64', '4', '何伟志', ' 中国广东省中山 市石歧区          ', '2018-12-17 20:06:50', '15338261799', '男', '1');
INSERT INTO `student` VALUES ('65', '1', '狗头', '深圳', '2018-12-17 21:05:38', '15338261500', '女', '0');
INSERT INTO `student` VALUES ('66', '2', '黄子华', '中国香港九龙区', '2018-12-17 21:05:39', '15338261500', '男', '0');
INSERT INTO `student` VALUES ('67', '3', '黄宗泽', '中国香港新界区', '2018-12-17 23:38:31', '15338261500', '男', '1');
INSERT INTO `student` VALUES ('68', '4', '钟嘉欣', '中国香港钵兰街区', '2018-12-17 23:38:31', '15338261775', '女', '1');
INSERT INTO `student` VALUES ('69', '5', '薛凯琪', '中国香港渔村区', '2018-12-17 23:38:31', '15338261500', '男', '1');
INSERT INTO `student` VALUES ('70', '6', '林峰', '中国香港下街区', '2018-12-17 21:05:39', '15338261776', '男', '0');
INSERT INTO `student` VALUES ('71', '4', '梁朝伟', '中国香港上下九区', '2018-12-17 20:06:45', '15338261779', '男', '0');
INSERT INTO `student` VALUES ('72', '1', '何伟志', ' 中国广东省中山 市石歧区          ', '2018-12-17 23:38:33', '15338261799', '男', '1');
INSERT INTO `student` VALUES ('73', '2', '狗头', '深圳', '2018-12-22 21:46:37', '15338261500', '不公开', '1');
INSERT INTO `student` VALUES ('74', '3', '黄宗泽', '中国香港新界区', '2018-12-22 21:46:37', '15338261500', '女', '1');
INSERT INTO `student` VALUES ('75', '4', '钟嘉欣', '中国香港钵兰街区', '2018-12-22 21:46:37', '15338261775', '女', '1');
INSERT INTO `student` VALUES ('76', '5', '薛凯琪', '中国香港渔村区', '2018-12-17 23:38:37', '15338261500', '男', '1');
INSERT INTO `student` VALUES ('78', '6', '林峰', '石岐区\r\n                        ', '2018-12-22 21:46:30', '15338261500', '男', '0');
INSERT INTO `student` VALUES ('79', '6', '梁朝伟', '中国香港下街区', '2018-12-22 21:46:30', '15338261500', '男', '0');
INSERT INTO `student` VALUES ('80', '6', '何伟志', '中国香港上下九区', '2018-12-22 21:46:30', '15338261775', '女', '0');
INSERT INTO `student` VALUES ('81', '6', '狗头', ' 中国广东省中山 市石歧区          ', '2018-12-22 21:46:30', '15338261500', '男', '0');
INSERT INTO `student` VALUES ('82', '6', '黄宗泽', ' 石歧区', '2018-12-22 21:46:33', '18312684615', '男', '0');
INSERT INTO `student` VALUES ('83', '6', '林峰', ' 齐头', '2018-12-22 21:46:33', '15338261799', '男', '0');
INSERT INTO `student` VALUES ('84', '6', '梁朝伟', '中国香港下街区', '2018-12-22 21:46:21', '15338261799', '男', '0');
INSERT INTO `student` VALUES ('85', '6', '何伟志', '中国香港上下九区', '2018-12-22 21:46:21', '15338261799', '不公开', '0');
INSERT INTO `student` VALUES ('86', '6', '狗头', ' 中国广东省中山 市石歧区          ', '2018-12-22 21:46:21', '15338261799', '女', '0');
INSERT INTO `student` VALUES ('87', '6', '黄宗泽', '深圳', '2018-12-22 21:46:22', '18312684615', '女', '0');
