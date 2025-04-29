/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : owladmindev

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 29/04/2025 10:58:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_apis
-- ----------------------------
DROP TABLE IF EXISTS `admin_apis`;
CREATE TABLE `admin_apis`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口路径',
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口模板',
  `enabled` tinyint NOT NULL DEFAULT 1 COMMENT '是否启用',
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '接口参数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_apis
-- ----------------------------

-- ----------------------------
-- Table structure for admin_dict
-- ----------------------------
DROP TABLE IF EXISTS `admin_dict`;
CREATE TABLE `admin_dict`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '父级ID',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编码',
  `enabled` tinyint NOT NULL DEFAULT 1 COMMENT '是否启用',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_dict_parent_id_index`(`parent_id` ASC) USING BTREE,
  INDEX `admin_dict_key_index`(`key` ASC) USING BTREE,
  INDEX `admin_dict_enabled_index`(`enabled` ASC) USING BTREE,
  INDEX `admin_dict_sort_index`(`sort` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '数据字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_dict
-- ----------------------------

-- ----------------------------
-- Table structure for admin_extensions
-- ----------------------------
DROP TABLE IF EXISTS `admin_extensions`;
CREATE TABLE `admin_extensions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_enabled` tinyint NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_extensions_name_unique`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_extensions
-- ----------------------------
INSERT INTO `admin_extensions` VALUES (1, 'slowlyo.owl-dict', 1, '2025-04-18 07:44:19', '2025-04-18 07:44:19');
INSERT INTO `admin_extensions` VALUES (2, 'slowlyo.owl-login-guard', 1, '2025-04-18 07:45:41', '2025-04-18 07:45:41');
INSERT INTO `admin_extensions` VALUES (3, 'slowlyo.owl-log-viewer', 1, '2025-04-18 07:45:59', '2025-04-18 07:45:59');
INSERT INTO `admin_extensions` VALUES (4, 'hyperf-plus.ai-helper', 0, '2025-04-18 07:58:51', '2025-04-18 07:59:07');
INSERT INTO `admin_extensions` VALUES (5, 'likeweb.core', 1, '2025-04-18 07:58:53', '2025-04-18 07:58:53');
INSERT INTO `admin_extensions` VALUES (6, 'owl-admin.components', 1, '2025-04-18 07:59:11', '2025-04-18 07:59:11');
INSERT INTO `admin_extensions` VALUES (7, 'slowlyo.owl-amis-json-parse', 1, '2025-04-18 07:59:13', '2025-04-18 07:59:13');
INSERT INTO `admin_extensions` VALUES (8, 'slowlyo.owl-icon-cache', 1, '2025-04-18 07:59:16', '2025-04-18 07:59:16');
INSERT INTO `admin_extensions` VALUES (9, 'slowlyo.owl-menu-search', 1, '2025-04-18 08:03:57', '2025-04-18 08:03:57');
INSERT INTO `admin_extensions` VALUES (10, 'slowlyo.owl-module-notice', 1, '2025-04-18 08:04:03', '2025-04-18 08:04:03');
INSERT INTO `admin_extensions` VALUES (12, 'ennnnny.owladmin-cloud-storage', 1, '2025-04-18 08:04:25', '2025-04-18 08:04:25');

