/*
Source Server         : localhost_3306
Source Server Version : 50555
Source Host           : localhost:3306
Source Database       : tickets

Target Server Type    : MYSQL
Target Server Version : 50555
File Encoding         : 65001

Date: 2018-06-05 15:01:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `frequency`
-- ----------------------------
DROP TABLE IF EXISTS `frequency`;
CREATE TABLE `frequency` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) DEFAULT NULL,
  `faddress` varchar(30) DEFAULT NULL,
  `starttime` varchar(50) DEFAULT NULL,
  `kilometers` double(10,2) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL COMMENT '关联车型',
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of frequency
-- ----------------------------
INSERT INTO `frequency` VALUES ('2', 'K887', '济南', '22:00', '332.00', '火车', '1');
INSERT INTO `frequency` VALUES ('3', 'K999', 'aa', '09:09', '3333.00', '火车', '1');
INSERT INTO `frequency` VALUES ('5', 'K336', 'aa', '22:32', '32.00', '飞机', '4');
INSERT INTO `frequency` VALUES ('6', '', '', '', null, '', null);
INSERT INTO `frequency` VALUES ('8', 'k223', 'aa', '09:09', '22.00', '飞机', '3');

-- ----------------------------
-- Table structure for `torder`
-- ----------------------------
DROP TABLE IF EXISTS `torder`;
CREATE TABLE `torder` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `finaladdress` varchar(20) DEFAULT NULL,
  `frequencyid` int(11) DEFAULT NULL,
  `price` double(10,0) DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of torder
-- ----------------------------
INSERT INTO `torder` VALUES ('1', '1', 'aa', '2', '18', '0');
INSERT INTO `torder` VALUES ('2', '1', 'aa', '2', '19', '0');
INSERT INTO `torder` VALUES ('3', '2', 'bb', '2', '19', '1');
INSERT INTO `torder` VALUES ('10', '1', 'aa', '8', '2', '0');
INSERT INTO `torder` VALUES ('11', '1', 'aa', '8', '2', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `upassword` varchar(30) NOT NULL,
  `idno` varchar(20) NOT NULL,
  `realname` varchar(30) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zxy', 'zxy', '388888888', 'cccc');
INSERT INTO `user` VALUES ('2', 'zxy2', '123', '3333', '哈哈');
INSERT INTO `user` VALUES ('3', '55', 'a', '33', 'dd');
INSERT INTO `user` VALUES ('4', 'vv', 'cc', 'd', 'd');
INSERT INTO `user` VALUES ('5', 'zxy2', 'zxy2', '1', '1');

-- ----------------------------
-- View structure for `orderview`
-- ----------------------------
DROP VIEW IF EXISTS `orderview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orderview` AS select `frequency`.`fname` AS `fname`,`torder`.`oid` AS `oid`,`torder`.`userid` AS `userid`,`torder`.`finaladdress` AS `finaladdress`,`torder`.`frequencyid` AS `frequencyid`,`torder`.`price` AS `price`,`user`.`realname` AS `realname`,`torder`.`state` AS `state` from ((`frequency` join `torder`) join `user`) where ((`torder`.`userid` = `user`.`uid`) and (`torder`.`frequencyid` = `frequency`.`fid`)) ;
