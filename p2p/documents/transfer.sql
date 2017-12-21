/*
Navicat MySQL Data Transfer

Source Server         : Mysql连接
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : transfer

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-20 20:38:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_adimin_ticket
-- ----------------------------
DROP TABLE IF EXISTS `t_adimin_ticket`;
CREATE TABLE `t_adimin_ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) NOT NULL COMMENT '用户id',
  `kid` bigint(20) NOT NULL COMMENT '券id',
  `tktime` datetime DEFAULT NULL COMMENT '领券时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `enable` int(11) DEFAULT '1' COMMENT '状态 1：启用2：禁用',
  `telphone` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `img` text,
  `sex` int(1) DEFAULT NULL COMMENT '性别0女1男',
  `paymentCode` varchar(50) DEFAULT NULL COMMENT '支付密码',
  `loanUserId` bigint(20) DEFAULT '-1' COMMENT '贷后维护经理UserId',
  `tid` bigint(20) DEFAULT NULL COMMENT '推荐人',
  `recommendCode` bigint(20) DEFAULT NULL COMMENT '推荐码',
  `isvip` bigint(20) DEFAULT NULL COMMENT '是否为VIIP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_adminmoney
-- ----------------------------
DROP TABLE IF EXISTS `t_adminmoney`;
CREATE TABLE `t_adminmoney` (
  `umid` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) NOT NULL COMMENT '用户id',
  `summoney` decimal(7,2) DEFAULT NULL COMMENT '总资产',
  `kymoney` decimal(7,2) DEFAULT NULL COMMENT '可用余额',
  `symoney` decimal(7,2) DEFAULT NULL COMMENT '收益总额',
  `tzmoney` decimal(7,2) DEFAULT NULL COMMENT '投资总额',
  `djmoney` decimal(7,2) DEFAULT NULL COMMENT '冻结金额',
  `dsmoney` decimal(7,2) DEFAULT NULL COMMENT '待收总额',
  `jlmoney` decimal(7,2) DEFAULT NULL COMMENT '奖励金额',
  PRIMARY KEY (`umid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_backuser
-- ----------------------------
DROP TABLE IF EXISTS `t_backuser`;
CREATE TABLE `t_backuser` (
  `huid` bigint(20) NOT NULL AUTO_INCREMENT,
  `realName` varchar(10) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL COMMENT '性别0女1男',
  `groupid` bigint(20) DEFAULT NULL COMMENT '所属组id',
  `groupName` varchar(20) DEFAULT NULL COMMENT '组名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`huid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_bankcard
-- ----------------------------
DROP TABLE IF EXISTS `t_bankcard`;
CREATE TABLE `t_bankcard` (
  `bcid` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) NOT NULL,
  `bankcard` bigint(20) DEFAULT NULL COMMENT '卡号',
  `realName` varchar(20) DEFAULT NULL COMMENT '姓名',
  `idno` varchar(20) DEFAULT NULL COMMENT '身份证',
  `banktype` varchar(20) DEFAULT NULL COMMENT '所属银行',
  `state` bigint(5) DEFAULT NULL COMMENT '状态',
  `date` datetime DEFAULT NULL COMMENT '绑卡时间',
  PRIMARY KEY (`bcid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_borrowapply
-- ----------------------------
DROP TABLE IF EXISTS `t_borrowapply`;
CREATE TABLE `t_borrowapply` (
  `baid` bigint(20) NOT NULL AUTO_INCREMENT,
  `realName` varchar(20) DEFAULT NULL,
  `money` decimal(10,3) DEFAULT NULL,
  `adminId` bigint(20) DEFAULT NULL,
  `bzid` bigint(20) DEFAULT NULL COMMENT '标种',
  `audittime` datetime DEFAULT NULL COMMENT '审核时间',
  `audittstate` bigint(5) DEFAULT NULL COMMENT '审核状态',
  `borrowertype` bigint(5) DEFAULT NULL COMMENT '借款类型',
  `borrowerterm` bigint(36) DEFAULT NULL COMMENT '借款期限',
  `deadline` datetime DEFAULT NULL COMMENT '截止时间',
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_borrowdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_borrowdetail`;
CREATE TABLE `t_borrowdetail` (
  `bdid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cardImage` varchar(120) DEFAULT NULL COMMENT '法人身份证（图片）',
  `businessImage` varchar(120) DEFAULT NULL COMMENT '营业执照副本',
  `bankAccount` varchar(20) DEFAULT NULL COMMENT '企业银行账号',
  `mpurpose` varchar(100) DEFAULT NULL COMMENT '资金用途',
  `repaymentSource` varchar(20) DEFAULT NULL COMMENT '还款来源',
  `suggest` varchar(20) DEFAULT NULL COMMENT '借款人介绍',
  `xmdescrip` varchar(500) DEFAULT NULL COMMENT '项目描述',
  `guarantee` varchar(500) DEFAULT NULL COMMENT '保障措施',
  `money` decimal(10,3) DEFAULT NULL COMMENT '金额',
  `nprofit` double(18,2) DEFAULT NULL COMMENT '年化收益',
  `IncomeApproach` varchar(50) DEFAULT NULL COMMENT '收益方式',
  PRIMARY KEY (`bdid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_borrowtype
-- ----------------------------
DROP TABLE IF EXISTS `t_borrowtype`;
CREATE TABLE `t_borrowtype` (
  `lxid` bigint(20) NOT NULL AUTO_INCREMENT,
  `lxname` varchar(20) DEFAULT NULL COMMENT '名称',
  `state` bigint(5) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`lxid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_bz
-- ----------------------------
DROP TABLE IF EXISTS `t_bz`;
CREATE TABLE `t_bz` (
  `bzid` bigint(20) NOT NULL AUTO_INCREMENT,
  `bzname` varchar(20) DEFAULT NULL COMMENT '名称',
  `state` bigint(5) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`bzid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_dxmodel
-- ----------------------------
DROP TABLE IF EXISTS `t_dxmodel`;
CREATE TABLE `t_dxmodel` (
  `dxid` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`dxid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `t_dynamic`;
CREATE TABLE `t_dynamic` (
  `dyid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `pic` varchar(100) DEFAULT NULL COMMENT '封面图片',
  PRIMARY KEY (`dyid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_friend
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend` (
  `fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `furl` varchar(100) DEFAULT NULL COMMENT '连接',
  `fpic` varchar(100) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_gathering
-- ----------------------------
DROP TABLE IF EXISTS `t_gathering`;
CREATE TABLE `t_gathering` (
  `skid` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) DEFAULT NULL,
  `borrowerid` bigint(20) DEFAULT NULL,
  `yprincipal` decimal(7,2) DEFAULT NULL COMMENT '应收本息',
  `rprincipal` decimal(7,2) DEFAULT NULL COMMENT '已收本息',
  `yinterest` decimal(7,2) DEFAULT NULL COMMENT '应收利息',
  `rinterest` decimal(7,2) DEFAULT NULL COMMENT '已收利息',
  `ycapital` decimal(7,2) DEFAULT NULL COMMENT '应收本金',
  `rcapital` decimal(7,2) DEFAULT NULL COMMENT '已收本金',
  `periods` bigint(36) DEFAULT NULL COMMENT '已还期数',
  `sumPeriods` bigint(36) DEFAULT NULL COMMENT '总期数',
  `repaymentDate` datetime DEFAULT NULL COMMENT '还款日期',
  `bdid` bigint(20) DEFAULT NULL,
  `faward` decimal(7,2) DEFAULT NULL COMMENT '好友奖励',
  PRIMARY KEY (`skid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_home
-- ----------------------------
DROP TABLE IF EXISTS `t_home`;
CREATE TABLE `t_home` (
  `hid` bigint(20) NOT NULL AUTO_INCREMENT,
  `pic1` varchar(100) DEFAULT NULL COMMENT '轮播图一',
  `pic2` varchar(100) DEFAULT NULL COMMENT '轮播图二',
  `pic3` varchar(100) DEFAULT NULL COMMENT '轮播图三',
  `ewm` varchar(100) DEFAULT NULL COMMENT '二维码',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_investment
-- ----------------------------
DROP TABLE IF EXISTS `t_investment`;
CREATE TABLE `t_investment` (
  `tzid` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) DEFAULT NULL,
  `borrowerid` bigint(20) DEFAULT NULL COMMENT '借款人id',
  `investmentMoney` decimal(10,3) DEFAULT NULL COMMENT '投资金额',
  `investmentTime` datetime DEFAULT NULL COMMENT '投资时间',
  `nprofit` double(18,2) DEFAULT NULL COMMENT '利率',
  `productName` varchar(20) DEFAULT NULL COMMENT '产品名',
  `bdid` bigint(20) DEFAULT NULL COMMENT '借款id',
  PRIMARY KEY (`tzid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_jur
-- ----------------------------
DROP TABLE IF EXISTS `t_jur`;
CREATE TABLE `t_jur` (
  `jid` bigint(20) NOT NULL AUTO_INCREMENT,
  `jurl` varchar(50) DEFAULT NULL COMMENT '权限',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_letter
-- ----------------------------
DROP TABLE IF EXISTS `t_letter`;
CREATE TABLE `t_letter` (
  `lid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `state` bigint(5) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_log_czz
-- ----------------------------
DROP TABLE IF EXISTS `t_log_czz`;
CREATE TABLE `t_log_czz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) NOT NULL COMMENT '用户id',
  `bankcard` bigint(20) DEFAULT NULL COMMENT '卡号',
  `banktype` varchar(20) DEFAULT NULL COMMENT '所属银行',
  `money` decimal(7,2) DEFAULT NULL COMMENT '金额',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `state` bigint(5) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_log_money
-- ----------------------------
DROP TABLE IF EXISTS `t_log_money`;
CREATE TABLE `t_log_money` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) NOT NULL COMMENT '用户id',
  `type` bigint(5) DEFAULT NULL COMMENT '类型',
  `inmoney` decimal(7,2) DEFAULT NULL COMMENT '收入',
  `outmoney` decimal(7,2) DEFAULT NULL COMMENT '支出',
  `date` datetime DEFAULT NULL COMMENT '生成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_log_tx
-- ----------------------------
DROP TABLE IF EXISTS `t_log_tx`;
CREATE TABLE `t_log_tx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) NOT NULL COMMENT '用户id',
  `bankcard` bigint(20) DEFAULT NULL COMMENT '卡号',
  `banktype` varchar(20) DEFAULT NULL COMMENT '所属银行',
  `money` decimal(7,2) DEFAULT NULL COMMENT '金额',
  `date` datetime DEFAULT NULL COMMENT '生成时间',
  `state` bigint(5) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_luckdate
-- ----------------------------
DROP TABLE IF EXISTS `t_luckdate`;
CREATE TABLE `t_luckdate` (
  `yid` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL COMMENT '生成时间',
  `summoney` decimal(10,2) DEFAULT NULL COMMENT '交易总额',
  `mothmoney` decimal(10,2) DEFAULT NULL COMMENT '月交易总额',
  `tadmin` int(11) DEFAULT NULL COMMENT '总用户数',
  `madmin` int(11) DEFAULT NULL COMMENT '月注册数',
  `ttzno` int(11) DEFAULT NULL COMMENT '总投资人数',
  `mtzno` int(11) DEFAULT NULL COMMENT '月投资人数',
  `tdkno` int(11) DEFAULT NULL COMMENT '总贷款人数',
  `mdkno` int(11) DEFAULT NULL COMMENT '月贷款人数',
  `tdkbno` int(11) DEFAULT NULL COMMENT '总贷款笔数',
  `mdkbno` int(11) DEFAULT NULL COMMENT '月贷款笔数',
  PRIMARY KEY (`yid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_media
-- ----------------------------
DROP TABLE IF EXISTS `t_media`;
CREATE TABLE `t_media` (
  `mid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `pic` varchar(100) DEFAULT NULL COMMENT '封面图片',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `url` varchar(100) DEFAULT NULL COMMENT '地址url',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_option
-- ----------------------------
DROP TABLE IF EXISTS `t_option`;
CREATE TABLE `t_option` (
  `opid` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`opid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_particulars
-- ----------------------------
DROP TABLE IF EXISTS `t_particulars`;
CREATE TABLE `t_particulars` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `realName` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `card` varchar(50) DEFAULT NULL COMMENT '身份证号码',
  `idtype` varchar(20) DEFAULT NULL COMMENT '证件类型',
  `education` varchar(20) DEFAULT NULL COMMENT '学历',
  `married` varchar(6) DEFAULT NULL COMMENT '婚否',
  `graduateschool` varchar(30) DEFAULT NULL COMMENT '毕业院校',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `nowwork` varchar(20) DEFAULT NULL COMMENT '现在的工作',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_recommend
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend`;
CREATE TABLE `t_recommend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tid` bigint(20) NOT NULL COMMENT '推荐人id',
  `tname` varchar(20) DEFAULT NULL COMMENT '推荐人姓名',
  `uid` bigint(20) NOT NULL COMMENT '被推荐人id',
  `rname` varchar(20) DEFAULT NULL COMMENT '被推荐人姓名',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_repayment
-- ----------------------------
DROP TABLE IF EXISTS `t_repayment`;
CREATE TABLE `t_repayment` (
  `hkid` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) DEFAULT NULL,
  `realName` varchar(20) DEFAULT NULL,
  `productName` varchar(20) DEFAULT NULL COMMENT '产品名',
  `bzName` varchar(20) DEFAULT NULL COMMENT '标种名称',
  `yprincipal` decimal(7,2) DEFAULT NULL COMMENT '应收本息',
  `rprincipal` decimal(7,2) DEFAULT NULL COMMENT '已收本息',
  `yinterest` decimal(7,2) DEFAULT NULL COMMENT '应收利息',
  `rinterest` decimal(7,2) DEFAULT NULL COMMENT '已收利息',
  `ycapital` decimal(7,2) DEFAULT NULL COMMENT '应收本金',
  `rcapital` decimal(7,2) DEFAULT NULL COMMENT '已收本金',
  `yinterestPenalty` decimal(7,2) DEFAULT NULL COMMENT '应还罚息',
  `rinterestPenalty` decimal(7,2) DEFAULT NULL COMMENT '已还罚息',
  `periods` bigint(36) DEFAULT NULL COMMENT '已还期数',
  `sumPeriods` bigint(36) DEFAULT NULL COMMENT '总期数',
  `repaymentDate` datetime DEFAULT NULL COMMENT '还款日期',
  `actualRepayDate` datetime DEFAULT NULL COMMENT '实际还款日期',
  `overdue` bigint(5) DEFAULT NULL COMMENT '逾期次数',
  `bdid` bigint(20) DEFAULT NULL,
  `repaymentState` bigint(5) DEFAULT NULL COMMENT '还款状态',
  `overdueTime` datetime DEFAULT NULL COMMENT '逾期执行时间',
  `huid` bigint(20) DEFAULT NULL COMMENT '贷后负责人',
  PRIMARY KEY (`hkid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_reward
-- ----------------------------
DROP TABLE IF EXISTS `t_reward`;
CREATE TABLE `t_reward` (
  `rwid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '投资人id',
  `tmoney` decimal(7,2) DEFAULT NULL COMMENT '投资总额',
  `money` decimal(7,2) DEFAULT NULL COMMENT '奖励金额',
  `state` bigint(5) DEFAULT NULL COMMENT '奖励发放状态',
  `date` datetime DEFAULT NULL COMMENT '奖励发放时间',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_reward_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_reward_setting`;
CREATE TABLE `t_reward_setting` (
  `rwid` bigint(20) NOT NULL AUTO_INCREMENT,
  `minmoney` decimal(7,2) DEFAULT NULL COMMENT '最小金额',
  `maxmoney` decimal(7,2) DEFAULT NULL COMMENT '最大金额',
  `percent` double DEFAULT NULL COMMENT '奖励百分比',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT,
  `realName` varchar(20) DEFAULT NULL COMMENT '角色名',
  `content` varchar(400) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_rolejur
-- ----------------------------
DROP TABLE IF EXISTS `t_rolejur`;
CREATE TABLE `t_rolejur` (
  `rjid` bigint(20) NOT NULL AUTO_INCREMENT,
  `jid` bigint(20) NOT NULL COMMENT '权限表',
  `rid` bigint(20) NOT NULL COMMENT '角色表',
  PRIMARY KEY (`rjid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_roleuser
-- ----------------------------
DROP TABLE IF EXISTS `t_roleuser`;
CREATE TABLE `t_roleuser` (
  `ruid` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NOT NULL COMMENT '角色id',
  `adminId` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`ruid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_rzvip_check
-- ----------------------------
DROP TABLE IF EXISTS `t_rzvip_check`;
CREATE TABLE `t_rzvip_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `huid` bigint(20) NOT NULL COMMENT '审核人id',
  `isok` bigint(5) DEFAULT NULL COMMENT '审核是否通过',
  `excuse` varchar(400) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_shborrow
-- ----------------------------
DROP TABLE IF EXISTS `t_shborrow`;
CREATE TABLE `t_shborrow` (
  `shid` bigint(20) NOT NULL AUTO_INCREMENT,
  `huid` bigint(20) NOT NULL COMMENT '审核人id',
  `isok` bigint(5) DEFAULT NULL COMMENT '审核是否通过',
  `excuse` varchar(400) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `baid` bigint(20) NOT NULL COMMENT '借款id',
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sway
-- ----------------------------
DROP TABLE IF EXISTS `t_sway`;
CREATE TABLE `t_sway` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `way` varchar(20) DEFAULT NULL COMMENT '方式',
  `sf` varchar(50) DEFAULT NULL COMMENT '算法',
  `state` bigint(5) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ticket
-- ----------------------------
DROP TABLE IF EXISTS `t_ticket`;
CREATE TABLE `t_ticket` (
  `kid` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` bigint(5) DEFAULT NULL COMMENT '类型',
  `tkmoney` decimal(5,2) DEFAULT NULL COMMENT '价值',
  `tktime` datetime DEFAULT NULL COMMENT '有效时间',
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_tx_check
-- ----------------------------
DROP TABLE IF EXISTS `t_tx_check`;
CREATE TABLE `t_tx_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `txid` bigint(20) NOT NULL COMMENT '提现id',
  `huid` bigint(20) NOT NULL COMMENT '审核人id',
  `isok` bigint(5) DEFAULT NULL COMMENT '审核是否通过',
  `excuse` varchar(400) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
