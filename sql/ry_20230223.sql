/*
 Navicat Premium Data Transfer

 Source Server         : 47.97.100.149
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : 47.97.100.149:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 02/04/2023 15:05:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dc_comp_basic
-- ----------------------------
DROP TABLE IF EXISTS `dc_comp_basic`;
CREATE TABLE `dc_comp_basic`  (
  `comp_basic_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'comp_basic_id',
  `comp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业名称',
  `comp_credit_code` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业统一社会信用代码',
  `comp_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业类型',
  `comp_fr` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业法人',
  `comp_fr_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业法人手机',
  `comp_area` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '行政区划',
  `comp_addr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '注册地址',
  `comp_lng` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '经度',
  `comp_lat` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '维度',
  `comp_reg_date` date DEFAULT NULL COMMENT '成立日期',
  `comp_business_term` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '营业期限',
  `comp_manage_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '经营状态',
  `comp_approve_date` date DEFAULT NULL COMMENT '核准日期',
  `comp_approve_office` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登记机关',
  `comp_reg_capital` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '注册资本',
  `comp_paid_capital` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '实缴资本',
  `comp_manage_scope` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '经营范围',
  `comp_lxr` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业联系人',
  `comp_lxr_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业联系人手机',
  `comp_lxr_email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业联系人邮箱',
  `comp_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`comp_basic_id`) USING BTREE,
  UNIQUE INDEX `uk_comp_credit_code`(`comp_credit_code`) USING BTREE,
  UNIQUE INDEX `uk_comp_name`(`comp_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_comp_basic
-- ----------------------------
INSERT INTO `dc_comp_basic` VALUES ('552543924565049344', '安徽建工集团有限公司', '91340000148940170G', '有限责任公司(非自然人投资或控股的法人独资)', '赵时运', '15888888888', '3401', '安徽省合肥市包河区芜湖路325号', '117.324911', '31.869924', '1989-04-25', '1989-05-06 至 无固定期限', '注销', '2018-07-30', '安徽省市场监督管理局', '52,000万(元)', '52,000万(元)', '各类工程建设项目总承包；房屋建筑、公路、市政公用、水利水电、矿山、铁路、冶炼、石油化工（不含危险品）、港口与航道、城市园林绿化；各类工程专业承包；建筑装修装饰、公路路基、公路路面、桥梁、隧道、炉窑、建筑幕墙、消防设施、钢结构、机电设备安装、河湖整治、起重设备安装；对外工程承包和劳务合作、国际国内商贸服务；交通建设投资；建筑材料的生产与销售，建筑机械制造、经销与租赁，建筑工程勘察设计，建筑和交通研发、咨询、检测、监理（以上范围涉及许可和资质证的凭许可和资质证经营）。', '戴国华', '15888888888', '158@qq.com', '0', '0', '133555608539361280', '2023-03-08 17:32:17', '554948857633439744', '2023-03-12 18:17:27');
INSERT INTO `dc_comp_basic` VALUES ('552544230317228032', '安徽大学资产经营有限公司', '913401007529530585', NULL, NULL, NULL, '3401', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '方强国', '15999999999', '159@qq.com', '0', '0', '133555608539361280', '2023-03-08 17:33:30', '133555608539361280', '2023-03-12 08:48:41');
INSERT INTO `dc_comp_basic` VALUES ('554428458738909184', '安徽省建设监理有限公司', '91340000148947612F', NULL, NULL, NULL, '3401', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '王庆国', '13666666666', '136@qq.com', '0', '0', '133555608539361280', '2023-03-10 22:20:45', '133555608539361280', '2023-03-12 08:48:45');
INSERT INTO `dc_comp_basic` VALUES ('554445566969380864', '安徽建筑大学资产经营有限公司', '91340111MA2UC77U2R', NULL, NULL, NULL, '3401', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '徐卫国', '15777777777', '157@qq.com', '0', '0', '133555608539361280', '2023-03-10 23:28:44', '133555608539361280', '2023-03-12 08:48:48');

-- ----------------------------
-- Table structure for dc_device_basic
-- ----------------------------
DROP TABLE IF EXISTS `dc_device_basic`;
CREATE TABLE `dc_device_basic`  (
  `device_basic_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'device_basic_id',
  `device_category_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备所属分类',
  `comp_basic_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备所属企业ID',
  `device_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备名称',
  `device_sn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备编号【设备ID】',
  `device_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备类型',
  `device_model` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备规格型号',
  `device_brand` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '品牌',
  `device_factory` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产厂家',
  `device_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备描述',
  `device_last_active_time` datetime(0) DEFAULT NULL COMMENT '设备最后活动时间',
  `device_online_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '2' COMMENT '在线状态（0离线 1在线  2未注册）',
  `device_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '设备状态（0正常 1停用  2故障）',
  `domain_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`device_basic_id`) USING BTREE,
  INDEX `fk_device_domain_id`(`domain_id`) USING BTREE,
  INDEX `fk_device_comp_id`(`comp_basic_id`) USING BTREE,
  INDEX `fk_device_category_id`(`device_category_id`) USING BTREE,
  CONSTRAINT `fk_device_category_id` FOREIGN KEY (`device_category_id`) REFERENCES `dc_device_category` (`device_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_device_comp_id` FOREIGN KEY (`comp_basic_id`) REFERENCES `dc_comp_basic` (`comp_basic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_device_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `sys_domain` (`domain_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_device_basic
-- ----------------------------
INSERT INTO `dc_device_basic` VALUES ('557680355809689600', '562422368073416704', NULL, '设备名称', 'CC', '设备类型', '设备规格型号', '品牌', '生产厂家', '设备描述', NULL, '2', '1', '554941486488092672', '0', '133555608539361280', '2023-03-19 21:42:38', '133555608539361280', '2023-04-02 12:52:08');
INSERT INTO `dc_device_basic` VALUES ('557680425485467648', '562422392698175488', NULL, '设备名称', 'CC', '设备类型', '设备规格型号', '品牌', '生产厂家', '设备描述ff', NULL, '2', '1', '554941486488092672', '0', '133555608539361280', '2023-03-19 21:42:55', '133555608539361280', '2023-03-19 22:00:16');
INSERT INTO `dc_device_basic` VALUES ('557684773531680768', '562422392698175488', NULL, '名称', 'CCC', '类型', '型号', '品牌', '厂家', NULL, NULL, '2', '0', '554941486488092672', '0', '133555608539361280', '2023-03-19 22:00:11', '133555608539361280', '2023-04-02 12:52:11');

-- ----------------------------
-- Table structure for dc_device_category
-- ----------------------------
DROP TABLE IF EXISTS `dc_device_category`;
CREATE TABLE `dc_device_category`  (
  `device_category_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'device_category_id',
  `category_parent_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上级分类ID',
  `category_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `category_sn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类编号',
  `category_level` smallint(5) DEFAULT NULL COMMENT '分类等级',
  `category_sort_num` double(5, 2) NOT NULL COMMENT '排序序号',
  `category_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `domain_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`device_category_id`) USING BTREE,
  INDEX `fk_device_category_domain_id`(`domain_id`) USING BTREE,
  CONSTRAINT `fk_device_category_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `sys_domain` (`domain_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备分类信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_device_category
-- ----------------------------
INSERT INTO `dc_device_category` VALUES ('562291915345625088', '00', '系统默认分类', 'SYSTEM_SN', 0, 1.00, NULL, '553672938461593600', '0', '133555608539361280', '2022-08-08 08:08:08', NULL, NULL);
INSERT INTO `dc_device_category` VALUES ('562416534383755264', '562422240730152960', '测试哦哦', '11', 1, 111.33, '方法', '553672938461593600', '0', '133555608539361280', '2023-04-01 23:22:31', '133555608539361280', '2023-04-02 12:53:55');
INSERT INTO `dc_device_category` VALUES ('562419911247265792', '562416534383755264', '测试tt', 'TT', 1, 1.00, NULL, '553672938461593600', '0', '133555608539361280', '2023-04-01 23:35:56', '133555608539361280', '2023-04-02 11:24:01');
INSERT INTO `dc_device_category` VALUES ('562421614898053120', '562291915345625088', '测试', 'FF', 11100, 11.00, '我是赢家', '553672938461593600', '0', '133555608539361280', '2023-04-01 23:42:42', '133555608539361280', '2023-04-02 12:22:50');
INSERT INTO `dc_device_category` VALUES ('562422240730152960', '562421614898053120', '11111', '1111', 11, 111.77, NULL, '553672938461593600', '0', '133555608539361280', '2023-04-01 23:45:11', '133555608539361280', '2023-04-02 12:52:53');
INSERT INTO `dc_device_category` VALUES ('562422368073416704', '562419911247265792', '22', '22', 11, 22.00, NULL, '553672938461593600', '0', '133555608539361280', '2023-04-01 23:45:42', '133555608539361280', '2023-04-02 11:32:26');
INSERT INTO `dc_device_category` VALUES ('562422392698175488', '562419911247265792', '测试ttt', '22111', 6666, 22.00, NULL, '553672938461593600', '0', '133555608539361280', '2023-04-01 23:45:48', '133555608539361280', '2023-04-02 12:22:41');
INSERT INTO `dc_device_category` VALUES ('562643478702456832', '562291915345625088', '智能家居设备', 'ZN_001', 1, 1.00, NULL, '554941486488092672', '0', '554948857633439744', '2023-04-02 14:24:19', NULL, NULL);
INSERT INTO `dc_device_category` VALUES ('562643562026500096', '562291915345625088', '工业智能网关', 'GY_001', 1, 1.00, NULL, '554941486488092672', '0', '554948857633439744', '2023-04-02 14:24:39', NULL, NULL);
INSERT INTO `dc_device_category` VALUES ('562643765471215616', '562643562026500096', '电表', 'GY_DB', 2, 2.00, NULL, '554941486488092672', '0', '554948857633439744', '2023-04-02 14:25:27', NULL, NULL);
INSERT INTO `dc_device_category` VALUES ('562643852339445760', '562643562026500096', '水表', 'GY_SB', 3, 3.00, NULL, '554941486488092672', '0', '554948857633439744', '2023-04-02 14:25:48', NULL, NULL);
INSERT INTO `dc_device_category` VALUES ('562652088920702976', '562643765471215616', '测试', '11', 11, 1.00, NULL, '554941486488092672', '0', '554948857633439744', '2023-04-02 14:58:32', '554948857633439744', '2023-04-02 14:58:50');

-- ----------------------------
-- Table structure for dc_staff_basic
-- ----------------------------
DROP TABLE IF EXISTS `dc_staff_basic`;
CREATE TABLE `dc_staff_basic`  (
  `staff_basic_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'staff_basic_id',
  `staff_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员姓名',
  `staff_card_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '证件类型【默认身份证】',
  `staff_card_no` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '证件号码',
  `staff_card_fzdate` date DEFAULT NULL COMMENT '证件发证日期',
  `staff_card_fzunit` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证件发证机关',
  `staff_card_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证件是否长期（0长期 1非长期）',
  `staff_card_sdate` date DEFAULT NULL COMMENT '证件有效期开始',
  `staff_card_edate` date DEFAULT NULL COMMENT '证件有效期截至',
  `staff_sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `staff_age` int(11) DEFAULT NULL COMMENT '年龄',
  `staff_nation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '民族',
  `staff_birthdate` date DEFAULT NULL COMMENT '出生日期',
  `staff_birthplace` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '籍贯',
  `staff_addr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '住址',
  `staff_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系手机',
  `staff_email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系邮箱',
  `staff_politics_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '政治面貌',
  `staff_remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注信息',
  `staff_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`staff_basic_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '人员基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_catalog_config
-- ----------------------------
DROP TABLE IF EXISTS `file_catalog_config`;
CREATE TABLE `file_catalog_config`  (
  `file_catalog_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件目录编码',
  `file_catalog_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件目录名称',
  `file_catalog_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件目录配置备注信息',
  `file_catalog_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_catalog_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件目录配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_catalog_config
-- ----------------------------
INSERT INTO `file_catalog_config` VALUES ('CC', '测试目录', NULL, '0', '0', '133555608539361280', '2023-03-26 13:13:10', NULL, NULL);
INSERT INTO `file_catalog_config` VALUES ('COMP_BASIC', '企业基本信息', 'cccc', '1', '0', '133555608539361280', '2023-03-19 20:59:50', '133555608539361280', '2023-03-25 22:21:03');
INSERT INTO `file_catalog_config` VALUES ('CS', '测试目录2', NULL, '0', '0', '133555608539361280', '2023-03-26 16:48:23', NULL, NULL);

-- ----------------------------
-- Table structure for file_catalog_relation
-- ----------------------------
DROP TABLE IF EXISTS `file_catalog_relation`;
CREATE TABLE `file_catalog_relation`  (
  `file_catalog_relation_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'file_catalog_relation_id',
  `file_catalog_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件目录编码',
  `file_config_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件配置代码',
  `file_config_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件类型【逗号拼接】',
  `file_config_must` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否必传【0非必须 1必须】',
  `file_config_min_num` int(11) NOT NULL COMMENT '最小文件数量',
  `file_config_max_num` int(11) NOT NULL COMMENT '最大文件数量',
  `file_config_min_size` bigint(20) NOT NULL COMMENT '最小文件大小',
  `file_config_max_size` bigint(20) NOT NULL COMMENT '最大文件大小',
  `file_config_sort_num` double(5, 2) NOT NULL COMMENT '排序序号',
  `file_catalog_relation_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_catalog_relation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件与目录关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_catalog_relation
-- ----------------------------
INSERT INTO `file_catalog_relation` VALUES ('560125272167284736', 'COMP_BASIC', 'COMP_001', 'pdf,png,rar', '3', 2, 2, 2, 2, 2.00, '0', '0', '133555608539361280', '2023-03-26 15:37:52', NULL, NULL);
INSERT INTO `file_catalog_relation` VALUES ('560131938535342080', 'COMP_BASIC', 'COMP_001', 'pdf,xls,png', '5', 6, 7, 8, 8, 8.00, '0', '0', '133555608539361280', '2023-03-26 16:04:21', NULL, NULL);

-- ----------------------------
-- Table structure for file_config
-- ----------------------------
DROP TABLE IF EXISTS `file_config`;
CREATE TABLE `file_config`  (
  `file_config_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件配置代码',
  `file_config_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件配置名称',
  `file_config_template` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件配置模板',
  `file_config_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件配置备注信息',
  `file_config_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_config_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_config
-- ----------------------------
INSERT INTO `file_config` VALUES ('CC', '企业营业执照', '企业', NULL, '1', '0', '133555608539361280', '2023-03-19 20:22:40', '133555608539361280', '2023-03-25 11:11:18');
INSERT INTO `file_config` VALUES ('COMP_001', '企业营业执照', '企业', NULL, '0', '0', '133555608539361280', '2023-03-19 20:22:40', '133555608539361280', '2023-03-25 11:10:06');

-- ----------------------------
-- Table structure for file_record
-- ----------------------------
DROP TABLE IF EXISTS `file_record`;
CREATE TABLE `file_record`  (
  `file_record_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'file_record_id',
  `business_record_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属业务记录ID',
  `file_catalog_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属文件目录名称',
  `file_catalog_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属文件目录编码',
  `file_record_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_record_detail
-- ----------------------------
DROP TABLE IF EXISTS `file_record_detail`;
CREATE TABLE `file_record_detail`  (
  `file_record_detail_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'file_record_detail_id',
  `file_record_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属文件记录',
  `business_record_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属业务记录ID',
  `file_catalog_relation_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属文件目录关系ID',
  `file_config_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属文件配置名称',
  `file_config_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属文件配置编码',
  `upload_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上传文件名称',
  `upload_original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上传文件原始名称',
  `upload_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上传文件类型',
  `upload_size` bigint(20) NOT NULL COMMENT '上传文件大小',
  `upload_parent_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上传文件服务器路径',
  `upload_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上传文件路径',
  `upload_time` datetime(0) NOT NULL COMMENT '上传时间',
  `upload_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上传备注',
  `file_sort_num` double(5, 2) NOT NULL COMMENT '排序序号【如果是配置，则写入配置的序号】',
  `upload_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_record_detail_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件记录明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `area_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域编码',
  `area_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域名称',
  `parent_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域父级编码',
  `area_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域描述',
  `area_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '区域状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统区域配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('00', '全国', '', '全国', '0', '0');
INSERT INTO `sys_area` VALUES ('11', '北京市', '00', '北京市', '0', '0');
INSERT INTO `sys_area` VALUES ('34', '安徽省', '00', NULL, '0', '0');
INSERT INTO `sys_area` VALUES ('3401', '合肥市', '34', NULL, '0', '0');
INSERT INTO `sys_area` VALUES ('340102', '瑶海区', '3401', NULL, '0', '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE INDEX `uk_config_key`(`config_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('552953471658098688', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-02-28 09:46:14', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('552953517531201536', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-02-28 09:46:14', 'admin', '2023-03-07 13:56:19', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('552954118797262848', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-02-28 09:46:14', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('552954191333556224', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-02-28 09:46:14', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('552967480931254272', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-02-28 09:46:14', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('552967497888825344', '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-02-28 09:46:14', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门id',
  `parent_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `domain_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门所属组织',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  INDEX `fk_dept_domain_id`(`domain_id`) USING BTREE,
  CONSTRAINT `fk_dept_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `sys_domain` (`domain_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('133702242296393723', '133702242296393728', '133702242296393728', '553672938461593600', '工业物联网', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-28 09:46:12', 'admin', '2023-03-10 21:43:52');
INSERT INTO `sys_dept` VALUES ('133702242296393728', '', '', '553672938461593600', '系统默认部门', 1, NULL, NULL, '', '0', '', 'icoolkj', '2022-05-08 20:08:58', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('554743409055629312', '0', '', '553672938461593600', '默认部门', 1, NULL, NULL, NULL, '0', '0', '133555608539361280', '2023-03-11 19:12:14', '', NULL);
INSERT INTO `sys_dept` VALUES ('554805441297645569', '0', '', '553672938461593600', '默认部门', 1, NULL, NULL, NULL, '0', '0', '133555608539361280', '2023-03-11 23:18:43', '', NULL);
INSERT INTO `sys_dept` VALUES ('554948857469861888', '0', '', '554941486488092672', '企业默认部门', 1, NULL, NULL, NULL, '0', '0', '133555608539361280', '2023-03-12 08:48:36', '', NULL);
INSERT INTO `sys_dept` VALUES ('554948868106616832', '0', '', '554941498399916032', '企业默认部门', 1, NULL, NULL, NULL, '0', '0', '133555608539361280', '2023-03-12 08:48:39', '', NULL);
INSERT INTO `sys_dept` VALUES ('554948886863544320', '0', '', '554941515038720000', '企业默认部门', 1, NULL, NULL, NULL, '0', '0', '133555608539361280', '2023-03-12 08:48:43', '', NULL);
INSERT INTO `sys_dept` VALUES ('554948898175582208', '0', '', '554941527416111104', '企业默认部门', 1, NULL, NULL, NULL, '0', '0', '133555608539361280', '2023-03-12 08:48:46', '', NULL);
INSERT INTO `sys_dept` VALUES ('555092004225155072', '0', '', '555092003948331008', '企业默认部门', 1, NULL, NULL, NULL, '0', '0', '554948857633439744', '2023-03-12 18:17:26', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('553140896963493888', 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-02-28 09:46:14', 'admin', '2023-03-07 14:00:24', '性别男');
INSERT INTO `sys_dict_data` VALUES ('553185920346488832', 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('553186115620700160', 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('553186124772671488', 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('553201860429742080', 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('553203139805708288', 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES ('553203992788729856', 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES ('553204009054240768', 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('553204057569755136', 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('553204109134528512', 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('553204136493973504', 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('553207849224765440', 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-28 09:46:14', 'admin', '2023-03-07 13:59:13', '性别女');
INSERT INTO `sys_dict_data` VALUES ('553211696177479680', 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('553214351763308544', 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('553214716353183744', 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('553214729510715392', 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('553214744417271808', 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('553214760657616896', 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('553214772753989632', 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('553214784963608576', 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('553215028908523520', 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('553215040107315200', 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('553215056741924864', 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-28 09:46:14', 'admin', '2023-03-07 14:00:22', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('553215068624388096', 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('553215079969980416', 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('553215091227492352', 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('553215263495946240', 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('553215273033793536', 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('553215369251127296', 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-02-28 09:46:14', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('557660232126300160', 1, '汉族', 'NATION_01', 'sys_nation', NULL, 'default', 'N', '0', 'admin', '2023-03-20 21:40:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('557670346489069568', 2, '壮族', 'NATION_02', 'sys_nation', NULL, 'default', 'N', '0', 'admin', '2023-03-20 21:41:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('557671014528450560', 3, '回族', 'NATION_03', 'sys_nation', NULL, 'default', 'N', '0', 'admin', '2023-03-20 21:41:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('557672836861263872', 4, '满族', 'NATION_04', 'sys_nation', NULL, 'default', 'N', '0', 'admin', '2023-03-20 21:41:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('557677512562311168', 5, '维吾尔族', 'NATION_05', 'sys_nation', NULL, 'default', 'N', '0', 'admin', '2023-03-20 21:42:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('557684310711205888', 6, '苗族', 'NATION_06', 'sys_nation', NULL, 'default', 'N', '0', 'admin', '2023-03-20 21:42:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('560081997322518528', 1, 'doc', 'doc', 'file_type', NULL, 'default', 'N', '0', 'admin', '2023-03-26 12:45:54', 'admin', '2023-03-26 12:47:59', NULL);
INSERT INTO `sys_dict_data` VALUES ('560082048342032384', 2, 'pdf', 'pdf', 'file_type', NULL, 'default', 'N', '0', 'admin', '2023-03-26 12:46:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('560082097969037312', 3, 'txt', 'txt', 'file_type', NULL, 'default', 'N', '0', 'admin', '2023-03-26 12:46:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('560082141757571072', 4, 'png', 'png', 'file_type', NULL, 'default', 'N', '0', 'admin', '2023-03-26 12:46:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('560082192798056448', 5, 'jpg', 'jpg', 'file_type', NULL, 'default', 'N', '0', 'admin', '2023-03-26 12:46:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('560082247181402112', 6, 'xls', 'xls', 'file_type', NULL, 'default', 'N', '0', 'admin', '2023-03-26 12:46:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('560082330887127040', 8, 'rar', 'rar', 'file_type', NULL, 'default', 'N', '0', 'admin', '2023-03-26 12:47:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('560082378987405312', 9, 'gif', 'gif', 'file_type', NULL, 'default', 'N', '0', 'admin', '2023-03-26 12:47:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES ('560082483735953408', 9, 'zip', 'zip', 'file_type', NULL, 'default', 'N', '0', 'admin', '2023-03-26 12:47:49', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE,
  UNIQUE INDEX `uk_dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('552901763322085376', '用户性别', 'sys_user_sex', '0', 'admin', '2023-02-28 09:46:13', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('552901784767561728', '系统状态', 'sys_common_status', '0', 'admin', '2023-02-28 09:46:13', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('552948459372544000', '菜单状态', 'sys_show_hide', '0', 'admin', '2023-02-28 09:46:13', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('552956916096040960', '系统开关', 'sys_normal_disable', '0', 'admin', '2023-02-28 09:46:13', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('552956941626769408', '任务状态', 'sys_job_status', '0', 'admin', '2023-02-28 09:46:13', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('552957001185886208', '任务分组', 'sys_job_group', '0', 'admin', '2023-02-28 09:46:13', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('552957042659164160', '系统是否', 'sys_yes_no', '0', 'admin', '2023-02-28 09:46:13', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('552960164257333248', '通知类型', 'sys_notice_type', '0', 'admin', '2023-02-28 09:46:13', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('552963908386684928', '通知状态', 'sys_notice_status', '0', 'admin', '2023-02-28 09:46:13', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('553140831784009728', '操作类型', 'sys_oper_type', '0', 'admin', '2023-02-28 09:46:13', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('557608236312690688', '民族', 'sys_nation', '0', 'admin', '2023-03-20 21:35:35', '', NULL, '民族字典列表');
INSERT INTO `sys_dict_type` VALUES ('560081676273713152', '文件类型', 'file_type', '0', 'admin', '2023-03-26 12:44:37', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_domain
-- ----------------------------
DROP TABLE IF EXISTS `sys_domain`;
CREATE TABLE `sys_domain`  (
  `domain_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编号',
  `domain_parent_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父级组织编号',
  `droles_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织角色编号',
  `domain_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织账户名称',
  `domain_account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织账号',
  `domain_indate` datetime(0) NOT NULL COMMENT '组织账户有效期',
  `domain_region` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织可管区域',
  `domain_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织管理员手机',
  `domain_email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织管理员邮箱',
  `domain_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织账户描述',
  `domain_relation_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织账号与业务关系ID',
  `domain_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '组织账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`domain_id`) USING BTREE,
  INDEX `fk_droles_id`(`droles_id`) USING BTREE,
  INDEX `domain_id`(`domain_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统组织账户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_domain
-- ----------------------------
INSERT INTO `sys_domain` VALUES ('553672938461593600', NULL, '553592170506878976', '系统组织域', 'DOMAIN_SYSTEM', '2023-03-09 00:00:00', '00', '', NULL, NULL, NULL, '0', '0', '133555608539361280', '2023-03-08 21:48:03', '133555608539361280', '2023-03-11 19:12:15');
INSERT INTO `sys_domain` VALUES ('553692142187315200', NULL, '553519200858013696', '企业组织域', 'DOMAIN_COMP', '2029-12-31 00:00:00', '00', NULL, NULL, NULL, NULL, '0', '0', '133555608539361280', '2023-03-11 18:48:35', '133555608539361280', '2023-03-11 19:12:19');
INSERT INTO `sys_domain` VALUES ('554941486488092672', '553692142187315200', '553519200858013696', '安徽建工集团有限公司', 'COMP#91340000148940170G', '2043-03-12 08:19:21', '3401', '15888888888', '158@qq.com', NULL, '552543924565049344', '0', '0', '133555608539361280', '2023-03-12 08:19:21', NULL, NULL);
INSERT INTO `sys_domain` VALUES ('554941498399916032', '553692142187315200', '553519200858013696', '安徽大学资产经营有限公司', 'COMP#913401007529530585', '2043-03-12 08:19:24', '3401', '15999999999', '159@qq.com', NULL, '552544230317228032', '0', '0', '133555608539361280', '2023-03-12 08:19:24', NULL, NULL);
INSERT INTO `sys_domain` VALUES ('554941515038720000', '553692142187315200', '553519200858013696', '安徽省建设监理有限公司', 'COMP#91340000148947612F', '2043-03-12 08:19:28', '3401', '13666666666', '136@qq.com', NULL, '554428458738909184', '0', '0', '133555608539361280', '2023-03-12 08:19:28', NULL, NULL);
INSERT INTO `sys_domain` VALUES ('554941527416111104', '553692142187315200', '553519200858013696', '安徽建筑大学资产经营有限公司', 'COMP#91340111MA2UC77U2R', '2043-03-12 08:19:30', '3401', '15777777777', '157@qq.com', NULL, '554445566969380864', '0', '0', '133555608539361280', '2023-03-12 08:19:30', NULL, NULL);
INSERT INTO `sys_domain` VALUES ('555092003948331008', '553692142187315200', '553519200858013696', '安徽建工集团有限公司', 'COMP#91340000148940170G', '2043-03-12 18:17:27', '3401', '15888888888', '158@qq.com', NULL, '552543924565049344', '0', '0', '554948857633439744', '2023-03-12 18:17:27', NULL, NULL);

-- ----------------------------
-- Table structure for sys_domain_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_domain_roles`;
CREATE TABLE `sys_domain_roles`  (
  `droles_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `droles_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织角色名称',
  `droles_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织角色类型',
  `droles_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '组织角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`droles_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统组织权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_domain_roles
-- ----------------------------
INSERT INTO `sys_domain_roles` VALUES ('553519200858013696', '企业组织角色', 'DOMAIN_TYPE_COMP', '0', '0', '133555608539361280', '2023-03-19 16:29:16', '133555608539361280', '2023-03-19 20:36:39');
INSERT INTO `sys_domain_roles` VALUES ('553592170506878976', '系统组织角色', 'DOMAIN_TYPE_SYSTEM', '0', '0', '133555608539361280', '2023-03-19 16:29:19', '133555608539361280', '2023-03-08 21:05:02');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('558044012603244544', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-20 21:48:18');
INSERT INTO `sys_logininfor` VALUES ('558044132514201600', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-20 21:48:08');
INSERT INTO `sys_logininfor` VALUES ('558045706238033920', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-20 21:54:42');
INSERT INTO `sys_logininfor` VALUES ('558045737594650624', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-20 21:54:31');
INSERT INTO `sys_logininfor` VALUES ('558393367038263296', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-21 20:55:50');
INSERT INTO `sys_logininfor` VALUES ('559677028261953536', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 09:56:37');
INSERT INTO `sys_logininfor` VALUES ('559692375765549056', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 10:57:36');
INSERT INTO `sys_logininfor` VALUES ('559700063786369024', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-25 11:28:09');
INSERT INTO `sys_logininfor` VALUES ('559700090688634880', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 11:28:15');
INSERT INTO `sys_logininfor` VALUES ('559705378699345920', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-25 11:49:54');
INSERT INTO `sys_logininfor` VALUES ('559715086445314048', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 12:27:55');
INSERT INTO `sys_logininfor` VALUES ('559719731792183296', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-25 12:46:42');
INSERT INTO `sys_logininfor` VALUES ('559719821785169920', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-03-25 12:46:44');
INSERT INTO `sys_logininfor` VALUES ('559719844065312768', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 12:46:49');
INSERT INTO `sys_logininfor` VALUES ('559807975112310784', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 18:37:01');
INSERT INTO `sys_logininfor` VALUES ('559854012904505344', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 21:39:57');
INSERT INTO `sys_logininfor` VALUES ('559869362597527552', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-25 22:40:57');
INSERT INTO `sys_logininfor` VALUES ('559869409464680448', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 22:41:08');
INSERT INTO `sys_logininfor` VALUES ('559872123628158976', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-25 22:52:14');
INSERT INTO `sys_logininfor` VALUES ('559872171829100544', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 22:52:06');
INSERT INTO `sys_logininfor` VALUES ('559878977074757632', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-25 23:19:09');
INSERT INTO `sys_logininfor` VALUES ('559879527275167744', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 23:21:20');
INSERT INTO `sys_logininfor` VALUES ('559881667418783744', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-25 23:30:29');
INSERT INTO `sys_logininfor` VALUES ('559881840727425024', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 23:30:31');
INSERT INTO `sys_logininfor` VALUES ('559885583606874112', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-25 23:45:43');
INSERT INTO `sys_logininfor` VALUES ('559885716323041280', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 23:45:56');
INSERT INTO `sys_logininfor` VALUES ('559887070454087680', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-25 23:51:57');
INSERT INTO `sys_logininfor` VALUES ('559888441731448832', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-25 23:56:45');
INSERT INTO `sys_logininfor` VALUES ('560046013100851200', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 10:22:53');
INSERT INTO `sys_logininfor` VALUES ('560048357821644800', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-26 10:32:50');
INSERT INTO `sys_logininfor` VALUES ('560048584083374080', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 10:33:06');
INSERT INTO `sys_logininfor` VALUES ('560055962556170240', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-26 11:03:03');
INSERT INTO `sys_logininfor` VALUES ('560056068953079808', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 11:03:09');
INSERT INTO `sys_logininfor` VALUES ('560056076234391552', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 11:03:11');
INSERT INTO `sys_logininfor` VALUES ('560062002744000512', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-26 11:26:44');
INSERT INTO `sys_logininfor` VALUES ('560070697494249472', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-26 12:01:36');
INSERT INTO `sys_logininfor` VALUES ('560070787126525952', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 12:01:38');
INSERT INTO `sys_logininfor` VALUES ('560070816885112832', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 12:01:26');
INSERT INTO `sys_logininfor` VALUES ('560087093032779776', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-26 13:06:28');
INSERT INTO `sys_logininfor` VALUES ('560087175941586944', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 13:06:28');
INSERT INTO `sys_logininfor` VALUES ('560087197936517120', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 13:06:33');
INSERT INTO `sys_logininfor` VALUES ('560090687756828672', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-26 13:21:04');
INSERT INTO `sys_logininfor` VALUES ('560090834205147136', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 13:21:00');
INSERT INTO `sys_logininfor` VALUES ('560120393449340928', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 15:18:27');
INSERT INTO `sys_logininfor` VALUES ('560134625284849664', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-26 16:15:20');
INSERT INTO `sys_logininfor` VALUES ('560135373485768704', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 16:17:59');
INSERT INTO `sys_logininfor` VALUES ('560142718475436032', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-26 16:47:29');
INSERT INTO `sys_logininfor` VALUES ('560142833810407424', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 16:47:38');
INSERT INTO `sys_logininfor` VALUES ('560152119781359616', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-26 17:24:32');
INSERT INTO `sys_logininfor` VALUES ('560152143651143680', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 17:24:37');
INSERT INTO `sys_logininfor` VALUES ('560168304652582912', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-26 18:28:50');
INSERT INTO `sys_logininfor` VALUES ('561287112507260928', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-29 20:34:34');
INSERT INTO `sys_logininfor` VALUES ('561647413530460160', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-30 20:26:16');
INSERT INTO `sys_logininfor` VALUES ('561649223104200704', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-30 20:34:06');
INSERT INTO `sys_logininfor` VALUES ('561649435545698304', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-30 20:34:18');
INSERT INTO `sys_logininfor` VALUES ('561654859380555776', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-30 20:56:11');
INSERT INTO `sys_logininfor` VALUES ('561654988640616448', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-30 20:56:22');
INSERT INTO `sys_logininfor` VALUES ('562004577193295872', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-31 20:05:30');
INSERT INTO `sys_logininfor` VALUES ('562266819629416448', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 13:27:35');
INSERT INTO `sys_logininfor` VALUES ('562276383611420672', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-01 14:05:35');
INSERT INTO `sys_logininfor` VALUES ('562276414401806336', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 14:05:42');
INSERT INTO `sys_logininfor` VALUES ('562288133811470336', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-01 14:52:36');
INSERT INTO `sys_logininfor` VALUES ('562288164320837632', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 14:52:24');
INSERT INTO `sys_logininfor` VALUES ('562290456667357184', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 15:01:30');
INSERT INTO `sys_logininfor` VALUES ('562291797447933952', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-01 15:07:28');
INSERT INTO `sys_logininfor` VALUES ('562291903555436544', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 15:07:34');
INSERT INTO `sys_logininfor` VALUES ('562291915345625088', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 15:07:18');
INSERT INTO `sys_logininfor` VALUES ('562300944897802240', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-01 15:43:49');
INSERT INTO `sys_logininfor` VALUES ('562301065274327040', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 15:43:59');
INSERT INTO `sys_logininfor` VALUES ('562324836332863488', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 17:18:07');
INSERT INTO `sys_logininfor` VALUES ('562346995780419584', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 18:46:10');
INSERT INTO `sys_logininfor` VALUES ('562352592588374016', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-01 19:09:03');
INSERT INTO `sys_logininfor` VALUES ('562352880225353728', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 19:09:33');
INSERT INTO `sys_logininfor` VALUES ('562356708001710080', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-01 19:25:05');
INSERT INTO `sys_logininfor` VALUES ('562395190111764480', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 21:57:41');
INSERT INTO `sys_logininfor` VALUES ('562397336668471296', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-01 22:06:13');
INSERT INTO `sys_logininfor` VALUES ('562397394021384192', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 22:06:45');
INSERT INTO `sys_logininfor` VALUES ('562404630865117184', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-01 22:35:12');
INSERT INTO `sys_logininfor` VALUES ('562404651526258688', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 22:35:17');
INSERT INTO `sys_logininfor` VALUES ('562404818140790784', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-01 22:35:56');
INSERT INTO `sys_logininfor` VALUES ('562404881629970432', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-01 22:36:11');
INSERT INTO `sys_logininfor` VALUES ('562430057629351936', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-02 00:16:52');
INSERT INTO `sys_logininfor` VALUES ('562432162771501056', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-02 00:24:36');
INSERT INTO `sys_logininfor` VALUES ('562579885378240512', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-02 10:11:36');
INSERT INTO `sys_logininfor` VALUES ('562603076301619200', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-02 11:44:05');
INSERT INTO `sys_logininfor` VALUES ('562603392283705344', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-02 11:45:01');
INSERT INTO `sys_logininfor` VALUES ('562606181915295744', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-02 11:56:44');
INSERT INTO `sys_logininfor` VALUES ('562610767656910848', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-02 12:14:19');
INSERT INTO `sys_logininfor` VALUES ('562619788669485056', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-02 12:50:10');
INSERT INTO `sys_logininfor` VALUES ('562620239968206848', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-02 12:51:58');
INSERT INTO `sys_logininfor` VALUES ('562624493499973632', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-02 13:09:11');
INSERT INTO `sys_logininfor` VALUES ('562624606964285440', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-02 13:09:19');
INSERT INTO `sys_logininfor` VALUES ('562624643647668224', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-02 13:09:27');
INSERT INTO `sys_logininfor` VALUES ('562640577389133824', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-02 14:12:46');
INSERT INTO `sys_logininfor` VALUES ('562640694515073024', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-04-02 14:13:14');
INSERT INTO `sys_logininfor` VALUES ('562640730728693760', 'COMP#91340000148940170G', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-04-02 14:13:23');
INSERT INTO `sys_logininfor` VALUES ('562640730820968448', 'COMP#91340000148940170G', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-02 14:13:23');
INSERT INTO `sys_logininfor` VALUES ('562640761678462976', 'COMP#91340000148940170G', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-04-02 14:13:30');
INSERT INTO `sys_logininfor` VALUES ('562640777520349184', 'COMP#91340000148940170G', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2023-04-02 14:13:34');
INSERT INTO `sys_logininfor` VALUES ('562640777608429568', 'COMP#91340000148940170G', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-02 14:13:34');
INSERT INTO `sys_logininfor` VALUES ('562641154055602176', 'COMP#913401007529530585', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-04-02 14:15:04');
INSERT INTO `sys_logininfor` VALUES ('562641154143682560', 'COMP#913401007529530585', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-02 14:15:04');
INSERT INTO `sys_logininfor` VALUES ('562641185898758144', 'COMP#913401007529530585', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2023-04-02 14:15:11');
INSERT INTO `sys_logininfor` VALUES ('562641185986838528', 'COMP#913401007529530585', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-02 14:15:11');
INSERT INTO `sys_logininfor` VALUES ('562641526656598016', 'COMP#91340000148940170G', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-04-02 14:16:33');
INSERT INTO `sys_logininfor` VALUES ('562641543005995008', 'COMP#91340000148940170G', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2023-04-02 14:16:37');
INSERT INTO `sys_logininfor` VALUES ('562641543089881088', 'COMP#91340000148940170G', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-02 14:16:37');
INSERT INTO `sys_logininfor` VALUES ('562641575218249728', 'COMP#91340000148940170G', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-02 14:16:44');
INSERT INTO `sys_logininfor` VALUES ('562641995172937728', 'COMP#91340000148940170G', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-02 14:18:24');
INSERT INTO `sys_logininfor` VALUES ('562651999015796736', 'COMP#91340000148940170G', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-04-02 14:58:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('133697708996161536', '系统管理', '133698244612976640', 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-02-28 09:46:12', 'admin', '2023-03-07 13:15:44', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('133697709000355842', '用户管理', '133697708996161536', 4, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-02-28 09:46:12', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('133697709000355843', '用户查询', '133697709000355842', 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355844', '用户新增', '133697709000355842', 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355845', '用户修改', '133697709000355842', 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355846', '用户删除', '133697709000355842', 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355847', '用户导出', '133697709000355842', 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355848', '用户导入', '133697709000355842', 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355849', '重置密码', '133697709000355842', 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355850', '角色查询', '133697709000355856', 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355851', '角色新增', '133697709000355856', 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355852', '角色修改', '133697709000355856', 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355856', '角色管理', '133697708996161536', 5, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-02-28 09:46:12', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('133697709000355858', '角色删除', '133697709000355856', 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355859', '角色导出', '133697709000355856', 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355860', '菜单查询', '133697709004550167', 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355861', '菜单新增', '133697709004550167', 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355862', '菜单修改', '133697709004550167', 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709000355863', '菜单删除', '133697709004550167', 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709004550144', '部门查询', '258324951071715328', 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709004550145', '部门新增', '258324951071715328', 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709004550158', '部门修改', '258324951071715328', 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709004550166', '部门删除', '258324951071715328', 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('133697709004550167', '菜单管理', '133697708996161536', 6, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-02-28 09:46:12', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('251121203056472064', '岗位查询', '259435333274300344', 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('251123640987283456', '岗位新增', '259435333274300344', 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('255425633205612544', '岗位修改', '259435333274300344', 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('255431785343610880', '岗位删除', '259435333274300344', 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('255431925127180288', '岗位导出', '259435333274300344', 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('255437098855690240', '字典查询', '259435333274300367', 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('255746980800622592', '字典新增', '259435333274300367', 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('256539810137632768', '字典修改', '259435333274300367', 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('257811852082278400', '字典删除', '259435333274300367', 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('258324852492988416', '字典导出', '259435333274300367', 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('258324951071715328', '部门管理', '133697708996161536', 3, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-02-28 09:46:12', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('258325657354760192', '参数查询', '259435333274300387', 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('258326278677983232', '参数新增', '259435333274300387', 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('258326927431954432', '参数修改', '259435333274300387', 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('258327104255422464', '参数删除', '259435333274300387', 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('258327239211347968', '参数导出', '259435333274300387', 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('258327272799334400', '公告查询', '259435333274300389', 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('258328633624489984', '公告新增', '259435333274300389', 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('258328766235799552', '公告修改', '259435333274300389', 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300341', '公告删除', '259435333274300389', 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300342', '操作查询', '446013329207459856', 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300344', '岗位管理', '133697708996161536', 7, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-02-28 09:46:12', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300345', '操作删除', '446013329207459856', 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300348', '日志导出', '446013329207459856', 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300349', '登录查询', '446013329207459857', 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300356', '登录删除', '446013329207459857', 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300361', '日志导出', '446013329207459857', 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300362', '账户解锁', '446013329207459857', 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300363', '在线查询', '259435333274300416', 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300364', '批量强退', '259435333274300416', 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300365', '单条强退', '259435333274300416', 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300366', '任务查询', '259435333274300417', 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300367', '字典管理', '133697708996161536', 8, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-02-28 09:46:12', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300368', '任务新增', '259435333274300417', 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300369', '任务修改', '259435333274300417', 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300371', '任务删除', '259435333274300417', 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300372', '状态修改', '259435333274300417', 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300373', '任务导出', '259435333274300417', 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300381', '生成查询', '259435333274300424', 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300382', '生成修改', '259435333274300424', 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300383', '生成删除', '259435333274300424', 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300384', '导入代码', '259435333274300424', 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300386', '预览代码', '259435333274300424', 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300387', '参数设置', '133697708996161536', 9, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-02-28 09:46:12', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300388', '生成代码', '259435333274300424', 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-02-28 09:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('259435333274300389', '通知公告', '133697708996161536', 11, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-02-28 09:46:12', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300399', '日志管理', '133697708996161536', 13, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-02-28 09:46:12', 'admin', '2023-03-19 14:47:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300416', '在线用户', '259435333274300431', 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-02-28 09:46:12', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300417', '定时任务', '259435333274300431', 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-02-28 09:46:12', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300418', '数据监控', '259435333274300431', 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-02-28 09:46:12', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300419', '服务监控', '259435333274300431', 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-02-28 09:46:12', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300421', '缓存监控', '259435333274300431', 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-02-28 09:46:12', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300422', '缓存列表', '259435333274300431', 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-02-28 09:46:12', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300423', '表单构建', '446013329207459851', 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-02-28 09:46:12', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300424', '代码生成', '446013329207459851', 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-02-28 09:46:12', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300425', '系统接口', '446013329207459851', 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-02-28 09:46:12', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300431', '系统监控', '133698244612976640', 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-02-28 09:46:12', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('259435333274300436', '区域配置', '133697708996161536', 10, 'area', 'system/area/index', NULL, 1, 0, 'C', '0', '0', 'system:area:list', 'rate', 'admin', '2023-03-05 09:26:04', 'admin', '2023-03-05 09:36:12', '系统区域配置菜单');
INSERT INTO `sys_menu` VALUES ('259435333274300438', '区域配置查询', '259435333274300436', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:area:query', '#', 'admin', '2023-03-05 09:26:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('446013329207459840', '区域配置新增', '259435333274300436', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:area:add', '#', 'admin', '2023-03-05 09:26:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('446013329207459841', '区域配置修改', '259435333274300436', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:area:edit', '#', 'admin', '2023-03-05 09:26:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('446013329207459842', '区域配置删除', '259435333274300436', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:area:remove', '#', 'admin', '2023-03-05 09:26:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('446013329207459843', '区域配置导出', '259435333274300436', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:area:export', '#', 'admin', '2023-03-05 09:26:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('446013329207459844', '企业基本信息', '446013329207459850', 1, 'basic', 'company/basic/index', NULL, 1, 0, 'C', '0', '0', 'company:basic:list', 'education', 'admin', '2023-03-05 14:26:46', 'admin', '2023-03-05 14:38:08', '企业基本信息菜单');
INSERT INTO `sys_menu` VALUES ('446013329207459845', '企业基本信息查询', '446013329207459844', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'company:basic:query', '#', 'admin', '2023-03-05 14:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('446013329207459846', '企业基本信息新增', '446013329207459844', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'company:basic:add', '#', 'admin', '2023-03-05 14:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('446013329207459847', '企业基本信息修改', '446013329207459844', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'company:basic:edit', '#', 'admin', '2023-03-05 14:26:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('446013329207459848', '企业基本信息删除', '446013329207459844', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'company:basic:remove', '#', 'admin', '2023-03-05 14:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('446013329207459849', '企业基本信息导出', '446013329207459844', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'company:basic:export', '#', 'admin', '2023-03-05 14:26:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('446013329207459850', '企业管理', '133698244612976640', 4, 'company', NULL, NULL, 1, 0, 'M', '0', '0', '', 'star', 'admin', '2023-03-05 14:30:08', 'admin', '2023-03-05 14:36:57', '');
INSERT INTO `sys_menu` VALUES ('446013329207459851', '系统工具', '133698244612976640', 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-02-28 09:46:12', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('446013329207459856', '操作日志', '259435333274300399', 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-02-28 09:46:12', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('446013329207459857', '登录日志', '259435333274300399', 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-02-28 09:46:12', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('553235111357710336', '组织账户', '133697708996161536', 2, 'domain', 'system/domain/index', NULL, 1, 0, 'C', '0', '0', 'system:domain:list', 'nested', 'admin', '2023-03-08 20:26:22', 'admin', '2023-03-08 20:35:43', '系统组织账户菜单');
INSERT INTO `sys_menu` VALUES ('553237935667806208', '系统组织账户查询', '553235111357710336', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:domain:query', '#', 'admin', '2023-03-08 20:26:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('553324873271738368', '系统组织账户新增', '553235111357710336', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:domain:add', '#', 'admin', '2023-03-08 20:28:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('553519303991754752', '系统组织账户修改', '553235111357710336', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:domain:edit', '#', 'admin', '2023-03-08 20:28:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('553521412661313536', '系统组织账户删除', '553235111357710336', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:domain:remove', '#', 'admin', '2023-03-08 20:28:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('553569027570532352', '系统组织账户导出', '553235111357710336', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:domain:export', '#', 'admin', '2023-03-08 20:28:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('553569065323462656', '组织角色', '133697708996161536', 1, 'droles', 'system/droles/index', NULL, 1, 0, 'C', '0', '0', 'system:droles:list', 'guide', 'admin', '2023-03-08 20:30:33', 'admin', '2023-03-08 20:36:18', '系统组织权限菜单');
INSERT INTO `sys_menu` VALUES ('553592219697676288', '系统组织角色查询', '553569065323462656', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:droles:query', '#', 'admin', '2023-03-08 20:30:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('553671576646582272', '系统组织角色新增', '553569065323462656', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:droles:add', '#', 'admin', '2023-03-08 20:30:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('553671586813575168', '系统组织角色修改', '553569065323462656', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:droles:edit', '#', 'admin', '2023-03-08 20:30:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('553671624952381440', '系统组织角色删除', '553569065323462656', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:droles:remove', '#', 'admin', '2023-03-08 20:30:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('554758523754381312', '企业信息完善', '446013329207459850', 1, 'perfectInfo', 'company/perfectInfo', NULL, 1, 0, 'C', '0', '0', '/company/basic/getCompUserInfo', 'form', 'admin', '2023-03-11 20:12:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('554943120207249408', '企业信息完善', '554758523754381312', 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'company:basic:perfectInfo', '#', 'admin', '2023-03-12 08:25:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('554947205169938432', '区域信息', '554758523754381312', 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:area:list', '#', 'admin', '2023-03-12 08:42:02', 'admin', '2023-03-12 08:42:20', '');
INSERT INTO `sys_menu` VALUES ('556929805367377920', '设备基础查询', '556929833750233088', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'device:basic:query', '#', 'admin', '2023-03-17 20:02:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('556929833750233088', '设备基础信息', '556932471489298432', 2, 'basic', 'device/basic/index', NULL, 1, 0, 'C', '0', '0', 'device:basic:list', 'dict', 'admin', '2023-03-17 20:02:26', 'admin', '2023-04-02 11:48:12', '设备基础菜单');
INSERT INTO `sys_menu` VALUES ('556929848983945216', '设备基础新增', '556929833750233088', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'device:basic:add', '#', 'admin', '2023-03-17 20:02:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('556929895641382912', '设备基础修改', '556929833750233088', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'device:basic:edit', '#', 'admin', '2023-03-17 20:02:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('556929947403288576', '设备基础删除', '556929833750233088', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'device:basic:remove', '#', 'admin', '2023-03-17 20:02:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('556930012918317056', '设备基础导出', '556929833750233088', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'device:basic:export', '#', 'admin', '2023-03-17 20:02:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('556930463650807808', '人员基本信息', '556932188893872128', 1, 'basic', 'staff/basic/index', NULL, 1, 0, 'C', '0', '0', 'staff:basic:list', 'peoples', 'admin', '2023-03-17 20:07:08', 'admin', '2023-04-02 11:48:21', '人员基本信息菜单');
INSERT INTO `sys_menu` VALUES ('556930533515329536', '人员基本信息查询', '556930463650807808', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'staff:basic:query', '#', 'admin', '2023-03-17 20:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('556930937296781312', '人员基本信息新增', '556930463650807808', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'staff:basic:add', '#', 'admin', '2023-03-17 20:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('556930964245184512', '人员基本信息修改', '556930463650807808', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'staff:basic:edit', '#', 'admin', '2023-03-17 20:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('556930985581608960', '人员基本信息删除', '556930463650807808', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'staff:basic:remove', '#', 'admin', '2023-03-17 20:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('556930997954805760', '人员基本信息导出', '556930463650807808', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'staff:basic:export', '#', 'admin', '2023-03-17 20:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('556932188893872128', '人员信息管理', '133698244612976640', 5, 'staff', NULL, NULL, 1, 0, 'M', '0', '0', '', 'peoples', 'admin', '2023-03-17 20:09:37', 'admin', '2023-03-17 20:09:53', '');
INSERT INTO `sys_menu` VALUES ('556932471489298432', '设备信息管理', '133698244612976640', 6, 'device', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'dict', 'admin', '2023-03-17 20:10:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564113560010752', '目录配置', '557575721661235200', 2, 'catalog', 'file/catalog/index', NULL, 1, 0, 'C', '0', '0', 'file:catalog:list', 'education', 'admin', '2023-03-19 15:02:56', 'admin', '2023-03-21 20:58:38', '文件目录配置菜单');
INSERT INTO `sys_menu` VALUES ('557564136670625792', '文件目录配置查询', '557564113560010752', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:catalog:query', '#', 'admin', '2023-03-19 15:02:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564171655315456', '文件配置导出', '557564753375920128', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:config:export', '#', 'admin', '2023-03-19 15:15:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564239154249728', '文件配置删除', '557564753375920128', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:config:remove', '#', 'admin', '2023-03-19 15:15:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564287623626752', '文件目录配置新增', '557564113560010752', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:catalog:add', '#', 'admin', '2023-03-19 15:02:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564303801057280', '文件目录配置修改', '557564113560010752', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:catalog:edit', '#', 'admin', '2023-03-19 15:02:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564315389919232', '文件目录配置删除', '557564113560010752', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:catalog:remove', '#', 'admin', '2023-03-19 15:02:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564335405137920', '文件目录配置导出', '557564113560010752', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:catalog:export', '#', 'admin', '2023-03-19 15:02:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564363498586112', '文件记录', '557575721661235200', 4, 'record', 'file/record/index', NULL, 1, 0, 'C', '0', '0', 'file:record:list', 'dict', 'admin', '2023-03-19 15:07:31', 'admin', '2023-03-19 15:21:40', '文件记录菜单');
INSERT INTO `sys_menu` VALUES ('557564375922114560', '文件记录查询', '557564363498586112', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:record:query', '#', 'admin', '2023-03-19 15:07:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564388584718336', '文件记录新增', '557564363498586112', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:record:add', '#', 'admin', '2023-03-19 15:07:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564479135547392', '文件记录修改', '557564363498586112', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:record:edit', '#', 'admin', '2023-03-19 15:07:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564494574780416', '文件记录删除', '557564363498586112', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:record:remove', '#', 'admin', '2023-03-19 15:07:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564505400279040', '文件记录导出', '557564363498586112', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:record:export', '#', 'admin', '2023-03-19 15:07:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564544172425216', '文件目录', '557575721661235200', 3, 'relation', 'file/relation/index', NULL, 1, 0, 'C', '0', '0', 'file:relation:list', 'row', 'admin', '2023-03-19 15:10:01', 'admin', '2023-03-21 20:59:03', '文件与目录关系菜单');
INSERT INTO `sys_menu` VALUES ('557564674216820736', '文件与目录关系查询', '557564544172425216', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:relation:query', '#', 'admin', '2023-03-19 15:10:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564692717895680', '文件与目录关系新增', '557564544172425216', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:relation:add', '#', 'admin', '2023-03-19 15:10:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564706768814080', '文件与目录关系修改', '557564544172425216', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:relation:edit', '#', 'admin', '2023-03-19 15:10:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564717254574080', '文件与目录关系删除', '557564544172425216', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:relation:remove', '#', 'admin', '2023-03-19 15:10:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564728377868288', '文件与目录关系导出', '557564544172425216', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:relation:export', '#', 'admin', '2023-03-19 15:10:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557564753375920128', '文件配置', '557575721661235200', 1, 'config', 'file/config/index', NULL, 1, 0, 'C', '0', '0', 'file:config:list', 'form', 'admin', '2023-03-19 15:15:08', 'admin', '2023-03-19 15:20:59', '文件配置菜单');
INSERT INTO `sys_menu` VALUES ('557564763945566208', '文件配置查询', '557564753375920128', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:config:query', '#', 'admin', '2023-03-19 15:15:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557574399050383360', '文件配置新增', '557564753375920128', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:config:add', '#', 'admin', '2023-03-19 15:15:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557574411041898496', '文件配置修改', '557564753375920128', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:config:edit', '#', 'admin', '2023-03-19 15:15:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557575721661235200', '文件管理', '133697708996161536', 12, 'file', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2023-03-19 14:46:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557583428774526976', '记录明细', '557575721661235200', 5, 'detail', 'file/detail/index', NULL, 1, 0, 'C', '0', '0', 'file:detail:list', 'log', 'admin', '2023-03-19 15:18:57', 'admin', '2023-03-21 20:59:17', '文件记录明细菜单');
INSERT INTO `sys_menu` VALUES ('557583442087247872', '文件记录明细查询', '557583428774526976', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:detail:query', '#', 'admin', '2023-03-19 15:18:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557583465738928128', '文件记录明细新增', '557583428774526976', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:detail:add', '#', 'admin', '2023-03-19 15:18:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557583501851885568', '文件记录明细修改', '557583428774526976', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:detail:edit', '#', 'admin', '2023-03-19 15:18:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557583522978594816', '文件记录明细删除', '557583428774526976', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:detail:remove', '#', 'admin', '2023-03-19 15:18:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('557583532667437056', '文件记录明细导出', '557583428774526976', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'file:detail:export', '#', 'admin', '2023-03-19 15:18:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('558393465218531328', '设备分类信息新增', '559864041741221888', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'device:category:add', '#', 'admin', '2023-04-01 13:46:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('558394072104960000', '设备分类信息查询', '559864041741221888', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'device:category:query', '#', 'admin', '2023-04-01 13:46:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('559864041741221888', '设备分类信息', '556932471489298432', 1, 'category', 'device/category/index', NULL, 1, 0, 'C', '0', '0', 'device:category:list', 'date-range', 'admin', '2023-04-01 13:45:52', 'admin', '2023-04-02 11:48:02', '设备分类信息菜单');
INSERT INTO `sys_menu` VALUES ('560081676743475200', '设备分类信息修改', '559864041741221888', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'device:category:edit', '#', 'admin', '2023-04-01 13:46:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('560081998085881856', '设备分类信息删除', '559864041741221888', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'device:category:remove', '#', 'admin', '2023-04-01 13:46:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('560082247911211008', '设备分类信息导出', '559864041741221888', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'device:category:export', '#', 'admin', '2023-04-01 13:46:49', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('553237921977597952', 'ce', '2', 0x3C703E6365663C2F703E, '0', 'admin', '2023-03-07 15:29:59', 'admin', '2023-03-19 14:01:08', NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('562304317504094208', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测1\",\"categoryParentId\":\"2\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 15:56:36\",\"deviceCategoryId\":\"562304317168549888\",\"domainId\":\"11111111111111111\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 15:56:35', 69);
INSERT INTO `sys_oper_log` VALUES ('562304597914288128', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测2\",\"categoryParentId\":\"2\",\"categorySn\":\"CC\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 15:57:43\",\"deviceCategoryId\":\"562304597549383680\",\"domainId\":\"11111111111111111\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 15:57:42', 75);
INSERT INTO `sys_oper_log` VALUES ('562304665350307840', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":3,\"categoryName\":\"测试33\",\"categoryParentId\":\"562304317168549888\",\"categorySn\":\"33\",\"categorySortNum\":3,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 15:57:59\",\"deviceCategoryId\":\"562304664880545792\",\"domainId\":\"11111111111111111\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 15:57:58', 100);
INSERT INTO `sys_oper_log` VALUES ('562304958821564416', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":22,\"categoryName\":\"蛋蛋\",\"categoryParentId\":\"2\",\"categorySn\":\"22\",\"categorySortNum\":2,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 15:59:09\",\"deviceCategoryId\":\"562304958364385280\",\"domainId\":\"11111111111111111\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 15:59:08', 97);
INSERT INTO `sys_oper_log` VALUES ('562405814837444608', '角色管理', 2, 'com.icoolkj.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-10 23:53:23\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[\"446013329207459850\",\"446013329207459844\",\"446013329207459845\",\"446013329207459846\",\"446013329207459847\",\"446013329207459848\",\"446013329207459849\",\"554758523754381312\",\"554943120207249408\",\"554947205169938432\",\"556932188893872128\",\"556930463650807808\",\"556930533515329536\",\"556930937296781312\",\"556930964245184512\",\"556930985581608960\",\"556930997954805760\",\"556932471489298432\",\"559864041741221888\",\"558394072104960000\",\"558393465218531328\",\"560081676743475200\",\"560081998085881856\",\"560082247911211008\",\"556929833750233088\",\"556929805367377920\",\"556929848983945216\",\"556929895641382912\",\"556929947403288576\",\"556930012918317056\"],\"params\":{},\"roleId\":\"554451769334169600\",\"roleKey\":\"comp\",\"roleName\":\"企业角色\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 22:39:54', 266);
INSERT INTO `sys_oper_log` VALUES ('562416534748659712', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:30\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"11111111111111111\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 23:22:30', 74);
INSERT INTO `sys_oper_log` VALUES ('562419911616364544', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试tt\",\"categoryParentId\":\"562416534383755264\",\"categorySn\":\"TT\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:35:56\",\"deviceCategoryId\":\"562419911247265792\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 23:35:55', 75);
INSERT INTO `sys_oper_log` VALUES ('562421481699540992', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 23:42:09', 108);
INSERT INTO `sys_oper_log` VALUES ('562421615334260736', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 23:42:41', 92);
INSERT INTO `sys_oper_log` VALUES ('562422241258635264', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"111\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 23:45:10', 114);
INSERT INTO `sys_oper_log` VALUES ('562422368471875584', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":22,\"categoryName\":\"22\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:41\",\"deviceCategoryId\":\"562422368073416704\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 23:45:41', 83);
INSERT INTO `sys_oper_log` VALUES ('562422393050497024', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":22,\"categoryName\":\"22\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:47\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 23:45:46', 72);
INSERT INTO `sys_oper_log` VALUES ('562434244450713600', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 00:32:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 00:32:52', 71);
INSERT INTO `sys_oper_log` VALUES ('562434263312498688', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 00:32:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 00:32:56', 48);
INSERT INTO `sys_oper_log` VALUES ('562434270405066752', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 00:32:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 00:32:58', 52);
INSERT INTO `sys_oper_log` VALUES ('562434512810672128', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":22,\"categoryName\":\"22\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 00:33:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 00:33:56', 82);
INSERT INTO `sys_oper_log` VALUES ('562434519890657280', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":22,\"categoryName\":\"22\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 00:33:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 00:33:58', 62);
INSERT INTO `sys_oper_log` VALUES ('562434672986947584', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"111\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 00:34:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 00:34:34', 112);
INSERT INTO `sys_oper_log` VALUES ('562434682528989184', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"111\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 00:34:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 00:34:36', 81);
INSERT INTO `sys_oper_log` VALUES ('562434711180279808', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"11111\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"1111\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 00:34:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 00:34:43', 75);
INSERT INTO `sys_oper_log` VALUES ('562434820949409792', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"11111\",\"categoryParentId\":\"562422368073416704\",\"categorySn\":\"1111\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 00:35:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 00:35:09', 78);
INSERT INTO `sys_oper_log` VALUES ('562435083034689536', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":22,\"categoryName\":\"22\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 00:36:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 00:36:12', 107);
INSERT INTO `sys_oper_log` VALUES ('562435129444663296', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":22,\"categoryName\":\"22\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 00:36:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 00:36:23', 86);
INSERT INTO `sys_oper_log` VALUES ('562584965229838336', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:31:47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:31:47', 70);
INSERT INTO `sys_oper_log` VALUES ('562584970166534144', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:31:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:31:49', 50);
INSERT INTO `sys_oper_log` VALUES ('562585007848161280', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:31:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:31:58', 65);
INSERT INTO `sys_oper_log` VALUES ('562585016412930048', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:32:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:32:00', 52);
INSERT INTO `sys_oper_log` VALUES ('562585081521111040', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":22,\"categoryName\":\"22\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422368073416704\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:32:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:32:15', 54);
INSERT INTO `sys_oper_log` VALUES ('562585179953037312', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":22,\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:32:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:32:39', 171);
INSERT INTO `sys_oper_log` VALUES ('562585237591162880', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试哦哦\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:32:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:32:52', 80);
INSERT INTO `sys_oper_log` VALUES ('562585251541417984', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"方法\",\"categoryLevel\":1,\"categoryName\":\"测试哦哦\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:32:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:32:56', 71);
INSERT INTO `sys_oper_log` VALUES ('562585277160226816', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"方法\",\"categoryLevel\":1,\"categoryName\":\"测试哦哦\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:33:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:33:02', 85);
INSERT INTO `sys_oper_log` VALUES ('562587504461479936', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:41:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:41:53', 96);
INSERT INTO `sys_oper_log` VALUES ('562587546547126272', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11\",\"categorySortNum\":1.1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:42:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:42:03', 121);
INSERT INTO `sys_oper_log` VALUES ('562587575118725120', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11\",\"categorySortNum\":1.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:42:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:42:10', 71);
INSERT INTO `sys_oper_log` VALUES ('562587590398574592', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:42:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:42:13', 51);
INSERT INTO `sys_oper_log` VALUES ('562587747496230912', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"11111\",\"categoryParentId\":\"562421614898053120\",\"categorySn\":\"1111\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:42:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:42:51', 144);
INSERT INTO `sys_oper_log` VALUES ('562587756929220608', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"11111\",\"categoryParentId\":\"562421614898053120\",\"categorySn\":\"1111\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:42:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:42:53', 52);
INSERT INTO `sys_oper_log` VALUES ('562587893722251264', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"11111\",\"categoryParentId\":\"562421614898053120\",\"categorySn\":\"1111\",\"categorySortNum\":111,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:43:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:43:26', 75);
INSERT INTO `sys_oper_log` VALUES ('562587911082475520', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"11111\",\"categoryParentId\":\"562421614898053120\",\"categorySn\":\"1111\",\"categorySortNum\":111.77,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:43:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:43:30', 73);
INSERT INTO `sys_oper_log` VALUES ('562587951637200896', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"11111\",\"categoryParentId\":\"562421614898053120\",\"categorySn\":\"1111\",\"categorySortNum\":111.77,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:43:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:43:39', 138);
INSERT INTO `sys_oper_log` VALUES ('562588196039294976', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"方法\",\"categoryLevel\":1,\"categoryName\":\"测试哦哦\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:44:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:44:38', 125);
INSERT INTO `sys_oper_log` VALUES ('562588362771267584', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:45:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:45:18', 134);
INSERT INTO `sys_oper_log` VALUES ('562589082706771968', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11.22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:48:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:48:09', 132);
INSERT INTO `sys_oper_log` VALUES ('562590641800871936', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:54:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:54:21', 66);
INSERT INTO `sys_oper_log` VALUES ('562591823776710656', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:59:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:59:03', 65);
INSERT INTO `sys_oper_log` VALUES ('562591909340512256', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"11111\",\"categoryParentId\":\"562421614898053120\",\"categorySn\":\"1111\",\"categorySortNum\":111.77,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:59:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:59:23', 98);
INSERT INTO `sys_oper_log` VALUES ('562591939292037120', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"11111\",\"categoryParentId\":\"562421614898053120\",\"categorySn\":\"1111\",\"categorySortNum\":1111,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 10:59:30\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'category_sort_num\' at row 1\r\n### The error may exist in file [D:\\Idea\\Workspace\\iiot\\iiot-system\\target\\classes\\mapper\\device\\DcDeviceCategoryMapper.xml]\r\n### The error may involve com.icoolkj.device.mapper.DcDeviceCategoryMapper.updateDcDeviceCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update dc_device_category          SET category_parent_id = ?,             category_name = ?,             category_sn = ?,             category_level = ?,             category_sort_num = ?,                          domain_id = ?,             del_flag = ?,             create_by = ?,             create_time = ?,             update_by = ?,             update_time = ?          where device_category_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'category_sort_num\' at row 1\n; Data truncation: Out of range value for column \'category_sort_num\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'category_sort_num\' at row 1', '2023-04-02 10:59:30', 72);
INSERT INTO `sys_oper_log` VALUES ('562592814177714176', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:02:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:02:59', 168);
INSERT INTO `sys_oper_log` VALUES ('562592831588270080', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11666666\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:03:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:03:03', 74);
INSERT INTO `sys_oper_log` VALUES ('562598091241291776', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11666666\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:23:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:23:57', 153);
INSERT INTO `sys_oper_log` VALUES ('562598104990220288', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试tt\",\"categoryParentId\":\"562416534383755264\",\"categorySn\":\"TT\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:35:56\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562419911247265792\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:24:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:24:00', 64);
INSERT INTO `sys_oper_log` VALUES ('562598116042211328', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":22,\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:24:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:24:03', 50);
INSERT INTO `sys_oper_log` VALUES ('562598135583473664', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"方法\",\"categoryLevel\":1,\"categoryName\":\"测试哦哦\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:24:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:24:08', 63);
INSERT INTO `sys_oper_log` VALUES ('562598173739057152', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"方法\",\"categoryLevel\":1,\"categoryName\":\"测试哦哦\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":111.33,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:24:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:24:17', 77);
INSERT INTO `sys_oper_log` VALUES ('562598198099574784', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"方法\",\"categoryLevel\":1,\"categoryName\":\"测试哦哦\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":111.33,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:24:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:24:22', 89);
INSERT INTO `sys_oper_log` VALUES ('562599015867219968', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11666666\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:27:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:27:37', 98);
INSERT INTO `sys_oper_log` VALUES ('562599030933159936', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11111,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11666666\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:27:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:27:41', 52);
INSERT INTO `sys_oper_log` VALUES ('562599400208072704', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:29:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:29:09', 78);
INSERT INTO `sys_oper_log` VALUES ('562599456273334272', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1110,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:29:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:29:22', 101);
INSERT INTO `sys_oper_log` VALUES ('562599461730123776', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1110,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:29:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:29:24', 59);
INSERT INTO `sys_oper_log` VALUES ('562599467820253184', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11100,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:29:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:29:25', 63);
INSERT INTO `sys_oper_log` VALUES ('562599484480028672', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11100,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:29:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:29:29', 59);
INSERT INTO `sys_oper_log` VALUES ('562599502897217536', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11111,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11666666\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:29:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:29:33', 98);
INSERT INTO `sys_oper_log` VALUES ('562599592294612992', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11100,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:29:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:29:55', 90);
INSERT INTO `sys_oper_log` VALUES ('562599680903479296', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11666666\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:30:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:30:16', 144);
INSERT INTO `sys_oper_log` VALUES ('562599713329643520', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:30:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:30:24', 84);
INSERT INTO `sys_oper_log` VALUES ('562599834582777856', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:30:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:30:53', 113);
INSERT INTO `sys_oper_log` VALUES ('562599891130384384', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22111\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:31:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:31:06', 131);
INSERT INTO `sys_oper_log` VALUES ('562599974878052352', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"22\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422368073416704\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:31:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:31:26', 122);
INSERT INTO `sys_oper_log` VALUES ('562600226079113216', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"22\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422368073416704\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:32:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:32:26', 76);
INSERT INTO `sys_oper_log` VALUES ('562600244953481216', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22111\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:32:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:32:30', 74);
INSERT INTO `sys_oper_log` VALUES ('562600266214408192', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11111,\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22111\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:32:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:32:35', 79);
INSERT INTO `sys_oper_log` VALUES ('562600534373040128', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11111,\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22111\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:33:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:33:39', 145);
INSERT INTO `sys_oper_log` VALUES ('562600539943075840', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22111\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:33:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:33:41', 61);
INSERT INTO `sys_oper_log` VALUES ('562600638123343872', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":6666,\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22111\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:34:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:34:04', 84);
INSERT INTO `sys_oper_log` VALUES ('562600674559262720', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22111\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:34:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:34:13', 76);
INSERT INTO `sys_oper_log` VALUES ('562603423011176448', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11111,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"11666666\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:45:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:45:08', 50);
INSERT INTO `sys_oper_log` VALUES ('562603442137202688', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11111,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"1166666611\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:45:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:45:13', 68);
INSERT INTO `sys_oper_log` VALUES ('562603750041059328', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"1\",\"categoryLevel\":1,\"categoryName\":\"测试赢家\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"GOOD\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-02 11:46:26\",\"deviceCategoryId\":\"562603749760040960\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:46:26', 55);
INSERT INTO `sys_oper_log` VALUES ('562603766839246848', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"1\",\"categoryLevel\":1,\"categoryName\":\"测试赢家\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"GOOD\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-02 11:46:27\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562603749760040960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:46:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:46:30', 62);
INSERT INTO `sys_oper_log` VALUES ('562603786623778816', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"22\",\"categoryLevel\":22,\"categoryName\":\"测试赢家\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"GOOD\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-02 11:46:27\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562603749760040960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:46:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:46:35', 79);
INSERT INTO `sys_oper_log` VALUES ('562603831460888576', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"\",\"categoryLevel\":22,\"categoryName\":\"测试赢家\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"GOOD\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-02 11:46:27\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562603749760040960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:46:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:46:45', 142);
INSERT INTO `sys_oper_log` VALUES ('562604023547428864', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"我赢了\",\"categoryLevel\":22,\"categoryName\":\"测试赢家\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"GOOD\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-02 11:46:27\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562603749760040960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:47:31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:47:31', 63);
INSERT INTO `sys_oper_log` VALUES ('562604038827278336', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"\",\"categoryLevel\":22,\"categoryName\":\"测试赢家\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"GOOD\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-02 11:46:27\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562603749760040960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:47:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:47:35', 60);
INSERT INTO `sys_oper_log` VALUES ('562604054677553152', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"我赢了\",\"categoryLevel\":22,\"categoryName\":\"测试赢家\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"GOOD\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-02 11:46:27\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562603749760040960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:47:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:47:39', 63);
INSERT INTO `sys_oper_log` VALUES ('562604154422296576', '菜单管理', 2, 'com.icoolkj.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/category/index\",\"createTime\":\"2023-04-01 13:45:52\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":\"559864041741221888\",\"menuName\":\"设备分类信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":\"556932471489298432\",\"path\":\"category\",\"perms\":\"device:category:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:48:02', 84);
INSERT INTO `sys_oper_log` VALUES ('562604193731313664', '菜单管理', 2, 'com.icoolkj.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/basic/index\",\"createTime\":\"2023-03-17 20:02:26\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":\"556929833750233088\",\"menuName\":\"设备基础信息\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":\"556932471489298432\",\"path\":\"basic\",\"perms\":\"device:basic:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:48:12', 131);
INSERT INTO `sys_oper_log` VALUES ('562604231027064832', '菜单管理', 2, 'com.icoolkj.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"staff/basic/index\",\"createTime\":\"2023-03-17 20:07:08\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":\"556930463650807808\",\"menuName\":\"人员基本信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":\"556932188893872128\",\"path\":\"basic\",\"perms\":\"staff:basic:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:48:21', 87);
INSERT INTO `sys_oper_log` VALUES ('562604649513746432', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11100,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:50:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:50:01', 66);
INSERT INTO `sys_oper_log` VALUES ('562605084832169984', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"我赢了\",\"categoryLevel\":22,\"categoryName\":\"测试赢家\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"GOOD\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-02 11:46:27\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562603749760040960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 11:51:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:51:44', 120);
INSERT INTO `sys_oper_log` VALUES ('562610999748722688', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"系统默认分类\",\"categoryParentId\":\"00\",\"categorySn\":\"SYSTEM_SN\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2022-08-08 08:08:08\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562291915345625088\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"系统默认分类，不允许修改。\",\"code\":500}', 0, NULL, '2023-04-02 12:15:15', 5);
INSERT INTO `sys_oper_log` VALUES ('562611010523889664', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"系统默认分类\",\"categoryParentId\":\"00\",\"categorySn\":\"SYSTEM_SN\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2022-08-08 08:08:08\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562291915345625088\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"系统默认分类，不允许修改。\",\"code\":500}', 0, NULL, '2023-04-02 12:15:17', 1);
INSERT INTO `sys_oper_log` VALUES ('562611016353972224', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"系统默认分类\",\"categoryParentId\":\"00\",\"categorySn\":\"SYSTEM_SN\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2022-08-08 08:08:08\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562291915345625088\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"系统默认分类，不允许修改。\",\"code\":500}', 0, NULL, '2023-04-02 12:15:18', 0);
INSERT INTO `sys_oper_log` VALUES ('562611337855762432', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"系统默认分类\",\"categoryParentId\":\"00\",\"categorySn\":\"SYSTEM_SN\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2022-08-08 08:08:08\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562291915345625088\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"系统默认分类，不允许修改\",\"code\":500}', 0, NULL, '2023-04-02 12:16:35', 5);
INSERT INTO `sys_oper_log` VALUES ('562611348211499008', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"系统默认分类\",\"categoryParentId\":\"00\",\"categorySn\":\"SYSTEM_SN\",\"categorySortNum\":1,\"createBy\":\"133555608539361280\",\"createTime\":\"2022-08-08 08:08:08\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562291915345625088\",\"domainId\":\"553672938461593600\",\"params\":{}}', '{\"msg\":\"系统默认分类，不允许修改\",\"code\":500}', 0, NULL, '2023-04-02 12:16:38', 0);
INSERT INTO `sys_oper_log` VALUES ('562611937192443904', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562291915345625088', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"系统默认分类，不允许删除\",\"code\":500}', 0, NULL, '2023-04-02 12:18:58', 0);
INSERT INTO `sys_oper_log` VALUES ('562611951029452800', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562291915345625088', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"系统默认分类，不允许删除\",\"code\":500}', 0, NULL, '2023-04-02 12:19:01', 0);
INSERT INTO `sys_oper_log` VALUES ('562611966120558592', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562419911247265792', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级分类,不允许删除\",\"code\":601}', 0, NULL, '2023-04-02 12:19:05', 17);
INSERT INTO `sys_oper_log` VALUES ('562611979957567488', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562419911247265792', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级分类,不允许删除\",\"code\":601}', 0, NULL, '2023-04-02 12:19:08', 18);
INSERT INTO `sys_oper_log` VALUES ('562612186736754688', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562603749760040960', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:19:58', 143);
INSERT INTO `sys_oper_log` VALUES ('562612284774416384', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"我是赢家\",\"categoryLevel\":11100,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 12:20:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:20:21', 74);
INSERT INTO `sys_oper_log` VALUES ('562612667315912704', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562422392698175488', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"分类存在设备,不允许删除\",\"code\":601}', 0, NULL, '2023-04-02 12:21:52', 34);
INSERT INTO `sys_oper_log` VALUES ('562612688056745984', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562422392698175488', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"分类存在设备,不允许删除\",\"code\":601}', 0, NULL, '2023-04-02 12:21:57', 34);
INSERT INTO `sys_oper_log` VALUES ('562612708344594432', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562422392698175488', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"分类存在设备,不允许删除\",\"code\":601}', 0, NULL, '2023-04-02 12:22:02', 33);
INSERT INTO `sys_oper_log` VALUES ('562612714250174464', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562422368073416704', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"分类存在设备,不允许删除\",\"code\":601}', 0, NULL, '2023-04-02 12:22:03', 32);
INSERT INTO `sys_oper_log` VALUES ('562612726149414912', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562419911247265792', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级分类,不允许删除\",\"code\":601}', 0, NULL, '2023-04-02 12:22:06', 16);
INSERT INTO `sys_oper_log` VALUES ('562612759175364608', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":6666,\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22111\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 12:22:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:22:14', 58);
INSERT INTO `sys_oper_log` VALUES ('562612869485559808', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":6666,\"categoryName\":\"测试ttt\",\"categoryParentId\":\"562419911247265792\",\"categorySn\":\"22111\",\"categorySortNum\":22,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:48\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422392698175488\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 12:22:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:22:40', 133);
INSERT INTO `sys_oper_log` VALUES ('562612908744245248', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"我是赢家\",\"categoryLevel\":11100,\"categoryName\":\"测试\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"FF\",\"categorySortNum\":11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:42\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421614898053120\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 12:22:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:22:50', 74);
INSERT INTO `sys_oper_log` VALUES ('562620279918952448', '设备基础', 2, 'com.icoolkj.web.controller.device.DcDeviceBasicController.edit()', 'PUT', 1, 'admin', NULL, '/device/basic', '127.0.0.1', '内网IP', '{\"createBy\":\"133555608539361280\",\"createTime\":\"2023-03-19 21:42:38\",\"delFlag\":\"0\",\"deviceBasicId\":\"557680355809689600\",\"deviceBrand\":\"品牌\",\"deviceDesc\":\"设备描述\",\"deviceFactory\":\"生产厂家\",\"deviceModel\":\"设备规格型号\",\"deviceName\":\"设备名称\",\"deviceOnlineStatus\":\"2\",\"deviceSn\":\"CC\",\"deviceStatus\":\"1\",\"deviceType\":\"设备类型\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 12:52:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:52:07', 112);
INSERT INTO `sys_oper_log` VALUES ('562620294129254400', '设备基础', 2, 'com.icoolkj.web.controller.device.DcDeviceBasicController.edit()', 'PUT', 1, 'admin', NULL, '/device/basic', '127.0.0.1', '内网IP', '{\"createBy\":\"133555608539361280\",\"createTime\":\"2023-03-19 22:00:11\",\"delFlag\":\"0\",\"deviceBasicId\":\"557684773531680768\",\"deviceBrand\":\"品牌\",\"deviceFactory\":\"厂家\",\"deviceModel\":\"型号\",\"deviceName\":\"名称\",\"deviceOnlineStatus\":\"2\",\"deviceSn\":\"CCC\",\"deviceStatus\":\"0\",\"deviceType\":\"类型\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 12:52:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:52:10', 47);
INSERT INTO `sys_oper_log` VALUES ('562620457065381888', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11111,\"categoryName\":\"测试啊啊\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"1166666611\",\"categorySortNum\":11.11,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:42:10\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562421481196224512\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 12:52:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:52:49', 118);
INSERT INTO `sys_oper_log` VALUES ('562620472143904768', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"11111\",\"categoryParentId\":\"562421614898053120\",\"categorySn\":\"1111\",\"categorySortNum\":111.77,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:45:11\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562422240730152960\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 12:52:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:52:53', 58);
INSERT INTO `sys_oper_log` VALUES ('562620485704089600', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"方法\",\"categoryLevel\":1,\"categoryName\":\"测试哦哦\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":111.33,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 12:52:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:52:56', 51);
INSERT INTO `sys_oper_log` VALUES ('562620717036732416', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"方法\",\"categoryLevel\":1,\"categoryName\":\"测试哦哦\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":111.33,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 12:53:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:53:51', 141);
INSERT INTO `sys_oper_log` VALUES ('562620728910807040', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryDesc\":\"方法\",\"categoryLevel\":1,\"categoryName\":\"测试哦哦\",\"categoryParentId\":\"562422240730152960\",\"categorySn\":\"11\",\"categorySortNum\":111.33,\"createBy\":\"133555608539361280\",\"createTime\":\"2023-04-01 23:22:31\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562416534383755264\",\"domainId\":\"553672938461593600\",\"params\":{},\"updateBy\":\"133555608539361280\",\"updateTime\":\"2023-04-02 12:53:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:53:54', 52);
INSERT INTO `sys_oper_log` VALUES ('562620927611764736', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562422392698175488', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"分类存在设备,不允许删除\",\"code\":601}', 0, NULL, '2023-04-02 12:54:41', 34);
INSERT INTO `sys_oper_log` VALUES ('562620940878348288', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562422368073416704', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"分类存在设备,不允许删除\",\"code\":601}', 0, NULL, '2023-04-02 12:54:45', 34);
INSERT INTO `sys_oper_log` VALUES ('562620947002032128', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562419911247265792', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级分类,不允许删除\",\"code\":601}', 0, NULL, '2023-04-02 12:54:46', 17);
INSERT INTO `sys_oper_log` VALUES ('562620959928877056', '设备分类信息', 3, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/device/category/562421481196224512', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:54:49', 78);
INSERT INTO `sys_oper_log` VALUES ('562643479298048000', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'COMP#91340000148940170G', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"智能家居设备\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"ZN_001\",\"categorySortNum\":1,\"createBy\":\"554948857633439744\",\"createTime\":\"2023-04-02 14:24:18\",\"deviceCategoryId\":\"562643478702456832\",\"domainId\":\"554948857285312512\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 14:24:18', 130);
INSERT INTO `sys_oper_log` VALUES ('562643562374627328', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'COMP#91340000148940170G', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":1,\"categoryName\":\"工业智能网关\",\"categoryParentId\":\"562291915345625088\",\"categorySn\":\"GY_001\",\"categorySortNum\":1,\"createBy\":\"554948857633439744\",\"createTime\":\"2023-04-02 14:24:38\",\"deviceCategoryId\":\"562643562026500096\",\"domainId\":\"554948857285312512\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 14:24:38', 71);
INSERT INTO `sys_oper_log` VALUES ('562643766016475136', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'COMP#91340000148940170G', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":2,\"categoryName\":\"电表\",\"categoryParentId\":\"562643562026500096\",\"categorySn\":\"GY_DB\",\"categorySortNum\":2,\"createBy\":\"554948857633439744\",\"createTime\":\"2023-04-02 14:25:27\",\"deviceCategoryId\":\"562643765471215616\",\"domainId\":\"554948857285312512\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 14:25:27', 118);
INSERT INTO `sys_oper_log` VALUES ('562643852691767296', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'COMP#91340000148940170G', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":3,\"categoryName\":\"水表\",\"categoryParentId\":\"562643562026500096\",\"categorySn\":\"GY_SB\",\"categorySortNum\":3,\"createBy\":\"554948857633439744\",\"createTime\":\"2023-04-02 14:25:47\",\"deviceCategoryId\":\"562643852339445760\",\"domainId\":\"554948857285312512\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 14:25:47', 72);
INSERT INTO `sys_oper_log` VALUES ('562652089432408064', '设备分类信息', 1, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.add()', 'POST', 1, 'COMP#91340000148940170G', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试\",\"categoryParentId\":\"562643765471215616\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"554948857633439744\",\"createTime\":\"2023-04-02 14:58:31\",\"deviceCategoryId\":\"562652088920702976\",\"domainId\":\"554941486488092672\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 14:58:31', 110);
INSERT INTO `sys_oper_log` VALUES ('562652168197242880', '设备分类信息', 2, 'com.icoolkj.web.controller.device.DcDeviceCategoryController.edit()', 'PUT', 1, 'COMP#91340000148940170G', NULL, '/device/category', '127.0.0.1', '内网IP', '{\"categoryLevel\":11,\"categoryName\":\"测试\",\"categoryParentId\":\"562643765471215616\",\"categorySn\":\"11\",\"categorySortNum\":1,\"createBy\":\"554948857633439744\",\"createTime\":\"2023-04-02 14:58:32\",\"delFlag\":\"0\",\"deviceCategoryId\":\"562652088920702976\",\"domainId\":\"554941486488092672\",\"params\":{},\"updateBy\":\"554948857633439744\",\"updateTime\":\"2023-04-02 14:58:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 14:58:50', 159);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('133701286179631104', 'operator', '系统操作员', 1, '0', 'admin', '2023-02-28 09:46:12', 'admin', '2023-03-07 13:45:46', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `uk_role_key`(`role_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('133700983795478528', '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-02-28 09:46:12', 'admin', '2023-03-07 09:04:26', '超级管理员');
INSERT INTO `sys_role` VALUES ('448462665975595008', '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-02-28 09:46:12', 'admin', '2023-03-07 13:30:29', '普通角色');
INSERT INTO `sys_role` VALUES ('554451769334169600', '企业角色', 'comp', 3, '4', 1, 1, '0', '0', 'admin', '2023-03-10 23:53:23', 'admin', '2023-04-01 22:39:54', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `dept_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `menu_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '133697708996161536');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '133697709000355856');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '133697709004550167');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '259435333274300372');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '259435333274300373');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '259435333274300381');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '259435333274300382');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '259435333274300383');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '259435333274300384');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '259435333274300389');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '259435333274300399');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '259435333274300417');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '259435333274300424');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '259435333274300431');
INSERT INTO `sys_role_menu` VALUES ('448462665975595008', '446013329207459851');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '446013329207459844');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '446013329207459845');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '446013329207459846');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '446013329207459847');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '446013329207459848');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '446013329207459849');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '446013329207459850');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '554758523754381312');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '554943120207249408');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '554947205169938432');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556929805367377920');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556929833750233088');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556929848983945216');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556929895641382912');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556929947403288576');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556930012918317056');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556930463650807808');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556930533515329536');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556930937296781312');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556930964245184512');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556930985581608960');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556930997954805760');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556932188893872128');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '556932471489298432');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '558393465218531328');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '558394072104960000');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '559864041741221888');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '560081676743475200');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '560081998085881856');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '560082247911211008');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `domain_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编号',
  `dept_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `password_cleartext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码明文',
  `user_relation_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户账号与业务关系ID',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `uk_user_name`(`user_name`) USING BTREE,
  INDEX `fk_domain_id`(`domain_id`) USING BTREE,
  INDEX `fk_dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `fk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `sys_domain` (`domain_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('133555608539361280', '553672938461593600', '133702242296393728', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', NULL, NULL, '0', '0', '127.0.0.1', '2023-04-02 14:12:47', 'admin', '2023-02-28 09:46:12', '', '2023-04-02 14:12:46', '管理员');
INSERT INTO `sys_user` VALUES ('554743409269538816', '553672938461593600', '554743409055629312', 'DOMAIN_SYSTEM', 'DOMAIN_SYSTEM管理员', '00', '', '', '0', '', '$2a$10$hjW/eeTsel6iqzyez0SSmeGRiDkvlvTXhcXN6r8oggPTNelCrSJJC', 'zzCLycsaFRjkMXVPvDXlag==', '', '0', '0', '127.0.0.1', '2023-03-11 19:23:05', '133555608539361280', '2023-03-11 19:12:14', '', '2023-03-11 19:23:04', NULL);
INSERT INTO `sys_user` VALUES ('554743424868155392', '553692142187315200', '554805441297645569', 'DOMAIN_COMP', 'DOMAIN_COMP管理员', '00', '', '', '0', '', '$2a$10$o2Dixf6qXbRcXooWsg2vZuPEBuYlXI5tDbO5x0O9Bf3Z68ecigFZC', 'x5TMWFDw61u9yXOqtFwKEA==', '552543924565049344', '0', '0', '127.0.0.1', '2023-03-11 23:12:24', '133555608539361280', '2023-03-11 19:12:18', '', '2023-03-11 23:12:23', NULL);
INSERT INTO `sys_user` VALUES ('554948857633439744', '554941486488092672', '554948857469861888', 'COMP#91340000148940170G', 'COMP#91340000148940170G管理员', '00', '158@qq.com', '15888888888', '0', '', '$2a$10$BKVAmUGQjujjpfONs9ganexFkTd0nrZrH/Vm2NETQkOgqMl.dEQxq', 'F4wJbPeBp41hyT5Y9i6aBw==', '552543924565049344', '0', '0', '127.0.0.1', '2023-04-02 14:58:10', '133555608539361280', '2023-03-12 08:48:36', '', '2023-04-02 14:58:09', NULL);
INSERT INTO `sys_user` VALUES ('554948868307943424', '554941498399916032', '554948868106616832', 'COMP#913401007529530585', 'COMP#913401007529530585管理员', '00', '159@qq.com', '15999999999', '0', '', '$2a$10$aHb3xZVx4sRXl89w5FwxWus/nq1HXh81jbmnF7KCRDaGZQ3qU0ybC', 'F4wJbPeBp41hyT5Y9i6aBw==', '552544230317228032', '0', '0', '', NULL, '133555608539361280', '2023-03-12 08:48:39', '', NULL, NULL);
INSERT INTO `sys_user` VALUES ('554948887014539264', '554941515038720000', '554948886863544320', 'COMP#91340000148947612F', 'COMP#91340000148947612F管理员', '00', '136@qq.com', '13666666666', '0', '', '$2a$10$5WSG0qVkEKk/PsvuWrKId.ZdtVgQE3Iv0h93HUHhIbqCHZCaPXsDW', 'F4wJbPeBp41hyT5Y9i6aBw==', '554428458738909184', '0', '0', '127.0.0.1', '2023-03-12 18:18:28', '133555608539361280', '2023-03-12 08:48:43', '', '2023-03-12 18:18:27', NULL);
INSERT INTO `sys_user` VALUES ('554948898368520192', '554941527416111104', '554948898175582208', 'COMP#91340111MA2UC77U2R', 'COMP#91340111MA2UC77U2R管理员', '00', '157@qq.com', '15777777777', '0', '', '$2a$10$KI9lIDpyR9ubQj1Uxu8.2.N8U6YNItxJGx5z5ECUDMbYkdZZQF.EO', 'F4wJbPeBp41hyT5Y9i6aBw==', '554445566969380864', '0', '0', '', NULL, '133555608539361280', '2023-03-12 08:48:46', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `post_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('133555608539361280', '133701286179631104');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `role_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('133555608539361280', '133700983795478528');
INSERT INTO `sys_user_role` VALUES ('554743409269538816', '554451769334169600');
INSERT INTO `sys_user_role` VALUES ('554743424868155392', '554451769334169600');
INSERT INTO `sys_user_role` VALUES ('554948857633439744', '554451769334169600');
INSERT INTO `sys_user_role` VALUES ('554948868307943424', '554451769334169600');
INSERT INTO `sys_user_role` VALUES ('554948887014539264', '554451769334169600');
INSERT INTO `sys_user_role` VALUES ('554948898368520192', '554451769334169600');
INSERT INTO `sys_user_role` VALUES ('555092004397121536', '554451769334169600');

-- ----------------------------
-- Function structure for getDeviceCategoryChildList
-- ----------------------------
DROP FUNCTION IF EXISTS `getDeviceCategoryChildList`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `getDeviceCategoryChildList`( deviceCategoryId VARCHAR ( 20 ) ) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
DECLARE
	str LONGTEXT;
DECLARE
	cid LONGTEXT;

SET str = '$';

SET cid = deviceCategoryId;
WHILE
	cid IS NOT NULL DO

SET str = concat( str, ',', cid );
SELECT
	group_concat( device_category_id ) INTO cid
FROM
	dc_device_category
WHERE
	FIND_IN_SET( category_parent_id, cid ) > 0;

END WHILE;
RETURN str;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for getDeviceCategoryParentList
-- ----------------------------
DROP FUNCTION IF EXISTS `getDeviceCategoryParentList`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `getDeviceCategoryParentList`( deviceCategoryId VARCHAR ( 20 )  ) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
DECLARE
	fid longtext default '';
DECLARE
	str longtext default deviceCategoryId;
WHILE
	deviceCategoryId IS NOT NULL DO

	SET fid = ( SELECT category_parent_id FROM dc_device_category WHERE device_category_id = deviceCategoryId );
IF
	fid IS NOT NULL THEN

		SET str = concat( str, ',', fid );

	SET deviceCategoryId = fid;
	ELSE
		SET deviceCategoryId = fid;

END IF;

END WHILE;
RETURN str;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;


DESC dc_device_basic;

## 所属组织
alter table sys_user add constraint fk_domain_id foreign key (domain_id) references sys_domain(domain_id);
##所属部门
alter table sys_user add constraint fk_dept_id foreign key (dept_id) references sys_dept(dept_id);

## 部门所属组织
alter table sys_dept add constraint fk_dept_domain_id foreign key (domain_id) references sys_domain(domain_id);

## 设备分类所属组织
alter table dc_device_category add constraint fk_device_category_domain_id foreign key (domain_id) references sys_domain(domain_id);


## 设备分类所属分类
alter table dc_device_basic add constraint fk_device_category_id foreign key (device_category_id) references dc_device_category(device_category_id);

## 设备分类所属组织
alter table dc_device_basic add constraint fk_device_domain_id foreign key (domain_id) references sys_domain(domain_id);

## 设备分类所属企业
alter table dc_device_basic add constraint fk_device_comp_id foreign key (comp_basic_id) references dc_comp_basic(comp_basic_id);

## 所属目录
alter table file_catalog_relation add constraint fk_catalog_code foreign key (file_catalog_code) references file_catalog_config(file_catalog_code);
##所属文件
alter table file_catalog_relation add constraint fk_config_code foreign key (file_config_code) references file_config(file_config_code);

## 所属目录
alter table file_record add constraint fk_record_catalog_code foreign key (file_catalog_code) references file_catalog_config(file_catalog_code);

## 所属记录
alter table file_record_detail add constraint fk_detail_record_id foreign key (file_record_id) references file_record(file_record_id);
## 所属文件目录关系
alter table file_record_detail add constraint fk_detail_catalog_relation_id foreign key (file_catalog_relation_id) references file_catalog_relation(file_catalog_relation_id);
##所属文件
alter table file_record_detail add constraint fk_detail_config_code foreign key (file_config_code) references file_config(file_config_code);