-- ----------------------------
-- Table structure for admin_menus
-- ----------------------------
DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE `admin_menus`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT 0,
  `custom_order` int NOT NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单路由',
  `url_type` tinyint NOT NULL DEFAULT 1 COMMENT '路由类型(1:路由,2:外链,3:iframe)',
  `visible` tinyint NOT NULL DEFAULT 1 COMMENT '是否可见',
  `is_home` tinyint NOT NULL DEFAULT 0 COMMENT '是否为首页',
  `keep_alive` tinyint NULL DEFAULT NULL COMMENT '页面缓存',
  `iframe_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'iframe_url',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单组件',
  `is_full` tinyint NOT NULL DEFAULT 0 COMMENT '是否是完整页面',
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '扩展',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menus
-- ----------------------------
INSERT INTO `admin_menus` VALUES (1, 0, 0, 'dashboard', 'mdi:chart-line', '/dashboard', 1, 1, 1, NULL, NULL, NULL, 0, NULL, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_menus` VALUES (2, 0, 0, 'admin_system', 'material-symbols:settings-outline', '/system', 1, 1, 0, NULL, NULL, NULL, 0, NULL, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_menus` VALUES (3, 2, 0, 'admin_users', 'ph:user-gear', '/system/admin_users', 1, 1, 0, NULL, NULL, NULL, 0, NULL, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_menus` VALUES (4, 2, 0, 'admin_roles', 'carbon:user-role', '/system/admin_roles', 1, 1, 0, NULL, NULL, NULL, 0, NULL, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_menus` VALUES (5, 2, 0, 'admin_permission', 'fluent-mdl2:permissions', '/system/admin_permissions', 1, 1, 0, NULL, NULL, NULL, 0, NULL, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_menus` VALUES (6, 2, 0, 'admin_menu', 'ant-design:menu-unfold-outlined', '/system/admin_menus', 1, 1, 0, NULL, NULL, NULL, 0, NULL, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_menus` VALUES (7, 2, 0, 'admin_setting', 'akar-icons:settings-horizontal', '/system/settings', 1, 1, 0, NULL, NULL, NULL, 0, NULL, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_menus` VALUES (8, 0, 1, '数据字典', 'fluent-mdl2:dictionary', '/admin_dict', 1, 1, 0, NULL, NULL, NULL, 0, 'slowlyo.owl-dict', '2025-04-18 07:44:19', '2025-04-18 07:44:19');
INSERT INTO `admin_menus` VALUES (9, 0, 2, '系统日志', 'octicon:log-24', '/owl-log-viewer', 1, 1, 0, NULL, NULL, NULL, 0, 'slowlyo.owl-log-viewer', '2025-04-18 07:45:59', '2025-04-18 07:45:59');
INSERT INTO `admin_menus` VALUES (11, 0, 3, 'amis json 解析', 'mdi:code-json', '/slow-amis-json-parse', 1, 1, 0, NULL, NULL, NULL, 0, 'slowlyo.owl-amis-json-parse', '2025-04-18 07:59:13', '2025-04-18 07:59:13');

-- ----------------------------
-- Table structure for admin_pages
-- ----------------------------
DROP TABLE IF EXISTS `admin_pages`;
CREATE TABLE `admin_pages`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面名称',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面标识',
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面结构',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_pages
-- ----------------------------

-- ----------------------------
-- Table structure for admin_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE `admin_permission_menu`  (
  `permission_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_permission_menu_permission_id_menu_id_index`(`permission_id` ASC, `menu_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permission_menu
-- ----------------------------
INSERT INTO `admin_permission_menu` VALUES (1, 1, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permission_menu` VALUES (2, 2, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permission_menu` VALUES (3, 3, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permission_menu` VALUES (2, 3, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permission_menu` VALUES (4, 4, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permission_menu` VALUES (2, 4, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permission_menu` VALUES (5, 5, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permission_menu` VALUES (2, 5, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permission_menu` VALUES (6, 6, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permission_menu` VALUES (2, 6, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permission_menu` VALUES (7, 7, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permission_menu` VALUES (2, 7, '2025-04-18 03:14:56', '2025-04-18 03:14:56');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `custom_order` int NOT NULL DEFAULT 0,
  `parent_id` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name` ASC) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, '首页', 'home', NULL, '[\'/home*\']', 0, 0, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permissions` VALUES (2, '系统', 'system', NULL, '', 0, 0, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permissions` VALUES (3, '管理员', 'admin_users', NULL, '[\'/admin_users*\']', 0, 2, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permissions` VALUES (4, '角色', 'roles', NULL, '[\'/roles*\']', 0, 2, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permissions` VALUES (5, '权限', 'permissions', NULL, '[\'/permissions*\']', 0, 2, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permissions` VALUES (6, '菜单', 'menus', NULL, '[\'/menus*\']', 0, 2, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_permissions` VALUES (7, '设置', 'settings', NULL, '[\'/settings*\']', 0, 2, '2025-04-18 03:14:56', '2025-04-18 03:14:56');

-- ----------------------------
-- Table structure for admin_relationships
-- ----------------------------
DROP TABLE IF EXISTS `admin_relationships`;
CREATE TABLE `admin_relationships`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联名称',
  `args` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '关联参数',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '额外参数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_relationships
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id` ASC, `permission_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_role_permissions` VALUES (1, 2, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_role_permissions` VALUES (1, 3, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_role_permissions` VALUES (1, 4, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_role_permissions` VALUES (1, 5, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_role_permissions` VALUES (1, 6, '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_role_permissions` VALUES (1, 7, '2025-04-18 03:14:56', '2025-04-18 03:14:56');

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id` ASC, `user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, '2025-04-18 03:14:56', '2025-04-18 03:14:56');

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name` ASC) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2025-04-18 03:14:56', '2025-04-18 03:14:56');

-- ----------------------------
-- Table structure for admin_settings
-- ----------------------------
DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE `admin_settings`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_settings
-- ----------------------------
INSERT INTO `admin_settings` VALUES ('admin_locale', '\"zh_CN\"', '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_settings` VALUES ('admin_common_field', '{\"标题/名称\":{\"name\":\"title\",\"type\":\"string\",\"default\":null,\"nullable\":false,\"comment\":\"标题\",\"action_scope\":[\"list\",\"detail\",\"create\",\"edit\"],\"file_column\":0,\"list_component\":{\"list_component_property\":[{\"name\":\"searchable\",\"value\":\"1\"}],\"list_component_type\":\"TableColumn\",\"component_property_options\":[{\"label\":\"align\",\"value\":\"align\"},{\"label\":\"breakpoint\",\"value\":\"breakpoint\"},{\"label\":\"canAccessSuperData\",\"value\":\"canAccessSuperData\"},{\"label\":\"className\",\"value\":\"className\"},{\"label\":\"classNameExpr\",\"value\":\"classNameExpr\"},{\"label\":\"copyable\",\"value\":\"copyable\"},{\"label\":\"filterable\",\"value\":\"filterable\"},{\"label\":\"fixed\",\"value\":\"fixed\"},{\"label\":\"headerAlign\",\"value\":\"headerAlign\"},{\"label\":\"innerStyle\",\"value\":\"innerStyle\"},{\"label\":\"labelClassName\",\"value\":\"labelClassName\"},{\"label\":\"lazyRenderAfter\",\"value\":\"lazyRenderAfter\"},{\"label\":\"popOver\",\"value\":\"popOver\"},{\"label\":\"quickEdit\",\"value\":\"quickEdit\"},{\"label\":\"quickEditOnUpdate\",\"value\":\"quickEditOnUpdate\"},{\"label\":\"remark\",\"value\":\"remark\"},{\"label\":\"searchable\",\"value\":\"searchable\"},{\"label\":\"sortable\",\"value\":\"sortable\"},{\"label\":\"toggled\",\"value\":\"toggled\"},{\"label\":\"type\",\"value\":\"type\"},{\"label\":\"unique\",\"value\":\"unique\"},{\"label\":\"vAlign\",\"value\":\"vAlign\"},{\"label\":\"value\",\"value\":\"value\"},{\"label\":\"width\",\"value\":\"width\"},{\"label\":\"make\",\"value\":\"make\"},{\"label\":\"permission\",\"value\":\"permission\"},{\"label\":\"filteredResults\",\"value\":\"filteredResults\"},{\"label\":\"macro\",\"value\":\"macro\"},{\"label\":\"mixin\",\"value\":\"mixin\"},{\"label\":\"hasMacro\",\"value\":\"hasMacro\"},{\"label\":\"flushMacros\",\"value\":\"flushMacros\"},{\"label\":\"__callStatic\",\"value\":\"__callStatic\"},{\"label\":\"macroCall\",\"value\":\"macroCall\"}]},\"form_component\":{\"form_component_type\":\"TextControl\",\"component_property_options\":[{\"label\":\"addApi\",\"value\":\"addApi\"},{\"label\":\"addControls\",\"value\":\"addControls\"},{\"label\":\"addDialog\",\"value\":\"addDialog\"},{\"label\":\"addOn\",\"value\":\"addOn\"},{\"label\":\"autoComplete\",\"value\":\"autoComplete\"},{\"label\":\"autoFill\",\"value\":\"autoFill\"},{\"label\":\"borderMode\",\"value\":\"borderMode\"},{\"label\":\"className\",\"value\":\"className\"},{\"label\":\"clearValueOnEmpty\",\"value\":\"clearValueOnEmpty\"},{\"label\":\"clearValueOnHidden\",\"value\":\"clearValueOnHidden\"},{\"label\":\"clearable\",\"value\":\"clearable\"},{\"label\":\"creatable\",\"value\":\"creatable\"},{\"label\":\"createBtnLabel\",\"value\":\"createBtnLabel\"},{\"label\":\"deferApi\",\"value\":\"deferApi\"},{\"label\":\"deferField\",\"value\":\"deferField\"},{\"label\":\"deleteApi\",\"value\":\"deleteApi\"},{\"label\":\"deleteConfirmText\",\"value\":\"deleteConfirmText\"},{\"label\":\"delimiter\",\"value\":\"delimiter\"},{\"label\":\"desc\",\"value\":\"desc\"},{\"label\":\"description\",\"value\":\"description\"},{\"label\":\"descriptionClassName\",\"value\":\"descriptionClassName\"},{\"label\":\"disabled\",\"value\":\"disabled\"},{\"label\":\"disabledOn\",\"value\":\"disabledOn\"},{\"label\":\"editApi\",\"value\":\"editApi\"},{\"label\":\"editControls\",\"value\":\"editControls\"},{\"label\":\"editDialog\",\"value\":\"editDialog\"},{\"label\":\"editable\",\"value\":\"editable\"},{\"label\":\"editorSetting\",\"value\":\"editorSetting\"},{\"label\":\"extraName\",\"value\":\"extraName\"},{\"label\":\"extractValue\",\"value\":\"extractValue\"},{\"label\":\"hidden\",\"value\":\"hidden\"},{\"label\":\"hiddenOn\",\"value\":\"hiddenOn\"},{\"label\":\"hint\",\"value\":\"hint\"},{\"label\":\"horizontal\",\"value\":\"horizontal\"},{\"label\":\"id\",\"value\":\"id\"},{\"label\":\"initAutoFill\",\"value\":\"initAutoFill\"},{\"label\":\"initFetch\",\"value\":\"initFetch\"},{\"label\":\"initFetchOn\",\"value\":\"initFetchOn\"},{\"label\":\"inline\",\"value\":\"inline\"},{\"label\":\"inputClassName\",\"value\":\"inputClassName\"},{\"label\":\"inputControlClassName\",\"value\":\"inputControlClassName\"},{\"label\":\"joinValues\",\"value\":\"joinValues\"},{\"label\":\"labelAlign\",\"value\":\"labelAlign\"},{\"label\":\"labelClassName\",\"value\":\"labelClassName\"},{\"label\":\"labelRemark\",\"value\":\"labelRemark\"},{\"label\":\"labelWidth\",\"value\":\"labelWidth\"},{\"label\":\"maxLength\",\"value\":\"maxLength\"},{\"label\":\"minLength\",\"value\":\"minLength\"},{\"label\":\"mode\",\"value\":\"mode\"},{\"label\":\"multiple\",\"value\":\"multiple\"},{\"label\":\"nativeAutoComplete\",\"value\":\"nativeAutoComplete\"},{\"label\":\"nativeInputClassName\",\"value\":\"nativeInputClassName\"},{\"label\":\"onEvent\",\"value\":\"onEvent\"},{\"label\":\"options\",\"value\":\"options\"},{\"label\":\"placeholder\",\"value\":\"placeholder\"},{\"label\":\"prefix\",\"value\":\"prefix\"},{\"label\":\"readOnly\",\"value\":\"readOnly\"},{\"label\":\"readOnlyOn\",\"value\":\"readOnlyOn\"},{\"label\":\"remark\",\"value\":\"remark\"},{\"label\":\"removable\",\"value\":\"removable\"},{\"label\":\"required\",\"value\":\"required\"},{\"label\":\"resetValue\",\"value\":\"resetValue\"},{\"label\":\"row\",\"value\":\"row\"},{\"label\":\"saveImmediately\",\"value\":\"saveImmediately\"},{\"label\":\"selectFirst\",\"value\":\"selectFirst\"},{\"label\":\"showCounter\",\"value\":\"showCounter\"},{\"label\":\"size\",\"value\":\"size\"},{\"label\":\"source\",\"value\":\"source\"},{\"label\":\"static\",\"value\":\"static\"},{\"label\":\"staticClassName\",\"value\":\"staticClassName\"},{\"label\":\"staticInputClassName\",\"value\":\"staticInputClassName\"},{\"label\":\"staticLabelClassName\",\"value\":\"staticLabelClassName\"},{\"label\":\"staticOn\",\"value\":\"staticOn\"},{\"label\":\"staticPlaceholder\",\"value\":\"staticPlaceholder\"},{\"label\":\"staticSchema\",\"value\":\"staticSchema\"},{\"label\":\"style\",\"value\":\"style\"},{\"label\":\"submitOnChange\",\"value\":\"submitOnChange\"},{\"label\":\"suffix\",\"value\":\"suffix\"},{\"label\":\"testIdBuilder\",\"value\":\"testIdBuilder\"},{\"label\":\"transform\",\"value\":\"transform\"},{\"label\":\"trimContents\",\"value\":\"trimContents\"},{\"label\":\"type\",\"value\":\"type\"},{\"label\":\"useMobileUI\",\"value\":\"useMobileUI\"},{\"label\":\"validateApi\",\"value\":\"validateApi\"},{\"label\":\"validateOnChange\",\"value\":\"validateOnChange\"},{\"label\":\"validationErrors\",\"value\":\"validationErrors\"},{\"label\":\"validations\",\"value\":\"validations\"},{\"label\":\"value\",\"value\":\"value\"},{\"label\":\"valuesNoWrap\",\"value\":\"valuesNoWrap\"},{\"label\":\"visible\",\"value\":\"visible\"},{\"label\":\"visibleOn\",\"value\":\"visibleOn\"},{\"label\":\"width\",\"value\":\"width\"},{\"label\":\"make\",\"value\":\"make\"},{\"label\":\"permission\",\"value\":\"permission\"},{\"label\":\"filteredResults\",\"value\":\"filteredResults\"},{\"label\":\"macro\",\"value\":\"macro\"},{\"label\":\"mixin\",\"value\":\"mixin\"},{\"label\":\"hasMacro\",\"value\":\"hasMacro\"},{\"label\":\"flushMacros\",\"value\":\"flushMacros\"},{\"label\":\"__callStatic\",\"value\":\"__callStatic\"},{\"label\":\"macroCall\",\"value\":\"macroCall\"}],\"form_component_property\":[{\"name\":\"required\",\"value\":\"1\"}]},\"detail_component\":[],\"list_filter\":[{\"mode\":\"input\",\"type\":\"contains\",\"filter\":{\"filter_type\":\"TextControl\",\"filter_property\":[{\"name\":\"size\",\"value\":\"md\"},{\"name\":\"clearable\",\"value\":1}],\"component_property_options\":[{\"label\":\"addApi\",\"value\":\"addApi\"},{\"label\":\"addControls\",\"value\":\"addControls\"},{\"label\":\"addDialog\",\"value\":\"addDialog\"},{\"label\":\"addOn\",\"value\":\"addOn\"},{\"label\":\"autoComplete\",\"value\":\"autoComplete\"},{\"label\":\"autoFill\",\"value\":\"autoFill\"},{\"label\":\"borderMode\",\"value\":\"borderMode\"},{\"label\":\"className\",\"value\":\"className\"},{\"label\":\"clearValueOnEmpty\",\"value\":\"clearValueOnEmpty\"},{\"label\":\"clearValueOnHidden\",\"value\":\"clearValueOnHidden\"},{\"label\":\"clearable\",\"value\":\"clearable\"},{\"label\":\"creatable\",\"value\":\"creatable\"},{\"label\":\"createBtnLabel\",\"value\":\"createBtnLabel\"},{\"label\":\"deferApi\",\"value\":\"deferApi\"},{\"label\":\"deferField\",\"value\":\"deferField\"},{\"label\":\"deleteApi\",\"value\":\"deleteApi\"},{\"label\":\"deleteConfirmText\",\"value\":\"deleteConfirmText\"},{\"label\":\"delimiter\",\"value\":\"delimiter\"},{\"label\":\"desc\",\"value\":\"desc\"},{\"label\":\"description\",\"value\":\"description\"},{\"label\":\"descriptionClassName\",\"value\":\"descriptionClassName\"},{\"label\":\"disabled\",\"value\":\"disabled\"},{\"label\":\"disabledOn\",\"value\":\"disabledOn\"},{\"label\":\"editApi\",\"value\":\"editApi\"},{\"label\":\"editControls\",\"value\":\"editControls\"},{\"label\":\"editDialog\",\"value\":\"editDialog\"},{\"label\":\"editable\",\"value\":\"editable\"},{\"label\":\"editorSetting\",\"value\":\"editorSetting\"},{\"label\":\"extraName\",\"value\":\"extraName\"},{\"label\":\"extractValue\",\"value\":\"extractValue\"},{\"label\":\"hidden\",\"value\":\"hidden\"},{\"label\":\"hiddenOn\",\"value\":\"hiddenOn\"},{\"label\":\"hint\",\"value\":\"hint\"},{\"label\":\"horizontal\",\"value\":\"horizontal\"},{\"label\":\"id\",\"value\":\"id\"},{\"label\":\"initAutoFill\",\"value\":\"initAutoFill\"},{\"label\":\"initFetch\",\"value\":\"initFetch\"},{\"label\":\"initFetchOn\",\"value\":\"initFetchOn\"},{\"label\":\"inline\",\"value\":\"inline\"},{\"label\":\"inputClassName\",\"value\":\"inputClassName\"},{\"label\":\"inputControlClassName\",\"value\":\"inputControlClassName\"},{\"label\":\"joinValues\",\"value\":\"joinValues\"},{\"label\":\"labelAlign\",\"value\":\"labelAlign\"},{\"label\":\"labelClassName\",\"value\":\"labelClassName\"},{\"label\":\"labelRemark\",\"value\":\"labelRemark\"},{\"label\":\"labelWidth\",\"value\":\"labelWidth\"},{\"label\":\"maxLength\",\"value\":\"maxLength\"},{\"label\":\"minLength\",\"value\":\"minLength\"},{\"label\":\"mode\",\"value\":\"mode\"},{\"label\":\"multiple\",\"value\":\"multiple\"},{\"label\":\"nativeAutoComplete\",\"value\":\"nativeAutoComplete\"},{\"label\":\"nativeInputClassName\",\"value\":\"nativeInputClassName\"},{\"label\":\"onEvent\",\"value\":\"onEvent\"},{\"label\":\"options\",\"value\":\"options\"},{\"label\":\"placeholder\",\"value\":\"placeholder\"},{\"label\":\"prefix\",\"value\":\"prefix\"},{\"label\":\"readOnly\",\"value\":\"readOnly\"},{\"label\":\"readOnlyOn\",\"value\":\"readOnlyOn\"},{\"label\":\"remark\",\"value\":\"remark\"},{\"label\":\"removable\",\"value\":\"removable\"},{\"label\":\"required\",\"value\":\"required\"},{\"label\":\"resetValue\",\"value\":\"resetValue\"},{\"label\":\"row\",\"value\":\"row\"},{\"label\":\"saveImmediately\",\"value\":\"saveImmediately\"},{\"label\":\"selectFirst\",\"value\":\"selectFirst\"},{\"label\":\"showCounter\",\"value\":\"showCounter\"},{\"label\":\"size\",\"value\":\"size\"},{\"label\":\"source\",\"value\":\"source\"},{\"label\":\"static\",\"value\":\"static\"},{\"label\":\"staticClassName\",\"value\":\"staticClassName\"},{\"label\":\"staticInputClassName\",\"value\":\"staticInputClassName\"},{\"label\":\"staticLabelClassName\",\"value\":\"staticLabelClassName\"},{\"label\":\"staticOn\",\"value\":\"staticOn\"},{\"label\":\"staticPlaceholder\",\"value\":\"staticPlaceholder\"},{\"label\":\"staticSchema\",\"value\":\"staticSchema\"},{\"label\":\"style\",\"value\":\"style\"},{\"label\":\"submitOnChange\",\"value\":\"submitOnChange\"},{\"label\":\"suffix\",\"value\":\"suffix\"},{\"label\":\"testIdBuilder\",\"value\":\"testIdBuilder\"},{\"label\":\"transform\",\"value\":\"transform\"},{\"label\":\"trimContents\",\"value\":\"trimContents\"},{\"label\":\"type\",\"value\":\"type\"},{\"label\":\"useMobileUI\",\"value\":\"useMobileUI\"},{\"label\":\"validateApi\",\"value\":\"validateApi\"},{\"label\":\"validateOnChange\",\"value\":\"validateOnChange\"},{\"label\":\"validationErrors\",\"value\":\"validationErrors\"},{\"label\":\"validations\",\"value\":\"validations\"},{\"label\":\"value\",\"value\":\"value\"},{\"label\":\"valuesNoWrap\",\"value\":\"valuesNoWrap\"},{\"label\":\"visible\",\"value\":\"visible\"},{\"label\":\"visibleOn\",\"value\":\"visibleOn\"},{\"label\":\"width\",\"value\":\"width\"},{\"label\":\"make\",\"value\":\"make\"},{\"label\":\"permission\",\"value\":\"permission\"},{\"label\":\"filteredResults\",\"value\":\"filteredResults\"},{\"label\":\"macro\",\"value\":\"macro\"},{\"label\":\"mixin\",\"value\":\"mixin\"},{\"label\":\"hasMacro\",\"value\":\"hasMacro\"},{\"label\":\"flushMacros\",\"value\":\"flushMacros\"},{\"label\":\"__callStatic\",\"value\":\"__callStatic\"},{\"label\":\"macroCall\",\"value\":\"macroCall\"}]},\"input_name\":\"keywords\"}]},\"单图\":{\"name\":\"image\",\"type\":\"string\",\"default\":null,\"nullable\":true,\"comment\":\"单图\",\"action_scope\":[\"list\",\"detail\",\"create\",\"edit\"],\"file_column\":true,\"list_component\":{\"list_component_type\":\"TableColumn\",\"component_property_options\":[{\"label\":\"align\",\"value\":\"align\"},{\"label\":\"breakpoint\",\"value\":\"breakpoint\"},{\"label\":\"canAccessSuperData\",\"value\":\"canAccessSuperData\"},{\"label\":\"className\",\"value\":\"className\"},{\"label\":\"classNameExpr\",\"value\":\"classNameExpr\"},{\"label\":\"copyable\",\"value\":\"copyable\"},{\"label\":\"filterable\",\"value\":\"filterable\"},{\"label\":\"fixed\",\"value\":\"fixed\"},{\"label\":\"headerAlign\",\"value\":\"headerAlign\"},{\"label\":\"innerStyle\",\"value\":\"innerStyle\"},{\"label\":\"labelClassName\",\"value\":\"labelClassName\"},{\"label\":\"lazyRenderAfter\",\"value\":\"lazyRenderAfter\"},{\"label\":\"popOver\",\"value\":\"popOver\"},{\"label\":\"quickEdit\",\"value\":\"quickEdit\"},{\"label\":\"quickEditOnUpdate\",\"value\":\"quickEditOnUpdate\"},{\"label\":\"remark\",\"value\":\"remark\"},{\"label\":\"searchable\",\"value\":\"searchable\"},{\"label\":\"sortable\",\"value\":\"sortable\"},{\"label\":\"toggled\",\"value\":\"toggled\"},{\"label\":\"type\",\"value\":\"type\"},{\"label\":\"unique\",\"value\":\"unique\"},{\"label\":\"vAlign\",\"value\":\"vAlign\"},{\"label\":\"value\",\"value\":\"value\"},{\"label\":\"width\",\"value\":\"width\"},{\"label\":\"make\",\"value\":\"make\"},{\"label\":\"permission\",\"value\":\"permission\"},{\"label\":\"filteredResults\",\"value\":\"filteredResults\"},{\"label\":\"macro\",\"value\":\"macro\"},{\"label\":\"mixin\",\"value\":\"mixin\"},{\"label\":\"hasMacro\",\"value\":\"hasMacro\"},{\"label\":\"flushMacros\",\"value\":\"flushMacros\"},{\"label\":\"__callStatic\",\"value\":\"__callStatic\"},{\"label\":\"macroCall\",\"value\":\"macroCall\"}],\"list_component_property\":[{\"name\":\"type\",\"value\":\"image\"},{\"name\":\"enlargeAble\",\"value\":\"1\"}]},\"form_component\":{\"form_component_type\":\"ImageControl\",\"component_property_options\":[{\"label\":\"accept\",\"value\":\"accept\"},{\"label\":\"allowInput\",\"value\":\"allowInput\"},{\"label\":\"autoFill\",\"value\":\"autoFill\"},{\"label\":\"autoUpload\",\"value\":\"autoUpload\"},{\"label\":\"btnClassName\",\"value\":\"btnClassName\"},{\"label\":\"btnUploadClassName\",\"value\":\"btnUploadClassName\"},{\"label\":\"capture\",\"value\":\"capture\"},{\"label\":\"className\",\"value\":\"className\"},{\"label\":\"clearValueOnHidden\",\"value\":\"clearValueOnHidden\"},{\"label\":\"compress\",\"value\":\"compress\"},{\"label\":\"compressOptions\",\"value\":\"compressOptions\"},{\"label\":\"crop\",\"value\":\"crop\"},{\"label\":\"cropFormat\",\"value\":\"cropFormat\"},{\"label\":\"cropQuality\",\"value\":\"cropQuality\"},{\"label\":\"delimiter\",\"value\":\"delimiter\"},{\"label\":\"desc\",\"value\":\"desc\"},{\"label\":\"description\",\"value\":\"description\"},{\"label\":\"descriptionClassName\",\"value\":\"descriptionClassName\"},{\"label\":\"disabled\",\"value\":\"disabled\"},{\"label\":\"disabledOn\",\"value\":\"disabledOn\"},{\"label\":\"draggable\",\"value\":\"draggable\"},{\"label\":\"draggableTip\",\"value\":\"draggableTip\"},{\"label\":\"dropCrop\",\"value\":\"dropCrop\"},{\"label\":\"editorSetting\",\"value\":\"editorSetting\"},{\"label\":\"extraName\",\"value\":\"extraName\"},{\"label\":\"extractValue\",\"value\":\"extractValue\"},{\"label\":\"fixedSize\",\"value\":\"fixedSize\"},{\"label\":\"fixedSizeClassName\",\"value\":\"fixedSizeClassName\"},{\"label\":\"frameImage\",\"value\":\"frameImage\"},{\"label\":\"hidden\",\"value\":\"hidden\"},{\"label\":\"hiddenOn\",\"value\":\"hiddenOn\"},{\"label\":\"hideUploadButton\",\"value\":\"hideUploadButton\"},{\"label\":\"hint\",\"value\":\"hint\"},{\"label\":\"horizontal\",\"value\":\"horizontal\"},{\"label\":\"id\",\"value\":\"id\"},{\"label\":\"imageClassName\",\"value\":\"imageClassName\"},{\"label\":\"initAutoFill\",\"value\":\"initAutoFill\"},{\"label\":\"initCrop\",\"value\":\"initCrop\"},{\"label\":\"inline\",\"value\":\"inline\"},{\"label\":\"inputClassName\",\"value\":\"inputClassName\"},{\"label\":\"joinValues\",\"value\":\"joinValues\"},{\"label\":\"labelAlign\",\"value\":\"labelAlign\"},{\"label\":\"labelClassName\",\"value\":\"labelClassName\"},{\"label\":\"labelRemark\",\"value\":\"labelRemark\"},{\"label\":\"labelWidth\",\"value\":\"labelWidth\"},{\"label\":\"limit\",\"value\":\"limit\"},{\"label\":\"maxLength\",\"value\":\"maxLength\"},{\"label\":\"maxSize\",\"value\":\"maxSize\"},{\"label\":\"mode\",\"value\":\"mode\"},{\"label\":\"multiple\",\"value\":\"multiple\"},{\"label\":\"onEvent\",\"value\":\"onEvent\"},{\"label\":\"placeholder\",\"value\":\"placeholder\"},{\"label\":\"reCropable\",\"value\":\"reCropable\"},{\"label\":\"readOnly\",\"value\":\"readOnly\"},{\"label\":\"readOnlyOn\",\"value\":\"readOnlyOn\"},{\"label\":\"receiver\",\"value\":\"receiver\"},{\"label\":\"remark\",\"value\":\"remark\"},{\"label\":\"required\",\"value\":\"required\"},{\"label\":\"resetValue\",\"value\":\"resetValue\"},{\"label\":\"row\",\"value\":\"row\"},{\"label\":\"saveImmediately\",\"value\":\"saveImmediately\"},{\"label\":\"showCompressOptions\",\"value\":\"showCompressOptions\"},{\"label\":\"size\",\"value\":\"size\"},{\"label\":\"src\",\"value\":\"src\"},{\"label\":\"static\",\"value\":\"static\"},{\"label\":\"staticClassName\",\"value\":\"staticClassName\"},{\"label\":\"staticInputClassName\",\"value\":\"staticInputClassName\"},{\"label\":\"staticLabelClassName\",\"value\":\"staticLabelClassName\"},{\"label\":\"staticOn\",\"value\":\"staticOn\"},{\"label\":\"staticPlaceholder\",\"value\":\"staticPlaceholder\"},{\"label\":\"staticSchema\",\"value\":\"staticSchema\"},{\"label\":\"style\",\"value\":\"style\"},{\"label\":\"submitOnChange\",\"value\":\"submitOnChange\"},{\"label\":\"testIdBuilder\",\"value\":\"testIdBuilder\"},{\"label\":\"thumbMode\",\"value\":\"thumbMode\"},{\"label\":\"thumbRatio\",\"value\":\"thumbRatio\"},{\"label\":\"type\",\"value\":\"type\"},{\"label\":\"uploadBtnText\",\"value\":\"uploadBtnText\"},{\"label\":\"useMobileUI\",\"value\":\"useMobileUI\"},{\"label\":\"validateApi\",\"value\":\"validateApi\"},{\"label\":\"validateOnChange\",\"value\":\"validateOnChange\"},{\"label\":\"validationErrors\",\"value\":\"validationErrors\"},{\"label\":\"validations\",\"value\":\"validations\"},{\"label\":\"value\",\"value\":\"value\"},{\"label\":\"visible\",\"value\":\"visible\"},{\"label\":\"visibleOn\",\"value\":\"visibleOn\"},{\"label\":\"width\",\"value\":\"width\"},{\"label\":\"make\",\"value\":\"make\"},{\"label\":\"permission\",\"value\":\"permission\"},{\"label\":\"filteredResults\",\"value\":\"filteredResults\"},{\"label\":\"macro\",\"value\":\"macro\"},{\"label\":\"mixin\",\"value\":\"mixin\"},{\"label\":\"hasMacro\",\"value\":\"hasMacro\"},{\"label\":\"flushMacros\",\"value\":\"flushMacros\"},{\"label\":\"__callStatic\",\"value\":\"__callStatic\"},{\"label\":\"macroCall\",\"value\":\"macroCall\"},{\"label\":\"uploadImagePath\",\"value\":\"uploadImagePath\"},{\"label\":\"uploadImage\",\"value\":\"uploadImage\"},{\"label\":\"uploadFilePath\",\"value\":\"uploadFilePath\"},{\"label\":\"uploadFile\",\"value\":\"uploadFile\"},{\"label\":\"uploadRichPath\",\"value\":\"uploadRichPath\"},{\"label\":\"uploadRich\",\"value\":\"uploadRich\"},{\"label\":\"chunkUploadStart\",\"value\":\"chunkUploadStart\"},{\"label\":\"chunkUpload\",\"value\":\"chunkUpload\"},{\"label\":\"chunkUploadFinish\",\"value\":\"chunkUploadFinish\"}],\"form_component_property\":[{\"name\":\"required\",\"value\":\"1\"}]},\"detail_component\":{\"detail_component_type\":\"StaticExactControl\",\"component_property_options\":[{\"label\":\"autoFill\",\"value\":\"autoFill\"},{\"label\":\"borderMode\",\"value\":\"borderMode\"},{\"label\":\"className\",\"value\":\"className\"},{\"label\":\"clearValueOnHidden\",\"value\":\"clearValueOnHidden\"},{\"label\":\"copyable\",\"value\":\"copyable\"},{\"label\":\"desc\",\"value\":\"desc\"},{\"label\":\"description\",\"value\":\"description\"},{\"label\":\"descriptionClassName\",\"value\":\"descriptionClassName\"},{\"label\":\"disabled\",\"value\":\"disabled\"},{\"label\":\"disabledOn\",\"value\":\"disabledOn\"},{\"label\":\"editorSetting\",\"value\":\"editorSetting\"},{\"label\":\"extraName\",\"value\":\"extraName\"},{\"label\":\"hidden\",\"value\":\"hidden\"},{\"label\":\"hiddenOn\",\"value\":\"hiddenOn\"},{\"label\":\"hint\",\"value\":\"hint\"},{\"label\":\"horizontal\",\"value\":\"horizontal\"},{\"label\":\"id\",\"value\":\"id\"},{\"label\":\"initAutoFill\",\"value\":\"initAutoFill\"},{\"label\":\"inline\",\"value\":\"inline\"},{\"label\":\"inputClassName\",\"value\":\"inputClassName\"},{\"label\":\"labelAlign\",\"value\":\"labelAlign\"},{\"label\":\"labelClassName\",\"value\":\"labelClassName\"},{\"label\":\"labelRemark\",\"value\":\"labelRemark\"},{\"label\":\"labelWidth\",\"value\":\"labelWidth\"},{\"label\":\"mode\",\"value\":\"mode\"},{\"label\":\"onEvent\",\"value\":\"onEvent\"},{\"label\":\"placeholder\",\"value\":\"placeholder\"},{\"label\":\"popOver\",\"value\":\"popOver\"},{\"label\":\"quickEdit\",\"value\":\"quickEdit\"},{\"label\":\"readOnly\",\"value\":\"readOnly\"},{\"label\":\"readOnlyOn\",\"value\":\"readOnlyOn\"},{\"label\":\"remark\",\"value\":\"remark\"},{\"label\":\"required\",\"value\":\"required\"},{\"label\":\"row\",\"value\":\"row\"},{\"label\":\"saveImmediately\",\"value\":\"saveImmediately\"},{\"label\":\"size\",\"value\":\"size\"},{\"label\":\"static\",\"value\":\"static\"},{\"label\":\"staticClassName\",\"value\":\"staticClassName\"},{\"label\":\"staticInputClassName\",\"value\":\"staticInputClassName\"},{\"label\":\"staticLabelClassName\",\"value\":\"staticLabelClassName\"},{\"label\":\"staticOn\",\"value\":\"staticOn\"},{\"label\":\"staticPlaceholder\",\"value\":\"staticPlaceholder\"},{\"label\":\"staticSchema\",\"value\":\"staticSchema\"},{\"label\":\"style\",\"value\":\"style\"},{\"label\":\"submitOnChange\",\"value\":\"submitOnChange\"},{\"label\":\"testIdBuilder\",\"value\":\"testIdBuilder\"},{\"label\":\"text\",\"value\":\"text\"},{\"label\":\"tpl\",\"value\":\"tpl\"},{\"label\":\"type\",\"value\":\"type\"},{\"label\":\"useMobileUI\",\"value\":\"useMobileUI\"},{\"label\":\"validateApi\",\"value\":\"validateApi\"},{\"label\":\"validateOnChange\",\"value\":\"validateOnChange\"},{\"label\":\"validationErrors\",\"value\":\"validationErrors\"},{\"label\":\"validations\",\"value\":\"validations\"},{\"label\":\"value\",\"value\":\"value\"},{\"label\":\"visible\",\"value\":\"visible\"},{\"label\":\"visibleOn\",\"value\":\"visibleOn\"},{\"label\":\"width\",\"value\":\"width\"},{\"label\":\"make\",\"value\":\"make\"},{\"label\":\"permission\",\"value\":\"permission\"},{\"label\":\"filteredResults\",\"value\":\"filteredResults\"},{\"label\":\"macro\",\"value\":\"macro\"},{\"label\":\"mixin\",\"value\":\"mixin\"},{\"label\":\"hasMacro\",\"value\":\"hasMacro\"},{\"label\":\"flushMacros\",\"value\":\"flushMacros\"},{\"label\":\"__callStatic\",\"value\":\"__callStatic\"},{\"label\":\"macroCall\",\"value\":\"macroCall\"}],\"detail_component_property\":[{\"name\":\"type\",\"value\":\"static-image\"},{\"name\":\"enlargeAble\",\"value\":\"1\"}]},\"file_column_multi\":0},\"排序\":{\"type\":\"integer\",\"comment\":\"排序\",\"action_scope\":[\"list\",\"detail\",\"create\",\"edit\"],\"file_column\":0,\"list_component\":[],\"form_component\":{\"form_component_type\":\"NumberControl\",\"component_property_options\":[{\"label\":\"autoFill\",\"value\":\"autoFill\"},{\"label\":\"big\",\"value\":\"big\"},{\"label\":\"borderMode\",\"value\":\"borderMode\"},{\"label\":\"className\",\"value\":\"className\"},{\"label\":\"clearValueOnHidden\",\"value\":\"clearValueOnHidden\"},{\"label\":\"desc\",\"value\":\"desc\"},{\"label\":\"description\",\"value\":\"description\"},{\"label\":\"descriptionClassName\",\"value\":\"descriptionClassName\"},{\"label\":\"disabled\",\"value\":\"disabled\"},{\"label\":\"disabledOn\",\"value\":\"disabledOn\"},{\"label\":\"displayMode\",\"value\":\"displayMode\"},{\"label\":\"editorSetting\",\"value\":\"editorSetting\"},{\"label\":\"extraName\",\"value\":\"extraName\"},{\"label\":\"hidden\",\"value\":\"hidden\"},{\"label\":\"hiddenOn\",\"value\":\"hiddenOn\"},{\"label\":\"hint\",\"value\":\"hint\"},{\"label\":\"horizontal\",\"value\":\"horizontal\"},{\"label\":\"id\",\"value\":\"id\"},{\"label\":\"initAutoFill\",\"value\":\"initAutoFill\"},{\"label\":\"inline\",\"value\":\"inline\"},{\"label\":\"inputClassName\",\"value\":\"inputClassName\"},{\"label\":\"keyboard\",\"value\":\"keyboard\"},{\"label\":\"kilobitSeparator\",\"value\":\"kilobitSeparator\"},{\"label\":\"labelAlign\",\"value\":\"labelAlign\"},{\"label\":\"labelClassName\",\"value\":\"labelClassName\"},{\"label\":\"labelRemark\",\"value\":\"labelRemark\"},{\"label\":\"labelWidth\",\"value\":\"labelWidth\"},{\"label\":\"max\",\"value\":\"max\"},{\"label\":\"min\",\"value\":\"min\"},{\"label\":\"mode\",\"value\":\"mode\"},{\"label\":\"onEvent\",\"value\":\"onEvent\"},{\"label\":\"placeholder\",\"value\":\"placeholder\"},{\"label\":\"precision\",\"value\":\"precision\"},{\"label\":\"prefix\",\"value\":\"prefix\"},{\"label\":\"readOnly\",\"value\":\"readOnly\"},{\"label\":\"readOnlyOn\",\"value\":\"readOnlyOn\"},{\"label\":\"remark\",\"value\":\"remark\"},{\"label\":\"required\",\"value\":\"required\"},{\"label\":\"row\",\"value\":\"row\"},{\"label\":\"saveImmediately\",\"value\":\"saveImmediately\"},{\"label\":\"showAsPercent\",\"value\":\"showAsPercent\"},{\"label\":\"showSteps\",\"value\":\"showSteps\"},{\"label\":\"size\",\"value\":\"size\"},{\"label\":\"static\",\"value\":\"static\"},{\"label\":\"staticClassName\",\"value\":\"staticClassName\"},{\"label\":\"staticInputClassName\",\"value\":\"staticInputClassName\"},{\"label\":\"staticLabelClassName\",\"value\":\"staticLabelClassName\"},{\"label\":\"staticOn\",\"value\":\"staticOn\"},{\"label\":\"staticPlaceholder\",\"value\":\"staticPlaceholder\"},{\"label\":\"staticSchema\",\"value\":\"staticSchema\"},{\"label\":\"step\",\"value\":\"step\"},{\"label\":\"style\",\"value\":\"style\"},{\"label\":\"submitOnChange\",\"value\":\"submitOnChange\"},{\"label\":\"suffix\",\"value\":\"suffix\"},{\"label\":\"testIdBuilder\",\"value\":\"testIdBuilder\"},{\"label\":\"type\",\"value\":\"type\"},{\"label\":\"unitOptions\",\"value\":\"unitOptions\"},{\"label\":\"useMobileUI\",\"value\":\"useMobileUI\"},{\"label\":\"validateApi\",\"value\":\"validateApi\"},{\"label\":\"validateOnChange\",\"value\":\"validateOnChange\"},{\"label\":\"validationErrors\",\"value\":\"validationErrors\"},{\"label\":\"validations\",\"value\":\"validations\"},{\"label\":\"value\",\"value\":\"value\"},{\"label\":\"visible\",\"value\":\"visible\"},{\"label\":\"visibleOn\",\"value\":\"visibleOn\"},{\"label\":\"width\",\"value\":\"width\"},{\"label\":\"make\",\"value\":\"make\"},{\"label\":\"permission\",\"value\":\"permission\"},{\"label\":\"filteredResults\",\"value\":\"filteredResults\"},{\"label\":\"macro\",\"value\":\"macro\"},{\"label\":\"mixin\",\"value\":\"mixin\"},{\"label\":\"hasMacro\",\"value\":\"hasMacro\"},{\"label\":\"flushMacros\",\"value\":\"flushMacros\"},{\"label\":\"__callStatic\",\"value\":\"__callStatic\"},{\"label\":\"macroCall\",\"value\":\"macroCall\"}],\"form_component_property\":[{\"name\":\"required\",\"value\":\"1\"},{\"name\":\"value\",\"value\":\"0\"},{\"name\":\"min\",\"value\":\"0\"},{\"name\":\"max\",\"value\":\"999999\"},{\"name\":\"description\",\"value\":\"越大越靠前\"}]},\"detail_component\":[],\"name\":\"custom_order\",\"default\":\"0\"},\"是否启用\":{\"type\":\"tinyInteger\",\"comment\":\"是否启用\",\"action_scope\":[\"list\",\"detail\",\"create\",\"edit\"],\"file_column\":0,\"list_component\":{\"list_component_type\":\"TableColumn\",\"list_component_property\":[{\"name\":\"quickEdit\",\"value\":\"{\\\"type\\\":\\\"switch\\\",\\\"mode\\\":\\\"inline\\\",\\\"saveImmediately\\\":true}\"}]},\"form_component\":{\"form_component_type\":\"SwitchControl\",\"form_component_property\":[{\"name\":\"value\",\"value\":\"1\"}]},\"detail_component\":{\"detail_component_type\":\"StaticExactControl\",\"detail_component_property\":[{\"name\":\"type\",\"value\":\"static-status\"}]},\"name\":\"enabled\",\"default\":\"1\",\"list_filter\":[{\"mode\":\"input\",\"type\":\"equal\",\"filter\":{\"filter_type\":\"SelectControl\",\"filter_property\":[{\"name\":\"size\",\"value\":\"md\"},{\"name\":\"clearable\",\"value\":\"1\"},{\"name\":\"options\",\"value\":\"[{\\\"value\\\":1,\\\"label\\\":\\\"是\\\"},{\\\"value\\\":0,\\\"label\\\":\\\"否\\\"}]\"}]},\"input_name\":\"enabled\"}]},\"多图\":{\"name\":\"images\",\"type\":\"text\",\"default\":null,\"nullable\":true,\"comment\":\"多图\",\"action_scope\":[\"list\",\"detail\",\"create\",\"edit\"],\"file_column\":true,\"list_component\":{\"list_component_type\":\"TableColumn\",\"list_component_property\":[{\"name\":\"type\",\"value\":\"images\"},{\"name\":\"enlargeAble\",\"value\":\"1\"}]},\"form_component\":{\"form_component_type\":\"ImageControl\",\"form_component_property\":[{\"name\":\"required\",\"value\":\"1\"},{\"name\":\"multiple\",\"value\":\"1\"}]},\"detail_component\":{\"detail_component_type\":\"StaticExactControl\",\"detail_component_property\":[{\"name\":\"type\",\"value\":\"static-images\"},{\"name\":\"enlargeAble\",\"value\":\"1\"}]},\"file_column_multi\":true}}', '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_settings` VALUES ('detail_component_property', '[{\"key\":\"StaticExactControl\",\"value\":[{\"name\":\"type\",\"value\":\"static-image\"},{\"name\":\"enlargeAble\",\"value\":\"1\"}],\"label\":\"单图\"},{\"key\":\"StaticExactControl\",\"value\":[{\"name\":\"type\",\"value\":\"static-images\"},{\"name\":\"enlargeAble\",\"value\":\"1\"}],\"label\":\"多图\"}]', '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_settings` VALUES ('filter_property', '[{\"key\":\"TextControl\",\"value\":[{\"name\":\"size\",\"value\":\"md\"},{\"name\":\"clearable\",\"value\":1}],\"label\":\"文本\"},{\"key\":\"SelectControl\",\"value\":[{\"name\":\"size\",\"value\":\"md\"},{\"name\":\"clearable\",\"value\":\"1\"},{\"name\":\"options\",\"value\":\"[{\\\"value\\\":1,\\\"label\\\":\\\"是\\\"},{\\\"value\\\":0,\\\"label\\\":\\\"否\\\"}]\"}],\"label\":\"是/否\"}]', '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_settings` VALUES ('form_component_property', '[{\"key\":\"TextControl\",\"value\":[{\"name\":\"required\",\"value\":\"1\"}],\"label\":\"文本(必填)\"},{\"key\":\"NumberControl\",\"value\":[{\"name\":\"required\",\"value\":\"1\"},{\"name\":\"value\",\"value\":\"0\"},{\"name\":\"min\",\"value\":\"0\"},{\"name\":\"max\",\"value\":\"999999\"},{\"name\":\"description\",\"value\":\"越大越靠前\"}],\"label\":\"排序字段\"}]', '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_settings` VALUES ('list_component_property', '[{\"key\":\"TableColumn\",\"value\":[{\"name\":\"searchable\",\"value\":\"1\"}],\"label\":\"文本(带搜索)\"},{\"key\":\"TableColumn\",\"value\":[{\"name\":\"type\",\"value\":\"image\"},{\"name\":\"enlargeAble\",\"value\":\"1\"}],\"label\":\"单图\"},{\"key\":\"TableColumn\",\"value\":[{\"name\":\"quickEdit\",\"value\":\"{\\\"type\\\":\\\"switch\\\",\\\"mode\\\":\\\"inline\\\",\\\"saveImmediately\\\":true}\"}],\"label\":\"开关\"}]', '2025-04-18 03:14:56', '2025-04-18 03:14:56');
INSERT INTO `admin_settings` VALUES ('slowlyo:owl-login-guard', '{\"max_try_count\":10,\"lock_time\":5}', '2025-04-18 07:45:47', '2025-04-18 07:45:47');
INSERT INTO `admin_settings` VALUES ('system_theme_setting', '{\"darkTheme\":false,\"footer\":false,\"breadcrumb\":true,\"themeColor\":\"rgb(146,99,239)\",\"layoutMode\":\"default\",\"siderTheme\":\"light\",\"topTheme\":\"light\",\"animateInType\":\"alpha\",\"animateInDuration\":600,\"animateOutType\":\"alpha\",\"animateOutDuration\":600,\"loginTemplate\":\"amis\",\"keepAlive\":false,\"enableTab\":true,\"tabIcon\":true,\"accordionMenu\":false}', '2025-04-18 08:38:13', '2025-04-18 08:42:50');

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$12$mu2zQPM5Nmq70w06Gb7Pb.pqA6ZsqQokDDxAS7r4BV3wgLtqLG86q', 1, 'Administrator', NULL, NULL, '2025-04-18 03:14:56', '2025-04-18 03:14:56');

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache
-- ----------------------------
INSERT INTO `cache` VALUES ('admin_extensions', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:11:{s:16:\"slowlyo.owl-dict\";O:33:\"Slowlyo\\OwlAdmin\\Models\\Extension\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:16:\"admin_extensions\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:1;s:4:\"name\";s:16:\"slowlyo.owl-dict\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:44:19\";s:10:\"updated_at\";s:19:\"2025-04-18 07:44:19\";}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:1;s:4:\"name\";s:16:\"slowlyo.owl-dict\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:44:19\";s:10:\"updated_at\";s:19:\"2025-04-18 07:44:19\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:7:\"options\";s:4:\"json\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:10:\"is_enabled\";i:2;s:7:\"options\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:23:\"slowlyo.owl-login-guard\";O:33:\"Slowlyo\\OwlAdmin\\Models\\Extension\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:16:\"admin_extensions\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:2;s:4:\"name\";s:23:\"slowlyo.owl-login-guard\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:45:41\";s:10:\"updated_at\";s:19:\"2025-04-18 07:45:41\";}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:2;s:4:\"name\";s:23:\"slowlyo.owl-login-guard\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:45:41\";s:10:\"updated_at\";s:19:\"2025-04-18 07:45:41\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:7:\"options\";s:4:\"json\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:10:\"is_enabled\";i:2;s:7:\"options\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:22:\"slowlyo.owl-log-viewer\";O:33:\"Slowlyo\\OwlAdmin\\Models\\Extension\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:16:\"admin_extensions\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:3;s:4:\"name\";s:22:\"slowlyo.owl-log-viewer\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:45:59\";s:10:\"updated_at\";s:19:\"2025-04-18 07:45:59\";}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:3;s:4:\"name\";s:22:\"slowlyo.owl-log-viewer\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:45:59\";s:10:\"updated_at\";s:19:\"2025-04-18 07:45:59\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:7:\"options\";s:4:\"json\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:10:\"is_enabled\";i:2;s:7:\"options\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:21:\"hyperf-plus.ai-helper\";O:33:\"Slowlyo\\OwlAdmin\\Models\\Extension\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:16:\"admin_extensions\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:4;s:4:\"name\";s:21:\"hyperf-plus.ai-helper\";s:10:\"is_enabled\";i:0;s:10:\"created_at\";s:19:\"2025-04-18 07:58:51\";s:10:\"updated_at\";s:19:\"2025-04-18 07:59:07\";}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:4;s:4:\"name\";s:21:\"hyperf-plus.ai-helper\";s:10:\"is_enabled\";i:0;s:10:\"created_at\";s:19:\"2025-04-18 07:58:51\";s:10:\"updated_at\";s:19:\"2025-04-18 07:59:07\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:7:\"options\";s:4:\"json\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:10:\"is_enabled\";i:2;s:7:\"options\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:12:\"likeweb.core\";O:33:\"Slowlyo\\OwlAdmin\\Models\\Extension\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:16:\"admin_extensions\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:5;s:4:\"name\";s:12:\"likeweb.core\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:58:53\";s:10:\"updated_at\";s:19:\"2025-04-18 07:58:53\";}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:5;s:4:\"name\";s:12:\"likeweb.core\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:58:53\";s:10:\"updated_at\";s:19:\"2025-04-18 07:58:53\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:7:\"options\";s:4:\"json\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:10:\"is_enabled\";i:2;s:7:\"options\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:20:\"owl-admin.components\";O:33:\"Slowlyo\\OwlAdmin\\Models\\Extension\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:16:\"admin_extensions\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:6;s:4:\"name\";s:20:\"owl-admin.components\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:59:11\";s:10:\"updated_at\";s:19:\"2025-04-18 07:59:11\";}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:6;s:4:\"name\";s:20:\"owl-admin.components\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:59:11\";s:10:\"updated_at\";s:19:\"2025-04-18 07:59:11\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:7:\"options\";s:4:\"json\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:10:\"is_enabled\";i:2;s:7:\"options\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:27:\"slowlyo.owl-amis-json-parse\";O:33:\"Slowlyo\\OwlAdmin\\Models\\Extension\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:16:\"admin_extensions\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:7;s:4:\"name\";s:27:\"slowlyo.owl-amis-json-parse\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:59:13\";s:10:\"updated_at\";s:19:\"2025-04-18 07:59:13\";}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:7;s:4:\"name\";s:27:\"slowlyo.owl-amis-json-parse\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:59:13\";s:10:\"updated_at\";s:19:\"2025-04-18 07:59:13\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:7:\"options\";s:4:\"json\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:10:\"is_enabled\";i:2;s:7:\"options\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:22:\"slowlyo.owl-icon-cache\";O:33:\"Slowlyo\\OwlAdmin\\Models\\Extension\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:16:\"admin_extensions\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:8;s:4:\"name\";s:22:\"slowlyo.owl-icon-cache\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:59:16\";s:10:\"updated_at\";s:19:\"2025-04-18 07:59:16\";}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:8;s:4:\"name\";s:22:\"slowlyo.owl-icon-cache\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 07:59:16\";s:10:\"updated_at\";s:19:\"2025-04-18 07:59:16\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:7:\"options\";s:4:\"json\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:10:\"is_enabled\";i:2;s:7:\"options\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:23:\"slowlyo.owl-menu-search\";O:33:\"Slowlyo\\OwlAdmin\\Models\\Extension\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:16:\"admin_extensions\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:9;s:4:\"name\";s:23:\"slowlyo.owl-menu-search\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 08:03:57\";s:10:\"updated_at\";s:19:\"2025-04-18 08:03:57\";}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:9;s:4:\"name\";s:23:\"slowlyo.owl-menu-search\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 08:03:57\";s:10:\"updated_at\";s:19:\"2025-04-18 08:03:57\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:7:\"options\";s:4:\"json\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:10:\"is_enabled\";i:2;s:7:\"options\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:25:\"slowlyo.owl-module-notice\";O:33:\"Slowlyo\\OwlAdmin\\Models\\Extension\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:16:\"admin_extensions\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:10;s:4:\"name\";s:25:\"slowlyo.owl-module-notice\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 08:04:03\";s:10:\"updated_at\";s:19:\"2025-04-18 08:04:03\";}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:10;s:4:\"name\";s:25:\"slowlyo.owl-module-notice\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 08:04:03\";s:10:\"updated_at\";s:19:\"2025-04-18 08:04:03\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:7:\"options\";s:4:\"json\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:10:\"is_enabled\";i:2;s:7:\"options\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:30:\"ennnnny.owladmin-cloud-storage\";O:33:\"Slowlyo\\OwlAdmin\\Models\\Extension\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:16:\"admin_extensions\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:12;s:4:\"name\";s:30:\"ennnnny.owladmin-cloud-storage\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 08:04:25\";s:10:\"updated_at\";s:19:\"2025-04-18 08:04:25\";}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:12;s:4:\"name\";s:30:\"ennnnny.owladmin-cloud-storage\";s:10:\"is_enabled\";i:1;s:10:\"created_at\";s:19:\"2025-04-18 08:04:25\";s:10:\"updated_at\";s:19:\"2025-04-18 08:04:25\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:7:\"options\";s:4:\"json\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:10:\"is_enabled\";i:2;s:7:\"options\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 2061255402);
INSERT INTO `cache` VALUES ('admin_has_table_admin_extensions', 'b:1;', 2061255402);
INSERT INTO `cache` VALUES ('admin_has_table_admin_relationships', 'b:1;', 2061255402);
INSERT INTO `cache` VALUES ('admin_relationships', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 2061255402);
INSERT INTO `cache` VALUES ('app_setting_admin_locale', 's:5:\"zh_CN\";', 2061255403);
INSERT INTO `cache` VALUES ('app_setting_slowlyo:owl-dict', 'N;', 2061255479);
INSERT INTO `cache` VALUES ('app_setting_system_theme_setting', 'a:16:{s:9:\"darkTheme\";b:0;s:6:\"footer\";b:0;s:10:\"breadcrumb\";b:1;s:10:\"themeColor\";s:15:\"rgb(146,99,239)\";s:10:\"layoutMode\";s:7:\"default\";s:10:\"siderTheme\";s:5:\"light\";s:8:\"topTheme\";s:5:\"light\";s:13:\"animateInType\";s:5:\"alpha\";s:17:\"animateInDuration\";i:600;s:14:\"animateOutType\";s:5:\"alpha\";s:18:\"animateOutDuration\";i:600;s:13:\"loginTemplate\";s:4:\"amis\";s:9:\"keepAlive\";b:0;s:9:\"enableTab\";b:1;s:7:\"tabIcon\";b:1;s:13:\"accordionMenu\";b:0;}', 2061255403);

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9d769891a5a9045a73704c0f203c656aedf244bbed08b39426f700a1b9e04b80', '[\"*\"]', '2025-04-29 02:21:22', NULL, '2025-04-18 03:17:05', '2025-04-29 02:21:22');
INSERT INTO `personal_access_tokens` VALUES (2, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'fb3110a7cb1f6c6baf14e5461279b909e791ccab011ae1458de8ebb0f438b161', '[\"*\"]', '2025-04-29 10:58:02', NULL, '2025-04-29 10:23:07', '2025-04-29 10:58:02');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('nR5MeRmlSOckTy5Jx83EOuosMKeavmgAoBggBwZu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3VMUElXa1dlTE1HV2x4S1JwUDRIT2EyNEJOYnplUUVQbUFMOUxLRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9vd2wtZGV2LWxvY2FsLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745893354);

-- ----------------------------
-- Table structure for telescope_entries
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries`;
CREATE TABLE `telescope_entries`  (
  `sequence` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`sequence`) USING BTREE,
  UNIQUE INDEX `telescope_entries_uuid_unique`(`uuid` ASC) USING BTREE,
  INDEX `telescope_entries_batch_id_index`(`batch_id` ASC) USING BTREE,
  INDEX `telescope_entries_family_hash_index`(`family_hash` ASC) USING BTREE,
  INDEX `telescope_entries_created_at_index`(`created_at` ASC) USING BTREE,
  INDEX `telescope_entries_type_should_display_on_index_index`(`type` ASC, `should_display_on_index` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 801 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telescope_entries
-- ----------------------------

-- ----------------------------
-- Table structure for telescope_entries_tags
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries_tags`;
CREATE TABLE `telescope_entries_tags`  (
  `entry_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`entry_uuid`, `tag`) USING BTREE,
  INDEX `telescope_entries_tags_tag_index`(`tag` ASC) USING BTREE,
  CONSTRAINT `telescope_entries_tags_ibfk_1` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telescope_entries_tags
-- ----------------------------

-- ----------------------------
-- Table structure for telescope_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `telescope_monitoring`;
CREATE TABLE `telescope_monitoring`  (
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telescope_monitoring
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
