/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : p2p_1

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-29 11:34:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bankcard
-- ----------------------------
DROP TABLE IF EXISTS `t_bankcard`;
CREATE TABLE `t_bankcard` (
  `bcid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `cardno` varchar(30) NOT NULL COMMENT '银行卡号',
  `rname` varchar(20) NOT NULL COMMENT '绑卡人姓名',
  `idno` char(18) DEFAULT NULL COMMENT '身份证号码，默认为18位',
  `type` varchar(20) NOT NULL COMMENT '所属银行',
  `state` tinyint(4) DEFAULT NULL COMMENT '银行卡状态，0激活，1冻结',
  `date` datetime DEFAULT NULL COMMENT '绑卡时间',
  PRIMARY KEY (`bcid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bankcard
-- ----------------------------
INSERT INTO `t_bankcard` VALUES ('1', '1', '78343434727374344', '凤囚凰灬', '37656456564546466', '建设银行', '1', '2017-12-25 14:32:03');
INSERT INTO `t_bankcard` VALUES ('2', '1', '54435456465765788', '凤囚凰灬', '37656456564546466', '工商银行', '1', '2017-12-25 14:32:54');

-- ----------------------------
-- Table structure for t_borrowapply
-- ----------------------------
DROP TABLE IF EXISTS `t_borrowapply`;
CREATE TABLE `t_borrowapply` (
  `baid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `money` decimal(10,2) DEFAULT NULL COMMENT '申请金额',
  `uid` bigint(20) DEFAULT NULL COMMENT '借款人id，uid为t_user表id',
  `bzid` bigint(20) DEFAULT NULL COMMENT '标种',
  `time` datetime DEFAULT NULL COMMENT '审核时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '审核状态（1表示为审核，2表示已审核）',
  `lxid` bigint(20) DEFAULT NULL COMMENT '借款类型为标种的主键字段',
  `term` int(20) DEFAULT NULL COMMENT '借款期限',
  `deadline` datetime DEFAULT NULL COMMENT '截止时间',
  `huserid` bigint(20) DEFAULT NULL COMMENT 's审核人id',
  `excuse` varchar(20) DEFAULT NULL COMMENT '审核理由',
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_borrowapply
-- ----------------------------
INSERT INTO `t_borrowapply` VALUES ('15', '温宁宁', '100000.00', '1', '1', null, '1', '2', '6', '2018-06-28 11:40:04', null, null);
INSERT INTO `t_borrowapply` VALUES ('16', '温宁宁', '500000.00', '1', '2', null, null, '1', '10', '2018-10-28 14:06:44', null, null);

-- ----------------------------
-- Table structure for t_borrowdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_borrowdetail`;
CREATE TABLE `t_borrowdetail` (
  `bdid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fpic` varchar(100) DEFAULT NULL COMMENT '法人身份证照片',
  `ypic` varchar(100) DEFAULT NULL COMMENT '营业执照副本照片',
  `qpic` varchar(100) DEFAULT NULL COMMENT '企业银行账号',
  `tpic` varchar(100) DEFAULT NULL COMMENT '其他资料',
  `mpurpose` varchar(100) DEFAULT NULL COMMENT '资金用途',
  `hksource` varchar(100) DEFAULT NULL COMMENT '还款来源',
  `suggest` varchar(500) DEFAULT NULL COMMENT '借款人介绍',
  `xmdescrip` varchar(500) DEFAULT NULL COMMENT '项目描述',
  `guarantee` varchar(500) DEFAULT NULL COMMENT '保障措施',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `nprofit` decimal(5,2) DEFAULT NULL COMMENT '年化收益',
  `way` varchar(200) DEFAULT NULL COMMENT '收益方式',
  `cpname` varchar(200) DEFAULT NULL COMMENT '产品名称',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，baid为t_borrowapply表id',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`bdid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_borrowdetail
-- ----------------------------
INSERT INTO `t_borrowdetail` VALUES ('10', '20171228114004123 (3).jpg', '20171228114004123.jpg', '201712281140041505740128770.jpeg', '20171228114004268228-106.jpg', '其他借款', '经营性收入', '赣州**商贸有限责任公司成立于2007年04月23日  ，注册资本260万，实收资本260万元，股东分别为李**占比60%、吴**占比40%，经营范围：预包装食品，散装食品，乳制品（含婴幼儿配方乳粉）批发兼零售（凭有效食品经营许可证经营）；食盐批发(凭食盐批发有效许可证经营)；日用品销售；市场营销策划；展览展示服务。公司现有在册员工87名，办公面积600余平方米，仓储面积5000余平米，配送车辆11台。2016年年营业收入6147.82万元左右，净利润519.33万元，2017年1-10月年营业收入5568.88万元，净利润479.49万元。', '本次借款主要用于年底年货销售旺季备货，该企业借款金额为100万元，第一期50万元，期限3个月，本平台为此借款提供服务。', '1、 公司股东李**、吴**夫妇提供无限连带责任担保\r\n2、在中登网登记2018年度与赣州**实业有限公司应收账款金额不低于240万元', '100000.00', '9.00', '按月付息，到期还本', 'PJZB1215', '15', null, null);
INSERT INTO `t_borrowdetail` VALUES ('11', '2017122814064411.jpg', '2017122814064412.jpg', '2017122814064413.jpg', '20171228140644ning.jpeg', '将通过访谈和规范化', '更符合规范化', '发送到', '法国队的风格', '更符合法规和', '500000.00', '6.00', '按月付息，到期还本', 'PJZB2116', '16', null, null);

-- ----------------------------
-- Table structure for t_bz
-- ----------------------------
DROP TABLE IF EXISTS `t_bz`;
CREATE TABLE `t_bz` (
  `bzid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `bzname` varchar(20) DEFAULT NULL COMMENT '标种名称',
  `state` tinyint(4) DEFAULT NULL COMMENT '标种状态(0为可用，1为不可用)',
  PRIMARY KEY (`bzid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bz
-- ----------------------------
INSERT INTO `t_bz` VALUES ('1', '恒金宝', '0');
INSERT INTO `t_bz` VALUES ('2', '多金宝', '0');
INSERT INTO `t_bz` VALUES ('3', '普金宝', '0');

-- ----------------------------
-- Table structure for t_dxmodel
-- ----------------------------
DROP TABLE IF EXISTS `t_dxmodel`;
CREATE TABLE `t_dxmodel` (
  `dxid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`dxid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dxmodel
-- ----------------------------
INSERT INTO `t_dxmodel` VALUES ('2', '您的验证码为123456，请妥善保管！');
INSERT INTO `t_dxmodel` VALUES ('3', '您的验证码为123456，请妥善保管！');
INSERT INTO `t_dxmodel` VALUES ('4', '您的验证码为123456，请妥善保管！');

-- ----------------------------
-- Table structure for t_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `t_dynamic`;
CREATE TABLE `t_dynamic` (
  `dyid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `pic` varchar(50) DEFAULT NULL COMMENT '封面图片',
  PRIMARY KEY (`dyid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dynamic
-- ----------------------------
INSERT INTO `t_dynamic` VALUES ('1', '关于公司动态', '2017-12-27 09:27:51', '公司动态', '621873904543590.jpg');
INSERT INTO `t_dynamic` VALUES ('2', '【普金资本】校企联手 探寻合作新契机！', '2017-12-27 09:40:12', '校企联手 探寻合作新契机！', '621873904543590.jpg');

-- ----------------------------
-- Table structure for t_friend
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend` (
  `fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `furl` varchar(50) DEFAULT NULL COMMENT '链接',
  `fpic` varchar(50) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_friend
-- ----------------------------

-- ----------------------------
-- Table structure for t_hkb
-- ----------------------------
DROP TABLE IF EXISTS `t_hkb`;
CREATE TABLE `t_hkb` (
  `hkid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT 'uid为前台用户表t_user主键字段',
  `rname` varchar(20) NOT NULL COMMENT '真实姓名',
  `cpname` varchar(20) NOT NULL COMMENT '产品名称',
  `rnum` int(11) DEFAULT NULL COMMENT '已还期数',
  `tnum` int(11) DEFAULT NULL COMMENT '总期数',
  `ytime` datetime DEFAULT NULL COMMENT '应还时间',
  `rtime` datetime DEFAULT NULL COMMENT '实际还款时间',
  `bzname` varchar(20) DEFAULT NULL COMMENT '标种名称，bzname为t_bz表里面标种名称',
  `ybx` decimal(7,2) DEFAULT NULL COMMENT '应还本息',
  `rbx` decimal(7,2) DEFAULT NULL COMMENT '已还本息',
  `ylx` decimal(7,2) DEFAULT NULL COMMENT '应还利息',
  `rlx` decimal(7,2) DEFAULT NULL COMMENT '已还利息',
  `ybj` decimal(7,2) DEFAULT NULL COMMENT '应还本金',
  `rbj` decimal(7,2) DEFAULT NULL COMMENT '已还本金',
  `yfx` decimal(7,2) DEFAULT NULL COMMENT '应还罚息',
  `rfx` decimal(7,2) DEFAULT NULL COMMENT '已还罚息',
  `yucount` int(11) DEFAULT NULL COMMENT '逾期次数',
  `state` tinyint(4) DEFAULT NULL COMMENT '还款状态（0未还款，1已还款）',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id ，t_borrowapply主键id',
  `yustartime` datetime DEFAULT NULL COMMENT '逾期执行时间',
  `huid` bigint(20) DEFAULT NULL COMMENT '贷后负责人 t_huser后台用户id字段',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`hkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hkb
-- ----------------------------

-- ----------------------------
-- Table structure for t_home
-- ----------------------------
DROP TABLE IF EXISTS `t_home`;
CREATE TABLE `t_home` (
  `hid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pic1` varchar(50) DEFAULT NULL COMMENT '轮播图1',
  `pic2` varchar(50) DEFAULT NULL COMMENT '轮播图2',
  `pic3` varchar(50) DEFAULT NULL COMMENT '轮播图3',
  `ewm` varchar(100) DEFAULT NULL COMMENT '二维码',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `l1` varchar(50) DEFAULT NULL COMMENT '链接1',
  `l2` varchar(50) DEFAULT NULL COMMENT '链接2',
  `l3` varchar(50) DEFAULT NULL COMMENT '链接3',
  `l4` varchar(50) DEFAULT NULL COMMENT '链接4',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_home
-- ----------------------------

-- ----------------------------
-- Table structure for t_huser
-- ----------------------------
DROP TABLE IF EXISTS `t_huser`;
CREATE TABLE `t_huser` (
  `huid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(4) NOT NULL COMMENT '性别（0男，1女）',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  `pwd` varchar(50) DEFAULT NULL,
  `huname` varchar(50) DEFAULT NULL COMMENT '用户名，相当于昵称',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`huid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_huser
-- ----------------------------
INSERT INTO `t_huser` VALUES ('1', '张三', '0', '11111111111', '4QrcOUm6Wau+VuBX8g+IPg==', '三儿', '111111@qq.com', null, null);

-- ----------------------------
-- Table structure for t_jklx
-- ----------------------------
DROP TABLE IF EXISTS `t_jklx`;
CREATE TABLE `t_jklx` (
  `lxid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lxname` varchar(20) DEFAULT NULL COMMENT '借款名称，如（先本后息，先息后本，等额本息，等额本金）',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态（0可用，1不可用）',
  PRIMARY KEY (`lxid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jklx
-- ----------------------------
INSERT INTO `t_jklx` VALUES ('1', '信用贷', '1');
INSERT INTO `t_jklx` VALUES ('2', '抵押贷', '1');
INSERT INTO `t_jklx` VALUES ('3', '净值贷', '1');

-- ----------------------------
-- Table structure for t_jur
-- ----------------------------
DROP TABLE IF EXISTS `t_jur`;
CREATE TABLE `t_jur` (
  `jid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `jurl` varchar(50) DEFAULT NULL COMMENT '权限URL',
  `content` varchar(500) DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jur
-- ----------------------------
INSERT INTO `t_jur` VALUES ('1', 'huser:login', '后台用户登录');
INSERT INTO `t_jur` VALUES ('2', 'huser:jur_add', '权限的导入');
INSERT INTO `t_jur` VALUES ('3', 'huser:jur_list', '权限的查看');
INSERT INTO `t_jur` VALUES ('4', 'huser:add', '后台员工的新增');
INSERT INTO `t_jur` VALUES ('5', 'hsuer:admin_add', '后台管理员的新增');
INSERT INTO `t_jur` VALUES ('6', 'huser:list', '所有后台用户查询');
INSERT INTO `t_jur` VALUES ('7', 'user:rzvip_check', '前台用户认证审核');
INSERT INTO `t_jur` VALUES ('8', 'user:tx_check', '前台用户提现审核');
INSERT INTO `t_jur` VALUES ('9', 'shborrow:check', '前台用户借款审核');
INSERT INTO `t_jur` VALUES ('10', 'bz:add', '标种的新增');
INSERT INTO `t_jur` VALUES ('11', 'shborrow:', '贷款审核');
INSERT INTO `t_jur` VALUES ('12', 'hkb:principal', '贷后负责人');

-- ----------------------------
-- Table structure for t_letter
-- ----------------------------
DROP TABLE IF EXISTS `t_letter`;
CREATE TABLE `t_letter` (
  `lid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0激活，1冻结',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_letter
-- ----------------------------

-- ----------------------------
-- Table structure for t_logczz
-- ----------------------------
DROP TABLE IF EXISTS `t_logczz`;
CREATE TABLE `t_logczz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `bankcard` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `banktype` varchar(20) DEFAULT NULL COMMENT '所属银行',
  `money` decimal(7,2) DEFAULT NULL COMMENT '金额',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0充值成功，1充值失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logczz
-- ----------------------------
INSERT INTO `t_logczz` VALUES ('1', '1', '54435456465765788', '工商银行', '600.00', '2017-12-26 09:05:00', '1');
INSERT INTO `t_logczz` VALUES ('2', '1', '78343434727374344', '建设银行', '600.00', '2017-12-26 09:07:44', '1');
INSERT INTO `t_logczz` VALUES ('3', '1', '54435456465765788', '工商银行', '500.00', '2017-12-26 09:09:25', '1');
INSERT INTO `t_logczz` VALUES ('4', '1', '78343434727374344', '建设银行', '500.00', '2017-12-26 09:09:56', '1');
INSERT INTO `t_logczz` VALUES ('5', '1', '78343434727374344', '建设银行', '500.00', '2017-12-26 10:03:13', '1');
INSERT INTO `t_logczz` VALUES ('6', '1', '78343434727374344', '建设银行', '500.00', '2017-12-26 10:03:25', '1');
INSERT INTO `t_logczz` VALUES ('7', '1', '78343434727374344', '建设银行', '444.00', '2017-12-26 10:05:50', '1');
INSERT INTO `t_logczz` VALUES ('8', '1', '78343434727374344', '建设银行', '342.00', '2017-12-26 10:59:13', '1');
INSERT INTO `t_logczz` VALUES ('9', '1', '78343434727374344', '建设银行', '300.00', '2017-12-27 14:42:31', '1');
INSERT INTO `t_logczz` VALUES ('10', '1', '78343434727374344', '建设银行', '588.00', '2017-12-27 14:44:17', '1');
INSERT INTO `t_logczz` VALUES ('11', '1', '78343434727374344', '建设银行', '666.00', '2017-12-27 14:45:18', '1');

-- ----------------------------
-- Table structure for t_logmoney
-- ----------------------------
DROP TABLE IF EXISTS `t_logmoney`;
CREATE TABLE `t_logmoney` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型，0充值，1提现，2回款，3系统金额（公司奖励等）',
  `in` decimal(10,2) DEFAULT NULL COMMENT '收入',
  `out` decimal(10,2) DEFAULT NULL COMMENT '支出',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logmoney
-- ----------------------------
INSERT INTO `t_logmoney` VALUES ('1', '1', '1', '0.00', '100000.00', '2017-12-25 08:29:10');
INSERT INTO `t_logmoney` VALUES ('2', '1', '0', '50000.00', '0.00', '2017-12-25 12:31:33');

-- ----------------------------
-- Table structure for t_logtx
-- ----------------------------
DROP TABLE IF EXISTS `t_logtx`;
CREATE TABLE `t_logtx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `money` decimal(7,2) DEFAULT NULL COMMENT '提现金额',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0提现成功，1未提现失败',
  `bankcard` varchar(50) DEFAULT NULL,
  `banktype` varchar(50) DEFAULT NULL,
  `proce` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logtx
-- ----------------------------
INSERT INTO `t_logtx` VALUES ('1', '1', '1000.00', '2017-12-28 15:57:53', '3', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('2', '1', '1000.00', '2017-12-28 16:34:47', '3', '54435456465765788', '工商银行', '3.50');
INSERT INTO `t_logtx` VALUES ('3', '1', '2000.00', '2017-12-28 20:02:03', '3', '78343434727374344', '建设银行', '7.00');
INSERT INTO `t_logtx` VALUES ('4', '1', '1000.00', '2017-12-28 20:44:59', '3', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('5', '1', '10000.00', '2017-12-28 20:48:30', '3', '78343434727374344', '建设银行', '35.00');
INSERT INTO `t_logtx` VALUES ('6', '1', '1000.00', '2017-12-28 20:57:31', '1', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('7', '1', '1000.00', '2017-12-29 08:04:21', '3', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('8', '1', '2000.00', '2017-12-29 08:34:41', '3', '78343434727374344', '建设银行', '7.00');
INSERT INTO `t_logtx` VALUES ('9', '1', '1000.00', '2017-12-29 08:43:24', '3', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('10', '1', '1000.00', '2017-12-29 08:45:56', '3', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('11', '1', '1000.00', '2017-12-29 08:46:25', '1', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('12', '1', '1000.00', '2017-12-29 08:47:12', '1', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('13', '1', '1000.00', '2017-12-29 08:47:48', '1', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('14', '1', '1000.00', '2017-12-29 08:53:51', '1', '78343434727374344', '建设银行', '3.50');
INSERT INTO `t_logtx` VALUES ('15', '1', '1200.00', '2017-12-29 08:54:05', '1', '78343434727374344', '建设银行', '4.20');

-- ----------------------------
-- Table structure for t_media
-- ----------------------------
DROP TABLE IF EXISTS `t_media`;
CREATE TABLE `t_media` (
  `mid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `pic` varchar(50) DEFAULT NULL COMMENT '封面图片',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `url` varchar(50) DEFAULT NULL COMMENT '报道的链接地址',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_media
-- ----------------------------
INSERT INTO `t_media` VALUES ('1', '普金资本', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0005.gif\"/>资本内容</p>', '1563789405059.jpg', '2017-12-21 20:00:58', 'http://baidu.com');
INSERT INTO `t_media` VALUES ('2', '媒体管理', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0005.gif\"/>媒体管理内容</p>', '7239120481023.jpg', '2017-12-25 08:34:59', 'http://baidu.com');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `nid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '公告时间',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------

-- ----------------------------
-- Table structure for t_option
-- ----------------------------
DROP TABLE IF EXISTS `t_option`;
CREATE TABLE `t_option` (
  `opid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `phone` char(11) NOT NULL COMMENT '电话',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `date` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`opid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_option
-- ----------------------------

-- ----------------------------
-- Table structure for t_recommend
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend`;
CREATE TABLE `t_recommend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tid` bigint(20) DEFAULT NULL COMMENT '推荐人id',
  `tname` varchar(20) DEFAULT NULL COMMENT '推荐人姓名',
  `uid` bigint(20) DEFAULT NULL COMMENT '被推荐人id',
  `rname` varchar(20) DEFAULT NULL COMMENT '被推荐人姓名',
  `date` datetime DEFAULT NULL COMMENT '推荐时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recommend
-- ----------------------------
INSERT INTO `t_recommend` VALUES ('12', '44', '吞吞', '65', '突然', '2017-12-25 08:35:54');
INSERT INTO `t_recommend` VALUES ('14', '12', '用户', '22', '回家', '2017-12-28 10:05:21');
INSERT INTO `t_recommend` VALUES ('15', '13', '放大', '23', '午饭', '2017-12-29 09:04:00');
INSERT INTO `t_recommend` VALUES ('16', '14', '覆盖', '24', '地方', '2017-12-31 09:04:24');

-- ----------------------------
-- Table structure for t_reward
-- ----------------------------
DROP TABLE IF EXISTS `t_reward`;
CREATE TABLE `t_reward` (
  `rwid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '投资人id，t_user前台用户表id字段',
  `tmoney` decimal(7,2) DEFAULT NULL COMMENT '投资总额',
  `money` decimal(7,2) DEFAULT NULL COMMENT '奖励金额',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态（0已发放，1未发放）',
  `date` datetime DEFAULT NULL COMMENT '奖励发放时间',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reward
-- ----------------------------

-- ----------------------------
-- Table structure for t_rewardsetting
-- ----------------------------
DROP TABLE IF EXISTS `t_rewardsetting`;
CREATE TABLE `t_rewardsetting` (
  `rwid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `minmoney` decimal(7,2) DEFAULT NULL COMMENT '最小金额',
  `maxmoney` decimal(7,2) DEFAULT NULL COMMENT '最大金额',
  `percent` double(255,0) DEFAULT NULL COMMENT '奖励百分比',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rewardsetting
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rname` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `content` varchar(500) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', '拥有本平台所有的权限');

-- ----------------------------
-- Table structure for t_rolejur
-- ----------------------------
DROP TABLE IF EXISTS `t_rolejur`;
CREATE TABLE `t_rolejur` (
  `rjid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色id，t_role主键id',
  `jid` bigint(20) DEFAULT NULL COMMENT '权限id，t_jur主键id',
  PRIMARY KEY (`rjid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rolejur
-- ----------------------------
INSERT INTO `t_rolejur` VALUES ('1', '1', '1');
INSERT INTO `t_rolejur` VALUES ('2', '1', '2');
INSERT INTO `t_rolejur` VALUES ('3', '1', '3');
INSERT INTO `t_rolejur` VALUES ('4', '1', '4');
INSERT INTO `t_rolejur` VALUES ('5', '1', '5');
INSERT INTO `t_rolejur` VALUES ('6', '1', '6');
INSERT INTO `t_rolejur` VALUES ('7', '1', '7');
INSERT INTO `t_rolejur` VALUES ('8', '1', '8');
INSERT INTO `t_rolejur` VALUES ('9', '1', '9');
INSERT INTO `t_rolejur` VALUES ('10', '1', '10');
INSERT INTO `t_rolejur` VALUES ('11', '1', '11');
INSERT INTO `t_rolejur` VALUES ('12', '1', '12');

-- ----------------------------
-- Table structure for t_roleuser
-- ----------------------------
DROP TABLE IF EXISTS `t_roleuser`;
CREATE TABLE `t_roleuser` (
  `ruid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色id',
  `huid` bigint(20) DEFAULT NULL COMMENT '后台用户id',
  PRIMARY KEY (`ruid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roleuser
-- ----------------------------

-- ----------------------------
-- Table structure for t_rzvip
-- ----------------------------
DROP TABLE IF EXISTS `t_rzvip`;
CREATE TABLE `t_rzvip` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `xl` varchar(40) DEFAULT NULL COMMENT '学历',
  `ism` tinyint(4) DEFAULT NULL COMMENT '婚否（0已婚，1未婚，2单身）',
  `bschool` varchar(30) DEFAULT NULL COMMENT '毕业学校',
  `addr` varchar(40) NOT NULL COMMENT '居住地址',
  `work` varchar(30) DEFAULT NULL COMMENT '现工作',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rzvip
-- ----------------------------
INSERT INTO `t_rzvip` VALUES ('1', '1', '本科', '0', '宏图学院', '博兴花园', 'java高级工程师', '20', null, null);

-- ----------------------------
-- Table structure for t_rzvipcheck
-- ----------------------------
DROP TABLE IF EXISTS `t_rzvipcheck`;
CREATE TABLE `t_rzvipcheck` (
  `rcid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `isok` tinyint(4) DEFAULT NULL COMMENT '审核是否通过，0通过，1未通过',
  `excute` varchar(200) DEFAULT NULL COMMENT '理由',
  `date` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`rcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rzvipcheck
-- ----------------------------

-- ----------------------------
-- Table structure for t_shborrow
-- ----------------------------
DROP TABLE IF EXISTS `t_shborrow`;
CREATE TABLE `t_shborrow` (
  `shid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id，t_huser后台用户主键id',
  `isok` tinyint(4) DEFAULT NULL COMMENT '审核是否通过（0未通过，1已通过）',
  `excute` varchar(200) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '审核时间',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply申请借款表主键id字段',
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shborrow
-- ----------------------------

-- ----------------------------
-- Table structure for t_skb
-- ----------------------------
DROP TABLE IF EXISTS `t_skb`;
CREATE TABLE `t_skb` (
  `skid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id，前台用户t_user主键id',
  `juid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply表主键id',
  `ybx` decimal(7,2) DEFAULT NULL COMMENT '应收本息',
  `rbx` decimal(7,2) DEFAULT NULL COMMENT '已收本息',
  `ylx` decimal(7,2) DEFAULT NULL COMMENT '应收利息',
  `rlx` decimal(7,2) DEFAULT NULL COMMENT '已收利息',
  `ybj` decimal(7,2) DEFAULT NULL COMMENT '应收本金',
  `rbj` decimal(7,2) DEFAULT NULL COMMENT '已收本金',
  `rnum` int(11) DEFAULT NULL COMMENT '已还期数',
  `tnum` int(11) DEFAULT NULL COMMENT '总期数',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply表主键id',
  `fmoney` decimal(7,2) DEFAULT NULL COMMENT '好友奖励',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`skid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_skb
-- ----------------------------

-- ----------------------------
-- Table structure for t_sway
-- ----------------------------
DROP TABLE IF EXISTS `t_sway`;
CREATE TABLE `t_sway` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `way` tinyint(4) DEFAULT NULL COMMENT '方式',
  `fw` varchar(200) DEFAULT NULL COMMENT '算法',
  `state` tinyint(4) DEFAULT NULL COMMENT '还款方式状态（0不可用，1可用）',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sway
-- ----------------------------
INSERT INTO `t_sway` VALUES ('2', '0', '微信', '1');
INSERT INTO `t_sway` VALUES ('3', '1', '银行卡', '1');
INSERT INTO `t_sway` VALUES ('4', '2', '支付宝', '1');
INSERT INTO `t_sway` VALUES ('5', '3', 'QQ钱包', '1');
INSERT INTO `t_sway` VALUES ('6', '4', '余额宝', '1');

-- ----------------------------
-- Table structure for t_ticket
-- ----------------------------
DROP TABLE IF EXISTS `t_ticket`;
CREATE TABLE `t_ticket` (
  `kid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` tinyint(4) DEFAULT NULL COMMENT '优惠券类型，如现金劵，代金券，体验金',
  `tkmoney` decimal(7,2) DEFAULT NULL COMMENT '优惠券金额',
  `tktime` datetime DEFAULT NULL COMMENT '有效时间',
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ticket
-- ----------------------------
INSERT INTO `t_ticket` VALUES ('1', '0', '50.00', '2017-12-23 14:51:03');
INSERT INTO `t_ticket` VALUES ('2', '1', '30.00', '2017-12-24 14:54:46');
INSERT INTO `t_ticket` VALUES ('3', '2', '60.00', '2017-12-26 08:56:59');
INSERT INTO `t_ticket` VALUES ('4', '3', '1000.00', '2017-12-28 10:24:38');

-- ----------------------------
-- Table structure for t_txcheck
-- ----------------------------
DROP TABLE IF EXISTS `t_txcheck`;
CREATE TABLE `t_txcheck` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `txid` bigint(20) DEFAULT NULL COMMENT '提现人id',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `isok` tinyint(4) DEFAULT NULL COMMENT '审核是否通过，0通过，1未通过',
  `excute` varchar(200) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_txcheck
-- ----------------------------

-- ----------------------------
-- Table structure for t_tzb
-- ----------------------------
DROP TABLE IF EXISTS `t_tzb`;
CREATE TABLE `t_tzb` (
  `tzid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '前台用户t_user表id字段',
  `juid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply表主键id',
  `money` decimal(7,2) NOT NULL COMMENT '投资金额',
  `time` datetime NOT NULL COMMENT '投资时间',
  `nprofit` float(3,2) NOT NULL COMMENT '利率',
  `cpname` varchar(20) NOT NULL COMMENT '产品名称',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款id 取t_borrowapply表id',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`tzid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tzb
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uname` varchar(20) NOT NULL COMMENT '用户名',
  `upwd` varchar(100) NOT NULL COMMENT '密码，进行MD5加密',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  `tzm` varchar(100) DEFAULT NULL COMMENT '推荐码',
  `idtype` varchar(20) DEFAULT NULL COMMENT '证件类型',
  `idno` char(18) DEFAULT NULL COMMENT '证件号（身份证号）',
  `zpwd` varchar(100) DEFAULT NULL COMMENT '支付密码',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `rname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `tid` bigint(20) DEFAULT NULL COMMENT '推荐人id， t_recommend推荐人表主键id',
  `face` varchar(50) NOT NULL DEFAULT 'upload/123.jpg' COMMENT '头像',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别（0男，1女）',
  `isvip` tinyint(4) DEFAULT NULL COMMENT '是否为VIP用户，0是，1否',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '凤囚凰灬', '4QrcOUm6Wau+VuBX8g+IPg==', '123456', '259001', '身份证', '360730199709191713', '123456', '1427916171@qq.com', '温宁宁', null, 'upload/123.jpg', '0', null, null, null);
INSERT INTO `t_user` VALUES ('2', '李四', '4QrcOUm6Wau+VuBX8g+IPg==', '18174099439', '256002', null, null, null, null, null, null, 'upload/123.jpg', null, null, null, null);
INSERT INTO `t_user` VALUES ('3', '王五', '4QrcOUm6Wau+VuBX8g+IPg==', '18370710329', '256003', null, null, null, null, null, null, 'upload/123.jpg', null, null, null, null);
INSERT INTO `t_user` VALUES ('4', '王五', '4QrcOUm6Wau+VuBX8g+IPg==', '18370715969', '256004', null, null, null, null, null, null, 'upload/123.jpg', null, null, null, null);
INSERT INTO `t_user` VALUES ('5', '张三', '4QrcOUm6Wau+VuBX8g+IPg==', '18779749107', '256005', null, null, null, null, null, null, 'upload/123.jpg', null, null, null, null);
INSERT INTO `t_user` VALUES ('6', '天天', '4QrcOUm6Wau+VuBX8g+IPg==', '18779749108', '256006', null, null, null, null, null, null, 'upload/123.jpg', null, null, null, null);
INSERT INTO `t_user` VALUES ('7', '朋友', '4QrcOUm6Wau+VuBX8g+IPg==', '18174099438', '256007', null, null, null, null, null, null, 'upload/123.jpg', null, null, null, null);

-- ----------------------------
-- Table structure for t_usermoney
-- ----------------------------
DROP TABLE IF EXISTS `t_usermoney`;
CREATE TABLE `t_usermoney` (
  `umid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `zmoney` decimal(10,2) DEFAULT NULL COMMENT '总资产',
  `kymoney` decimal(10,2) DEFAULT NULL COMMENT '可用余额',
  `symoney` decimal(10,2) DEFAULT NULL COMMENT '收益总额',
  `tzmoney` decimal(10,2) DEFAULT NULL COMMENT '投资总额',
  `djmoney` decimal(10,2) DEFAULT NULL COMMENT '冻结金额',
  `dsmoney` decimal(10,2) DEFAULT NULL COMMENT '待收金额',
  `jlmoney` decimal(10,2) DEFAULT NULL COMMENT '奖励金额',
  PRIMARY KEY (`umid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_usermoney
-- ----------------------------
INSERT INTO `t_usermoney` VALUES ('1', '1', '92440.00', '12800.00', '10000.00', '50000.00', '43000.00', '0.00', '1000.00');

-- ----------------------------
-- Table structure for t_userticket
-- ----------------------------
DROP TABLE IF EXISTS `t_userticket`;
CREATE TABLE `t_userticket` (
  `ukid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '前台用户id',
  `kid` bigint(20) DEFAULT NULL COMMENT '劵id',
  `tktime` datetime DEFAULT NULL COMMENT '领劵时间',
  PRIMARY KEY (`ukid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userticket
-- ----------------------------
INSERT INTO `t_userticket` VALUES ('1', '1', '1', '2017-12-27 09:18:45');
INSERT INTO `t_userticket` VALUES ('3', '1', '2', '2017-12-28 11:38:04');

-- ----------------------------
-- Table structure for t_ydate
-- ----------------------------
DROP TABLE IF EXISTS `t_ydate`;
CREATE TABLE `t_ydate` (
  `yid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `date` datetime DEFAULT NULL COMMENT '生成时间',
  `tmoney` decimal(7,2) DEFAULT NULL COMMENT '交易总额',
  `mmoney` decimal(7,2) DEFAULT NULL COMMENT '月交易总额',
  `tuser` int(11) DEFAULT NULL COMMENT '总用户数',
  `muser` int(11) DEFAULT NULL COMMENT '月用户数',
  `ttzno` int(11) DEFAULT NULL COMMENT '总投资人数',
  `mtzno` int(11) DEFAULT NULL COMMENT '月投资人数',
  `tdkno` int(11) DEFAULT NULL COMMENT '总贷款人数',
  `mdkno` int(11) DEFAULT NULL COMMENT '月贷款人数',
  `tdkbno` int(11) DEFAULT NULL COMMENT '总贷款笔数',
  `mdkbno` int(11) DEFAULT NULL COMMENT '月贷款笔数',
  PRIMARY KEY (`yid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ydate
-- ----------------------------
