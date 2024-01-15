/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : db_conf

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 15/01/2024 09:03:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (19, 'aaaa-test.yaml', 'TEST_GROUP', 'config:\n  info: 测试结果test', '9c762491cee9dc42b4548eea532f0cd6', '2023-06-15 09:32:17', '2023-06-15 09:35:42', 'nacos', '10.24.18.94', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (28, 'mcroservice-payment-dev.yaml', 'DEFAULT_GROUP', 'server:\r\n  port: 8001\r\n  \r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n\r\nmanagement:\r\n  endpoints:\r\n    jmx:\r\n      exposure:\r\n        include: \'*\'\r\nconfig:\r\n  info: 测试结果\r\n', '95874d12f722e1dc121960aa4ed4d5a6', '2023-12-14 07:55:44', '2023-12-14 07:59:38', NULL, '0:0:0:0:0:0:0:1', '', '', '', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (30, 'mcroservice-order-dev.yaml', 'DEFAULT_GROUP', 'server:\r\n  port: 8002\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n\r\nmanagement:\r\n  endpoints:\r\n    jmx:\r\n      exposure:\r\n        include: \'*\'\r\nconfig:\r\n  info: 测试结果\r\n', '98c81f0d26341a2901403696b17c25f5', '2023-12-14 07:57:10', '2023-12-14 07:59:25', NULL, '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (35, 'api-gateway-dev.yaml', 'DEFAULT_GROUP', 'server:\n  port: 9999\nspring:\n    redis:\n    # Redis数据库索引（默认为0）\n    database: 1\n    # Redis服务器地址\n    host: 127.0.0.1\n    # Redis服务器连接端口\n    port: 6379\n    # Redis服务器连接密码（默认为空）\n    # password:\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池最大连接数\n        max-active: 200\n        # 连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms\n        # 连接池中的最大空闲连接\n        max-idle: 10\n        # 连接池中的最小空闲连接\n        min-idle: 0', '1767cd913bda6c367a6cd0e0ca62a93a', '2023-12-14 08:06:32', '2024-01-10 05:26:24', 'nacos', '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (39, 'api-auth-dev.yaml', 'DEFAULT_GROUP', 'server:\n  port: 8081\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/db_auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\n    username: root\n    password: root\n\n', '5c3e298862b71f6ce561a316dca627dc', '2023-12-19 06:28:17', '2024-01-09 08:28:51', 'nacos', '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (42, 'api-auth-resource-dev.yaml', 'DEFAULT_GROUP', 'server:\r\n  port: 8082', '5c94f26f1780e2d1651fdaad7e08d2e2', '2023-12-29 01:46:43', '2023-12-29 01:47:33', NULL, '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (49, 'cloud-upms-biz-dev.yaml', 'DEFAULT_GROUP', 'server:\n  port: 8000\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/db_auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\n    username: root\n    password: root\n    redis:\n    # Redis数据库索引（默认为0）\n    database: 1\n    # Redis服务器地址\n    host: 127.0.0.1\n    # Redis服务器连接端口\n    port: 6379\n    # Redis服务器连接密码（默认为空）\n    # password:\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池最大连接数\n        max-active: 200\n        # 连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms\n        # 连接池中的最大空闲连接\n        max-idle: 10\n        # 连接池中的最小空闲连接\n        min-idle: 0\n\n', 'd438441591ce21d66e7abb767b7fade5', '2024-01-04 07:19:42', '2024-01-09 06:35:33', 'nacos', '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (25, 36, 'api-gateway.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9999', '01e0cfa6deb6df14a899dbc9baa0ae38', '2023-12-14 15:41:48', '2023-12-14 07:41:48', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 37, 'mcroservice-payment-dev.yaml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-12-14 15:55:44', '2023-12-14 07:55:44', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (28, 38, 'mcroservice-payment-dev.yaml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-12-14 15:55:58', '2023-12-14 07:55:58', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (14, 39, 'mcroservice-payment.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 8001\n  \nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\nspring:\n  application:\n    #服务名\n    name: mcroservice-payment  \n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\n    username: root\n    password: root\n\nmanagement:\n  endpoints:\n    jmx:\n      exposure:\n        include: \'*\'\nconfig:\n  info: 测试结果\n', 'ecfa7ffaf21301f6684d85a4f8370dda', '2023-12-14 15:56:06', '2023-12-14 07:56:06', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 40, 'mcroservice-order-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8002\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\nspring:\r\n  application:\r\n    #服务名\r\n    name: mcroservice-order\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n\r\nmanagement:\r\n  endpoints:\r\n    jmx:\r\n      exposure:\r\n        include: \'*\'\r\nconfig:\r\n  info: 测试结果\r\n', '4a7e162ee5147e32ef486837b7ed4ea8', '2023-12-14 15:57:10', '2023-12-14 07:57:10', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (25, 41, 'api-gateway.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9999', '01e0cfa6deb6df14a899dbc9baa0ae38', '2023-12-14 15:57:22', '2023-12-14 07:57:23', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 42, 'api-gateay-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9999', '01e0cfa6deb6df14a899dbc9baa0ae38', '2023-12-14 15:57:38', '2023-12-14 07:57:39', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (22, 43, 'mcroservice-order.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8002\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\nspring:\r\n  application:\r\n    #服务名\r\n    name: mcroservice-payment  \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n\r\nmanagement:\r\n  endpoints:\r\n    jmx:\r\n      exposure:\r\n        include: \'*\'\r\nconfig:\r\n  info: 测试结果\r\n', '642f2c5ca5e2ce8fbc43a59a68dfa531', '2023-12-14 15:57:51', '2023-12-14 07:57:52', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (28, 44, 'mcroservice-payment-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8001\r\n  \r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\nspring:\r\n  application:\r\n    #服务名\r\n    name: mcroservice-payment  \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n\r\nmanagement:\r\n  endpoints:\r\n    jmx:\r\n      exposure:\r\n        include: \'*\'\r\nconfig:\r\n  info: 测试结果\r\n', '4a336e6928a2ab4ee38983fca731ade0', '2023-12-14 15:59:14', '2023-12-14 07:59:14', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (30, 45, 'mcroservice-order-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8002\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\nspring:\r\n  application:\r\n    #服务名\r\n    name: mcroservice-order\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n\r\nmanagement:\r\n  endpoints:\r\n    jmx:\r\n      exposure:\r\n        include: \'*\'\r\nconfig:\r\n  info: 测试结果\r\n', '4a7e162ee5147e32ef486837b7ed4ea8', '2023-12-14 15:59:24', '2023-12-14 07:59:25', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (28, 46, 'mcroservice-payment-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8001\r\n  \r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n\r\nmanagement:\r\n  endpoints:\r\n    jmx:\r\n      exposure:\r\n        include: \'*\'\r\nconfig:\r\n  info: 测试结果\r\n', '33474a8d5d40be5b684b92979023f77a', '2023-12-14 15:59:38', '2023-12-14 07:59:38', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (31, 47, 'api-gateay-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9999', '01e0cfa6deb6df14a899dbc9baa0ae38', '2023-12-14 16:06:00', '2023-12-14 08:06:01', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 48, 'api-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'sever：\r\n    port: 9999', '808e0a576f51aa9396c75ec417855a2c', '2023-12-14 16:06:32', '2023-12-14 08:06:32', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (35, 49, 'api-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'sever：\r\n    port: 9999', '808e0a576f51aa9396c75ec417855a2c', '2023-12-14 16:07:23', '2023-12-14 08:07:23', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (35, 50, 'api-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9999', '01e0cfa6deb6df14a899dbc9baa0ae38', '2023-12-14 16:15:47', '2023-12-14 08:15:48', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (35, 51, 'api-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9999\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n\r\nmanagement:\r\n  endpoints:\r\n    jmx:\r\n      exposure:\r\n        include: \'*\'\r\nconfig:\r\n  info: 测试结果\r\n', '8e066402029c5bcadaafc238be7da909', '2023-12-14 16:19:49', '2023-12-14 08:19:50', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 52, 'api-auth-dev.yaml', 'DEFAULT_GROUP', '', 'server\r\n    port: 8082', '62aa7ec38a99e6ed3b8f4b230aa4d127', '2023-12-19 14:28:17', '2023-12-19 06:28:17', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (39, 53, 'api-auth-dev.yaml', 'DEFAULT_GROUP', '', 'server\r\n    port: 8082', '62aa7ec38a99e6ed3b8f4b230aa4d127', '2023-12-19 14:38:22', '2023-12-19 06:38:22', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (39, 54, 'api-auth-dev.yaml', 'DEFAULT_GROUP', '', 'server\r\n    port: 8081', 'fbd16fa9eaf498a530deeaf4efa05e80', '2023-12-19 15:17:32', '2023-12-19 07:17:32', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 55, 'api-auth-resource-dev.yaml', 'DEFAULT_GROUP', '', 'server\r\n    port:8082', 'eef33a9a896a7f74c4411c076c9b14cb', '2023-12-29 09:46:42', '2023-12-29 01:46:43', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (42, 56, 'api-auth-resource-dev.yaml', 'DEFAULT_GROUP', '', 'server\r\n    port:8082', 'eef33a9a896a7f74c4411c076c9b14cb', '2023-12-29 09:47:33', '2023-12-29 01:47:33', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (39, 57, 'api-auth-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\n', '5a11d2a28797ac6fe37023eac2807ae2', '2023-12-29 16:16:06', '2023-12-29 08:16:06', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (39, 58, 'api-auth-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/dd-auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n', '9df02916fc55057716a923b5f3b27292', '2023-12-29 16:18:51', '2023-12-29 08:18:51', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (39, 59, 'api-auth-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/dd-auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n', '74eed9fe2d5a4b58eeb0718bbf2f9cd6', '2023-12-29 16:20:06', '2023-12-29 08:20:06', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (39, 60, 'api-auth-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/dd_auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n', '75ec77e1557d02b70285d8df711990ca', '2023-12-29 16:27:22', '2023-12-29 08:27:23', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (39, 61, 'api-auth-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/dd_auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n\r\nmanagement:\r\n  endpoints:\r\n    jmx:\r\n      exposure:\r\n        include: \'*\'\r\nconfig:\r\n  info: 测试结果\r\n\r\n', 'f22b916c4f3b975cd255956345e93f5e', '2023-12-29 16:28:55', '2023-12-29 08:28:55', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 62, 'cloud-upms-biz-dev.yaml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2024-01-04 15:19:41', '2024-01-04 07:19:42', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (49, 63, 'cloud-upms-biz-dev.yaml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2024-01-04 15:20:26', '2024-01-04 07:20:26', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (49, 64, 'cloud-upms-biz-dev.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 8888\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/db_auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\n    username: root\n    password: root\n\nmanagement:\n  endpoints:\n    jmx:\n      exposure:\n        include: \'*\'\nconfig:\n  info: 测试结果\n\n', '0ba98037b1234e970869636e368baee7', '2024-01-04 15:20:50', '2024-01-04 07:20:50', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (49, 65, 'cloud-upms-biz-dev.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 8000\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/db_auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\n    username: root\n    password: root\n\nmanagement:\n  endpoints:\n    jmx:\n      exposure:\n        include: \'*\'\nconfig:\n  info: 测试结果\n\n', '9f963e53864d541d612bc937dac05075', '2024-01-04 16:13:06', '2024-01-04 08:13:06', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (49, 66, 'cloud-upms-biz-dev.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 8000\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/db_auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\n    username: root\n    password: root\n    redis:\n    # Redis数据库索引（默认为0）\n    database: 1\n    # Redis服务器地址\n    host: 127.0.0.1\n    # Redis服务器连接端口\n    port: 6379\n    # Redis服务器连接密码（默认为空）\n    # password:\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池最大连接数\n        max-active: 200\n        # 连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms\n        # 连接池中的最大空闲连接\n        max-idle: 10\n        # 连接池中的最小空闲连接\n        min-idle: 0\n\nmanagement:\n  endpoints:\n    jmx:\n      exposure:\n        include: \'*\'\nconfig:\n  info: 测试结果\n\n', '5a9a49bacf7bee9466bab7712d027c16', '2024-01-09 14:04:51', '2024-01-09 06:04:51', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (49, 67, 'cloud-upms-biz-dev.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 8000\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/db_auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\n    username: root\n    password: root\n    redis:\n    # Redis数据库索引（默认为0）\n    database: 1\n    # Redis服务器地址\n    host: 127.0.0.1\n    # Redis服务器连接端口\n    port: 6379\n    # Redis服务器连接密码（默认为空）\n    # password:\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池最大连接数\n        max-active: 200\n        # 连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms\n        # 连接池中的最大空闲连接\n        max-idle: 10\n        # 连接池中的最小空闲连接\n        min-idle: 0\n\n', 'd438441591ce21d66e7abb767b7fade5', '2024-01-09 14:34:35', '2024-01-09 06:34:36', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (49, 68, 'cloud-upms-biz-dev.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 8099\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/db_auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\n    username: root\n    password: root\n    redis:\n    # Redis数据库索引（默认为0）\n    database: 1\n    # Redis服务器地址\n    host: 127.0.0.1\n    # Redis服务器连接端口\n    port: 6379\n    # Redis服务器连接密码（默认为空）\n    # password:\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池最大连接数\n        max-active: 200\n        # 连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms\n        # 连接池中的最大空闲连接\n        max-idle: 10\n        # 连接池中的最小空闲连接\n        min-idle: 0\n\n', '5ad2e2240b2ffdd5839927df5945df80', '2024-01-09 14:35:33', '2024-01-09 06:35:33', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (39, 69, 'api-auth-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    map-underscore-to-camel-case: true\r\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://127.0.0.1:3306/db_auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\r\n    username: root\r\n    password: root\r\n\r\nmanagement:\r\n  endpoints:\r\n    jmx:\r\n      exposure:\r\n        include: \'*\'\r\nconfig:\r\n  info: 测试结果\r\n\r\n', 'f248e30ee778a4fe76550af4f8029ac2', '2024-01-09 16:26:34', '2024-01-09 08:26:35', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (39, 70, 'api-auth-dev.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 8081\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\n    # 该配置就是将带有下划线的表字段映射为驼峰格式的实体类属性\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://127.0.0.1:3306/db_auth?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8\n    username: root\n    password: root\nconfig:\n  info: 测试结果\n\n', 'eed93329e22b5526acefeddb693a534a', '2024-01-09 16:28:51', '2024-01-09 08:28:51', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (35, 71, 'api-gateway-dev.yaml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9999\r\n', '4700e6da41904602440006f41726c71b', '2024-01-10 13:26:23', '2024-01-10 05:26:24', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '994ac410-26fc-4257-9315-51a96cb6d3c1', 'test', '测试空间', 'nacos', 1686821396942, 1686821396942);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
