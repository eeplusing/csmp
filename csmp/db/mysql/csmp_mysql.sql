/*
Navicat MySQL Data Transfer

Source Server         : MYSQL57:127.0.0.1
Source Server Version : 50703
Source Host           : 127.0.0.1:3306
Source Database       : csmp

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2016-01-11 17:02:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for csmp_address_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_address_info`;
CREATE TABLE `csmp_address_info` (
  `ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `POST_CODE` varchar(255) NOT NULL,
  `CONSIGNE_NAME` varchar(255) NOT NULL,
  `CONSIGNE_PHONE` varchar(255) NOT NULL,
  `USER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_bill_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_bill_detail_info`;
CREATE TABLE `csmp_bill_detail_info` (
  `INFO_ID` bigint(20) NOT NULL,
  `GOOD_ID` bigint(20) NOT NULL,
  `AMOUNT` double NOT NULL,
  `BILL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_bill_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_bill_info`;
CREATE TABLE `csmp_bill_info` (
  `BILL_ID` bigint(20) NOT NULL,
  `BILL_NO` varchar(255) NOT NULL,
  `STORAGE_ID` bigint(20) NOT NULL,
  `BILL_TYPE` bigint(20) NOT NULL,
  `OPER_TIME` datetime(6) DEFAULT NULL,
  `CREATE_TIME` datetime(6) NOT NULL,
  `PROPOSER` varchar(255) DEFAULT NULL,
  `PERATOR` varchar(255) DEFAULT NULL,
  `BILL_STAT` bigint(20) NOT NULL,
  PRIMARY KEY (`BILL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_buy_good_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_buy_good_info`;
CREATE TABLE `csmp_buy_good_info` (
  `INFO_ID` bigint(20) NOT NULL,
  `GOOD_ID` bigint(20) NOT NULL,
  `AMOUNT` double NOT NULL,
  `MONEY` double DEFAULT NULL,
  `CAR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_car_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_car_info`;
CREATE TABLE `csmp_car_info` (
  `CAR_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CAR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_chat_record
-- ----------------------------
DROP TABLE IF EXISTS `csmp_chat_record`;
CREATE TABLE `csmp_chat_record` (
  `CHAT_ID` bigint(20) NOT NULL,
  `SENDERUSERNAME` varchar(255) DEFAULT NULL,
  `SENDEEUSERNAME` varchar(255) DEFAULT NULL,
  `SENDERTIME` datetime(6) DEFAULT NULL,
  `CCONTENT` varchar(255) DEFAULT NULL,
  `FILEPATH` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CHAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_datastat_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_datastat_info`;
CREATE TABLE `csmp_datastat_info` (
  `ID` bigint(20) NOT NULL,
  `BROWSE_TIMES` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_evaluate_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_evaluate_info`;
CREATE TABLE `csmp_evaluate_info` (
  `EVALUATE_ID` bigint(20) NOT NULL,
  `GOOD_ID` bigint(20) NOT NULL,
  `EVALUATE_TIME` datetime(6) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  `EVALUATE_GRADE` bigint(20) NOT NULL,
  `EVALUATE_CONTENT` varchar(255) NOT NULL,
  PRIMARY KEY (`EVALUATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_feedback_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_feedback_info`;
CREATE TABLE `csmp_feedback_info` (
  `FEEDBACK_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  `FEEDBACK_TIME` datetime(6) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `CONTENT` varchar(255) NOT NULL,
  PRIMARY KEY (`FEEDBACK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_good_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_good_info`;
CREATE TABLE `csmp_good_info` (
  `GOOD_ID` bigint(20) NOT NULL,
  `GOOD_NAME` varchar(255) NOT NULL,
  `BUSY_TYPE` bigint(20) NOT NULL,
  `SPECIFICATION` varchar(1000) DEFAULT NULL,
  `HEAD_VALUE` varchar(1000) DEFAULT NULL,
  `UP_RACK_TIME` datetime(6) DEFAULT NULL,
  `DOWN_RACK_TIME` datetime(6) DEFAULT NULL,
  `GOOD_STATE` bigint(20) DEFAULT NULL,
  `TYPE_ID` bigint(20) NOT NULL,
  `CALORIFIC_VALUE` bigint(20) DEFAULT NULL,
  `GOOD_ORIGIN` varchar(100) DEFAULT NULL,
  `GOOD_VENDOR` varchar(100) DEFAULT NULL,
  `GOOD_HOT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`GOOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_grade_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_grade_info`;
CREATE TABLE `csmp_grade_info` (
  `GRADE_ID` bigint(20) NOT NULL,
  `GRADE_NUM` bigint(20) NOT NULL,
  `GRADE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`GRADE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_group_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_group_info`;
CREATE TABLE `csmp_group_info` (
  `GROUP_ID` bigint(20) NOT NULL,
  `GROUP_NAME` varchar(255) NOT NULL,
  `FGROUP_ID` bigint(20) DEFAULT NULL,
  `GROUP_GRADE` bigint(20) NOT NULL,
  `GROUP_LEADER` bigint(20) NOT NULL,
  PRIMARY KEY (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_idepot_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_idepot_info`;
CREATE TABLE `csmp_idepot_info` (
  `INFO_ID` bigint(20) NOT NULL,
  `BILL_ID` bigint(20) NOT NULL,
  `STORAGE_ID` bigint(20) NOT NULL,
  `TYPE` bigint(20) NOT NULL,
  `GOOD_ID` bigint(20) NOT NULL,
  `AMOUNT` double NOT NULL,
  `TIME` datetime(6) NOT NULL,
  `PERATOR` varchar(255) NOT NULL,
  PRIMARY KEY (`INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_image_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_image_info`;
CREATE TABLE `csmp_image_info` (
  `IMAGE_ID` bigint(20) NOT NULL,
  `IMAGE_PATH` varchar(255) NOT NULL,
  `IS_DEFAULT` bigint(20) NOT NULL,
  `GOOD_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_mail_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_mail_info`;
CREATE TABLE `csmp_mail_info` (
  `MAIL_ID` bigint(20) NOT NULL,
  `SENDER` bigint(20) NOT NULL,
  `GETTERS` varchar(255) NOT NULL,
  `MAIL_TITLE` varchar(255) NOT NULL,
  `MAIL_CONTENT` varchar(255) DEFAULT NULL,
  `ANNEXS` varchar(255) DEFAULT NULL,
  `SEND_TIME` datetime(6) NOT NULL,
  `OWER` bigint(20) NOT NULL,
  PRIMARY KEY (`MAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_modle_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_modle_info`;
CREATE TABLE `csmp_modle_info` (
  `MODLE_ID` bigint(20) NOT NULL,
  `MODLE_NAME` varchar(255) NOT NULL,
  `MODLE_URL` varchar(255) NOT NULL,
  `PARENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`MODLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_news
-- ----------------------------
DROP TABLE IF EXISTS `csmp_news`;
CREATE TABLE `csmp_news` (
  `NEWS_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  `NEWS_TITLE` varchar(4000) NOT NULL,
  `NEWS_TIME` datetime(6) NOT NULL,
  `NEWS_CONTENT` varchar(4000) NOT NULL,
  `NEWS_TYPE` bigint(20) NOT NULL,
  PRIMARY KEY (`NEWS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_operlog_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_operlog_info`;
CREATE TABLE `csmp_operlog_info` (
  `LOG_ID` bigint(20) NOT NULL,
  `OPER_TYPE` bigint(20) NOT NULL,
  `OPER_TIME` datetime(6) NOT NULL,
  `OPER_CONTENT` varchar(255) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_order_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_order_detail_info`;
CREATE TABLE `csmp_order_detail_info` (
  `INFO_ID` bigint(20) NOT NULL,
  `GOOD_ID` bigint(20) NOT NULL,
  `GOOD_NAME` varchar(255) NOT NULL,
  `NUM` double NOT NULL,
  `SALE_PRICE` double DEFAULT NULL,
  `SPECIFICATION` varchar(2000) DEFAULT NULL,
  `HEAD_VALUE` varchar(2000) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_order_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_order_info`;
CREATE TABLE `csmp_order_info` (
  `ORDER_ID` bigint(20) NOT NULL,
  `ORDER_NO` varchar(255) NOT NULL,
  `ORDER_STATE` bigint(20) NOT NULL,
  `ORDER_DATE` datetime(6) NOT NULL,
  `INFO_FLOW` varchar(2000) DEFAULT NULL,
  `ORDER_AMOUNT` double NOT NULL,
  `ORDER_CARRIAGE` double DEFAULT NULL,
  `ORDER_CYCLE` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  `EVALUATE_INFO` varchar(255) DEFAULT NULL,
  `CANCEL_REASON` varchar(255) DEFAULT NULL,
  `CHECK_TIME` datetime(6) DEFAULT NULL,
  `PAY_TIME` datetime(6) DEFAULT NULL,
  `TAKE_GOOD_TIME` datetime(6) DEFAULT NULL,
  `EVALUATE_TIME` datetime(6) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_price_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_price_info`;
CREATE TABLE `csmp_price_info` (
  `INFO_ID` bigint(20) NOT NULL,
  `PRICE_NAME` varchar(255) NOT NULL,
  `PRICE` double NOT NULL,
  `GOOD_ID` bigint(20) NOT NULL,
  `GRADE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_recruit_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_recruit_info`;
CREATE TABLE `csmp_recruit_info` (
  `RECRUIT_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  `TIME` datetime(6) DEFAULT NULL,
  `JOB_NAME` varchar(255) NOT NULL,
  `WORK_NATURE` bigint(20) NOT NULL,
  `WORK_ADDRESS` varchar(4000) DEFAULT NULL,
  `SEX_REQUIRE` bigint(20) DEFAULT NULL,
  `WAGE` varchar(255) DEFAULT NULL,
  `POST_DUTY` varchar(4000) DEFAULT NULL,
  `FACTOR` varchar(4000) DEFAULT NULL,
  `RECRUIT_MEMBER` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RECRUIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_right_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_right_info`;
CREATE TABLE `csmp_right_info` (
  `RIGHT_ID` bigint(20) NOT NULL,
  `RIGHT_NAME` varchar(255) NOT NULL,
  `FUNCTION` varchar(255) NOT NULL,
  `RIGHT_REMARK` varchar(255) DEFAULT NULL,
  `RIGHT_MODLE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_role_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_role_info`;
CREATE TABLE `csmp_role_info` (
  `ROLE_ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(255) NOT NULL,
  `ROLE_RANK` tinyint(4) NOT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_role_modle
-- ----------------------------
DROP TABLE IF EXISTS `csmp_role_modle`;
CREATE TABLE `csmp_role_modle` (
  `ROLE_ID` bigint(20) NOT NULL,
  `MODLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`MODLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_role_right
-- ----------------------------
DROP TABLE IF EXISTS `csmp_role_right`;
CREATE TABLE `csmp_role_right` (
  `ROLE_ID` bigint(20) NOT NULL,
  `RIGHT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_stat_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_stat_info`;
CREATE TABLE `csmp_stat_info` (
  `STAT_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  `LOGIN_NUM` bigint(20) DEFAULT NULL,
  `BUY_NUM` bigint(20) NOT NULL,
  `CANCEL_BUY_NUM` bigint(20) NOT NULL,
  `FIRST_BUY_TIME` datetime(6) NOT NULL,
  `CREATE_ORDER_NUM` bigint(20) NOT NULL,
  `CANCEL_ORDER_NUM` bigint(20) NOT NULL,
  `PAY_ORDER_NUM` bigint(20) NOT NULL,
  `LAST_PAY_TIME` datetime(6) NOT NULL,
  `LAST_LOGIN_TIME` datetime(6) NOT NULL,
  `TOTAL_TIME` bigint(20) NOT NULL,
  PRIMARY KEY (`STAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_stock_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_stock_info`;
CREATE TABLE `csmp_stock_info` (
  `STOCK_ID` bigint(20) NOT NULL,
  `GOOD_ID` bigint(20) NOT NULL,
  `STORAGE_ID` bigint(20) NOT NULL,
  `STOCK_AMOUNT` double NOT NULL,
  PRIMARY KEY (`STOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_storage_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_storage_info`;
CREATE TABLE `csmp_storage_info` (
  `STORAGE_ID` bigint(20) NOT NULL,
  `STORAGE_NAME` varchar(255) NOT NULL,
  `STORAGE_SPECIFICATION` varchar(255) DEFAULT NULL,
  `STORAGE_ADDRESS` varchar(1000) NOT NULL,
  `OWER` varchar(255) NOT NULL,
  `STOCK_MAX_AMOUNT` double DEFAULT NULL,
  `STOCK_INI_AMOUNT` double DEFAULT NULL,
  `STOCK_AMOUNT` double DEFAULT NULL,
  `DISTRIBUTION_WAY` varchar(255) DEFAULT NULL,
  `WATERPROOF_GRADE` varchar(255) DEFAULT NULL,
  `SURFACE` varchar(255) DEFAULT NULL,
  `STORAGE_STAT` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`STORAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_type_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_type_info`;
CREATE TABLE `csmp_type_info` (
  `TYPE_ID` bigint(20) NOT NULL,
  `TYPE_NAME` varchar(255) NOT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `PARENT_ID` bigint(20) NOT NULL,
  `TYPE_GRADE` bigint(20) NOT NULL,
  `TYPE_UNIT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for csmp_user_info
-- ----------------------------
DROP TABLE IF EXISTS `csmp_user_info`;
CREATE TABLE `csmp_user_info` (
  `USER_ID` bigint(20) NOT NULL,
  `LOGIN_ACCOUNT` varchar(255) DEFAULT NULL,
  `LOGIN_PASSWORD` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `USER_PHONE` varchar(255) NOT NULL,
  `COMPANY_NAME` varchar(255) DEFAULT NULL,
  `USER_STATE` bigint(20) NOT NULL,
  `USER_EMAIL` varchar(255) DEFAULT NULL,
  `ERROR_NUM` bigint(20) DEFAULT NULL,
  `COUNT_DATE` datetime(6) DEFAULT NULL,
  `GRADE_ID` bigint(20) NOT NULL,
  `GROUP_ID` bigint(20) DEFAULT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
