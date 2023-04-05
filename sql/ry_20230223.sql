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

 Date: 05/04/2023 18:13:34
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
INSERT INTO `dc_comp_basic` VALUES ('552543924565049344', '安徽建工集团有限公司', '91340000148940170G', '有限责任公司(非自然人投资或控股的法人独资)', '赵时运', '15888888888', '3401', '安徽省合肥市包河区芜湖路325号', '117.324911', '31.869924', '1989-04-23', '1989-05-06 至 无固定期限', '注销', '2018-07-30', '安徽省市场监督管理局', '52,000万(元)', '52,000万(元)', '各类工程建设项目总承包；房屋建筑、公路、市政公用、水利水电、矿山、铁路、冶炼、石油化工（不含危险品）、港口与航道、城市园林绿化；各类工程专业承包；建筑装修装饰、公路路基、公路路面、桥梁、隧道、炉窑、建筑幕墙、消防设施、钢结构、机电设备安装、河湖整治、起重设备安装；对外工程承包和劳务合作、国际国内商贸服务；交通建设投资；建筑材料的生产与销售，建筑机械制造、经销与租赁，建筑工程勘察设计，建筑和交通研发、咨询、检测、监理（以上范围涉及许可和资质证的凭许可和资质证经营）。', '戴国华', '15888888888', '158@qq.com', '0', '0', '133555608539361280', '2023-03-08 17:32:17', 'COMP#91340000148940170G', '2023-04-05 15:58:24');
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
  PRIMARY KEY (`file_catalog_relation_id`) USING BTREE,
  INDEX `fk_catalog_code`(`file_catalog_code`) USING BTREE,
  INDEX `fk_config_code`(`file_config_code`) USING BTREE,
  CONSTRAINT `fk_catalog_code` FOREIGN KEY (`file_catalog_code`) REFERENCES `file_catalog_config` (`file_catalog_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_config_code` FOREIGN KEY (`file_config_code`) REFERENCES `file_config` (`file_config_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  PRIMARY KEY (`file_record_id`) USING BTREE,
  INDEX `fk_record_catalog_code`(`file_catalog_code`) USING BTREE,
  CONSTRAINT `fk_record_catalog_code` FOREIGN KEY (`file_catalog_code`) REFERENCES `file_catalog_config` (`file_catalog_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  PRIMARY KEY (`file_record_detail_id`) USING BTREE,
  INDEX `fk_detail_record_id`(`file_record_id`) USING BTREE,
  INDEX `fk_detail_config_code`(`file_config_code`) USING BTREE,
  INDEX `fk_detail_catalog_relation_id`(`file_catalog_relation_id`) USING BTREE,
  CONSTRAINT `fk_detail_catalog_relation_id` FOREIGN KEY (`file_catalog_relation_id`) REFERENCES `file_catalog_relation` (`file_catalog_relation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_detail_config_code` FOREIGN KEY (`file_config_code`) REFERENCES `file_config` (`file_config_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_detail_record_id` FOREIGN KEY (`file_record_id`) REFERENCES `file_record` (`file_record_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('563713580441010176', 'sys_dept', '部门表', NULL, NULL, 'SysDept', 'crud', 'com.icoolkj.company', 'company', 'dept', '部门', 'icoolkj', '0', '/', NULL, 'admin', '2023-04-05 13:16:30', '', NULL, NULL);
INSERT INTO `gen_table` VALUES ('563713583142141952', 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'com.icoolkj.company', 'company', 'user', '用户信息', 'icoolkj', '0', '/', NULL, 'admin', '2023-04-05 13:16:31', '', NULL, NULL);

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
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('563713580734611456', '563713580441010176', 'dept_id', '部门id', 'varchar(20)', 'String', 'deptId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-05 13:16:30', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713580914966528', '563713580441010176', 'parent_id', '父部门id', 'varchar(20)', 'String', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-04-05 13:16:30', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713581078544384', '563713580441010176', 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-05 13:16:30', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713581237927936', '563713580441010176', 'domain_id', '部门所属组织', 'varchar(20)', 'String', 'domainId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-05 13:16:30', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713581397311488', '563713580441010176', 'dept_name', '部门名称', 'varchar(30)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-04-05 13:16:30', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713581556695040', '563713580441010176', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713581711884288', '563713580441010176', 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713581871267840', '563713580441010176', 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713582026457088', '563713580441010176', 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713582190034944', '563713580441010176', 'status', '部门状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713582349418496', '563713580441010176', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713582504607744', '563713580441010176', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713582663991296', '563713580441010176', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713582823374848', '563713580441010176', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713582982758400', '563713580441010176', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713583397994496', '563713583142141952', 'user_id', '用户ID', 'varchar(20)', 'String', 'userId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713583557378048', '563713583142141952', 'domain_id', '组织编号', 'varchar(20)', 'String', 'domainId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713583716761600', '563713583142141952', 'dept_id', '部门ID', 'varchar(20)', 'String', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713583880339456', '563713583142141952', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713584035528704', '563713583142141952', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713584194912256', '563713583142141952', 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713584350101504', '563713583142141952', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713584509485056', '563713583142141952', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713584668868608', '563713583142141952', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713584824057856', '563713583142141952', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713584983441408', '563713583142141952', 'theme', '系统主题', 'varchar(255)', 'String', 'theme', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713585138630656', '563713583142141952', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713585293819904', '563713583142141952', 'password_cleartext', '密码明文', 'varchar(255)', 'String', 'passwordCleartext', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713585449009152', '563713583142141952', 'user_relation_id', '用户账号与业务关系ID', 'varchar(20)', 'String', 'userRelationId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2023-04-05 13:16:31', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713585604198400', '563713583142141952', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 15, 'admin', '2023-04-05 13:16:32', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713585759387648', '563713583142141952', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2023-04-05 13:16:32', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713585914576896', '563713583142141952', 'login_num', '登录次数', 'int(11)', 'Long', 'loginNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2023-04-05 13:16:32', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713586069766144', '563713583142141952', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2023-04-05 13:16:32', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713586224955392', '563713583142141952', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 19, 'admin', '2023-04-05 13:16:32', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713586384338944', '563713583142141952', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2023-04-05 13:16:32', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713586539528192', '563713583142141952', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 21, 'admin', '2023-04-05 13:16:32', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713586694717440', '563713583142141952', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 22, 'admin', '2023-04-05 13:16:32', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713586849906688', '563713583142141952', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 23, 'admin', '2023-04-05 13:16:32', '', NULL);
INSERT INTO `gen_table_column` VALUES ('563713587009290240', '563713583142141952', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 24, 'admin', '2023-04-05 13:16:32', '', NULL);

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
INSERT INTO `sys_config` VALUES ('552953471658098688', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-02-28 09:46:14', 'admin', '2023-04-05 12:21:31', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
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
  `parent_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `domain_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门所属组织',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `sys_dept_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '系统部门不允许删除停用操作【0代表非系统，1代表系统】',
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
INSERT INTO `sys_dept` VALUES ('133702242296393728', '00', '00', '553672938461593600', '系统根部门', 1, '', '', '', '1', '0', '0', 'admin', '2022-05-08 20:08:58', 'admin', '2023-04-05 17:07:37');
INSERT INTO `sys_dept` VALUES ('563785611970871296', '00', '00', '553692142187315200', '企业根部门', 1, NULL, NULL, NULL, '1', '0', '0', 'admin', '2023-04-05 18:02:44', '', NULL);

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
INSERT INTO `sys_domain` VALUES ('553672938461593600', NULL, '553592170506878976', '系统组织域', 'DOMAIN_SYSTEM', '2023-03-09 00:00:00', '00', '', NULL, NULL, NULL, '0', '0', 'admin', '2023-03-08 21:48:03', 'admin', '2023-04-05 18:10:20');
INSERT INTO `sys_domain` VALUES ('553692142187315200', NULL, '553519200858013696', '企业组织域', 'DOMAIN_COMP', '2058-08-08 00:00:00', '00', NULL, NULL, NULL, NULL, '0', '0', 'admin', '2023-04-05 18:02:44', 'admin', '2023-04-05 18:10:24');

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
INSERT INTO `sys_domain_roles` VALUES ('553519200858013696', '企业组织角色', 'DOMAIN_TYPE_COMP', '0', '0', '133555608539361280', '2023-03-19 16:29:16', '133555608539361280', '2023-04-05 12:20:54');
INSERT INTO `sys_domain_roles` VALUES ('553592170506878976', '系统组织角色', 'DOMAIN_TYPE_SYSTEM', '0', '0', '133555608539361280', '2023-03-19 16:29:19', '133555608539361280', '2023-04-04 20:11:44');

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
INSERT INTO `sys_menu` VALUES ('133697708996161536', '系统管理', '133698244612976640', 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-02-28 09:46:12', 'admin', '2023-04-05 12:21:09', '系统管理目录');
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
INSERT INTO `sys_menu` VALUES ('562674295445127168', '设备活动预警', '556932471489298432', 3, 'warning', 'device/warning/activityIndex', NULL, 1, 0, 'C', '0', '0', 'device:warning:list', 'time-range', 'admin', '2023-04-02 16:26:45', 'admin', '2023-04-02 16:36:24', '');
INSERT INTO `sys_menu` VALUES ('562675372496257024', '设备基础查询', '562674295445127168', 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'device:warning:query', '#', 'admin', '2023-04-02 16:31:02', 'admin', '2023-04-02 16:44:36', '');
INSERT INTO `sys_menu` VALUES ('563100396843696128', '部门修改', '563699546626981888', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'oa:dept:edit', '#', 'admin', '2023-04-05 13:22:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('563699546626981888', '部门架构', '563713038318829568', 1, 'dept', 'oa/dept/index', NULL, 1, 0, 'C', '0', '0', 'oa:dept:list', 'tree-table', 'admin', '2023-04-05 13:22:30', 'admin', '2023-04-05 13:23:57', '部门菜单');
INSERT INTO `sys_menu` VALUES ('563702086886227968', '部门导出', '563699546626981888', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'oa:dept:export', '#', 'admin', '2023-04-05 13:22:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('563706689988067328', '部门删除', '563699546626981888', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'oa:dept:remove', '#', 'admin', '2023-04-05 13:22:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('563713038318829568', '人力资源', '133698244612976640', 7, 'hr', NULL, NULL, 1, 0, 'M', '0', '0', '', 'user', 'admin', '2023-04-05 13:14:21', 'admin', '2023-04-05 13:14:58', '');
INSERT INTO `sys_menu` VALUES ('563713587449692160', '部门查询', '563699546626981888', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'oa:dept:query', '#', 'admin', '2023-04-05 13:22:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('563713607485882368', '部门新增', '563699546626981888', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'oa:dept:add', '#', 'admin', '2023-04-05 13:22:30', '', NULL, '');

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
INSERT INTO `sys_notice` VALUES ('553237921977597952', 'ce', '2', 0x3C703E6365663C2F703E, '0', 'admin', '2023-03-07 15:29:59', 'admin', '2023-04-02 17:35:30', NULL);

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
INSERT INTO `sys_post` VALUES ('133701286179631104', 'operator', '系统操作员', 1, '0', 'admin', '2023-02-28 09:46:12', 'admin', '2023-04-05 13:13:08', '');

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
INSERT INTO `sys_role` VALUES ('554451769334169600', '企业角色', 'comp', 3, '4', 1, 1, '0', '0', 'admin', '2023-03-10 23:53:23', 'admin', '2023-04-05 15:37:09', NULL);

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
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '562674295445127168');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '562675372496257024');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '563100396843696128');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '563699546626981888');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '563702086886227968');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '563706689988067328');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '563713038318829568');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '563713587449692160');
INSERT INTO `sys_role_menu` VALUES ('554451769334169600', '563713607485882368');

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
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'black' COMMENT '系统主题',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `password_cleartext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码明文',
  `user_relation_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户账号与业务关系ID',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_num` int(11) NOT NULL DEFAULT 0 COMMENT '登录次数',
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
INSERT INTO `sys_user` VALUES ('133555608539361280', '553672938461593600', '133702242296393728', 'admin', '系统管理员', '00', 'icoolkj@163.com', '15888888888', '1', '', 'black', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', NULL, NULL, '0', '0', 0, '127.0.0.1', '2023-04-05 18:09:33', 'admin', '2023-02-28 09:46:12', '', '2023-04-05 18:09:33', '管理员');
INSERT INTO `sys_user` VALUES ('563785612117671936', '553692142187315200', '563785611970871296', 'DOMAIN_COMP', 'DOMAIN_COMP管理员', '00', '', '', '0', '', 'black', '$2a$10$4wqpDVkLsdOrcvPHIDuzYeZCOn6G1896klyOespqS2eIZOPTVeddO', 'wQBRGQsUgenaYPLmExiTRm9MZ8XhcTmDHu4BAIzRJj8=', NULL, '0', '0', 0, '', NULL, 'admin', '2023-04-05 18:02:44', '', NULL, NULL);

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
INSERT INTO `sys_user_role` VALUES ('563785612117671936', '554451769334169600');

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
