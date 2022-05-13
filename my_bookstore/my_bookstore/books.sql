/*
Navicat MySQL Data Transfer

Source Server         : yuanjing
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : books

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2022-05-07 12:29:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double DEFAULT NULL,
  `creditcard` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '7500', '12345678901');
INSERT INTO `account` VALUES ('3', '20000', '001');
INSERT INTO `account` VALUES ('4', '20000', '001');
INSERT INTO `account` VALUES ('5', '20000', '001');

-- ----------------------------
-- Table structure for authorisbn
-- ----------------------------
DROP TABLE IF EXISTS `authorisbn`;
CREATE TABLE `authorisbn` (
  `authorID` int(11) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authorisbn
-- ----------------------------
INSERT INTO `authorisbn` VALUES ('1', '0130895725');
INSERT INTO `authorisbn` VALUES ('1', '0132261197');
INSERT INTO `authorisbn` VALUES ('1', '0130895717');
INSERT INTO `authorisbn` VALUES ('1', '0135289106');
INSERT INTO `authorisbn` VALUES ('1', '0139163050');
INSERT INTO `authorisbn` VALUES ('1', '013028419x');
INSERT INTO `authorisbn` VALUES ('1', '0130161438');
INSERT INTO `authorisbn` VALUES ('1', '0130856118');
INSERT INTO `authorisbn` VALUES ('1', '0130125075');
INSERT INTO `authorisbn` VALUES ('1', '0138993947');
INSERT INTO `authorisbn` VALUES ('1', '0130852473');
INSERT INTO `authorisbn` VALUES ('1', '0130829277');
INSERT INTO `authorisbn` VALUES ('1', '0134569555');
INSERT INTO `authorisbn` VALUES ('1', '0130829293');
INSERT INTO `authorisbn` VALUES ('1', '0130284173');
INSERT INTO `authorisbn` VALUES ('1', '0130284181');
INSERT INTO `authorisbn` VALUES ('1', '0130895601');
INSERT INTO `authorisbn` VALUES ('2', '0130895725');
INSERT INTO `authorisbn` VALUES ('2', '0132261197');
INSERT INTO `authorisbn` VALUES ('2', '0130895717');
INSERT INTO `authorisbn` VALUES ('2', '0135289106');
INSERT INTO `authorisbn` VALUES ('2', '0139163050');
INSERT INTO `authorisbn` VALUES ('2', '013028419x');
INSERT INTO `authorisbn` VALUES ('2', '0130161438');
INSERT INTO `authorisbn` VALUES ('2', '0130856118');
INSERT INTO `authorisbn` VALUES ('2', '0130125075');
INSERT INTO `authorisbn` VALUES ('2', '0138993947');
INSERT INTO `authorisbn` VALUES ('2', '0130852473');
INSERT INTO `authorisbn` VALUES ('2', '0130829277');
INSERT INTO `authorisbn` VALUES ('2', '0134569555');
INSERT INTO `authorisbn` VALUES ('2', '0130829293');
INSERT INTO `authorisbn` VALUES ('2', '0130284173');
INSERT INTO `authorisbn` VALUES ('2', '0130284181');
INSERT INTO `authorisbn` VALUES ('2', '0130895601');
INSERT INTO `authorisbn` VALUES ('3', '013028419x');
INSERT INTO `authorisbn` VALUES ('3', '0130161438');
INSERT INTO `authorisbn` VALUES ('3', '0130856118');
INSERT INTO `authorisbn` VALUES ('3', '0134569555');
INSERT INTO `authorisbn` VALUES ('3', '0130829293');
INSERT INTO `authorisbn` VALUES ('3', '0130284173');
INSERT INTO `authorisbn` VALUES ('3', '0130284181');
INSERT INTO `authorisbn` VALUES ('4', '0130895601');

-- ----------------------------
-- Table structure for authors
-- ----------------------------
DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `authorID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authors
-- ----------------------------
INSERT INTO `authors` VALUES ('1', 'Harvey', 'Deitel');
INSERT INTO `authors` VALUES ('2', 'Paul', 'Deitel');
INSERT INTO `authors` VALUES ('3', 'Tem', 'Nieto');
INSERT INTO `authors` VALUES ('4', 'Sean', 'Santry');

-- ----------------------------
-- Table structure for bookorder
-- ----------------------------
DROP TABLE IF EXISTS `bookorder`;
CREATE TABLE `bookorder` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `zipcode` varchar(8) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `creditcard` varchar(20) DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookorder
-- ----------------------------
INSERT INTO `bookorder` VALUES ('1', 'admin', '226007', '8888866666', '12345678901', '50');
INSERT INTO `bookorder` VALUES ('2', 'admin', '226007', '8888866666', '12345678901', '118.5');
INSERT INTO `bookorder` VALUES ('3', 'admin', '226007', '88886666', '12345678901', '100');
INSERT INTO `bookorder` VALUES ('7', 'admin', '226007', '12345678', '12345678901', '390');
INSERT INTO `bookorder` VALUES ('8', 'ww', '222', '333', '4444444', '86');
INSERT INTO `bookorder` VALUES ('9', 'ee', 'ee', 'ee', 'ee', '88.4000015258789');

-- ----------------------------
-- Table structure for publishers
-- ----------------------------
DROP TABLE IF EXISTS `publishers`;
CREATE TABLE `publishers` (
  `publisherID` int(11) NOT NULL AUTO_INCREMENT,
  `publisherName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publishers
-- ----------------------------
INSERT INTO `publishers` VALUES ('1', 'Prentice Hall');
INSERT INTO `publishers` VALUES ('2', 'Prentice Hall PTG');

-- ----------------------------
-- Table structure for titles
-- ----------------------------
DROP TABLE IF EXISTS `titles`;
CREATE TABLE `titles` (
  `isbn` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `editionNumber` int(11) DEFAULT NULL,
  `copyright` varchar(4) DEFAULT NULL,
  `publisherID` int(11) DEFAULT NULL,
  `imageFile` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `summary` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of titles
-- ----------------------------
INSERT INTO `titles` VALUES ('0123456677', 'JavaEE编程技术', '1', '2002', '2', 'vbctc1.jpg', '38.4000015258789', null);
INSERT INTO `titles` VALUES ('0135289106', 'C++ 程序设计', '2', '1998', '1', 'cpphtp2.jpg', '50', null);
INSERT INTO `titles` VALUES ('0138993947', 'Java How to Program (Java 1.1)', '2', '1998', '1', 'jhtp2.jpg', '50', null);
INSERT INTO `titles` VALUES ('0139163050', 'The Complete C++ Training Course', '3', '2001', '2', 'cppctc3.jpg', '110', null);
INSERT INTO `titles` VALUES ('9787030207357', 'Web编程技术JSP XML JAVAEE', '1', '2008', '1', 'xmlhtp1.jpg', '36', null);
INSERT INTO `titles` VALUES ('9787030207358', 'Web编程技术JSP XML JAVAEE', '1', '2008', '1', 'xmlhtp1.jpg', '36', null);
INSERT INTO `titles` VALUES ('9787115170026', '精通JavaEE项目案例', '1', '2007', '1', 'iw3htp1.jpg', '70', null);
INSERT INTO `titles` VALUES ('9787121062629', 'EJB JPA数据库持久层开发', '3', '2008', '2', 'javactc3.jpg', '49', null);
INSERT INTO `titles` VALUES ('9787121072984', 'Java Web整合开发与项目实战', '1', '2009', '1', 'perlhtp1.jpg', '49', null);
INSERT INTO `titles` VALUES ('9787121072985', 'Flex 3 RIA开发详解与精深实践', '1', '2009', '1', 'ebechtp1.jpg', '44', null);
INSERT INTO `titles` VALUES ('9787121072986', '精通EJB3.0', '2', '2006', '2', 'javactc2.jpg', '100', null);
INSERT INTO `titles` VALUES ('9787121072987', 'The Complete精通Spring', '1', '2008', '2', 'vbctc1.jpg', '47', null);
INSERT INTO `titles` VALUES ('9787811232417', 'JavaEE编程技术', '3', '2008', '1', 'jhtp3.jpg', '27.2', null);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'admin', 'admin');
