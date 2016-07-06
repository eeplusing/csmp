/*
Navicat MySQL Data Transfer

Source Server         : localhost3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : csmp

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-06 15:25:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for csmp_address_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_address_info`;
CREATE TABLE `csmp_address_info` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `post_code` varchar(255) NOT NULL,
  `consigne_name` varchar(255) NOT NULL,
  `consigne_phone` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK2C073CC5D49F5351` (`user_id`),
  CONSTRAINT `FK2C073CC5D49F5351` FOREIGN KEY (`user_id`) REFERENCES `csmp_user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_address_info
-- ----------------------------
INSERT INTO `csmp_address_info` VALUES ('1', '等待', '710000', '二', '12355678', '73');
INSERT INTO `csmp_address_info` VALUES ('2', '等待', '710000', '二', '12355678', '73');

-- ----------------------------
-- Table structure for csmp_bill_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_bill_detail_info`;
CREATE TABLE `csmp_bill_detail_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `bill_id` int(11) NOT NULL,
  PRIMARY KEY (`info_id`),
  KEY `FKEBA56C50D6CF99D1` (`bill_id`),
  CONSTRAINT `FKEBA56C50D6CF99D1` FOREIGN KEY (`bill_id`) REFERENCES `csmp_bill_info` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_bill_detail_info
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_bill_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_bill_info`;
CREATE TABLE `csmp_bill_info` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(255) NOT NULL,
  `storage_id` int(11) NOT NULL,
  `bill_type` int(11) NOT NULL,
  `oper_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `proposer` varchar(255) DEFAULT NULL,
  `perator` varchar(255) DEFAULT NULL,
  `bill_stat` int(11) NOT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_bill_info
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_buy_good_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_buy_good_info`;
CREATE TABLE `csmp_buy_good_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `money` double DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`info_id`),
  KEY `FK98E3074B738F6CE3` (`car_id`),
  KEY `FK98E3074BE9B4D611` (`good_id`),
  CONSTRAINT `FK98E3074B738F6CE3` FOREIGN KEY (`car_id`) REFERENCES `csmp_car_info` (`car_id`),
  CONSTRAINT `FK98E3074BE9B4D611` FOREIGN KEY (`good_id`) REFERENCES `csmp_good_info` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_buy_good_info
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_car_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_car_info`;
CREATE TABLE `csmp_car_info` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_car_info
-- ----------------------------
INSERT INTO `csmp_car_info` VALUES ('1', '71');
INSERT INTO `csmp_car_info` VALUES ('2', '73');

-- ----------------------------
-- Table structure for csmp_chat_record
-- ----------------------------
DROP TABLE IF EXISTS `csmp_chat_record`;
CREATE TABLE `csmp_chat_record` (
  `chat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `senderUsername` varchar(255) DEFAULT NULL,
  `sendeeUsername` varchar(255) DEFAULT NULL,
  `senderTime` datetime DEFAULT NULL,
  `ccontent` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_chat_record
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_datastat_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_datastat_info`;
CREATE TABLE `csmp_datastat_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `browse_times` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_datastat_info
-- ----------------------------
INSERT INTO `csmp_datastat_info` VALUES ('1', '26');

-- ----------------------------
-- Table structure for csmp_evaluate_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_evaluate_info`;
CREATE TABLE `csmp_evaluate_info` (
  `evaluate_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `evaluate_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluate_grade` int(11) NOT NULL,
  `evaluate_content` varchar(255) NOT NULL,
  PRIMARY KEY (`evaluate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_evaluate_info
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_feedback_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_feedback_info`;
CREATE TABLE `csmp_feedback_info` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `feedback_time` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_feedback_info
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_good_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_good_info`;
CREATE TABLE `csmp_good_info` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(255) NOT NULL,
  `busy_type` int(11) NOT NULL,
  `specification` varchar(255) DEFAULT NULL,
  `head_value` varchar(255) DEFAULT NULL,
  `calorific_value` int(11) DEFAULT NULL,
  `up_rack_time` datetime DEFAULT NULL,
  `down_rack_time` datetime DEFAULT NULL,
  `good_state` int(11) DEFAULT NULL,
  `good_origin` varchar(255) DEFAULT NULL,
  `good_vendor` varchar(255) DEFAULT NULL,
  `good_hot` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`good_id`),
  KEY `FKE1A307C4AA8AE8F1` (`type_id`),
  CONSTRAINT `FKE1A307C4AA8AE8F1` FOREIGN KEY (`type_id`) REFERENCES `csmp_type_info` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_good_info
-- ----------------------------
INSERT INTO `csmp_good_info` VALUES ('4', '焦煤', '0', '煤炭', '煤炭', '345', '2016-07-06 15:17:32', null, '1', '甘肃神煤集团', '甘肃神煤集团', '0', '1');

-- ----------------------------
-- Table structure for csmp_grade_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_grade_info`;
CREATE TABLE `csmp_grade_info` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_num` int(11) NOT NULL,
  `grade_name` varchar(255) NOT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_grade_info
-- ----------------------------
INSERT INTO `csmp_grade_info` VALUES ('1', '1', '超级管理员');
INSERT INTO `csmp_grade_info` VALUES ('2', '2', '二级代理商');
INSERT INTO `csmp_grade_info` VALUES ('3', '3', '三级代理商');
INSERT INTO `csmp_grade_info` VALUES ('4', '4', '终端消费者');

-- ----------------------------
-- Table structure for csmp_group_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_group_info`;
CREATE TABLE `csmp_group_info` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `fgroup_id` int(11) DEFAULT NULL,
  `group_grade` int(11) NOT NULL,
  `group_leader` int(11) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_group_info
-- ----------------------------
INSERT INTO `csmp_group_info` VALUES ('1', '系统管理人员', '0', '1', '1');

-- ----------------------------
-- Table structure for csmp_idepot_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_idepot_info`;
CREATE TABLE `csmp_idepot_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `storage_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `time` datetime NOT NULL,
  `perator` varchar(255) NOT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_idepot_info
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_image_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_image_info`;
CREATE TABLE `csmp_image_info` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_path` varchar(255) NOT NULL,
  `is_default` int(11) NOT NULL,
  `good_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `FKCD832BEE9B4D611` (`good_id`),
  CONSTRAINT `FKCD832BEE9B4D611` FOREIGN KEY (`good_id`) REFERENCES `csmp_good_info` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_image_info
-- ----------------------------
INSERT INTO `csmp_image_info` VALUES ('6', '/image/20160706/2016070615094566500482161631467788985665.jpeg', '1', '4');

-- ----------------------------
-- Table structure for csmp_mail_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_mail_info`;
CREATE TABLE `csmp_mail_info` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `getters` varchar(255) NOT NULL,
  `mail_title` varchar(255) NOT NULL,
  `mail_content` varchar(255) DEFAULT NULL,
  `annexs` varchar(255) DEFAULT NULL,
  `send_time` datetime NOT NULL,
  `ower` int(11) NOT NULL,
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_mail_info
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_modle_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_modle_info`;
CREATE TABLE `csmp_modle_info` (
  `modle_id` int(11) NOT NULL AUTO_INCREMENT,
  `modle_name` varchar(255) NOT NULL,
  `modle_url` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`modle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_modle_info
-- ----------------------------
INSERT INTO `csmp_modle_info` VALUES ('1', '系统管理', 'null', '1');

-- ----------------------------
-- Table structure for csmp_news
-- ----------------------------
DROP TABLE IF EXISTS `csmp_news`;
CREATE TABLE `csmp_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `news_title` varchar(600) DEFAULT NULL,
  `news_time` datetime DEFAULT NULL,
  `news_content` varchar(4000) DEFAULT NULL,
  `news_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_news
-- ----------------------------
INSERT INTO `csmp_news` VALUES ('1', '72', '暴走大事件', '2016-07-06 14:03:45', '暴走大事件暴走大事件暴走大事件暴走大事件暴走大事件暴走大事件', '0');

-- ----------------------------
-- Table structure for csmp_operlog_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_operlog_info`;
CREATE TABLE `csmp_operlog_info` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `oper_type` int(11) NOT NULL,
  `oper_time` datetime NOT NULL,
  `oper_content` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_operlog_info
-- ----------------------------
INSERT INTO `csmp_operlog_info` VALUES ('1', '20', '2016-07-06 15:20:45', '管理员：admin审核订单，订单编号0027796410,运费：0.0', '72');

-- ----------------------------
-- Table structure for csmp_order_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_order_detail_info`;
CREATE TABLE `csmp_order_detail_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `good_name` varchar(255) NOT NULL,
  `num` double NOT NULL,
  `sale_price` double DEFAULT NULL,
  `specification` varchar(255) DEFAULT NULL,
  `head_value` varchar(255) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`info_id`),
  KEY `FK74E4593F18653C63` (`order_id`),
  CONSTRAINT `FK74E4593F18653C63` FOREIGN KEY (`order_id`) REFERENCES `csmp_order_info` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_order_detail_info
-- ----------------------------
INSERT INTO `csmp_order_detail_info` VALUES ('1', '4', '焦煤', '1', '34', '煤炭', '煤炭', '1');

-- ----------------------------
-- Table structure for csmp_order_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_order_info`;
CREATE TABLE `csmp_order_info` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) NOT NULL,
  `order_state` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `info_flow` varchar(255) DEFAULT NULL,
  `order_amount` double NOT NULL,
  `order_carriage` double DEFAULT NULL,
  `order_cycle` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluate_info` varchar(255) DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `take_good_time` datetime DEFAULT NULL,
  `evaluate_time` datetime DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK8FED14ABBA707C63` (`address_id`),
  CONSTRAINT `FK8FED14ABBA707C63` FOREIGN KEY (`address_id`) REFERENCES `csmp_address_info` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_order_info
-- ----------------------------
INSERT INTO `csmp_order_info` VALUES ('1', '0027796410', '1', '2016-07-06 15:19:02', '2016-07-06 15:19:02	顾客测试1提交订单;\r	2016-07-06 15:20:45	超级管理员审核订单;\r	', '34', '0', '0', '73', null, null, '2016-07-06 15:20:45', null, null, null, '1');

-- ----------------------------
-- Table structure for csmp_price_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_price_info`;
CREATE TABLE `csmp_price_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `price_name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `good_id` int(11) NOT NULL,
  `grade_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`info_id`),
  KEY `FKBA0EF90D3B883C3` (`grade_id`),
  KEY `FKBA0EF90E9B4D611` (`good_id`),
  CONSTRAINT `FKBA0EF90D3B883C3` FOREIGN KEY (`grade_id`) REFERENCES `csmp_grade_info` (`grade_id`),
  CONSTRAINT `FKBA0EF90E9B4D611` FOREIGN KEY (`good_id`) REFERENCES `csmp_good_info` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_price_info
-- ----------------------------
INSERT INTO `csmp_price_info` VALUES ('3', '提货价', '34', '4', '3');
INSERT INTO `csmp_price_info` VALUES ('4', '出厂价', '34', '4', '2');
INSERT INTO `csmp_price_info` VALUES ('5', '分销价', '34', '4', '4');
INSERT INTO `csmp_price_info` VALUES ('6', '默认价格', '34', '4', '1');

-- ----------------------------
-- Table structure for csmp_recruit_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_recruit_info`;
CREATE TABLE `csmp_recruit_info` (
  `recruit_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `job_name` varchar(255) NOT NULL,
  `work_nature` int(11) NOT NULL,
  `work_address` varchar(600) NOT NULL,
  `recruit_member` int(11) DEFAULT NULL,
  `sex_require` int(11) DEFAULT NULL,
  `wage` varchar(255) DEFAULT NULL,
  `post_duty` varchar(4000) DEFAULT NULL,
  `factor` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`recruit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_recruit_info
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_right_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_right_info`;
CREATE TABLE `csmp_right_info` (
  `right_id` int(11) NOT NULL AUTO_INCREMENT,
  `right_name` varchar(255) NOT NULL,
  `function` varchar(255) NOT NULL,
  `right_remark` varchar(255) DEFAULT NULL,
  `right_modle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_right_info
-- ----------------------------
INSERT INTO `csmp_right_info` VALUES ('1', '账户管理', 'user_list.action', '账户管理', '1');
INSERT INTO `csmp_right_info` VALUES ('2', '角色管理', 'role_list.action', '角色管理', '1');
INSERT INTO `csmp_right_info` VALUES ('3', '权限管理', 'right_list.action', '权限管理', '1');
INSERT INTO `csmp_right_info` VALUES ('4', '群组管理', 'group_list.action', '账户管理', '1');
INSERT INTO `csmp_right_info` VALUES ('5', '岗位发布', 'recruit_list.action', '岗位发布', '1');
INSERT INTO `csmp_right_info` VALUES ('6', '新闻发布', 'news_list.action', '新闻发布', '1');

-- ----------------------------
-- Table structure for csmp_role_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_role_info`;
CREATE TABLE `csmp_role_info` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `role_rank` int(11) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_role_info
-- ----------------------------
INSERT INTO `csmp_role_info` VALUES ('1', '超级管理员', '0');
INSERT INTO `csmp_role_info` VALUES ('2', '系统管理员', '0');
INSERT INTO `csmp_role_info` VALUES ('3', '顾客', '1');

-- ----------------------------
-- Table structure for csmp_role_modle
-- ----------------------------
DROP TABLE IF EXISTS `csmp_role_modle`;
CREATE TABLE `csmp_role_modle` (
  `role_id` int(11) NOT NULL,
  `modle_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`modle_id`),
  KEY `FKCF614C9EAA2F6143` (`modle_id`),
  KEY `FKCF614C9E2F748F71` (`role_id`),
  CONSTRAINT `FKCF614C9E2F748F71` FOREIGN KEY (`role_id`) REFERENCES `csmp_role_info` (`role_id`),
  CONSTRAINT `FKCF614C9EAA2F6143` FOREIGN KEY (`modle_id`) REFERENCES `csmp_modle_info` (`modle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_role_modle
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_role_right
-- ----------------------------
DROP TABLE IF EXISTS `csmp_role_right`;
CREATE TABLE `csmp_role_right` (
  `role_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`right_id`),
  KEY `FKCFA512BF2F748F71` (`role_id`),
  KEY `FKCFA512BF7960A1A3` (`right_id`),
  CONSTRAINT `FKCFA512BF2F748F71` FOREIGN KEY (`role_id`) REFERENCES `csmp_role_info` (`role_id`),
  CONSTRAINT `FKCFA512BF7960A1A3` FOREIGN KEY (`right_id`) REFERENCES `csmp_right_info` (`right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_role_right
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_stat_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_stat_info`;
CREATE TABLE `csmp_stat_info` (
  `stat_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login_num` int(11) DEFAULT NULL,
  `buy_num` int(11) NOT NULL,
  `cancel_buy_num` int(11) NOT NULL,
  `first_buy_time` datetime NOT NULL,
  `create_order_num` int(11) NOT NULL,
  `cancel_order_num` int(11) NOT NULL,
  `pay_order_num` int(11) NOT NULL,
  `last_pay_time` datetime NOT NULL,
  `last_login_time` datetime NOT NULL,
  `total_time` int(11) NOT NULL,
  PRIMARY KEY (`stat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_stat_info
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_stock_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_stock_info`;
CREATE TABLE `csmp_stock_info` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `storage_id` int(11) NOT NULL,
  `stock_amount` double NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_stock_info
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_storage_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_storage_info`;
CREATE TABLE `csmp_storage_info` (
  `storage_id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_name` varchar(255) NOT NULL,
  `storage_specification` varchar(255) DEFAULT NULL,
  `storage_address` varchar(255) NOT NULL,
  `ower` varchar(255) NOT NULL,
  `stock_max_amount` double DEFAULT NULL,
  `stock_ini_amount` double DEFAULT NULL,
  `stock_amount` double DEFAULT NULL,
  `distribution_way` varchar(255) DEFAULT NULL,
  `waterproof_grade` varchar(255) DEFAULT NULL,
  `surface` varchar(255) DEFAULT NULL,
  `storage_stat` int(11) NOT NULL,
  PRIMARY KEY (`storage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_storage_info
-- ----------------------------

-- ----------------------------
-- Table structure for csmp_type_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_type_info`;
CREATE TABLE `csmp_type_info` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `type_grade` int(11) NOT NULL,
  `type_unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_type_info
-- ----------------------------
INSERT INTO `csmp_type_info` VALUES ('1', '煤炭', '', '0', '1', '甘肃央元');
INSERT INTO `csmp_type_info` VALUES ('2', '水果', '', '0', '1', '山东菏泽');

-- ----------------------------
-- Table structure for csmp_user_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_user_info`;
CREATE TABLE `csmp_user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_account` varchar(255) DEFAULT NULL,
  `login_password` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `user_state` int(11) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `error_num` int(11) DEFAULT NULL,
  `count_date` datetime DEFAULT NULL,
  `grade_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FKA3CB55762F748F71` (`role_id`),
  KEY `FKA3CB5576D3B883C3` (`grade_id`),
  KEY `FKA3CB5576EC9122C3` (`group_id`),
  CONSTRAINT `FKA3CB55762F748F71` FOREIGN KEY (`role_id`) REFERENCES `csmp_role_info` (`role_id`),
  CONSTRAINT `FKA3CB5576D3B883C3` FOREIGN KEY (`grade_id`) REFERENCES `csmp_grade_info` (`grade_id`),
  CONSTRAINT `FKA3CB5576EC9122C3` FOREIGN KEY (`group_id`) REFERENCES `csmp_group_info` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csmp_user_info
-- ----------------------------
INSERT INTO `csmp_user_info` VALUES ('71', '123', '5f93f983524def3dca464469d2cf9f3e', 'admin', '110', null, '1', null, '0', null, '1', null, '1');
INSERT INTO `csmp_user_info` VALUES ('72', 'admin', '4ee623fee2fedc9f7653156fde5d51a2', '超级管理员', '13572098176', '西安电子科技大学', '1', 'admin@eplusing.com', '0', '2016-07-05 21:46:09', '1', null, '1');
INSERT INTO `csmp_user_info` VALUES ('73', 'customer1', '202cb962ac59075b964b07152d234b70', '顾客测试1', '123', '中国石油天然气股份有限公司', '0', 'aaron@eplusing.com', '0', '2016-07-05 21:46:09', '1', null, '3');
INSERT INTO `csmp_user_info` VALUES ('74', 'customer2', '250cf8b51c773f3f8dc8b4be867a9a02', '顾客测试2', '456', '中国石油化工股份有限公司', '1', 'brant@eplusing.com', '0', '2016-07-05 21:46:09', '1', null, '3');
