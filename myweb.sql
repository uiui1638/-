/*
 Navicat Premium Dump SQL

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : myweb

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 09/09/2024 21:05:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_admin
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin`;
CREATE TABLE `cms_admin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `salt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'black' COMMENT '系统主题',
  `mobile` bigint(11) NULL DEFAULT 0,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `did` int(11) NOT NULL DEFAULT 0 COMMENT '部门id',
  `position_id` int(11) NOT NULL DEFAULT 0 COMMENT '职位id',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  `last_login_time` int(11) NOT NULL DEFAULT 0,
  `login_num` int(11) NOT NULL DEFAULT 0,
  `last_login_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1正常,0禁止登录,-1删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_admin
-- ----------------------------
INSERT INTO `cms_admin` VALUES (1, 'admin', '1bb8811bb4ad8cee14475c59d2df9d2c', '8E3dgsvr0YRT46filNFJ', '超级管理员', '/static/admin/images/icon.png', 'black', 0, '', NULL, 1, 1, 1699194293, 1699194293, 1725757679, 20, '127.0.0.1', 1);
INSERT INTO `cms_admin` VALUES (2, 'macro', 'c3ba8d31b12b1ea99ae9ab3d55e44155', '6zBPUe2FZjpNHDtaCyfu', '曾辉', '/storage/avatars/avatar_256_H7elKyuFGO1699194768.png', 'black', 13111111111, '', '', 1, 1, 0, 0, 1725873926, 55, '127.0.0.1', 1);
INSERT INTO `cms_admin` VALUES (4, 'zh', '228f9f44779d320c04845d83da7e7e0a', 'w47VnMZW5CrEgxoJpGOI', 'zh', '/storage/avatars/avatar_256_roLfeuSpbH1699701617.png', 'black', 1, '', '', 1, 1, 0, 0, 1725709505, 29, '127.0.0.1', 1);
INSERT INTO `cms_admin` VALUES (5, '1', 'a3aefee5227cb6b30bfb88db1a5965e3', 'BjfYUv3i0QrdFZ2lNbIy', '1', '/storage/avatars/avatar_256_8UMg136arB1725710143.png', 'black', 0, '', '', 0, 0, 0, 1725757536, 0, 0, '', -1);

-- ----------------------------
-- Table structure for cms_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin_group`;
CREATE TABLE `cms_admin_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `rules` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户组拥有的规则id， 多个规则\",\"隔开',
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_admin_group
-- ----------------------------
INSERT INTO `cms_admin_group` VALUES (1, '超级管理员', 1, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,118', '超级管理员，系统自动分配所有可操作权限及菜单。', 0, 0);
INSERT INTO `cms_admin_group` VALUES (3, '管理员', 1, '1,17,18,19,20,21,22,29,30,31,32,2,46,47,48,49,50,51,52,4,79,80,81,82,83,84,85,86,87,5,88,89,92,93,94,95,96,6,97,98,99,100,101,102,103,104,105', '', 0, 0);
INSERT INTO `cms_admin_group` VALUES (4, '卖家', 1, '106,107,114,115,116,117,1,29,30,31,32', '', 0, 0);

-- ----------------------------
-- Table structure for cms_admin_group_access
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin_group_access`;
CREATE TABLE `cms_admin_group_access`  (
  `uid` int(11) UNSIGNED NULL DEFAULT NULL,
  `group_id` int(11) NULL DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限分组和管理员的关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_admin_group_access
-- ----------------------------
INSERT INTO `cms_admin_group_access` VALUES (1, 1, 0, 0);
INSERT INTO `cms_admin_group_access` VALUES (2, 3, 0, 0);
INSERT INTO `cms_admin_group_access` VALUES (3, 4, 0, 0);
INSERT INTO `cms_admin_group_access` VALUES (5, 4, 0, 0);
INSERT INTO `cms_admin_group_access` VALUES (4, 4, 0, 0);

-- ----------------------------
-- Table structure for cms_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin_log`;
CREATE TABLE `cms_admin_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作类型',
  `action` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作动作',
  `subject` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作主体',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作描述',
  `module` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `function` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `rule_menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '节点权限路径',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录ip',
  `param_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作数据id',
  `param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数json格式',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0删除 1正常',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 295 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_admin_log
-- ----------------------------
INSERT INTO `cms_admin_log` VALUES (199, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2023-12-03 19:29:44登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1701602984,\"last_login_ip\":\"127.0.0.1\",\"login_num\":36}', 1, 1701602984);
INSERT INTO `cms_admin_log` VALUES (200, 2, '曾辉', 'add', '新增', '功能节点', '新建/编辑', '曾辉在2023-12-03 19:31:19新增了功能节点', 'admin', 'rule', 'add', '', '127.0.0.1', 118, '{\"pid\":\"1\",\"menu\":\"1\",\"title\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"name\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"src\":\"admin\\/filers\\/index\",\"sort\":\"0\",\"icon\":\"\",\"id\":\"0\",\"create_time\":1701603079}', 1, 1701603079);
INSERT INTO `cms_admin_log` VALUES (201, 2, '曾辉', 'edit', '编辑', '权限角色', '新建/编辑', '曾辉在2023-12-03 19:31:37编辑了权限角色', 'admin', 'role', 'add', '', '127.0.0.1', 3, '{\"id\":\"3\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"status\":\"1\",\"rule\":{\"12\":\"1\",\"13\":\"118\",\"14\":\"17\",\"15\":\"18\",\"16\":\"19\",\"17\":\"20\",\"18\":\"21\",\"19\":\"22\",\"20\":\"29\",\"21\":\"30\",\"22\":\"31\",\"23\":\"32\",\"24\":\"4\",\"25\":\"79\",\"26\":\"80\",\"27\":\"81\",\"28\":\"82\",\"29\":\"83\",\"30\":\"84\",\"31\":\"85\",\"32\":\"86\",\"33\":\"87\",\"34\":\"5\",\"35\":\"88\",\"36\":\"89\",\"39\":\"92\",\"40\":\"93\",\"41\":\"94\",\"42\":\"95\",\"43\":\"96\",\"44\":\"6\",\"45\":\"97\",\"46\":\"98\",\"47\":\"99\",\"48\":\"100\",\"49\":\"101\",\"50\":\"102\",\"51\":\"103\",\"52\":\"104\",\"53\":\"105\"},\"desc\":\"\",\"rules\":\"1,118,17,18,19,20,21,22,29,30,31,32,4,79,80,81,82,83,84,85,86,87,5,88,89,92,93,94,95,96,6,97,98,99,100,101,102,103,104,105\"}', 1, 1701603097);
INSERT INTO `cms_admin_log` VALUES (202, 2, '曾辉', 'edit', '编辑', '功能节点', '新建/编辑', '曾辉在2023-12-03 19:32:04编辑了功能节点', 'admin', 'rule', 'add', '', '127.0.0.1', 118, '{\"pid\":\"1\",\"menu\":\"1\",\"title\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"name\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"src\":\"admin\\/filer\\/index\",\"sort\":\"0\",\"icon\":\"\",\"id\":\"118\"}', 1, 1701603124);
INSERT INTO `cms_admin_log` VALUES (203, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2023-12-03 19:32:21登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1701603141,\"last_login_ip\":\"127.0.0.1\",\"login_num\":37}', 1, 1701603141);
INSERT INTO `cms_admin_log` VALUES (204, 2, '曾辉', 'edit', '编辑', '功能节点', '新建/编辑', '曾辉在2023-12-03 19:32:40编辑了功能节点', 'admin', 'rule', 'add', '', '127.0.0.1', 118, '{\"pid\":\"1\",\"menu\":\"1\",\"title\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"name\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"src\":\"admin\\/files\\/index\",\"sort\":\"0\",\"icon\":\"\",\"id\":\"118\"}', 1, 1701603160);
INSERT INTO `cms_admin_log` VALUES (205, 2, '曾辉', 'delete', '删除', '功能节点', '删除', '曾辉在2023-12-03 19:36:03删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 118, '[]', 1, 1701603363);
INSERT INTO `cms_admin_log` VALUES (206, 2, '曾辉', 'edit', '编辑', '功能节点', '新建/编辑', '曾辉在2023-12-03 19:36:13编辑了功能节点', 'admin', 'rule', 'add', '', '127.0.0.1', 46, '{\"pid\":\"0\",\"menu\":\"1\",\"title\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"name\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"src\":\"admin\\/files\\/index\",\"sort\":\"1\",\"icon\":\"ri-file-list-line\",\"id\":\"46\"}', 1, 1701603373);
INSERT INTO `cms_admin_log` VALUES (207, 2, '曾辉', 'edit', '编辑', '权限角色', '新建/编辑', '曾辉在2023-12-03 19:36:41编辑了权限角色', 'admin', 'role', 'add', '', '127.0.0.1', 3, '{\"id\":\"3\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"status\":\"1\",\"rule\":{\"12\":\"1\",\"13\":\"17\",\"14\":\"18\",\"15\":\"19\",\"16\":\"20\",\"17\":\"21\",\"18\":\"22\",\"19\":\"29\",\"20\":\"30\",\"21\":\"31\",\"22\":\"32\",\"23\":\"46\",\"24\":\"47\",\"25\":\"48\",\"26\":\"49\",\"27\":\"50\",\"28\":\"51\",\"29\":\"52\",\"30\":\"4\",\"31\":\"79\",\"32\":\"80\",\"33\":\"81\",\"34\":\"82\",\"35\":\"83\",\"36\":\"84\",\"37\":\"85\",\"38\":\"86\",\"39\":\"87\",\"40\":\"5\",\"41\":\"88\",\"42\":\"89\",\"45\":\"92\",\"46\":\"93\",\"47\":\"94\",\"48\":\"95\",\"49\":\"96\",\"50\":\"6\",\"51\":\"97\",\"52\":\"98\",\"53\":\"99\",\"54\":\"100\",\"55\":\"101\",\"56\":\"102\",\"57\":\"103\",\"58\":\"104\",\"59\":\"105\"},\"desc\":\"\",\"rules\":\"1,17,18,19,20,21,22,29,30,31,32,46,47,48,49,50,51,52,4,79,80,81,82,83,84,85,86,87,5,88,89,92,93,94,95,96,6,97,98,99,100,101,102,103,104,105\"}', 1, 1701603401);
INSERT INTO `cms_admin_log` VALUES (208, 2, '曾辉', 'edit', '编辑', '功能节点', '新建/编辑', '曾辉在2023-12-03 19:37:19编辑了功能节点', 'admin', 'rule', 'add', '', '127.0.0.1', 47, '{\"pid\":\"46\",\"menu\":\"1\",\"title\":\"\\u7f16\\u8f91\\u9644\\u4ef6\",\"name\":\"\\u9644\\u4ef6\",\"src\":\"admin\\/files\\/edit\",\"sort\":\"1\",\"icon\":\"\",\"id\":\"47\"}', 1, 1701603439);
INSERT INTO `cms_admin_log` VALUES (209, 2, '曾辉', 'edit', '编辑', '功能节点', '新建/编辑', '曾辉在2023-12-03 19:39:27编辑了功能节点', 'admin', 'rule', 'add', '', '127.0.0.1', 46, '{\"pid\":\"2\",\"menu\":\"1\",\"title\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"name\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"src\":\"admin\\/files\\/index\",\"sort\":\"1\",\"icon\":\"ri-file-list-line\",\"id\":\"46\"}', 1, 1701603567);
INSERT INTO `cms_admin_log` VALUES (210, 2, '曾辉', 'edit', '编辑', '功能节点', '新建/编辑', '曾辉在2023-12-03 19:39:43编辑了功能节点', 'admin', 'rule', 'add', '', '127.0.0.1', 47, '{\"pid\":\"46\",\"menu\":\"2\",\"title\":\"\\u7f16\\u8f91\\u9644\\u4ef6\",\"name\":\"\\u9644\\u4ef6\",\"src\":\"admin\\/files\\/edit\",\"sort\":\"1\",\"icon\":\"\",\"id\":\"47\"}', 1, 1701603583);
INSERT INTO `cms_admin_log` VALUES (211, 2, '曾辉', 'edit', '编辑', '权限角色', '新建/编辑', '曾辉在2023-12-03 19:39:53编辑了权限角色', 'admin', 'role', 'add', '', '127.0.0.1', 3, '{\"id\":\"3\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"status\":\"1\",\"rule\":{\"12\":\"1\",\"13\":\"17\",\"14\":\"18\",\"15\":\"19\",\"16\":\"20\",\"17\":\"21\",\"18\":\"22\",\"19\":\"29\",\"20\":\"30\",\"21\":\"31\",\"22\":\"32\",\"23\":\"2\",\"24\":\"46\",\"25\":\"47\",\"26\":\"48\",\"27\":\"49\",\"28\":\"50\",\"29\":\"51\",\"30\":\"52\",\"31\":\"4\",\"32\":\"79\",\"33\":\"80\",\"34\":\"81\",\"35\":\"82\",\"36\":\"83\",\"37\":\"84\",\"38\":\"85\",\"39\":\"86\",\"40\":\"87\",\"41\":\"5\",\"42\":\"88\",\"43\":\"89\",\"46\":\"92\",\"47\":\"93\",\"48\":\"94\",\"49\":\"95\",\"50\":\"96\",\"51\":\"6\",\"52\":\"97\",\"53\":\"98\",\"54\":\"99\",\"55\":\"100\",\"56\":\"101\",\"57\":\"102\",\"58\":\"103\",\"59\":\"104\",\"60\":\"105\"},\"desc\":\"\",\"rules\":\"1,17,18,19,20,21,22,29,30,31,32,2,46,47,48,49,50,51,52,4,79,80,81,82,83,84,85,86,87,5,88,89,92,93,94,95,96,6,97,98,99,100,101,102,103,104,105\"}', 1, 1701603593);
INSERT INTO `cms_admin_log` VALUES (212, 2, '曾辉', 'add', '新增', '附件分组', '新建/编辑', '曾辉在2023-12-03 19:41:25新增了附件分组', 'admin', 'files', 'add_group', '', '127.0.0.1', 2, '{\"id\":\"0\",\"title\":\"test\"}', 1, 1701603685);
INSERT INTO `cms_admin_log` VALUES (213, 2, '曾辉', 'edit', '编辑', '功能节点', '新建/编辑', '曾辉在2023-12-03 19:42:36编辑了功能节点', 'admin', 'rule', 'add', '', '127.0.0.1', 46, '{\"pid\":\"1\",\"menu\":\"1\",\"title\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"name\":\"\\u9644\\u4ef6\\u7ba1\\u7406\",\"src\":\"admin\\/files\\/index\",\"sort\":\"1\",\"icon\":\"ri-file-list-line\",\"id\":\"46\"}', 1, 1701603756);
INSERT INTO `cms_admin_log` VALUES (214, 2, '曾辉', 'delete', '删除', '功能节点', '删除', '曾辉在2023-12-03 19:42:49删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 2, '[]', 1, 1701603769);
INSERT INTO `cms_admin_log` VALUES (215, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-04 07:53:27登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1701647607,\"last_login_ip\":\"127.0.0.1\",\"login_num\":13}', 1, 1701647607);
INSERT INTO `cms_admin_log` VALUES (216, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-04 08:49:10登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1701650950,\"last_login_ip\":\"127.0.0.1\",\"login_num\":14}', 1, 1701650950);
INSERT INTO `cms_admin_log` VALUES (217, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2023-12-04 08:49:19登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1701650959,\"last_login_ip\":\"127.0.0.1\",\"login_num\":38}', 1, 1701650959);
INSERT INTO `cms_admin_log` VALUES (218, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-04 09:08:53登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1701652133,\"last_login_ip\":\"127.0.0.1\",\"login_num\":15}', 1, 1701652133);
INSERT INTO `cms_admin_log` VALUES (219, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2023-12-04 09:37:52登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1701653872,\"last_login_ip\":\"127.0.0.1\",\"login_num\":39}', 1, 1701653872);
INSERT INTO `cms_admin_log` VALUES (220, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2023-12-04 09:52:22登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1701654742,\"last_login_ip\":\"127.0.0.1\",\"login_num\":40}', 1, 1701654742);
INSERT INTO `cms_admin_log` VALUES (221, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-05 13:47:55登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1701755275,\"last_login_ip\":\"127.0.0.1\",\"login_num\":16}', 1, 1701755275);
INSERT INTO `cms_admin_log` VALUES (222, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-05 14:04:34登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1701756274,\"last_login_ip\":\"127.0.0.1\",\"login_num\":17}', 1, 1701756274);
INSERT INTO `cms_admin_log` VALUES (223, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2023-12-06 19:11:17登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1701861077,\"last_login_ip\":\"127.0.0.1\",\"login_num\":41}', 1, 1701861077);
INSERT INTO `cms_admin_log` VALUES (224, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-07 10:08:53登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1701914933,\"last_login_ip\":\"127.0.0.1\",\"login_num\":18}', 1, 1701914933);
INSERT INTO `cms_admin_log` VALUES (225, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-07 10:36:47登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1701916607,\"last_login_ip\":\"127.0.0.1\",\"login_num\":19}', 1, 1701916607);
INSERT INTO `cms_admin_log` VALUES (226, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-11 07:49:08登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1702252148,\"last_login_ip\":\"127.0.0.1\",\"login_num\":20}', 1, 1702252148);
INSERT INTO `cms_admin_log` VALUES (227, 4, 'zh', 'upload', '上传', '文件', '', 'zh在2023-12-11 09:17:52上传了文件', 'admin', 'api', 'upload', '', '127.0.0.1', 4, '{\"filepath\":\"\\/storage\\/202312\\/640e17b77acc6d45beb9d6372c7e0d59.png\",\"name\":\"\\u4e0a\\u8bfe\\u65f6\\u95f4\\u8868.png\",\"mimetype\":\"image\\/png\",\"fileext\":\"png\",\"filesize\":70922,\"filename\":\"202312\\/640e17b77acc6d45beb9d6372c7e0d59.png\",\"sha1\":\"69c52134a0d64c05c01c439e30c9b60749cb57c1\",\"md5\":\"640e17b77acc6d45beb9d6372c7e0d59\",\"module\":\"admin\",\"action\":\"upload\",\"uploadip\":\"127.0.0.1\",\"create_time\":1702257472,\"user_id\":4,\"status\":1,\"admin_id\":4,\"audit_time\":1702257472,\"use\":\"thumb\"}', 1, 1702257472);
INSERT INTO `cms_admin_log` VALUES (228, 4, 'zh', 'upload', '上传', '文件', '', 'zh在2023-12-11 09:18:14上传了文件', 'admin', 'api', 'upload', '', '127.0.0.1', 4, '{\"filepath\":\"\\/storage\\/202312\\/640e17b77acc6d45beb9d6372c7e0d59.png\",\"name\":\"\\u4e0a\\u8bfe\\u65f6\\u95f4\\u8868.png\",\"mimetype\":\"image\\/png\",\"fileext\":\"png\",\"filesize\":70922,\"filename\":\"202312\\/640e17b77acc6d45beb9d6372c7e0d59.png\",\"sha1\":\"69c52134a0d64c05c01c439e30c9b60749cb57c1\",\"md5\":\"640e17b77acc6d45beb9d6372c7e0d59\",\"module\":\"admin\",\"action\":\"upload\",\"uploadip\":\"127.0.0.1\",\"create_time\":1702257494,\"user_id\":4,\"status\":1,\"admin_id\":4,\"audit_time\":1702257494,\"use\":\"thumb\"}', 1, 1702257494);
INSERT INTO `cms_admin_log` VALUES (229, 4, 'zh', 'upload', '上传', '文件', '', 'zh在2023-12-11 09:18:45上传了文件', 'admin', 'api', 'upload', '', '127.0.0.1', 4, '{\"filepath\":\"\\/storage\\/202312\\/640e17b77acc6d45beb9d6372c7e0d59.png\",\"name\":\"\\u4e0a\\u8bfe\\u65f6\\u95f4\\u8868.png\",\"mimetype\":\"image\\/png\",\"fileext\":\"png\",\"filesize\":70922,\"filename\":\"202312\\/640e17b77acc6d45beb9d6372c7e0d59.png\",\"sha1\":\"69c52134a0d64c05c01c439e30c9b60749cb57c1\",\"md5\":\"640e17b77acc6d45beb9d6372c7e0d59\",\"module\":\"admin\",\"action\":\"upload\",\"uploadip\":\"127.0.0.1\",\"create_time\":1702257525,\"user_id\":4,\"status\":1,\"admin_id\":4,\"audit_time\":1702257525,\"use\":\"thumb\"}', 1, 1702257525);
INSERT INTO `cms_admin_log` VALUES (230, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-11 11:24:35登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1702265075,\"last_login_ip\":\"127.0.0.1\",\"login_num\":21}', 1, 1702265075);
INSERT INTO `cms_admin_log` VALUES (231, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-12 10:37:27登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1702348647,\"last_login_ip\":\"127.0.0.1\",\"login_num\":22}', 1, 1702348647);
INSERT INTO `cms_admin_log` VALUES (232, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-12 13:45:33登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1702359933,\"last_login_ip\":\"127.0.0.1\",\"login_num\":23}', 1, 1702359933);
INSERT INTO `cms_admin_log` VALUES (233, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2023-12-12 15:05:22登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1702364721,\"last_login_ip\":\"127.0.0.1\",\"login_num\":42}', 1, 1702364722);
INSERT INTO `cms_admin_log` VALUES (234, 4, 'zh', 'login', '登录', '系统', '', 'zh在2023-12-14 09:52:45登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1702518765,\"last_login_ip\":\"127.0.0.1\",\"login_num\":24}', 1, 1702518765);
INSERT INTO `cms_admin_log` VALUES (235, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2023-12-18 08:06:07登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1702857967,\"last_login_ip\":\"127.0.0.1\",\"login_num\":43}', 1, 1702857967);
INSERT INTO `cms_admin_log` VALUES (236, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-01-11 08:48:35登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1704934115,\"last_login_ip\":\"127.0.0.1\",\"login_num\":44}', 1, 1704934115);
INSERT INTO `cms_admin_log` VALUES (237, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-01-11 09:01:15登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1704934875,\"last_login_ip\":\"127.0.0.1\",\"login_num\":45}', 1, 1704934875);
INSERT INTO `cms_admin_log` VALUES (238, 1, '超级管理员', 'login', '登录', '系统', '', '超级管理员在2024-09-07 18:44:07登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 1, '{\"last_login_time\":1725705847,\"last_login_ip\":\"127.0.0.1\",\"login_num\":11}', 1, 1725705847);
INSERT INTO `cms_admin_log` VALUES (239, 4, 'zh', 'login', '登录', '系统', '', 'zh在2024-09-07 18:44:45登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1725705885,\"last_login_ip\":\"127.0.0.1\",\"login_num\":25}', 1, 1725705885);
INSERT INTO `cms_admin_log` VALUES (240, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-09-07 18:49:00登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1725706140,\"last_login_ip\":\"127.0.0.1\",\"login_num\":46}', 1, 1725706140);
INSERT INTO `cms_admin_log` VALUES (241, 4, 'zh', 'login', '登录', '系统', '', 'zh在2024-09-07 18:49:17登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1725706157,\"last_login_ip\":\"127.0.0.1\",\"login_num\":26}', 1, 1725706157);
INSERT INTO `cms_admin_log` VALUES (242, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-09-07 18:54:23登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1725706463,\"last_login_ip\":\"127.0.0.1\",\"login_num\":47}', 1, 1725706463);
INSERT INTO `cms_admin_log` VALUES (243, 1, '超级管理员', 'login', '登录', '系统', '', '超级管理员在2024-09-07 19:08:40登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 1, '{\"last_login_time\":1725707320,\"last_login_ip\":\"127.0.0.1\",\"login_num\":12}', 1, 1725707320);
INSERT INTO `cms_admin_log` VALUES (244, 4, 'zh', 'login', '登录', '系统', '', 'zh在2024-09-07 19:14:52登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1725707692,\"last_login_ip\":\"127.0.0.1\",\"login_num\":27}', 1, 1725707692);
INSERT INTO `cms_admin_log` VALUES (245, 1, '超级管理员', 'login', '登录', '系统', '', '超级管理员在2024-09-07 19:33:45登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 1, '{\"last_login_time\":1725708825,\"last_login_ip\":\"127.0.0.1\",\"login_num\":13}', 1, 1725708825);
INSERT INTO `cms_admin_log` VALUES (246, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:34:24删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 113, '[]', 1, 1725708864);
INSERT INTO `cms_admin_log` VALUES (247, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:34:30删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 111, '[]', 1, 1725708870);
INSERT INTO `cms_admin_log` VALUES (248, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:34:33删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 109, '[]', 1, 1725708873);
INSERT INTO `cms_admin_log` VALUES (249, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:34:38删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 112, '[]', 1, 1725708878);
INSERT INTO `cms_admin_log` VALUES (250, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:34:42删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 110, '[]', 1, 1725708882);
INSERT INTO `cms_admin_log` VALUES (251, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:34:46删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 108, '[]', 1, 1725708886);
INSERT INTO `cms_admin_log` VALUES (252, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:36:19删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 87, '[]', 1, 1725708979);
INSERT INTO `cms_admin_log` VALUES (253, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:36:22删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 86, '[]', 1, 1725708982);
INSERT INTO `cms_admin_log` VALUES (254, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:36:27删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 85, '[]', 1, 1725708987);
INSERT INTO `cms_admin_log` VALUES (255, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:36:30删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 84, '[]', 1, 1725708990);
INSERT INTO `cms_admin_log` VALUES (256, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:36:32删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 83, '[]', 1, 1725708992);
INSERT INTO `cms_admin_log` VALUES (257, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:36:35删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 82, '[]', 1, 1725708995);
INSERT INTO `cms_admin_log` VALUES (258, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:36:38删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 81, '[]', 1, 1725708998);
INSERT INTO `cms_admin_log` VALUES (259, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:36:40删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 80, '[]', 1, 1725709000);
INSERT INTO `cms_admin_log` VALUES (260, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:36:42删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 79, '[]', 1, 1725709002);
INSERT INTO `cms_admin_log` VALUES (261, 1, '超级管理员', 'delete', '删除', '功能节点', '删除', '超级管理员在2024-09-07 19:36:44删除了功能节点', 'admin', 'rule', 'delete', '', '127.0.0.1', 4, '[]', 1, 1725709004);
INSERT INTO `cms_admin_log` VALUES (262, 1, '超级管理员', 'login', '登录', '系统', '', '超级管理员在2024-09-07 19:38:35登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 1, '{\"last_login_time\":1725709115,\"last_login_ip\":\"127.0.0.1\",\"login_num\":14}', 1, 1725709115);
INSERT INTO `cms_admin_log` VALUES (263, 4, 'zh', 'login', '登录', '系统', '', 'zh在2024-09-07 19:39:31登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1725709171,\"last_login_ip\":\"127.0.0.1\",\"login_num\":28}', 1, 1725709171);
INSERT INTO `cms_admin_log` VALUES (264, 1, '超级管理员', 'login', '登录', '系统', '', '超级管理员在2024-09-07 19:44:37登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 1, '{\"last_login_time\":1725709477,\"last_login_ip\":\"127.0.0.1\",\"login_num\":15}', 1, 1725709477);
INSERT INTO `cms_admin_log` VALUES (265, 4, 'zh', 'login', '登录', '系统', '', 'zh在2024-09-07 19:45:05登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 4, '{\"last_login_time\":1725709505,\"last_login_ip\":\"127.0.0.1\",\"login_num\":29}', 1, 1725709505);
INSERT INTO `cms_admin_log` VALUES (266, 1, '超级管理员', 'login', '登录', '系统', '', '超级管理员在2024-09-07 19:47:23登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 1, '{\"last_login_time\":1725709643,\"last_login_ip\":\"127.0.0.1\",\"login_num\":16}', 1, 1725709643);
INSERT INTO `cms_admin_log` VALUES (267, 1, '超级管理员', 'edit', '编辑', '权限角色', '新建/编辑', '超级管理员在2024-09-07 19:48:39编辑了权限角色', 'admin', 'role', 'add', '', '127.0.0.1', 4, '{\"id\":\"4\",\"title\":\"\\u5356\\u5bb6\",\"status\":\"1\",\"rule\":{\"0\":\"106\",\"1\":\"107\",\"2\":\"114\",\"3\":\"115\",\"4\":\"116\",\"5\":\"117\",\"6\":\"1\",\"13\":\"29\",\"14\":\"30\",\"15\":\"31\",\"16\":\"32\"},\"desc\":\"\",\"rules\":\"106,107,114,115,116,117,1,29,30,31,32\"}', 1, 1725709719);
INSERT INTO `cms_admin_log` VALUES (268, 4, 'zh', 'add', '新增', '系统用户', '添加/修改', 'zh在2024-09-07 19:55:43新增了系统用户', 'admin', 'admin', 'add', '', '127.0.0.1', 5, '{\"username\":\"1\",\"nickname\":\"1\",\"thumb\":\"\",\"file\":\"\",\"pwd\":\"a3aefee5227cb6b30bfb88db1a5965e3\",\"pwd_confirm\":\"1\",\"mobile\":\"\",\"email\":\"\",\"group_id\":{\"2\":\"4\"},\"status\":\"1\",\"desc\":\"\",\"salt\":\"BjfYUv3i0QrdFZ2lNbIy\"}', 1, 1725710143);
INSERT INTO `cms_admin_log` VALUES (269, 1, '超级管理员', 'login', '登录', '系统', '', '超级管理员在2024-09-07 19:59:38登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 1, '{\"last_login_time\":1725710378,\"last_login_ip\":\"127.0.0.1\",\"login_num\":17}', 1, 1725710378);
INSERT INTO `cms_admin_log` VALUES (270, 1, '超级管理员', 'login', '登录', '系统', '', '超级管理员在2024-09-07 19:59:55登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 1, '{\"last_login_time\":1725710395,\"last_login_ip\":\"127.0.0.1\",\"login_num\":18}', 1, 1725710395);
INSERT INTO `cms_admin_log` VALUES (271, 1, '超级管理员', 'view', '查看', '系统用户', '查看', '超级管理员在2024-09-07 20:01:02查看了系统用户', 'admin', 'admin', 'view', '', '127.0.0.1', 5, '[]', 1, 1725710462);
INSERT INTO `cms_admin_log` VALUES (272, 1, '超级管理员', 'edit', '编辑', '系统用户', '添加/修改', '超级管理员在2024-09-07 20:02:12编辑了系统用户', 'admin', 'admin', 'add', '', '127.0.0.1', 5, '{\"id\":\"5\",\"username\":\"1\",\"nickname\":\"1\",\"thumb\":\"\\/storage\\/avatars\\/avatar_256_8UMg136arB1725710143.png\",\"file\":\"\",\"edit_pwd\":\"\",\"edit_pwd_confirm\":\"\",\"mobile\":\"0\",\"email\":\"\",\"group_id\":{\"2\":\"4\"},\"status\":\"1\",\"desc\":\"\"}', 1, 1725710532);
INSERT INTO `cms_admin_log` VALUES (273, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-09-07 20:02:39登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1725710559,\"last_login_ip\":\"127.0.0.1\",\"login_num\":48}', 1, 1725710559);
INSERT INTO `cms_admin_log` VALUES (274, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-09-07 20:03:25登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1725710605,\"last_login_ip\":\"127.0.0.1\",\"login_num\":49}', 1, 1725710605);
INSERT INTO `cms_admin_log` VALUES (275, 1, '超级管理员', 'login', '登录', '系统', '', '超级管理员在2024-09-07 20:03:42登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 1, '{\"last_login_time\":1725710622,\"last_login_ip\":\"127.0.0.1\",\"login_num\":19}', 1, 1725710622);
INSERT INTO `cms_admin_log` VALUES (276, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-09-08 09:03:45登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1725757425,\"last_login_ip\":\"127.0.0.1\",\"login_num\":50}', 1, 1725757425);
INSERT INTO `cms_admin_log` VALUES (277, 2, '曾辉', 'upload', '上传', '文件', '', '曾辉在2024-09-08 09:04:14上传了文件', 'admin', 'api', 'upload', '', '127.0.0.1', 2, '{\"filepath\":\"\\/storage\\/202409\\/fae65bf1502cb1d51387bc1029a926a2.rar\",\"name\":\"2024\\u672c\\u79d1\\u6bd5\\u8bbe_\\u90b9\\u957f\\u519b.rar\",\"mimetype\":\"application\\/x-compressed\",\"fileext\":\"rar\",\"filesize\":9485279,\"filename\":\"202409\\/fae65bf1502cb1d51387bc1029a926a2.rar\",\"sha1\":\"5084396b2730e8e03a0afabcdfe07ddfa91ce596\",\"md5\":\"fae65bf1502cb1d51387bc1029a926a2\",\"module\":\"admin\",\"action\":\"upload\",\"uploadip\":\"127.0.0.1\",\"create_time\":1725757454,\"user_id\":2,\"status\":1,\"admin_id\":2,\"audit_time\":1725757454,\"use\":\"thumb\"}', 1, 1725757454);
INSERT INTO `cms_admin_log` VALUES (278, 2, '曾辉', 'delete', '删除', '系统用户', '删除', '曾辉在2024-09-08 09:05:36删除了系统用户', 'admin', 'admin', 'delete', '', '127.0.0.1', 5, '[]', 1, 1725757536);
INSERT INTO `cms_admin_log` VALUES (279, 2, '曾辉', 'edit', '编辑', '系统用户', '添加/修改', '曾辉在2024-09-08 09:06:24编辑了系统用户', 'admin', 'admin', 'add', '', '127.0.0.1', 4, '{\"id\":\"4\",\"username\":\"zh\",\"nickname\":\"zh\",\"thumb\":\"\\/storage\\/avatars\\/avatar_256_roLfeuSpbH1699701617.png\",\"file\":\"\",\"edit_pwd\":\"\",\"edit_pwd_confirm\":\"\",\"mobile\":\"1\",\"email\":\"\",\"group_id\":{\"1\":\"3\",\"2\":\"4\"},\"status\":\"1\",\"desc\":\"\"}', 1, 1725757584);
INSERT INTO `cms_admin_log` VALUES (280, 2, '曾辉', 'edit', '编辑', '系统用户', '添加/修改', '曾辉在2024-09-08 09:06:31编辑了系统用户', 'admin', 'admin', 'add', '', '127.0.0.1', 4, '{\"id\":\"4\",\"username\":\"zh\",\"nickname\":\"zh\",\"thumb\":\"\\/storage\\/avatars\\/avatar_256_roLfeuSpbH1699701617.png\",\"file\":\"\",\"edit_pwd\":\"\",\"edit_pwd_confirm\":\"\",\"mobile\":\"1\",\"email\":\"\",\"group_id\":{\"2\":\"4\"},\"status\":\"1\",\"desc\":\"\"}', 1, 1725757591);
INSERT INTO `cms_admin_log` VALUES (281, 2, '曾辉', 'view', '查看', '系统用户', '查看', '曾辉在2024-09-08 09:06:35查看了系统用户', 'admin', 'admin', 'view', '', '127.0.0.1', 2, '[]', 1, 1725757595);
INSERT INTO `cms_admin_log` VALUES (282, 2, '曾辉', 'view', '查看', '系统用户', '查看', '曾辉在2024-09-08 09:06:51查看了系统用户', 'admin', 'admin', 'view', '', '127.0.0.1', 2, '[]', 1, 1725757611);
INSERT INTO `cms_admin_log` VALUES (283, 2, '曾辉', 'view', '查看', '系统用户', '查看', '曾辉在2024-09-08 09:07:33查看了系统用户', 'admin', 'admin', 'view', '', '127.0.0.1', 2, '[]', 1, 1725757653);
INSERT INTO `cms_admin_log` VALUES (284, 1, '超级管理员', 'login', '登录', '系统', '', '超级管理员在2024-09-08 09:07:59登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 1, '{\"last_login_time\":1725757679,\"last_login_ip\":\"127.0.0.1\",\"login_num\":20}', 1, 1725757679);
INSERT INTO `cms_admin_log` VALUES (285, 1, '超级管理员', 'edit', '编辑', '文章分类', '编辑', '超级管理员在2024-09-08 09:08:41编辑了文章分类', 'admin', 'article_cate', 'edit', '', '127.0.0.1', 1, '{\"pid\":\"0\",\"sort\":\"0\",\"title\":\"\\u52a8\\u6001\\u7f51\\u7ad9\\u5f00\\u53d1\",\"keywords\":\"\\u7f51\\u7ad9\\u5f00\\u53d1\",\"desc\":\"\\u5de6\\u624bThinkPHP\\uff0c\\u53f3\\u624bLayUI\",\"id\":\"1\",\"update_time\":1725757721}', 1, 1725757721);
INSERT INTO `cms_admin_log` VALUES (286, 1, '超级管理员', 'delete', '删除', '文章', '删除', '超级管理员在2024-09-08 09:09:06删除了文章', 'admin', 'article', 'del', '', '127.0.0.1', 4, '[]', 1, 1725757746);
INSERT INTO `cms_admin_log` VALUES (287, 1, '超级管理员', 'delete', '删除', '文章', '删除', '超级管理员在2024-09-08 09:09:23删除了文章', 'admin', 'article', 'del', '', '127.0.0.1', 2, '[]', 1, 1725757763);
INSERT INTO `cms_admin_log` VALUES (288, 1, '超级管理员', 'edit', '编辑', '图集分类', '编辑', '超级管理员在2024-09-08 09:09:46编辑了图集分类', 'admin', 'gallery_cate', 'edit', '', '127.0.0.1', 1, '{\"pid\":\"0\",\"sort\":\"1\",\"title\":\"\\u56fe\\u96c6\",\"keywords\":\"\",\"desc\":\"\",\"id\":\"1\",\"update_time\":1725757786}', 1, 1725757786);
INSERT INTO `cms_admin_log` VALUES (289, 1, '超级管理员', 'edit', '编辑', '图集分类', '编辑', '超级管理员在2024-09-08 09:10:08编辑了图集分类', 'admin', 'gallery_cate', 'edit', '', '127.0.0.1', 2, '{\"pid\":\"1\",\"sort\":\"0\",\"title\":\"\\u56fe\\u96c61\",\"keywords\":\"\",\"desc\":\"\\u56fe\\u96c61\",\"id\":\"2\",\"update_time\":1725757808}', 1, 1725757808);
INSERT INTO `cms_admin_log` VALUES (290, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-09-09 10:56:48登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1725850608,\"last_login_ip\":\"127.0.0.1\",\"login_num\":51}', 1, 1725850608);
INSERT INTO `cms_admin_log` VALUES (291, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-09-09 15:23:36登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1725866616,\"last_login_ip\":\"127.0.0.1\",\"login_num\":52}', 1, 1725866616);
INSERT INTO `cms_admin_log` VALUES (292, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-09-09 15:27:39登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1725866859,\"last_login_ip\":\"127.0.0.1\",\"login_num\":53}', 1, 1725866859);
INSERT INTO `cms_admin_log` VALUES (293, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-09-09 15:47:07登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1725868027,\"last_login_ip\":\"127.0.0.1\",\"login_num\":54}', 1, 1725868027);
INSERT INTO `cms_admin_log` VALUES (294, 2, '曾辉', 'login', '登录', '系统', '', '曾辉在2024-09-09 17:25:26登录了系统', 'admin', 'login', 'login_submit', '', '127.0.0.1', 2, '{\"last_login_time\":1725873926,\"last_login_ip\":\"127.0.0.1\",\"login_num\":55}', 1, 1725873926);

-- ----------------------------
-- Table structure for cms_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin_module`;
CREATE TABLE `cms_admin_module`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模块名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模块所在目录，小写字母',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态,0禁用,1正常',
  `type` int(1) NOT NULL DEFAULT 2 COMMENT '模块类型,2普通模块,1系统模块',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '功能模块表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_admin_module
-- ----------------------------
INSERT INTO `cms_admin_module` VALUES (1, '后台模块', 'admin', '', 1, 1, 1639562910, 0);
INSERT INTO `cms_admin_module` VALUES (2, '前台模块', 'home', '', 1, 1, 1639562910, 0);

-- ----------------------------
-- Table structure for cms_admin_rule
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin_rule`;
CREATE TABLE `cms_admin_rule`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'url链接',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '日志操作名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `menu` int(1) NOT NULL DEFAULT 0 COMMENT '是否是菜单,1是,2不是',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '越小越靠前',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态,0禁用,1正常',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `crud` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'crud标识',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单及权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_admin_rule
-- ----------------------------
INSERT INTO `cms_admin_rule` VALUES (1, 0, '', '系统管理', '系统管理', 'ri-settings-3-line', 1, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (5, 0, '', '资讯中心', '资讯中心', 'ri-article-line', 1, 5, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (6, 0, '', '图集中心', '图集中心', 'ri-image-2-line', 1, 6, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (17, 1, 'admin/rule/index', '功能节点', '功能节点', '', 1, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (18, 17, 'admin/rule/add', '新建/编辑', '功能节点', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (19, 17, 'admin/rule/delete', '删除', '功能节点', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (20, 1, 'admin/role/index', '权限角色', '权限角色', '', 1, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (21, 20, 'admin/role/add', '新建/编辑', '权限角色', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (22, 20, 'admin/role/delete', '删除', '权限角色', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (29, 1, 'admin/admin/index', '系统用户', '系统用户', '', 1, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (30, 29, 'admin/admin/add', '添加/修改', '系统用户', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (31, 29, 'admin/admin/view', '查看', '系统用户', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (32, 29, 'admin/admin/delete', '删除', '系统用户', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (46, 1, 'admin/files/index', '附件管理', '附件管理', 'ri-file-list-line', 1, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (47, 46, 'admin/files/edit', '编辑附件', '附件', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (48, 46, 'admin/files/move', '移动附件', '附件', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (49, 46, 'admin/files/delete', '删除附件', '附件', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (50, 46, 'admin/files/get_group', '附件分组', '附件分组', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (51, 46, 'admin/files/add_group', '新建/编辑', '附件分组', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (52, 46, 'admin/files/del_group', '删除附件分组', '附件分组', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (88, 5, 'admin/article_cate/datalist', '文章分类', '文章分类', '', 1, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (89, 88, 'admin/article_cate/add', '新建', '文章分类', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (90, 88, 'admin/article_cate/edit', '编辑', '文章分类', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (91, 88, 'admin/article_cate/del', '删除', '文章分类', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (92, 5, 'admin/article/datalist', '文章列表', '文章', '', 1, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (93, 92, 'admin/article/add', '新建', '文章', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (94, 92, 'admin/article/edit', '编辑', '文章', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (95, 92, 'admin/article/read', '查看', '文章', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (96, 92, 'admin/article/del', '删除', '文章', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (97, 6, 'admin/gallery_cate/datalist', '图集分类', '图集分类', '', 1, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (98, 97, 'admin/gallery_cate/add', '新建', '图集分类', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (99, 97, 'admin/gallery_cate/edit', '编辑', '图集分类', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (100, 97, 'admin/gallery_cate/del', '删除', '图集分类', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (101, 6, 'admin/gallery/datalist', '图集列表', '图集', '', 1, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (102, 101, 'admin/gallery/add', '新建', '图集', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (103, 101, 'admin/gallery/edit', '编辑', '图集', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (104, 101, 'admin/gallery/read', '查看', '图集', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (105, 101, 'admin/gallery/del', '删除', '图集', '', 2, 1, 1, '', '', 0, 0);
INSERT INTO `cms_admin_rule` VALUES (106, 0, '', '图书管理', '图书管理', 'ri-book-fill', 1, 0, 1, '', '', 1699443910, 0);
INSERT INTO `cms_admin_rule` VALUES (107, 106, 'teach/book_type/index', '图书类别', '图书类别', 'ri-numbers-fill', 1, 0, 1, '', '', 1699443963, 0);
INSERT INTO `cms_admin_rule` VALUES (114, 106, 'teach/book/index', '图书列表', '图书列表', 'ri-align-left', 1, 0, 1, '', '', 1700382023, 0);
INSERT INTO `cms_admin_rule` VALUES (115, 106, 'teach/cart/index', '购物车', '购物车', '', 1, 0, 1, '', '', 1701522923, 0);
INSERT INTO `cms_admin_rule` VALUES (116, 106, 'teach/cart/order', '我的定单', '定单', '', 1, 0, 1, '', '', 1701523211, 0);
INSERT INTO `cms_admin_rule` VALUES (117, 106, 'teach/user/index', '用户列表', '用户列表', '', 1, 0, 1, '', '', 1701523397, 0);

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属分类',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '摘要',
  `thumb` int(11) NOT NULL DEFAULT 0 COMMENT '缩略图:附件id',
  `original` int(1) NOT NULL DEFAULT 0 COMMENT '是否原创:1是,0否',
  `origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '来源或作者',
  `origin_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '来源地址',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `md_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'markdown内容',
  `read` int(11) NOT NULL DEFAULT 0 COMMENT '阅读量',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '属性:1精华,2热门,3推荐',
  `is_home` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否首页显示:0否,1是',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态:1正常,0下架',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章::crud' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES (1, 1, '勾股CMS——轻量级、高性能极速后台开发框架', '勾股CMS是一套基于ThinkPHP6 + Layui + MySql打造的轻量级、高性能极速后台开发框架。通用型的后台权限管理框架，极低门槛、操作简单、开箱即用。系统易于功能扩展，代码维护，方便二次开发，让开发者更专注于业务深度需求的开发，帮助开发者简单高效降低二次开发成本。', 1, 0, '', '', '<p>勾股CMS是一套基于ThinkPHP6 + Layui + MySql打造的轻量级、高性能极速后台开发框架。通用型的后台权限管理框架，极低门槛、操作简单、开箱即用。系统易于功能扩展，代码维护，方便二次开发，让开发者更专注于业务深度需求的开发，帮助开发者简单高效降低二次开发成本。</p>\n<p><img src=\"https://blog.gougucms.com/storage/image/202109/1630457997502502.png\" /></p>', '勾股CMS是一套基于ThinkPHP6 + Layui + MySql打造的轻量级、高性能极速后台开发框架。通用型的后台权限管理框架，极低门槛、操作简单、开箱即用。系统易于功能扩展，代码维护，方便二次开发，让开发者更专注于业务深度需求的开发，帮助开发者简单高效降低二次开发成本。', 0, 2, 1, 0, 1, 1, 1625071256, 1650811576, 0);
INSERT INTO `cms_article` VALUES (2, 1, '勾股BLOG——简约，易用开源的个人博客系统', '勾股BLOG是一款实用的开源免费的个人博客系统。集成了系统管理、基础数据、博客文章、博客动态、语雀知识库、用户管理、访问统计等功能。具有简约，易用，内存占用低等特点，可以用来做个人博客，工作室官网，自...', 2, 0, '', '', '<p>勾股BLOG是一款实用的开源免费的个人博客系统。集成了系统管理、基础数据、博客文章、博客动态、语雀知识库、用户管理、访问统计等功能。具有简约，易用，内存占用低等特点，可以用来做个人博客，工作室官网，自媒体官网等网站，二次开发之后也可以作为资讯、展品展示等网站。</p>\n<p><img src=\"https://blog.gougucms.com/storage/image/b1.png\" /></p>', '勾股BLOG是一款实用的开源免费的个人博客系统。集成了系统管理、基础数据、博客文章、博客动态、语雀知识库、用户管理、访问统计等功能。具有简约，易用，内存占用低等特点，可以用来做个人博客，工作室官网，自媒体官网等网站，二次开发之后也可以作为资讯、展品展示等网站。', 0, 0, 1, 0, 1, 1, 1650811439, 1650811624, 1725757763);
INSERT INTO `cms_article` VALUES (3, 1, '勾股OA——实用的开源的企业办公系统框架', '勾股OA是一款实用的开源免费的企业办公系统框架。它集成了系统设置、人事管理、消息管理、审批管理、日常办公、财务管理等基础模块。系统简约，易于功能扩展，方便二次开发，让开发者更专注于业务深度需求的开发，...', 3, 0, '', '', '<p>勾股OA是一款实用的开源免费的企业办公系统框架。它集成了系统设置、人事管理、消息管理、审批管理、日常办公、财务管理等基础模块。系统简约，易于功能扩展，方便二次开发，让开发者更专注于业务深度需求的开发，通过二次开发之后可以用来做CRM，ERP，业务管理等系统。</p>\n<p><img src=\"https://oa.gougucms.com/storage/image/oa1.png\" /></p>', '勾股OA是一款实用的开源免费的企业办公系统框架。它集成了系统设置、人事管理、消息管理、审批管理、日常办公、财务管理等基础模块。系统简约，易于功能扩展，方便二次开发，让开发者更专注于业务深度需求的开发，通过二次开发之后可以用来做CRM，ERP，业务管理等系统。', 0, 0, 1, 0, 1, 1, 1650811502, 1650811709, 0);
INSERT INTO `cms_article` VALUES (4, 1, '勾股DEV——研发管理与团队协作的工具软件', '勾股DEV是一款专为IT行业研发团队打造的智能化项目管理与团队协作的工具软件，可以在线管理团队的工作、项目和任务，覆盖从需求提出到研发完成上线整个过程的项目协作。', 4, 0, '', '', '<p>勾股DEV是一款专为IT行业研发团队打造的智能化项目管理与团队协作的工具软件，可以在线管理团队的工作、项目和任务，覆盖从需求提出到研发完成上线整个过程的项目协作。</p>\n<p><img src=\"https://dev.gougucms.com/storage/202204/dev2.png\" /></p>', '勾股DEV是一款专为IT行业研发团队打造的智能化项目管理与团队协作的工具软件，可以在线管理团队的工作、项目和任务，覆盖从需求提出到研发完成上线整个过程的项目协作。', 0, 0, 1, 0, 1, 1, 1650811542, 1650811682, 1725757746);

-- ----------------------------
-- Table structure for cms_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_cate`;
CREATE TABLE `cms_article_cate`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父类ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '关键字',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `sort` int(5) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类::crud' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_article_cate
-- ----------------------------
INSERT INTO `cms_article_cate` VALUES (1, 0, '动态网站开发', '网站开发', '左手ThinkPHP，右手LayUI', 0, 1610196442, 1725757721, 0);

-- ----------------------------
-- Table structure for cms_article_keywords
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_keywords`;
CREATE TABLE `cms_article_keywords`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章ID',
  `keywords_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联关键字id',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE,
  INDEX `inid`(`keywords_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_article_keywords
-- ----------------------------
INSERT INTO `cms_article_keywords` VALUES (1, 1, 1, 1, 1610198553);
INSERT INTO `cms_article_keywords` VALUES (2, 2, 2, 1, 1610198553);
INSERT INTO `cms_article_keywords` VALUES (3, 3, 3, 1, 1610198553);
INSERT INTO `cms_article_keywords` VALUES (4, 4, 4, 1, 1610198553);

-- ----------------------------
-- Table structure for cms_book
-- ----------------------------
DROP TABLE IF EXISTS `cms_book`;
CREATE TABLE `cms_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面地址',
  `book_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `number` int(11) NULL DEFAULT 0 COMMENT '数量',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_book
-- ----------------------------
INSERT INTO `cms_book` VALUES (3, 19, 4, 'C++程序设计', '/storage/202311/5ad9dc34698eae871ab303b2ce5f7db6.jpg', NULL, '清华大学出版社', '', '1', 10, 21.00);
INSERT INTO `cms_book` VALUES (19, 7, 4, '计算机网络', '/storage/202312/640e17b77acc6d45beb9d6372c7e0d59.png', NULL, '清华大学出版社', NULL, '0', 16, 32.00);
INSERT INTO `cms_book` VALUES (20, 19, 4, 'Java语言', '/storage/202312/640e17b77acc6d45beb9d6372c7e0d59.png', NULL, '北京大学出版社', NULL, '0', 3, 31.00);
INSERT INTO `cms_book` VALUES (21, 7, 4, '计算机导论', '', NULL, '北京大学出版社', NULL, '1', 1, 9.00);
INSERT INTO `cms_book` VALUES (22, 7, 4, '动态网站开发', '/storage/202312/640e17b77acc6d45beb9d6372c7e0d59.png', NULL, '清华大学出版社', NULL, '1', 0, 1.00);

-- ----------------------------
-- Table structure for cms_book_cart
-- ----------------------------
DROP TABLE IF EXISTS `cms_book_cart`;
CREATE TABLE `cms_book_cart`  (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号为空表示还没有购买',
  `book_id` int(11) NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `money` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_book_cart
-- ----------------------------
INSERT INTO `cms_book_cart` VALUES (16, 4, '2023120518312', 3, 8, 21.00);
INSERT INTO `cms_book_cart` VALUES (17, 4, '2023120518312', 20, 5, 31.00);
INSERT INTO `cms_book_cart` VALUES (19, 4, '2023120547376', 3, 1, 21.00);
INSERT INTO `cms_book_cart` VALUES (20, 4, '2023120547376', 20, 1, 31.00);
INSERT INTO `cms_book_cart` VALUES (21, 4, '2023120730594', 3, 6, 21.00);
INSERT INTO `cms_book_cart` VALUES (22, 4, '2023120730594', 20, 1, 31.00);
INSERT INTO `cms_book_cart` VALUES (23, 4, '2024090728722', 3, 1, 21.00);
INSERT INTO `cms_book_cart` VALUES (24, 4, NULL, 21, 1, 9.00);

-- ----------------------------
-- Table structure for cms_book_order
-- ----------------------------
DROP TABLE IF EXISTS `cms_book_order`;
CREATE TABLE `cms_book_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` decimal(10, 2) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_date` int(11) NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_book_order
-- ----------------------------
INSERT INTO `cms_book_order` VALUES (10, 4, '2023120518312', 323.00, NULL, NULL, 1701758488, '0', NULL);
INSERT INTO `cms_book_order` VALUES (8, 4, '2023120507885', 146.00, NULL, NULL, 1701757566, '0', NULL);
INSERT INTO `cms_book_order` VALUES (9, 4, '2023120587810', 323.00, NULL, NULL, 1701758432, '0', NULL);
INSERT INTO `cms_book_order` VALUES (11, 4, '2023120547376', 52.00, NULL, NULL, 1701758668, '0', NULL);
INSERT INTO `cms_book_order` VALUES (12, 4, '2023120730594', 157.00, NULL, NULL, 1701916847, '0', NULL);
INSERT INTO `cms_book_order` VALUES (13, 4, '2024090728722', 21.00, NULL, NULL, 1725705985, '0', NULL);

-- ----------------------------
-- Table structure for cms_book_type
-- ----------------------------
DROP TABLE IF EXISTS `cms_book_type`;
CREATE TABLE `cms_book_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT 0,
  `status` int(1) NULL DEFAULT 1,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_book_type
-- ----------------------------
INSERT INTO `cms_book_type` VALUES (7, '经济类', 1699234707, 0, '');
INSERT INTO `cms_book_type` VALUES (10, '生活类', 1699234707, 1, NULL);
INSERT INTO `cms_book_type` VALUES (11, '外语类', 1699234707, 1, NULL);
INSERT INTO `cms_book_type` VALUES (19, '财经类', 1700382126, 1, '');

-- ----------------------------
-- Table structure for cms_brand
-- ----------------------------
DROP TABLE IF EXISTS `cms_brand`;
CREATE TABLE `cms_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `producer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introd` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `join_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_brand
-- ----------------------------
INSERT INTO `cms_brand` VALUES (1, '探路者444', '北京公司', '', 1699234707);
INSERT INTO `cms_brand` VALUES (2, '77', NULL, '', NULL);
INSERT INTO `cms_brand` VALUES (4, '77', NULL, '', 1700709077);

-- ----------------------------
-- Table structure for cms_build
-- ----------------------------
DROP TABLE IF EXISTS `cms_build`;
CREATE TABLE `cms_build`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_build
-- ----------------------------
INSERT INTO `cms_build` VALUES (1, '1栋', NULL);

-- ----------------------------
-- Table structure for cms_config
-- ----------------------------
DROP TABLE IF EXISTS `cms_config`;
CREATE TABLE `cms_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置标识',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '配置内容',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_config
-- ----------------------------
INSERT INTO `cms_config` VALUES (1, '网站配置', 'web', 'a:13:{s:2:\"id\";s:1:\"1\";s:11:\"admin_title\";s:9:\"勾股CMS\";s:5:\"title\";s:9:\"勾股cms\";s:4:\"logo\";s:39:\"/static/admin/images/nonepic360x360.jpg\";s:4:\"file\";s:0:\"\";s:6:\"domain\";s:24:\"https://www.gougucms.com\";s:3:\"icp\";s:23:\"粤ICP备1xxxxxx11号-1\";s:8:\"keywords\";s:9:\"勾股cms\";s:5:\"beian\";s:29:\"粤公网安备1xxxxxx11号-1\";s:4:\"desc\";s:258:\"勾股CMS是一套基于ThinkPHP6 + Layui + MySql打造的轻量级、高性能快速建站的内容管理系统。后台管理模块，一目了然，操作简单，通用型后台权限管理框架，紧随潮流、极低门槛、开箱即用。           \";s:4:\"code\";s:0:\"\";s:9:\"copyright\";s:39:\"© 2022 gougucms.com Apache-2.0 license\";s:7:\"version\";s:6:\"2.0.18\";}', 1, 1612514630, 1645057819);
INSERT INTO `cms_config` VALUES (2, '邮箱配置', 'email', 'a:8:{s:2:\"id\";s:1:\"2\";s:4:\"smtp\";s:11:\"smtp.qq.com\";s:9:\"smtp_port\";s:3:\"465\";s:9:\"smtp_user\";s:15:\"gougucms@qq.com\";s:8:\"smtp_pwd\";s:6:\"123456\";s:4:\"from\";s:24:\"勾股CMS系统管理员\";s:5:\"email\";s:18:\"admin@gougucms.com\";s:8:\"template\";s:122:\"<p>勾股CMS是一套基于ThinkPHP6 + Layui + MySql打造的轻量级、高性能快速建站的内容管理系统。</p>\";}', 1, 1612521657, 1619088538);
INSERT INTO `cms_config` VALUES (3, '微信配置', 'wechat', 'a:11:{s:2:\"id\";s:1:\"3\";s:5:\"token\";s:8:\"GOUGUCMS\";s:14:\"login_back_url\";s:49:\"https://www.gougucms.com/wechat/index/getChatInfo\";s:5:\"appid\";s:18:\"wxdf96xxxx7cd6f0c5\";s:9:\"appsecret\";s:32:\"1dbf319a4f0dfed7xxxxfd1c7dbba488\";s:5:\"mchid\";s:10:\"151xxxx331\";s:11:\"secrect_key\";s:29:\"gougucmsxxxxhumabcxxxxjixxxng\";s:8:\"cert_url\";s:13:\"/extend/cert/\";s:12:\"pay_back_url\";s:42:\"https://www.gougucms.com/wxappv1/wx/notify\";s:9:\"xcx_appid\";s:18:\"wxdf96xxxx9cd6f0c5\";s:13:\"xcx_appsecret\";s:28:\"gougucmsxxxxhunangdmabcxxxng\";}', 1, 1612522314, 1613789058);
INSERT INTO `cms_config` VALUES (4, 'Api Token配置', 'token', 'a:5:{s:2:\"id\";s:1:\"5\";s:3:\"iss\";s:16:\"www.gougucms.com\";s:3:\"aud\";s:8:\"gougucms\";s:7:\"secrect\";s:8:\"GOUGUCMS\";s:7:\"exptime\";s:4:\"3600\";}', 1, 1627313142, 1627376290);
INSERT INTO `cms_config` VALUES (5, '其他配置', 'other', 'a:4:{s:2:\"id\";s:1:\"5\";s:6:\"author\";s:15:\"勾股工作室\";s:7:\"version\";s:7:\"v2.0.16\";s:6:\"editor\";s:1:\"1\";}', 1, 1613725791, 1645107069);

-- ----------------------------
-- Table structure for cms_data
-- ----------------------------
DROP TABLE IF EXISTS `cms_data`;
CREATE TABLE `cms_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_data
-- ----------------------------
INSERT INTO `cms_data` VALUES (1, '江西省', 0);
INSERT INTO `cms_data` VALUES (2, '南昌市', 1);
INSERT INTO `cms_data` VALUES (3, '赣州', 1);

-- ----------------------------
-- Table structure for cms_department
-- ----------------------------
DROP TABLE IF EXISTS `cms_department`;
CREATE TABLE `cms_department`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级部门id',
  `leader_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '部门负责人ID',
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门联系电话',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门组织' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_department
-- ----------------------------
INSERT INTO `cms_department` VALUES (1, '勾股科技', 0, 0, '13688888888', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (2, '广州总公司', 1, 0, '13688888889', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (3, '人事部', 2, 0, '13688888898', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (4, '财务部', 2, 0, '13688888898', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (5, '市场部', 2, 0, '13688888978', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (6, '销售部', 2, 0, '13688889868', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (7, '技术部', 2, 0, '13688898858', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (8, '客服部', 2, 0, '13688988848', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (9, '销售一部', 6, 0, '13688998838', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (10, '销售二部', 6, 0, '13688999828', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (11, '深圳分公司', 1, 0, '13688999918', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (12, '人事部', 11, 0, '13688888886', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (13, '市场部', 11, 0, '13688888886', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (14, '财务部', 11, 0, '13688888876', '', 1, 0, 0);
INSERT INTO `cms_department` VALUES (15, '销售部', 11, 0, '13688888666', '', 1, 0, 0);

-- ----------------------------
-- Table structure for cms_file
-- ----------------------------
DROP TABLE IF EXISTS `cms_file`;
CREATE TABLE `cms_file`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `sha1` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'sha1',
  `md5` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'md5',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原始文件名',
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `filepath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件路径+文件名',
  `filesize` int(10) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `fileext` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件类型',
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件分组ID',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上传会员ID',
  `uploadip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '上传IP',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未审核1已审核-1不通过',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `admin_id` int(11) NOT NULL COMMENT '审核者id',
  `delete_time` int(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `audit_time` int(11) NOT NULL DEFAULT 0 COMMENT '审核时间',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '来源模块功能',
  `use` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用处',
  `download` int(11) NOT NULL DEFAULT 0 COMMENT '下载量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_file
-- ----------------------------
INSERT INTO `cms_file` VALUES (1, 'admin', '5125347886f07f48f7003825660117039eb8784f', '563e5e8f48e607ed54461796b0cb4844', 'f95982689eb222b84e999122a50b3780.jpg.jpg', 'f95982689eb222b84e999122a50b3780.jpg', 'https://blog.gougucms.com/storage/202202/f95982689eb222b84e999122a50b3780.jpg', 62609, 'jpg', 'image/jpeg', 0, 1, '127.0.0.1', 1, 1645057433, 1, 0, 1645057433, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (2, 'admin', '5125347886f07f48f7003825660117039eb8784f', '563e5e8f48e607ed54461796b0cb4844', 'e729477de18e3be7e7eb4ec7fe2f821e.jpg', 'e729477de18e3be7e7eb4ec7fe2f821e.jpg', 'https://blog.gougucms.com/storage/202202/e729477de18e3be7e7eb4ec7fe2f821e.jpg', 62609, 'jpg', 'image/jpeg', 0, 1, '127.0.0.1', 1, 1645057433, 1, 0, 1645057433, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (3, 'admin', '5125347886f07f48f7003825660117039eb8784f', '563e5e8f48e607ed54461796b0cb4844', '1193f7a1585b9f6e8a97ae17718018b3.jpg', 'images/1193f7a1585b9f6e8a97ae17718018b3.jpg', 'https://blog.gougucms.com/storage/202204/1193f7a1585b9f6e8a97ae17718018b3.jpg', 62609, 'jpg', 'image/jpeg', 0, 1, '127.0.0.1', 1, 1645057433, 1, 0, 1645057433, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (4, 'admin', '5125347886f07f48f7003825660117039eb8784f', '563e5e8f48e607ed54461796b0cb4844', '0f22a5ba4797b2fa22049ea73e6f779c.jpg', 'images/0f22a5ba4797b2fa22049ea73e6f779c.jpg', 'https://blog.gougucms.com/storage/202202/0f22a5ba4797b2fa22049ea73e6f779c.jpg', 62609, 'jpg', 'image/jpeg', 0, 1, '127.0.0.1', 1, 1645057433, 1, 0, 1645057433, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (5, 'admin', 'b96c9d8818988657e422c1265d9df87774403b51', '7d5c38fc70644080a39a21460ab47ea7', '2023.1学期课表.xlsx', '202311/7d5c38fc70644080a39a21460ab47ea7.xlsx', '/storage/202311/7d5c38fc70644080a39a21460ab47ea7.xlsx', 30575, 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 0, 1, '127.0.0.1', 1, 1699194428, 1, 1701603633, 1699194428, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (6, 'admin', 'c064ac922d6f2911250bf170350493a17def6a8c', '5ad9dc34698eae871ab303b2ce5f7db6', '1.jpg', '202311/5ad9dc34698eae871ab303b2ce5f7db6.jpg', '/storage/202311/5ad9dc34698eae871ab303b2ce5f7db6.jpg', 80894, 'jpg', 'image/jpeg', 0, 4, '127.0.0.1', 1, 1700393936, 4, 1701603635, 1700393936, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (7, 'admin', '69c52134a0d64c05c01c439e30c9b60749cb57c1', '640e17b77acc6d45beb9d6372c7e0d59', '上课时间表.png', '202311/640e17b77acc6d45beb9d6372c7e0d59.png', '/storage/202311/640e17b77acc6d45beb9d6372c7e0d59.png', 70922, 'png', 'image/png', 0, 4, '127.0.0.1', 1, 1700394486, 4, 1701603630, 1700394486, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (8, 'admin', '69c52134a0d64c05c01c439e30c9b60749cb57c1', '640e17b77acc6d45beb9d6372c7e0d59', '上课时间表.png', '202311/640e17b77acc6d45beb9d6372c7e0d59.png', '/storage/202311/640e17b77acc6d45beb9d6372c7e0d59.png', 70922, 'png', 'image/png', 0, 4, '127.0.0.1', 1, 1700398136, 4, 1701603628, 1700398136, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (9, 'admin', '69c52134a0d64c05c01c439e30c9b60749cb57c1', '640e17b77acc6d45beb9d6372c7e0d59', '上课时间表.png', '202311/640e17b77acc6d45beb9d6372c7e0d59.png', '/storage/202311/640e17b77acc6d45beb9d6372c7e0d59.png', 70922, 'png', 'image/png', 0, 4, '127.0.0.1', 1, 1700398199, 4, 1701603624, 1700398199, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (10, 'admin', '69c52134a0d64c05c01c439e30c9b60749cb57c1', '640e17b77acc6d45beb9d6372c7e0d59', '上课时间表.png', '202311/640e17b77acc6d45beb9d6372c7e0d59.png', '/storage/202311/640e17b77acc6d45beb9d6372c7e0d59.png', 70922, 'png', 'image/png', 0, 4, '127.0.0.1', 1, 1700398380, 4, 1701603622, 1700398380, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (11, 'admin', 'c064ac922d6f2911250bf170350493a17def6a8c', '5ad9dc34698eae871ab303b2ce5f7db6', '1.jpg', '202311/5ad9dc34698eae871ab303b2ce5f7db6.jpg', '/storage/202311/5ad9dc34698eae871ab303b2ce5f7db6.jpg', 80894, 'jpg', 'image/jpeg', 0, 2, '127.0.0.1', 1, 1700403611, 2, 1701603626, 1700403611, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (12, 'admin', '69c52134a0d64c05c01c439e30c9b60749cb57c1', '640e17b77acc6d45beb9d6372c7e0d59', '上课时间表.png', '202311/640e17b77acc6d45beb9d6372c7e0d59.png', '/storage/202311/640e17b77acc6d45beb9d6372c7e0d59.png', 70922, 'png', 'image/png', 0, 2, '127.0.0.1', 1, 1700403682, 2, 1701603619, 1700403682, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (13, 'admin', 'c064ac922d6f2911250bf170350493a17def6a8c', '5ad9dc34698eae871ab303b2ce5f7db6', '1.jpg', '202311/5ad9dc34698eae871ab303b2ce5f7db6.jpg', '/storage/202311/5ad9dc34698eae871ab303b2ce5f7db6.jpg', 80894, 'jpg', 'image/jpeg', 0, 2, '127.0.0.1', 1, 1700403754, 2, 1701603617, 1700403754, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (14, 'admin', 'c064ac922d6f2911250bf170350493a17def6a8c', '5ad9dc34698eae871ab303b2ce5f7db6', '1.jpg', '202311/5ad9dc34698eae871ab303b2ce5f7db6.jpg', '/storage/202311/5ad9dc34698eae871ab303b2ce5f7db6.jpg', 80894, 'jpg', 'image/jpeg', 0, 4, '127.0.0.1', 1, 1700404239, 4, 1701603611, 1700404239, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (15, 'admin', 'c064ac922d6f2911250bf170350493a17def6a8c', '5ad9dc34698eae871ab303b2ce5f7db6', '1.jpg', '202311/5ad9dc34698eae871ab303b2ce5f7db6.jpg', '/storage/202311/5ad9dc34698eae871ab303b2ce5f7db6.jpg', 80894, 'jpg', 'image/jpeg', 0, 4, '127.0.0.1', 1, 1700437642, 4, 1701603615, 1700437642, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (16, 'admin', '69c52134a0d64c05c01c439e30c9b60749cb57c1', '640e17b77acc6d45beb9d6372c7e0d59', '上课时间表.png', '202311/640e17b77acc6d45beb9d6372c7e0d59.png', '/storage/202311/640e17b77acc6d45beb9d6372c7e0d59.png', 70922, 'png', 'image/png', 0, 2, '127.0.0.1', 1, 1700444249, 2, 1701603609, 1700444249, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (17, 'admin', '69c52134a0d64c05c01c439e30c9b60749cb57c1', '640e17b77acc6d45beb9d6372c7e0d59', '上课时间表.png', '202311/640e17b77acc6d45beb9d6372c7e0d59.png', '/storage/202311/640e17b77acc6d45beb9d6372c7e0d59.png', 70922, 'png', 'image/png', 0, 2, '127.0.0.1', 1, 1700444270, 2, 1701603604, 1700444270, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (18, 'admin', '69c52134a0d64c05c01c439e30c9b60749cb57c1', '640e17b77acc6d45beb9d6372c7e0d59', '上课时间表.png', '202311/640e17b77acc6d45beb9d6372c7e0d59.png', '/storage/202311/640e17b77acc6d45beb9d6372c7e0d59.png', 70922, 'png', 'image/png', 0, 4, '127.0.0.1', 1, 1700449395, 4, 1701603607, 1700449395, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (19, 'admin', '69c52134a0d64c05c01c439e30c9b60749cb57c1', '640e17b77acc6d45beb9d6372c7e0d59', '上课时间表.png', '202312/640e17b77acc6d45beb9d6372c7e0d59.png', '/storage/202312/640e17b77acc6d45beb9d6372c7e0d59.png', 70922, 'png', 'image/png', 0, 4, '127.0.0.1', 1, 1702257472, 4, 1725709142, 1702257472, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (20, 'admin', '69c52134a0d64c05c01c439e30c9b60749cb57c1', '640e17b77acc6d45beb9d6372c7e0d59', '上课时间表.png', '202312/640e17b77acc6d45beb9d6372c7e0d59.png', '/storage/202312/640e17b77acc6d45beb9d6372c7e0d59.png', 70922, 'png', 'image/png', 0, 4, '127.0.0.1', 1, 1702257494, 4, 1725709140, 1702257494, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (21, 'admin', '69c52134a0d64c05c01c439e30c9b60749cb57c1', '640e17b77acc6d45beb9d6372c7e0d59', '上课时间表.png', '202312/640e17b77acc6d45beb9d6372c7e0d59.png', '/storage/202312/640e17b77acc6d45beb9d6372c7e0d59.png', 70922, 'png', 'image/png', 0, 4, '127.0.0.1', 1, 1702257525, 4, 1725709137, 1702257525, 'upload', 'thumb', 0);
INSERT INTO `cms_file` VALUES (22, 'admin', '5084396b2730e8e03a0afabcdfe07ddfa91ce596', 'fae65bf1502cb1d51387bc1029a926a2', '2024本科毕设_邹长军.rar', '202409/fae65bf1502cb1d51387bc1029a926a2.rar', '/storage/202409/fae65bf1502cb1d51387bc1029a926a2.rar', 9485279, 'rar', 'application/x-compressed', 0, 2, '127.0.0.1', 1, 1725757454, 2, 1725757458, 1725757454, 'upload', 'thumb', 0);

-- ----------------------------
-- Table structure for cms_file_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_file_group`;
CREATE TABLE `cms_file_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组名',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_file_group
-- ----------------------------

-- ----------------------------
-- Table structure for cms_gallery
-- ----------------------------
DROP TABLE IF EXISTS `cms_gallery`;
CREATE TABLE `cms_gallery`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '属性:1精华,2热门,3推荐',
  `is_home` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否首页显示:0否,1是',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态:0下架 1正常',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图集名称',
  `thumb` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '缩略图',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图集摘要',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '来源或作者',
  `origin_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '来源地址',
  `read` int(11) NOT NULL DEFAULT 0 COMMENT '阅读量',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图集::crud' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_gallery
-- ----------------------------
INSERT INTO `cms_gallery` VALUES (1, 1, 3, 1, 1, '勾股开源系列系统', 1, '勾股科技专注于CMS系统，OA办公系统，CRM系统，ERP系统，在线教育系统，项目管理系统等系统软件的建设。左手研发，右手开源，未来可期！', NULL, 0, '勾股科技', 'http://www.gougucms.com', 0, 0, 1, 1655452531, 1655633932, 1699195063);

-- ----------------------------
-- Table structure for cms_gallery_cate
-- ----------------------------
DROP TABLE IF EXISTS `cms_gallery_cate`;
CREATE TABLE `cms_gallery_cate`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图集分类名称',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '关键字',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图集分类::crud' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_gallery_cate
-- ----------------------------
INSERT INTO `cms_gallery_cate` VALUES (1, '图集', 1, 0, '', '', 1645058420, 1725757786, 0);
INSERT INTO `cms_gallery_cate` VALUES (2, '图集1', 0, 1, '', '图集1', 1699194628, 1725757808, 0);

-- ----------------------------
-- Table structure for cms_gallery_file
-- ----------------------------
DROP TABLE IF EXISTS `cms_gallery_file`;
CREATE TABLE `cms_gallery_file`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图集ID',
  `file_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片名称',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '摘要',
  `filepath` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片路径',
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图集关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_gallery_file
-- ----------------------------
INSERT INTO `cms_gallery_file` VALUES (1, 1, 0, '勾股cms', '勾股CMS', '勾股CMS是一套基于ThinkPHP6 + Layui + MySql打造的轻量级的通用后台管理框架。简单、易用且方便二次开发，是一款免费可商用的开源项目', 'https://blog.gougucms.com/storage/202202/f95982689eb222b84e999122a50b3780.jpg', 'http://www.gougucms.com', 1, 1655633932);
INSERT INTO `cms_gallery_file` VALUES (2, 1, 0, '勾股OA', '勾股OA', '勾股OA是一款实用的企业办公系统框架。集成了系统设置、人事管理、消息管理、审批管理、日常办公、财务管理等基础模块。系统简约，易于功能扩展，方便二次开发，让开发者更专注于业务深度需求的开发，通过二次开发之后可以用来做CRM，ERP，业务管理等系统。', 'https://blog.gougucms.com/storage/202202/e729477de18e3be7e7eb4ec7fe2f821e.jpg', 'http://oa.gougucms.com', 2, 1655633932);
INSERT INTO `cms_gallery_file` VALUES (3, 1, 0, '勾股DEV', '勾股DEV', '勾股DEV是一款任务管理与团队协作的任务/项目管理系统，可以进行工作任务计划、执行、管理，完整地覆盖了项目管理的核心流程。项目基于GPL-3.0协议开源发布。', 'https://blog.gougucms.com/storage/202204/1193f7a1585b9f6e8a97ae17718018b3.jpg', 'http://dev.gougucms.com', 3, 1655633932);

-- ----------------------------
-- Table structure for cms_gallery_keywords
-- ----------------------------
DROP TABLE IF EXISTS `cms_gallery_keywords`;
CREATE TABLE `cms_gallery_keywords`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图集ID',
  `keywords_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联关键字id',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图集关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_gallery_keywords
-- ----------------------------
INSERT INTO `cms_gallery_keywords` VALUES (1, 1, 1, 1644823517);

-- ----------------------------
-- Table structure for cms_goods
-- ----------------------------
DROP TABLE IF EXISTS `cms_goods`;
CREATE TABLE `cms_goods`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '属性:1精华,2热门,3推荐',
  `is_home` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否首页显示:0否,1是',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '商品状态:0下架,1正常',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `thumb` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '缩略图',
  `banner` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品轮播图',
  `tips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品卖点，一句话推销',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品摘要',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `base_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '市场价格',
  `price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实际价格',
  `stocks` int(11) NOT NULL DEFAULT 0 COMMENT '商品库存',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '商品销量',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品发货地址',
  `start_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '开始抢购时间',
  `end_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '结束抢购时间',
  `read` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读量',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_mail` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否包邮:0否,1是',
  `tag_values` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品标签:1正品保证,2一年保修,3七天退换,4赠运费险,5闪电发货,6售后无忧',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '编辑时间',
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品::crud' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_goods
-- ----------------------------
INSERT INTO `cms_goods` VALUES (1, 1, 1, 1, 1, '勾股CMS，勾股Blog，勾股OA定制开发方案', 1, '', '赠送一年免费维护服务', '', '勾股CMS定制开发方案99元起，勾股Blog定制开发方案199元起，勾股OA定制开发方案299元起。欢迎联系QQ:327725426咨询定制 。</p>', 199.00, 99.00, 0, 0, '', 0, 0, 0, 1, 1, '1,2,6', 0, 1644823517, 0, 0);

-- ----------------------------
-- Table structure for cms_goods_cate
-- ----------------------------
DROP TABLE IF EXISTS `cms_goods_cate`;
CREATE TABLE `cms_goods_cate`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '关键字',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类::crud' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_goods_cate
-- ----------------------------
INSERT INTO `cms_goods_cate` VALUES (1, '勾股科技', 1, 0, '勾股CMS', '左手自研，右手开源', 1645058420, 0, 0);

-- ----------------------------
-- Table structure for cms_goods_keywords
-- ----------------------------
DROP TABLE IF EXISTS `cms_goods_keywords`;
CREATE TABLE `cms_goods_keywords`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `keywords_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联关键字id',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态:-1删除 0禁用 1启用',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE,
  INDEX `inid`(`keywords_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_goods_keywords
-- ----------------------------
INSERT INTO `cms_goods_keywords` VALUES (1, 1, 1, 1, 1644823517);

-- ----------------------------
-- Table structure for cms_keywords
-- ----------------------------
DROP TABLE IF EXISTS `cms_keywords`;
CREATE TABLE `cms_keywords`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关键字表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_keywords
-- ----------------------------
INSERT INTO `cms_keywords` VALUES (1, '勾股CMS', 0, 1, 1610183567, 1610184824);
INSERT INTO `cms_keywords` VALUES (2, '勾股BLOG', 0, 1, 1610183567, 1610184824);
INSERT INTO `cms_keywords` VALUES (3, '勾股OA', 0, 1, 1610183567, 1610184824);
INSERT INTO `cms_keywords` VALUES (4, '勾股dev', 0, 1, 1610183567, 1610184824);

-- ----------------------------
-- Table structure for cms_lib
-- ----------------------------
DROP TABLE IF EXISTS `cms_lib`;
CREATE TABLE `cms_lib`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lib_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `aud_id` int(11) NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_lib
-- ----------------------------

-- ----------------------------
-- Table structure for cms_nav
-- ----------------------------
DROP TABLE IF EXISTS `cms_nav`;
CREATE TABLE `cms_nav`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1可用-1禁用',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '导航' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_nav
-- ----------------------------
INSERT INTO `cms_nav` VALUES (1, '主导航', 'NAV_HOME', 1, '平台主导航', 0, 0);

-- ----------------------------
-- Table structure for cms_nav_info
-- ----------------------------
DROP TABLE IF EXISTS `cms_nav_info`;
CREATE TABLE `cms_nav_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `nav_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `target` int(1) NOT NULL DEFAULT 0 COMMENT '是否新窗口打开,默认0,1新窗口打开',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1可用,-1禁用',
  `sort` int(11) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '导航详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_nav_info
-- ----------------------------
INSERT INTO `cms_nav_info` VALUES (1, 0, 1, '首页', '/', 'index', 0, 1, 1, 0, 0);
INSERT INTO `cms_nav_info` VALUES (2, 0, 1, '开源系统', '/home/index/logs.html', 'logs', 0, 1, 2, 0, 0);
INSERT INTO `cms_nav_info` VALUES (3, 0, 1, '博客社区', 'https://blog.gougucms.com/', '', 1, 1, 3, 0, 0);
INSERT INTO `cms_nav_info` VALUES (4, 0, 1, 'API接口', '/api/index', '', 1, 1, 4, 0, 0);
INSERT INTO `cms_nav_info` VALUES (5, 0, 1, '系统文档', 'https://blog.gougucms.com/home/book/detail/bid/1.html', '', 1, 1, 5, 0, 0);
INSERT INTO `cms_nav_info` VALUES (6, 0, 1, '后台演示', '/admin/index/index.html', '', 1, 1, 6, 0, 0);
INSERT INTO `cms_nav_info` VALUES (7, 2, 1, '勾股BLOG', 'https://blog.gougucms.com/home/book/detail/bid/2.html', '', 1, 1, 7, 0, 0);
INSERT INTO `cms_nav_info` VALUES (8, 2, 1, '勾股OA办公系统', 'https://www.gougucms.com/home/pages/detail/s/gouguoa.html', '', 1, 1, 8, 0, 0);
INSERT INTO `cms_nav_info` VALUES (9, 2, 1, '勾股DEV项目管理系统', 'https://www.gougucms.com/home/pages/detail/s/gougudev.html', '', 1, 1, 9, 0, 0);
INSERT INTO `cms_nav_info` VALUES (10, 0, 1, '开发日志', '/home/index/logs.html', '', 0, 1, 10, 0, 0);

-- ----------------------------
-- Table structure for cms_position
-- ----------------------------
DROP TABLE IF EXISTS `cms_position`;
CREATE TABLE `cms_position`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '岗位名称',
  `work_price` int(10) NOT NULL DEFAULT 0 COMMENT '工时单价',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位职称' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_position
-- ----------------------------
INSERT INTO `cms_position` VALUES (1, '董事长', 1000, '董事长', 1, 0, 0);
INSERT INTO `cms_position` VALUES (2, '人事总监', 1000, '人事部的最大领导', 1, 0, 0);
INSERT INTO `cms_position` VALUES (3, '普通员工', 500, '普通员工', 1, 0, 0);

-- ----------------------------
-- Table structure for cms_user
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户微信昵称',
  `nickname_a` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户微信昵称16进制',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机（也可以作为登录账号)',
  `mobile_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '手机绑定状态： 0未绑定 1已绑定',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `headimgurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信头像',
  `sex` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别 0:未知 1:女 2:男 ',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '个人简介',
  `birthday` int(11) NULL DEFAULT 0 COMMENT '生日',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公司',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公司地址',
  `depament` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门',
  `position` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '职位',
  `puid` int(11) NOT NULL DEFAULT 0 COMMENT '推荐人ID,默认是0',
  `qrcode_invite` int(11) NOT NULL DEFAULT 0 COMMENT '邀请场景二维码id',
  `level` tinyint(1) NOT NULL DEFAULT 1 COMMENT '等级  默认是普通会员',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态  -1删除 0禁用 1正常',
  `last_login_time` int(11) NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `last_login_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `login_num` int(11) NOT NULL DEFAULT 0,
  `register_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `register_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '注册IP',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '信息更新时间',
  `wx_platform` int(11) NOT NULL DEFAULT 0 COMMENT '首次注册来自于哪个微信平台',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_user
-- ----------------------------

-- ----------------------------
-- Table structure for cms_user_level
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_level`;
CREATE TABLE `cms_user_level`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '等级名称',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态:0禁用,1正常',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员等级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_user_level
-- ----------------------------
INSERT INTO `cms_user_level` VALUES (1, '普通会员', '', 1, 1639562910, 0);
INSERT INTO `cms_user_level` VALUES (2, '铜牌会员', '', 1, 1639562910, 0);
INSERT INTO `cms_user_level` VALUES (3, '银牌会员', '', 1, 1639562910, 0);
INSERT INTO `cms_user_level` VALUES (4, '黄金会员', '', 1, 1639562910, 0);
INSERT INTO `cms_user_level` VALUES (5, '白金会员', '', 1, 1639562910, 0);
INSERT INTO `cms_user_level` VALUES (6, '钻石会员', '', 1, 1639562910, 0);

-- ----------------------------
-- Table structure for cms_user_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_log`;
CREATE TABLE `cms_user_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作类型',
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作描述',
  `module` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `function` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录ip',
  `param_id` int(11) UNSIGNED NOT NULL COMMENT '操作ID',
  `param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数json格式',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0删除 1正常',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_user_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
