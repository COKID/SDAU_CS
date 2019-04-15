-- ----------------------------
DROP TABLE IF EXISTS `stu_info`;
CREATE TABLE `stu_info` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_info
-- ----------------------------
INSERT INTO `stu_info` VALUES ('11', '11', '11', '11', '11', '11');
INSERT INTO `stu_info` VALUES ('16', 'zhangsan', 'nan', '20', '70', '175');
INSERT INTO `stu_info` VALUES ('21', '张三', '男', '14', '25', '143');


