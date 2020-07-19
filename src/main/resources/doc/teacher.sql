/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : teacher

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 19/07/2020 15:36:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES (101, '研发部门', 111, '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-07-17 14:31:39');
INSERT INTO `tbl_dept` VALUES (102, '市场部门', 2, '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00');
INSERT INTO `tbl_dept` VALUES (103, '测试部门', 3, '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00');
INSERT INTO `tbl_dept` VALUES (104, '财务部门', 4, '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00');
INSERT INTO `tbl_dept` VALUES (105, '运维部门', 5, '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for tbl_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE `tbl_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1019 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_menu
-- ----------------------------
INSERT INTO `tbl_menu` VALUES (1, '系统管理', 0, 1, '#', 'M', '0', '', 'layui-icon-set', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `tbl_menu` VALUES (2, '系统监控', 0, 2, '#', 'M', '0', '', 'layui-icon-camera-fill', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `tbl_menu` VALUES (100, '用户管理', 1, 2, '/user/toShowUser', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `tbl_menu` VALUES (101, '角色管理', 1, 1, '/role/toShowRole', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `tbl_menu` VALUES (102, '菜单管理', 1, 3, '/menu/toShowMenu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `tbl_menu` VALUES (103, '部门管理', 1, 4, '/dept/toShowDept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `tbl_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `tbl_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `tbl_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `tbl_menu` VALUES (1000, '用户查询', 100, 1, '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1001, '用户新增', 100, 2, '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1002, '用户修改', 100, 3, '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1003, '用户删除', 100, 4, '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1004, '用户导出', 100, 5, '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1005, '重置密码', 100, 6, '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1006, '角色查询', 101, 1, '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1007, '角色新增', 101, 2, '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1008, '角色修改', 101, 3, '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1009, '角色删除', 101, 4, '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1010, '角色导出', 101, 5, '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1011, '菜单查询', 102, 1, '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1012, '菜单新增', 102, 2, '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1013, '菜单修改', 102, 3, '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1014, '菜单删除', 102, 4, '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1015, '部门查询', 103, 1, '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1016, '部门新增', 103, 2, '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1017, '部门修改', 103, 3, '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `tbl_menu` VALUES (1018, '部门删除', 103, 4, '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for tbl_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_role
-- ----------------------------
INSERT INTO `tbl_role` VALUES (1, '管理员', 'admin', 1, '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '管理员');
INSERT INTO `tbl_role` VALUES (2, '普通角色', 'common', 2, '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-08-07 16:24:20', '普通角色');
INSERT INTO `tbl_role` VALUES (3, '测试角色', 'ceshi', 3, '0', '0', 'admin', '2019-12-31 15:40:32', 'admin', '2019-12-31 15:42:14', '');

-- ----------------------------
-- Table structure for tbl_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role_menu`;
CREATE TABLE `tbl_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_role_menu
-- ----------------------------
INSERT INTO `tbl_role_menu` VALUES (1, 1);
INSERT INTO `tbl_role_menu` VALUES (1, 2);
INSERT INTO `tbl_role_menu` VALUES (1, 100);
INSERT INTO `tbl_role_menu` VALUES (1, 101);
INSERT INTO `tbl_role_menu` VALUES (1, 102);
INSERT INTO `tbl_role_menu` VALUES (1, 103);
INSERT INTO `tbl_role_menu` VALUES (1, 109);
INSERT INTO `tbl_role_menu` VALUES (1, 111);
INSERT INTO `tbl_role_menu` VALUES (1, 112);
INSERT INTO `tbl_role_menu` VALUES (1, 1000);
INSERT INTO `tbl_role_menu` VALUES (1, 1001);
INSERT INTO `tbl_role_menu` VALUES (1, 1002);
INSERT INTO `tbl_role_menu` VALUES (1, 1003);
INSERT INTO `tbl_role_menu` VALUES (1, 1004);
INSERT INTO `tbl_role_menu` VALUES (1, 1005);
INSERT INTO `tbl_role_menu` VALUES (1, 1006);
INSERT INTO `tbl_role_menu` VALUES (1, 1007);
INSERT INTO `tbl_role_menu` VALUES (1, 1008);
INSERT INTO `tbl_role_menu` VALUES (1, 1009);
INSERT INTO `tbl_role_menu` VALUES (1, 1010);
INSERT INTO `tbl_role_menu` VALUES (1, 1011);
INSERT INTO `tbl_role_menu` VALUES (1, 1012);
INSERT INTO `tbl_role_menu` VALUES (1, 1013);
INSERT INTO `tbl_role_menu` VALUES (1, 1014);
INSERT INTO `tbl_role_menu` VALUES (1, 1015);
INSERT INTO `tbl_role_menu` VALUES (1, 1016);
INSERT INTO `tbl_role_menu` VALUES (1, 1017);
INSERT INTO `tbl_role_menu` VALUES (1, 1018);
INSERT INTO `tbl_role_menu` VALUES (2, 1);
INSERT INTO `tbl_role_menu` VALUES (2, 100);
INSERT INTO `tbl_role_menu` VALUES (2, 101);
INSERT INTO `tbl_role_menu` VALUES (2, 1001);
INSERT INTO `tbl_role_menu` VALUES (2, 1002);
INSERT INTO `tbl_role_menu` VALUES (2, 1003);

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, 101, 'admin', '豆豆', '86521760@qq.com', '18538062907', '0', NULL, '280111d7f4fa14ff76606fe1ffa4d782', '9ed6610c-6132-4d0c-a8a4-5011080ba754', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-01-01 21:15:13', '管理员');
INSERT INTO `tbl_user` VALUES (3, 101, 'chenjian', '陈建', 'chenjian3822515@163.com', '18538062906', '0', NULL, 'f4a77e1417b03bf32d4b33a137282093', '4bd21f', '0', '0', 'admin', '2019-04-18 11:48:31', 'admin', '2019-08-07 12:31:29', '我');
INSERT INTO `tbl_user` VALUES (4, 101, 'root2', '张三', '86587432@qq.com', '18538062999', '0', NULL, '3512abbc9c7c8daa4c3560e79f8d1858', '568629be-6ca4-46eb-baaf-f6fea4c23d74', '0', '0', 'admin', '2019-08-07 15:46:18', 'admin', '2019-08-07 16:24:29', '');
INSERT INTO `tbl_user` VALUES (15, 102, 'zhangsan', '张三', '8656843@qq.com', '18538062907', '0', NULL, 'baa0fb07cc9cff4560527676336cd35a', 'e3305f06-12c5-46df-81fe-0957756b5a2f', '0', '1', 'admin', '2020-07-19 14:35:43', '', NULL, '5435');
INSERT INTO `tbl_user` VALUES (16, 106, 'lisi', '李四', '8655643@qq.com', '18538062907', '1', NULL, 'd091038f8f909f12b536dbe9e3f9cc42', '3501799b-326b-4ab0-8240-08870869ea8e', '0', '1', 'admin', '2020-07-19 14:40:56', '', NULL, '324124');

-- ----------------------------
-- Table structure for tbl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_role`;
CREATE TABLE `tbl_user_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_user_role
-- ----------------------------
INSERT INTO `tbl_user_role` VALUES (1, 1);
INSERT INTO `tbl_user_role` VALUES (2, 2);
INSERT INTO `tbl_user_role` VALUES (3, 2);
INSERT INTO `tbl_user_role` VALUES (3, 3);
INSERT INTO `tbl_user_role` VALUES (4, 2);
INSERT INTO `tbl_user_role` VALUES (9, 1);
INSERT INTO `tbl_user_role` VALUES (9, 2);
INSERT INTO `tbl_user_role` VALUES (9, 3);
INSERT INTO `tbl_user_role` VALUES (10, 1);
INSERT INTO `tbl_user_role` VALUES (10, 2);
INSERT INTO `tbl_user_role` VALUES (10, 3);
INSERT INTO `tbl_user_role` VALUES (11, 0);
INSERT INTO `tbl_user_role` VALUES (11, 1);
INSERT INTO `tbl_user_role` VALUES (11, 2);
INSERT INTO `tbl_user_role` VALUES (11, 3);
INSERT INTO `tbl_user_role` VALUES (13, 1);
INSERT INTO `tbl_user_role` VALUES (13, 2);
INSERT INTO `tbl_user_role` VALUES (13, 3);
INSERT INTO `tbl_user_role` VALUES (14, 1);
INSERT INTO `tbl_user_role` VALUES (14, 2);
INSERT INTO `tbl_user_role` VALUES (14, 3);
INSERT INTO `tbl_user_role` VALUES (15, 1);
INSERT INTO `tbl_user_role` VALUES (15, 2);
INSERT INTO `tbl_user_role` VALUES (15, 3);
INSERT INTO `tbl_user_role` VALUES (16, 1);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (17, 'root2', '3512abbc9c7c8daa4c3560e79f8d1858', '568629be-6ca4-46eb-baaf-f6fea4c23d74');
INSERT INTO `userinfo` VALUES (18, 'admin', '280111d7f4fa14ff76606fe1ffa4d782', '9ed6610c-6132-4d0c-a8a4-5011080ba754');
INSERT INTO `userinfo` VALUES (22, 'zhangsan0', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (23, 'zhangsan1', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (24, 'zhangsan2', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (25, 'zhangsan3', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (26, 'zhangsan4', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (27, 'zhangsan5', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (28, 'zhangsan6', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (29, 'zhangsan7', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (30, 'zhangsan8', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (31, 'zhangsan9', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (32, 'zhangsan10', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (33, 'zhangsan11', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (34, 'zhangsan12', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (35, 'zhangsan13', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (36, 'zhangsan14', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (37, 'zhangsan15', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (38, 'zhangsan16', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (39, 'zhangsan17', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (40, 'zhangsan18', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (41, 'zhangsan19', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (42, 'zhangsan20', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (43, 'zhangsan21', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (44, 'zhangsan22', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (45, 'zhangsan23', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (46, 'zhangsan24', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (47, 'zhangsan25', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (48, 'zhangsan26', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (49, 'zhangsan27', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (50, 'zhangsan28', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (51, 'zhangsan29', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (52, 'zhangsan30', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (53, 'zhangsan31', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (54, 'zhangsan32', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (55, 'zhangsan33', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (56, 'zhangsan34', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (57, 'zhangsan35', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (58, 'zhangsan36', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (59, 'zhangsan37', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (60, 'zhangsan38', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (61, 'zhangsan39', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (62, 'zhangsan40', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (63, 'zhangsan41', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (64, 'zhangsan42', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (65, 'zhangsan43', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (66, 'zhangsan44', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (67, 'zhangsan45', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (68, 'zhangsan46', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (69, 'zhangsan47', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (70, 'zhangsan48', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (71, 'zhangsan49', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (72, 'zhangsan50', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (73, 'zhangsan51', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (74, 'zhangsan52', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (75, 'zhangsan53', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (76, 'zhangsan54', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (77, 'zhangsan55', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (78, 'zhangsan56', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (79, 'zhangsan57', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (80, 'zhangsan58', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (81, 'zhangsan59', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (82, 'zhangsan60', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (83, 'zhangsan61', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (84, 'zhangsan62', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (85, 'zhangsan63', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (86, 'zhangsan64', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (87, 'zhangsan65', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (88, 'zhangsan66', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (89, 'zhangsan67', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (90, 'zhangsan68', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (91, 'zhangsan69', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (92, 'zhangsan70', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (93, 'zhangsan71', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (94, 'zhangsan72', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (95, 'zhangsan73', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (96, 'zhangsan74', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (97, 'zhangsan75', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (98, 'zhangsan76', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (99, 'zhangsan77', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (100, 'zhangsan78', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (101, 'zhangsan79', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (102, 'zhangsan80', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (103, 'zhangsan81', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (104, 'zhangsan82', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (105, 'zhangsan83', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (106, 'zhangsan84', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (107, 'zhangsan85', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (108, 'zhangsan86', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (109, 'zhangsan87', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (110, 'zhangsan88', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (111, 'zhangsan89', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (112, 'zhangsan90', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (113, 'zhangsan91', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (114, 'zhangsan92', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (115, 'zhangsan93', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (116, 'zhangsan94', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (117, 'zhangsan95', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (118, 'zhangsan96', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (119, 'zhangsan97', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (120, 'zhangsan98', 'mima', 'fdsjalff');
INSERT INTO `userinfo` VALUES (121, 'zhangsan99', 'mima', 'fdsjalff');

SET FOREIGN_KEY_CHECKS = 1;
