/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : eduflex

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 29/07/2025 07:55:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'tb_college', '学院表', NULL, NULL, 'College', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'college', '学院管理', '林煜鋒', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-10-05 14:57:09', '', '2024-10-05 15:00:58', NULL);
INSERT INTO `gen_table` VALUES (2, 'tb_grade', '班级表', NULL, NULL, 'Grade', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'grade', '班级管理', '林煜鋒', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-10-05 19:47:39', '', '2024-10-05 19:51:46', NULL);
INSERT INTO `gen_table` VALUES (3, 'tb_semester', '学期表', NULL, NULL, 'Semester', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'semester', '学期管理', '林煜鋒', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-10-05 21:03:46', '', '2024-10-05 21:15:26', NULL);
INSERT INTO `gen_table` VALUES (4, 'tb_teacher', '教师表', NULL, NULL, 'Teacher', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'teacher', '教师管理', '林煜鋒', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-10-05 23:09:43', '', '2024-10-05 23:34:53', NULL);
INSERT INTO `gen_table` VALUES (6, 'tb_student', '学生表', NULL, NULL, 'Student', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'student', '学生管理', '林煜鋒', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-10-07 16:46:44', '', '2024-10-07 16:47:44', NULL);
INSERT INTO `gen_table` VALUES (7, 'tb_course', '课程表', '', '', 'Course', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'course', '课程管理', '林煜鋒', '0', '/', '{\"parentMenuId\":2031}', 'admin', '2024-10-10 20:50:07', '', '2024-10-14 23:22:24', NULL);
INSERT INTO `gen_table` VALUES (9, 'tb_course_grade', '课程-班级关系表', NULL, NULL, 'CourseGrade', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'courseGrade', '班级课程管理', '林煜鋒', '0', '/', '{\"parentMenuId\":2031}', 'admin', '2024-10-10 20:58:46', '', '2024-10-11 17:48:25', NULL);
INSERT INTO `gen_table` VALUES (11, 'tb_course_material', '课程资料表', NULL, NULL, 'CourseMaterial', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'material', '课程资料', '林煜鋒', '0', '/', '{\"parentMenuId\":2031}', 'admin', '2024-10-14 11:12:11', '', '2024-10-15 17:19:59', NULL);
INSERT INTO `gen_table` VALUES (12, 'tb_course_chapter', '课程内容章节表', '', '', 'CourseChapter', 'tree', 'element-plus', 'com.eduflex.manage', 'manage', 'chapter', '课程内容章节管理', '林煜鋒', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"name\",\"treeParentCode\":\"parentId\",\"parentMenuId\":2032}', 'admin', '2024-10-14 11:39:27', '', '2024-10-14 15:36:14', NULL);
INSERT INTO `gen_table` VALUES (13, 'tb_homework', '作业表', NULL, NULL, 'Homework', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'homework', '作业管理', '林煜鋒', '0', '/', '{\"parentMenuId\":2031}', 'admin', '2024-11-23 21:53:04', '', '2024-11-23 21:54:57', NULL);
INSERT INTO `gen_table` VALUES (14, 'tb_course_category', '课程分类表', '', '', 'CourseCategory', 'tree', 'element-plus', 'com.eduflex.manage', 'Category', 'category', '课程分类', '林煜鋒', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":2031}', 'admin', '2024-12-08 21:37:06', '', '2024-12-08 21:39:45', NULL);
INSERT INTO `gen_table` VALUES (15, 'tb_paper', '试卷表', NULL, NULL, 'Paper', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'paper', '试卷管理', '林煜鋒', '0', '/', '{\"parentMenuId\":\"2068\"}', 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:12:18', NULL);
INSERT INTO `gen_table` VALUES (16, 'tb_question', '题目表', NULL, NULL, 'Question', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'question', '题目管理', '林煜鋒', '0', '/', '{\"parentMenuId\":\"2068\"}', 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15', NULL);
INSERT INTO `gen_table` VALUES (17, 'tb_knowledge', '知识点分类表', '', '', 'Knowledge', 'tree', 'element-plus', 'com.eduflex.manage', 'manage', 'knowledge', '知识点分类', '林煜鋒', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"2068\"}', 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16', NULL);
INSERT INTO `gen_table` VALUES (18, 'tb_comments', '评论表', '', '', 'Comments', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'comments', '评论管理', '林煜鋒', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"content\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"2087\"}', 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:04:50', NULL);
INSERT INTO `gen_table` VALUES (19, 'tb_oss_file', '文件管理表', NULL, NULL, 'OssFile', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'file', '资源管理', '林煜鋒', '0', '/', '{}', 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15', NULL);
INSERT INTO `gen_table` VALUES (24, 'tb_goal', '学习目标表', NULL, NULL, 'Goal', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'goal', '学习目标管理', '林煜鋒', '0', '/', '{\"parentMenuId\":\"2100\"}', 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03', NULL);
INSERT INTO `gen_table` VALUES (27, 'tb_study_record', '学习记录表', NULL, NULL, 'StudyRecord', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'record', '学习记录管理', '林煜鋒', '0', '/', '{\"parentMenuId\":\"2100\"}', 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06', NULL);
INSERT INTO `gen_table` VALUES (28, 'tb_student_course', '学生选课表', '', '', 'StudentCourse', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'student_course', '学生选课', '林煜鋒', '0', '/', '{\"parentMenuId\":\"2025\"}', 'admin', '2025-01-26 09:27:54', '', '2025-01-26 09:31:00', NULL);
INSERT INTO `gen_table` VALUES (29, 'tb_paper_question', '试卷题目关联表', NULL, NULL, 'PaperQuestion', 'crud', '', 'com.eduflex.system', 'system', 'question', '试卷题目关联', 'ruoyi', '0', '/', NULL, 'admin', '2025-01-26 14:04:38', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (30, 'tb_file_images', '文件转换存储表', NULL, NULL, 'FileImages', 'crud', '', 'com.eduflex.system', 'system', 'images', '文件转换存储', 'ruoyi', '0', '/', NULL, 'admin', '2025-01-26 14:04:38', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (32, 'tb_repo', '题库表', NULL, NULL, 'Repo', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'repo', '题库管理', '林煜鋒', '0', '/', '{\"parentMenuId\":\"2068\"}', 'admin', '2025-02-09 20:49:50', '', '2025-02-09 20:50:50', NULL);
INSERT INTO `gen_table` VALUES (33, 'tb_exam', '考试表', NULL, NULL, 'Exam', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'exam', '考试管理', '林煜鋒', '0', '/', '{\"parentMenuId\":\"2068\"}', 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35', NULL);
INSERT INTO `gen_table` VALUES (34, 'tb_exam_answer', '考试答案记录表', NULL, NULL, 'ExamAnswer', 'crud', 'element-plus', 'com.eduflex.manage.exam', 'examAnswer', 'examAnswer', '考试答案记录', '林煜鋒', '0', '/', '{}', 'admin', '2025-02-11 21:23:45', '', '2025-02-11 22:44:39', NULL);
INSERT INTO `gen_table` VALUES (35, 'tb_exam_record', '考试记录表', NULL, NULL, 'ExamRecord', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'record', '考试记录', '林煜鋒', '0', '/', '{}', 'admin', '2025-02-11 21:23:45', '', '2025-02-11 21:24:43', NULL);
INSERT INTO `gen_table` VALUES (36, 'tb_direction', '课程方向表', NULL, NULL, 'Direction', 'crud', 'element-plus', 'com.eduflex.manage.direction', 'manage', 'direction', '课程方向', '林煜鋒', '0', '/', '{\"parentMenuId\":\"2031\"}', 'admin', '2025-02-12 23:46:39', '', '2025-02-12 23:49:13', NULL);
INSERT INTO `gen_table` VALUES (37, 'tb_evalutation', '课程评价表', NULL, NULL, 'Evalutation', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'evalutation', '课程评价管理', '林煜鋒', '0', '/', '{\"parentMenuId\":\"2031\"}', 'admin', '2025-02-25 10:56:36', '', '2025-02-25 10:59:15', NULL);
INSERT INTO `gen_table` VALUES (38, 'tb_plan', '学习计划表', NULL, NULL, 'Plan', 'crud', 'element-plus', 'com.eduflex.manage', 'manage', 'plan', '学习计划管理', '林煜鋒', '0', '/', '{\"parentMenuId\":\"2100\"}', 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 349 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '学院ID', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-05 14:57:09', '', '2024-10-05 15:00:58');
INSERT INTO `gen_table_column` VALUES (2, 1, 'parent_id', '父级学院ID', 'bigint', 'Long', 'parentId', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-10-05 14:57:09', '', '2024-10-05 15:00:58');
INSERT INTO `gen_table_column` VALUES (3, 1, 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 3, 'admin', '2024-10-05 14:57:09', '', '2024-10-05 15:00:58');
INSERT INTO `gen_table_column` VALUES (4, 1, 'name', '学院名称', 'varchar(30)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-10-05 14:57:09', '', '2024-10-05 15:00:58');
INSERT INTO `gen_table_column` VALUES (5, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-10-05 14:57:09', '', '2024-10-05 15:00:58');
INSERT INTO `gen_table_column` VALUES (6, 1, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, '1', NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-10-05 14:57:09', '', '2024-10-05 15:00:58');
INSERT INTO `gen_table_column` VALUES (7, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-10-05 14:57:09', '', '2024-10-05 15:00:58');
INSERT INTO `gen_table_column` VALUES (8, 1, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-10-05 14:57:09', '', '2024-10-05 15:00:58');
INSERT INTO `gen_table_column` VALUES (9, 2, 'id', '班级ID', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-05 19:47:39', '', '2024-10-05 19:51:46');
INSERT INTO `gen_table_column` VALUES (10, 2, 'college_id', '所属学院ID', 'bigint', 'Long', 'collegeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-10-05 19:47:39', '', '2024-10-05 19:51:46');
INSERT INTO `gen_table_column` VALUES (11, 2, 'name', '班级名称', 'varchar(50)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-10-05 19:47:39', '', '2024-10-05 19:51:46');
INSERT INTO `gen_table_column` VALUES (12, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-10-05 19:47:39', '', '2024-10-05 19:51:46');
INSERT INTO `gen_table_column` VALUES (13, 2, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, '0', 'EQ', 'datetime', '', 5, 'admin', '2024-10-05 19:47:39', '', '2024-10-05 19:51:46');
INSERT INTO `gen_table_column` VALUES (14, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-10-05 19:47:39', '', '2024-10-05 19:51:46');
INSERT INTO `gen_table_column` VALUES (15, 2, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-10-05 19:47:39', '', '2024-10-05 19:51:46');
INSERT INTO `gen_table_column` VALUES (16, 3, 'id', '学期ID', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-05 21:03:46', '', '2024-10-05 21:15:26');
INSERT INTO `gen_table_column` VALUES (17, 3, 'name', '学期名称', 'varchar(50)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-10-05 21:03:46', '', '2024-10-05 21:15:26');
INSERT INTO `gen_table_column` VALUES (18, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2024-10-05 21:03:46', '', '2024-10-05 21:15:26');
INSERT INTO `gen_table_column` VALUES (19, 3, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, '1', '0', 'EQ', 'datetime', '', 4, 'admin', '2024-10-05 21:03:46', '', '2024-10-05 21:15:26');
INSERT INTO `gen_table_column` VALUES (20, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-10-05 21:03:46', '', '2024-10-05 21:15:26');
INSERT INTO `gen_table_column` VALUES (21, 3, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-10-05 21:03:46', '', '2024-10-05 21:15:26');
INSERT INTO `gen_table_column` VALUES (22, 4, 'id', '教师ID', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-05 23:09:43', '', '2024-10-05 23:34:53');
INSERT INTO `gen_table_column` VALUES (23, 4, 'user_id', '关联sys_user表的id', 'bigint', 'Long', 'userId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-10-05 23:09:43', '', '2024-10-05 23:34:53');
INSERT INTO `gen_table_column` VALUES (24, 4, 'college_id', '所属学院ID', 'bigint', 'Long', 'collegeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-05 23:09:43', '', '2024-10-05 23:34:53');
INSERT INTO `gen_table_column` VALUES (42, 6, 'id', '学生ID', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-07 16:46:44', '', '2024-10-07 16:47:44');
INSERT INTO `gen_table_column` VALUES (43, 6, 'user_id', '关联sys_user表的ID', 'bigint', 'Long', 'userId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-10-07 16:46:44', '', '2024-10-07 16:47:44');
INSERT INTO `gen_table_column` VALUES (44, 6, 'college_id', '所属学院ID', 'bigint', 'Long', 'collegeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-07 16:46:44', '', '2024-10-07 16:47:44');
INSERT INTO `gen_table_column` VALUES (45, 6, 'grade_id', '所属班级ID', 'bigint', 'Long', 'gradeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-07 16:46:44', '', '2024-10-07 16:47:44');
INSERT INTO `gen_table_column` VALUES (46, 7, 'id', '课程ID', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-10 20:50:07', '', '2024-10-14 23:22:24');
INSERT INTO `gen_table_column` VALUES (47, 7, 'name', '课程名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-10-10 20:50:07', '', '2024-10-14 23:22:24');
INSERT INTO `gen_table_column` VALUES (48, 7, 'description', '课程描述', 'text', 'String', 'description', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'textarea', '', 3, 'admin', '2024-10-10 20:50:07', '', '2024-10-14 23:22:24');
INSERT INTO `gen_table_column` VALUES (49, 7, 'teacher_id', '任课老师ID', 'bigint', 'Long', 'teacherId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-10-10 20:50:08', '', '2024-10-14 23:22:24');
INSERT INTO `gen_table_column` VALUES (50, 7, 'start_time', '开始时间', 'timestamp', 'Date', 'startTime', '0', '0', '1', '1', '1', '1', '1', 'GTE', 'datetime', '', 5, 'admin', '2024-10-10 20:50:08', '', '2024-10-14 23:22:24');
INSERT INTO `gen_table_column` VALUES (51, 7, 'end_time', '结束时间', 'timestamp', 'Date', 'endTime', '0', '0', '1', '1', '1', '1', '1', 'LTE', 'datetime', '', 6, 'admin', '2024-10-10 20:50:08', '', '2024-10-14 23:22:24');
INSERT INTO `gen_table_column` VALUES (52, 7, 'status', '课程状态(0=未开始 1=进行中 2=已结束)', 'tinyint', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2024-10-10 20:50:08', '', '2024-10-14 23:22:24');
INSERT INTO `gen_table_column` VALUES (53, 7, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-10-10 20:50:08', '', '2024-10-14 23:22:24');
INSERT INTO `gen_table_column` VALUES (54, 7, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-10-10 20:50:08', '', '2024-10-14 23:22:24');
INSERT INTO `gen_table_column` VALUES (55, 7, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-10-10 20:50:08', '', '2024-10-14 23:22:24');
INSERT INTO `gen_table_column` VALUES (56, 7, 'update_time', '创建时间', 'int', 'Long', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-10-10 20:50:08', '', '2024-10-14 23:22:24');
INSERT INTO `gen_table_column` VALUES (64, 9, 'id', '关系主键', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-10 20:58:46', '', '2024-10-11 17:48:25');
INSERT INTO `gen_table_column` VALUES (65, 9, 'course_id', '课程ID', 'bigint', 'Long', 'courseId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-10-10 20:58:46', '', '2024-10-11 17:48:25');
INSERT INTO `gen_table_column` VALUES (66, 9, 'grade_id', '班级ID', 'bigint', 'Long', 'gradeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-10 20:58:46', '', '2024-10-11 17:48:25');
INSERT INTO `gen_table_column` VALUES (67, 9, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-10-10 20:58:46', '', '2024-10-11 17:48:25');
INSERT INTO `gen_table_column` VALUES (68, 9, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-10-10 20:58:46', '', '2024-10-11 17:48:25');
INSERT INTO `gen_table_column` VALUES (69, 9, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-10-10 20:58:46', '', '2024-10-11 17:48:25');
INSERT INTO `gen_table_column` VALUES (70, 9, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-10-10 20:58:46', '', '2024-10-11 17:48:25');
INSERT INTO `gen_table_column` VALUES (80, 11, 'id', '主键ID', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-14 11:12:11', '', '2024-10-15 17:19:59');
INSERT INTO `gen_table_column` VALUES (81, 11, 'chapter_id', '关联章节ID', 'bigint', 'Long', 'chapterId', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-10-14 11:12:11', '', '2024-10-15 17:19:59');
INSERT INTO `gen_table_column` VALUES (82, 11, 'name', '资料名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2024-10-14 11:12:11', '', '2024-10-15 17:19:59');
INSERT INTO `gen_table_column` VALUES (83, 11, 'url', '链接', 'varchar(100)', 'String', 'url', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'fileUpload', '', 4, 'admin', '2024-10-14 11:12:11', '', '2024-10-15 17:19:59');
INSERT INTO `gen_table_column` VALUES (84, 12, 'id', '主键ID', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-14 11:39:27', '', '2024-10-14 15:36:14');
INSERT INTO `gen_table_column` VALUES (85, 12, 'course_id', '关联课程ID', 'bigint', 'Long', 'courseId', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-10-14 11:39:27', '', '2024-10-14 15:36:14');
INSERT INTO `gen_table_column` VALUES (86, 12, 'name', '章节名称', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '0', 'LIKE', 'input', '', 3, 'admin', '2024-10-14 11:39:27', '', '2024-10-14 15:36:14');
INSERT INTO `gen_table_column` VALUES (87, 12, 'parentId', '父级ID', 'bigint', 'Long', 'parentId', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'input', '', 4, 'admin', '2024-10-14 11:39:27', '', '2024-10-14 15:36:14');
INSERT INTO `gen_table_column` VALUES (88, 12, 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 5, 'admin', '2024-10-14 11:39:27', '', '2024-10-14 15:36:14');
INSERT INTO `gen_table_column` VALUES (89, 12, 'order_num', '排序', 'bigint', 'Long', 'orderNum', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'input', '', 6, 'admin', '2024-10-14 11:39:27', '', '2024-10-14 15:36:14');
INSERT INTO `gen_table_column` VALUES (90, 12, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-10-14 11:39:27', '', '2024-10-14 15:36:14');
INSERT INTO `gen_table_column` VALUES (91, 12, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-10-14 11:39:27', '', '2024-10-14 15:36:14');
INSERT INTO `gen_table_column` VALUES (92, 12, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-10-14 11:39:27', '', '2024-10-14 15:36:14');
INSERT INTO `gen_table_column` VALUES (93, 12, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-10-14 11:39:27', '', '2024-10-14 15:36:14');
INSERT INTO `gen_table_column` VALUES (94, 13, 'id', '作业ID', 'bigint', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-11-23 21:53:04', '', '2024-11-23 21:54:57');
INSERT INTO `gen_table_column` VALUES (95, 13, 'course_id', '所属课程ID', 'bigint', 'Long', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-11-23 21:53:04', '', '2024-11-23 21:54:57');
INSERT INTO `gen_table_column` VALUES (96, 13, 'title', '作业标题', 'varchar(50)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-11-23 21:53:04', '', '2024-11-23 21:54:57');
INSERT INTO `gen_table_column` VALUES (97, 13, 'content', '作业内容', 'text', 'String', 'content', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'editor', '', 4, 'admin', '2024-11-23 21:53:04', '', '2024-11-23 21:54:57');
INSERT INTO `gen_table_column` VALUES (98, 13, 'deadline', '截止日期', 'timestamp', 'Date', 'deadline', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-11-23 21:53:04', '', '2024-11-23 21:54:57');
INSERT INTO `gen_table_column` VALUES (99, 13, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-11-23 21:53:04', '', '2024-11-23 21:54:57');
INSERT INTO `gen_table_column` VALUES (100, 13, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-11-23 21:53:04', '', '2024-11-23 21:54:57');
INSERT INTO `gen_table_column` VALUES (101, 13, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-11-23 21:53:04', '', '2024-11-23 21:54:57');
INSERT INTO `gen_table_column` VALUES (102, 13, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-11-23 21:53:04', '', '2024-11-23 21:54:57');
INSERT INTO `gen_table_column` VALUES (103, 14, 'id', '分类ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-12-08 21:37:06', '', '2024-12-08 21:39:45');
INSERT INTO `gen_table_column` VALUES (104, 14, 'name', '分类名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-12-08 21:37:06', '', '2024-12-08 21:39:45');
INSERT INTO `gen_table_column` VALUES (105, 14, 'parent_id', '父级分类ID', 'bigint', 'Long', 'parentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-12-08 21:37:06', '', '2024-12-08 21:39:45');
INSERT INTO `gen_table_column` VALUES (106, 14, 'status', '分类状态 ', 'tinyint', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2024-12-08 21:37:06', '', '2024-12-08 21:39:45');
INSERT INTO `gen_table_column` VALUES (107, 14, 'deleted', '逻辑删除字段', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 5, 'admin', '2024-12-08 21:37:06', '', '2024-12-08 21:39:45');
INSERT INTO `gen_table_column` VALUES (108, 14, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-12-08 21:37:06', '', '2024-12-08 21:39:45');
INSERT INTO `gen_table_column` VALUES (109, 14, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, '1', NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-12-08 21:37:06', '', '2024-12-08 21:39:45');
INSERT INTO `gen_table_column` VALUES (110, 14, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-12-08 21:37:06', '', '2024-12-08 21:39:45');
INSERT INTO `gen_table_column` VALUES (111, 14, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-12-08 21:37:06', '', '2024-12-08 21:39:45');
INSERT INTO `gen_table_column` VALUES (112, 15, 'id', '试卷ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:12:18');
INSERT INTO `gen_table_column` VALUES (113, 15, 'title', '试卷名称', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:12:18');
INSERT INTO `gen_table_column` VALUES (114, 15, 'total_score', '总分', 'int', 'Long', 'totalScore', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:12:18');
INSERT INTO `gen_table_column` VALUES (115, 15, 'duration', '考试时长（分钟）', 'int', 'Long', 'duration', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:12:18');
INSERT INTO `gen_table_column` VALUES (116, 15, 'is_published', '是否发布（0-未发布 1-已发布）', 'tinyint', 'Long', 'isPublished', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:12:18');
INSERT INTO `gen_table_column` VALUES (117, 15, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:12:18');
INSERT INTO `gen_table_column` VALUES (118, 15, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:12:18');
INSERT INTO `gen_table_column` VALUES (119, 15, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:12:18');
INSERT INTO `gen_table_column` VALUES (120, 15, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:12:18');
INSERT INTO `gen_table_column` VALUES (121, 15, 'deleted', '逻辑删除字段', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 10, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:12:18');
INSERT INTO `gen_table_column` VALUES (122, 16, 'id', '题目ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (123, 16, 'title', '题目内容', 'varchar(500)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 2, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (124, 16, 'type', '题目类型（1-单选 2-多选 3-判断 4-填空 5-简答）', 'tinyint', 'Long', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'question_type', 3, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (125, 16, 'options', '选项（JSON格式，仅适用于选择题）', 'text', 'String', 'options', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'textarea', '', 4, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (126, 16, 'answer', '正确答案', 'varchar(255)', 'String', 'answer', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (127, 16, 'analysis', '答案解析', 'text', 'String', 'analysis', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (128, 16, 'knowledge_id', '关联知识点ID', 'bigint', 'Long', 'knowledgeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (129, 16, 'course_id', '关联课程ID', 'bigint', 'Long', 'courseId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (130, 16, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (131, 16, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (132, 16, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (133, 16, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (134, 16, 'deleted', '逻辑删除', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 13, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:18:15');
INSERT INTO `gen_table_column` VALUES (135, 17, 'id', '知识点ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16');
INSERT INTO `gen_table_column` VALUES (136, 17, 'course_id', '关联课程ID', 'bigint', 'Long', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16');
INSERT INTO `gen_table_column` VALUES (137, 17, 'name', '知识点名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16');
INSERT INTO `gen_table_column` VALUES (138, 17, 'parent_id', '父级知识点ID', 'bigint', 'Long', 'parentId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16');
INSERT INTO `gen_table_column` VALUES (139, 17, 'ancestors', '祖级列表', 'varchar(255)', 'String', 'ancestors', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16');
INSERT INTO `gen_table_column` VALUES (140, 17, 'description', '知识点描述', 'varchar(500)', 'String', 'description', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16');
INSERT INTO `gen_table_column` VALUES (141, 17, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16');
INSERT INTO `gen_table_column` VALUES (142, 17, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16');
INSERT INTO `gen_table_column` VALUES (143, 17, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16');
INSERT INTO `gen_table_column` VALUES (144, 17, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16');
INSERT INTO `gen_table_column` VALUES (145, 17, 'deleted', '逻辑删除字段', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 11, 'admin', '2025-01-10 16:09:03', '', '2025-01-10 16:32:16');
INSERT INTO `gen_table_column` VALUES (146, 18, 'id', '评论ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:04:50');
INSERT INTO `gen_table_column` VALUES (147, 18, 'course_id', '课程ID', 'bigint', 'Long', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:04:50');
INSERT INTO `gen_table_column` VALUES (148, 18, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:04:50');
INSERT INTO `gen_table_column` VALUES (149, 18, 'content', '评论内容', 'text', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:04:50');
INSERT INTO `gen_table_column` VALUES (150, 18, 'parent_id', '父级评论ID', 'bigint', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:04:50');
INSERT INTO `gen_table_column` VALUES (151, 18, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:04:51');
INSERT INTO `gen_table_column` VALUES (152, 18, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:04:51');
INSERT INTO `gen_table_column` VALUES (153, 18, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:04:51');
INSERT INTO `gen_table_column` VALUES (154, 18, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:04:51');
INSERT INTO `gen_table_column` VALUES (155, 18, 'deleted', '逻辑删除字段', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 10, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:04:51');
INSERT INTO `gen_table_column` VALUES (156, 19, 'id', 'ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15');
INSERT INTO `gen_table_column` VALUES (157, 19, 'name', '文件名', 'varchar(255)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15');
INSERT INTO `gen_table_column` VALUES (158, 19, 'suffix', '文件后缀名', 'varchar(255)', 'String', 'suffix', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15');
INSERT INTO `gen_table_column` VALUES (159, 19, 'path', '文件路径', 'varchar(255)', 'String', 'path', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15');
INSERT INTO `gen_table_column` VALUES (160, 19, 'type', '文件类型', 'varchar(255)', 'String', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15');
INSERT INTO `gen_table_column` VALUES (161, 19, 'size', '文件大小', 'bigint', 'Long', 'size', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15');
INSERT INTO `gen_table_column` VALUES (162, 19, 'deleted', '是否已删除', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 7, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15');
INSERT INTO `gen_table_column` VALUES (163, 19, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15');
INSERT INTO `gen_table_column` VALUES (164, 19, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15');
INSERT INTO `gen_table_column` VALUES (165, 19, 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15');
INSERT INTO `gen_table_column` VALUES (166, 19, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-01-21 12:00:48', '', '2025-01-21 13:06:15');
INSERT INTO `gen_table_column` VALUES (212, 24, 'id', '学习目标ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (213, 24, 'goal_name', '名称', 'varchar(100)', 'String', 'goalName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (214, 24, 'description', '目标描述', 'text', 'String', 'description', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'textarea', '', 3, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (215, 24, 'deadline', '目标完成期限', 'date', 'Date', 'deadline', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'datetime', '', 4, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (216, 24, 'progress', '学习进度(%)', 'decimal(5,2)', 'BigDecimal', 'progress', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (217, 24, 'status', '状态', 'tinyint', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'study_status', 6, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (218, 24, 'stu_id', '学习者', 'bigint', 'Long', 'stuId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (219, 24, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (220, 24, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (221, 24, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (222, 24, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (223, 24, 'deleted', '逻辑删除字段', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 12, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 16:59:03');
INSERT INTO `gen_table_column` VALUES (246, 27, 'id', '学习记录ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06');
INSERT INTO `gen_table_column` VALUES (247, 27, 'stu_id', '学习者', 'bigint', 'Long', 'stuId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06');
INSERT INTO `gen_table_column` VALUES (248, 27, 'course_id', '课程', 'bigint', 'Long', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06');
INSERT INTO `gen_table_column` VALUES (249, 27, 'completion_time', '完成时间', 'timestamp', 'Date', 'completionTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 4, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06');
INSERT INTO `gen_table_column` VALUES (250, 27, 'status', '状态', 'tinyint', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'study_status', 5, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06');
INSERT INTO `gen_table_column` VALUES (251, 27, 'progress', '课程进度百分比（0-100）', 'decimal(5,2)', 'BigDecimal', 'progress', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06');
INSERT INTO `gen_table_column` VALUES (252, 27, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06');
INSERT INTO `gen_table_column` VALUES (253, 27, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06');
INSERT INTO `gen_table_column` VALUES (254, 27, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06');
INSERT INTO `gen_table_column` VALUES (255, 27, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06');
INSERT INTO `gen_table_column` VALUES (256, 27, 'deleted', '逻辑删除字段', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 11, 'admin', '2025-01-24 16:52:48', '', '2025-01-24 17:07:06');
INSERT INTO `gen_table_column` VALUES (257, 28, 'id', '记录ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-26 09:27:54', '', '2025-01-26 09:31:00');
INSERT INTO `gen_table_column` VALUES (258, 28, 'stu_id', '学生ID', 'bigint', 'Long', 'stuId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-01-26 09:27:54', '', '2025-01-26 09:31:00');
INSERT INTO `gen_table_column` VALUES (259, 28, 'course_id', '课程ID', 'bigint', 'Long', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-01-26 09:27:54', '', '2025-01-26 09:31:00');
INSERT INTO `gen_table_column` VALUES (260, 28, 'progress', '学习进度(%)', 'decimal(5,2)', 'BigDecimal', 'progress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-01-26 09:27:54', '', '2025-01-26 09:31:00');
INSERT INTO `gen_table_column` VALUES (261, 28, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2025-01-26 09:27:54', '', '2025-01-26 09:31:00');
INSERT INTO `gen_table_column` VALUES (262, 28, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2025-01-26 09:27:54', '', '2025-01-26 09:31:00');
INSERT INTO `gen_table_column` VALUES (263, 28, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-01-26 09:27:54', '', '2025-01-26 09:31:00');
INSERT INTO `gen_table_column` VALUES (264, 28, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-01-26 09:27:54', '', '2025-01-26 09:31:00');
INSERT INTO `gen_table_column` VALUES (265, 28, 'deleted', '逻辑删除字段', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 9, 'admin', '2025-01-26 09:27:54', '', '2025-01-26 09:31:00');
INSERT INTO `gen_table_column` VALUES (266, 29, 'id', 'ID', 'bigint', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-26 14:04:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (267, 29, 'paper_id', '试卷ID', 'bigint', 'Long', 'paperId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-01-26 14:04:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (268, 29, 'question_id', '题目ID', 'bigint', 'Long', 'questionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-01-26 14:04:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (269, 29, 'score', '分值', 'int', 'Long', 'score', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-01-26 14:04:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (270, 29, 'order_num', '题目顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-01-26 14:04:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (271, 30, 'id', 'ID', 'bigint', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-26 14:04:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (272, 30, 'file_id', '关联Oss文件ID', 'bigint', 'Long', 'fileId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-01-26 14:04:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (273, 30, 'path', '图片存储路径', 'varchar(255)', 'String', 'path', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-01-26 14:04:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (274, 30, 'page_number', '图片所处页面', 'int', 'Long', 'pageNumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-01-26 14:04:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (285, 32, 'id', '题库ID', 'bigint', 'Long', 'id', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-09 20:49:50', '', '2025-02-09 20:50:50');
INSERT INTO `gen_table_column` VALUES (286, 32, 'name', '题库名称', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-02-09 20:49:50', '', '2025-02-09 20:50:50');
INSERT INTO `gen_table_column` VALUES (287, 32, 'course_id', '关联课程', 'bigint', 'Long', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-09 20:49:50', '', '2025-02-09 20:50:50');
INSERT INTO `gen_table_column` VALUES (288, 32, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2025-02-09 20:49:50', '', '2025-02-09 20:50:50');
INSERT INTO `gen_table_column` VALUES (289, 32, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2025-02-09 20:49:50', '', '2025-02-09 20:50:50');
INSERT INTO `gen_table_column` VALUES (290, 32, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-02-09 20:49:50', '', '2025-02-09 20:50:50');
INSERT INTO `gen_table_column` VALUES (291, 32, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-02-09 20:49:50', '', '2025-02-09 20:50:50');
INSERT INTO `gen_table_column` VALUES (292, 32, 'deleted', '逻辑删除字段', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-09 20:49:50', '', '2025-02-09 20:50:50');
INSERT INTO `gen_table_column` VALUES (293, 33, 'id', '主键', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (294, 33, 'course_id', '关联课程ID', 'bigint', 'Long', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (295, 33, 'paper_id', '关联试卷ID', 'bigint', 'Long', 'paperId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (296, 33, 'name', '考试名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (297, 33, 'total_score', '总分数', 'int', 'Long', 'totalScore', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (298, 33, 'pass_score', '及格分数', 'int', 'Long', 'passScore', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (299, 33, 'duration', '考试时长(分钟)', 'int', 'Long', 'duration', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (300, 33, 'limit', '是否限时(0-否 1-是)', 'tinyint', 'Long', 'limit', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (301, 33, 'start_time', '开始时间', 'date', 'Date', 'startTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 9, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (302, 33, 'end_time', '结束时间', 'date', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 10, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (303, 33, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (304, 33, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (305, 33, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (306, 33, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (307, 33, 'deleted', '逻辑删除字段', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2025-02-11 09:31:18', '', '2025-02-11 09:34:35');
INSERT INTO `gen_table_column` VALUES (308, 34, 'id', '记录ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-11 21:23:45', '', '2025-02-11 22:44:39');
INSERT INTO `gen_table_column` VALUES (309, 34, 'record_id', '考试记录ID', 'bigint', 'Long', 'recordId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-11 21:23:45', '', '2025-02-11 22:44:39');
INSERT INTO `gen_table_column` VALUES (310, 34, 'question_id', '题目ID', 'bigint', 'Long', 'questionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-11 21:23:45', '', '2025-02-11 22:44:39');
INSERT INTO `gen_table_column` VALUES (311, 34, 'answer', '答案', 'varchar(255)', 'String', 'answer', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-11 21:23:45', '', '2025-02-11 22:44:39');
INSERT INTO `gen_table_column` VALUES (312, 35, 'id', '记录ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-11 21:23:45', '', '2025-02-11 21:24:43');
INSERT INTO `gen_table_column` VALUES (313, 35, 'exam_id', '考试ID', 'bigint', 'Long', 'examId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-11 21:23:45', '', '2025-02-11 21:24:43');
INSERT INTO `gen_table_column` VALUES (314, 35, 'user_id', '关联用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-11 21:23:45', '', '2025-02-11 21:24:43');
INSERT INTO `gen_table_column` VALUES (315, 35, 'score', '分数', 'int', 'Long', 'score', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-11 21:23:45', '', '2025-02-11 21:24:43');
INSERT INTO `gen_table_column` VALUES (316, 35, 'status', '考试状态', 'tinyint', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2025-02-11 21:23:45', '', '2025-02-11 21:24:43');
INSERT INTO `gen_table_column` VALUES (317, 35, 'start_time', '开始时间', 'timestamp', 'Date', 'startTime', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'datetime', '', 6, 'admin', '2025-02-11 21:23:45', '', '2025-02-11 21:24:43');
INSERT INTO `gen_table_column` VALUES (318, 35, 'end_time', '结束时间', 'timestamp', 'Date', 'endTime', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'datetime', '', 7, 'admin', '2025-02-11 21:23:45', '', '2025-02-11 21:24:43');
INSERT INTO `gen_table_column` VALUES (319, 36, 'id', '主键', 'bigint', 'Long', 'id', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-12 23:46:39', '', '2025-02-12 23:49:13');
INSERT INTO `gen_table_column` VALUES (320, 36, 'name', '名称', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-02-12 23:46:39', '', '2025-02-12 23:49:13');
INSERT INTO `gen_table_column` VALUES (321, 36, 'status', '启用状态(0-禁用 1-启用)', 'tinyint', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-12 23:46:39', '', '2025-02-12 23:49:13');
INSERT INTO `gen_table_column` VALUES (322, 36, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2025-02-12 23:46:39', '', '2025-02-12 23:49:13');
INSERT INTO `gen_table_column` VALUES (323, 36, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2025-02-12 23:46:39', '', '2025-02-12 23:49:13');
INSERT INTO `gen_table_column` VALUES (324, 36, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-02-12 23:46:39', '', '2025-02-12 23:49:13');
INSERT INTO `gen_table_column` VALUES (325, 36, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-02-12 23:46:39', '', '2025-02-12 23:49:13');
INSERT INTO `gen_table_column` VALUES (326, 36, 'deleted', '立即删除字段', 'tinyint', 'Integer', 'deleted', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-12 23:46:39', '', '2025-02-12 23:49:13');
INSERT INTO `gen_table_column` VALUES (327, 37, 'id', 'ID', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-25 10:56:36', '', '2025-02-25 10:59:15');
INSERT INTO `gen_table_column` VALUES (328, 37, 'score', '评分', 'tinyint', 'Long', 'score', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-25 10:56:36', '', '2025-02-25 10:59:15');
INSERT INTO `gen_table_column` VALUES (329, 37, 'content', '评论', 'text', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2025-02-25 10:56:36', '', '2025-02-25 10:59:15');
INSERT INTO `gen_table_column` VALUES (330, 37, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-25 10:56:36', '', '2025-02-25 10:59:15');
INSERT INTO `gen_table_column` VALUES (331, 37, 'course_id', '课程ID', 'bigint', 'Long', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-02-25 10:56:36', '', '2025-02-25 10:59:15');
INSERT INTO `gen_table_column` VALUES (332, 37, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-02-25 10:56:36', '', '2025-02-25 10:59:15');
INSERT INTO `gen_table_column` VALUES (333, 37, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-02-25 10:56:36', '', '2025-02-25 10:59:15');
INSERT INTO `gen_table_column` VALUES (334, 37, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-25 10:56:36', '', '2025-02-25 10:59:15');
INSERT INTO `gen_table_column` VALUES (335, 37, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-02-25 10:56:36', '', '2025-02-25 10:59:15');
INSERT INTO `gen_table_column` VALUES (336, 37, 'deleted', '逻辑删除字段', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-02-25 10:56:36', '', '2025-02-25 10:59:15');
INSERT INTO `gen_table_column` VALUES (337, 38, 'id', '主键', 'bigint', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');
INSERT INTO `gen_table_column` VALUES (338, 38, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');
INSERT INTO `gen_table_column` VALUES (339, 38, 'goal_id', '学习目标ID', 'bigint', 'Long', 'goalId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');
INSERT INTO `gen_table_column` VALUES (340, 38, 'title', '计划标题', 'varchar(50)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');
INSERT INTO `gen_table_column` VALUES (341, 38, 'content', '计划内容', 'varchar(255)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');
INSERT INTO `gen_table_column` VALUES (342, 38, 'start_time', '开始日期', 'timestamp', 'Date', 'startTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');
INSERT INTO `gen_table_column` VALUES (343, 38, 'end_time', '结束日期', 'timestamp', 'Date', 'endTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');
INSERT INTO `gen_table_column` VALUES (344, 38, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');
INSERT INTO `gen_table_column` VALUES (345, 38, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');
INSERT INTO `gen_table_column` VALUES (346, 38, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');
INSERT INTO `gen_table_column` VALUES (347, 38, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');
INSERT INTO `gen_table_column` VALUES (348, 38, 'deleted', '逻辑删除字段', 'tinyint', 'Long', 'deleted', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2025-03-12 13:12:51', '', '2025-03-12 13:14:14');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-10-05 13:28:49', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-10-05 13:28:49', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-10-05 13:28:49', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-10-05 13:28:49', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-10-05 13:28:49', 'admin', '2025-02-15 15:12:20', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-10-05 13:28:49', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '启用', '0', 'student_status', NULL, 'default', 'N', '0', 'admin', '2024-10-06 23:21:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '停用', '1', 'student_status', NULL, 'default', 'N', '0', 'admin', '2024-10-06 23:21:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 3, '音视频', '3', 'material_type', NULL, 'info', 'N', '0', 'admin', '2024-10-16 10:41:16', 'admin', '2025-01-24 11:57:36', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 2, '图片', '2', 'material_type', NULL, 'success', 'N', '0', 'admin', '2024-10-16 10:41:23', 'admin', '2025-01-24 11:57:31', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 1, '纯文本', '1', 'material_type', NULL, 'default', 'N', '0', 'admin', '2024-10-16 10:41:39', 'admin', '2025-01-24 11:57:52', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 4, '幻灯片', '4', 'material_type', NULL, 'warning', 'N', '0', 'admin', '2024-10-16 10:41:52', 'admin', '2025-01-24 11:57:40', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 5, 'PDF文档', '5', 'material_type', NULL, 'primary', 'N', '0', 'admin', '2024-10-16 10:42:02', 'admin', '2025-01-22 17:18:56', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 1, '单选题', '1', 'question_type', NULL, 'primary', 'N', '0', 'admin', '2025-01-10 15:42:59', 'admin', '2025-02-11 00:05:55', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 2, '多选题', '2', 'question_type', NULL, 'primary', 'N', '0', 'admin', '2025-01-10 15:43:14', 'admin', '2025-02-11 00:05:59', NULL);
INSERT INTO `sys_dict_data` VALUES (112, 3, '判断题', '3', 'question_type', NULL, 'primary', 'N', '0', 'admin', '2025-01-10 15:43:35', 'admin', '2025-02-11 00:06:02', NULL);
INSERT INTO `sys_dict_data` VALUES (113, 4, '填空题', '4', 'question_type', NULL, 'primary', 'N', '0', 'admin', '2025-01-10 15:43:44', 'admin', '2025-02-11 00:06:04', NULL);
INSERT INTO `sys_dict_data` VALUES (114, 5, '简答题', '5', 'question_type', NULL, 'primary', 'N', '0', 'admin', '2025-01-10 15:43:53', 'admin', '2025-02-11 00:06:07', NULL);
INSERT INTO `sys_dict_data` VALUES (115, 1, '简单', '1', 'question_difficulty', NULL, 'primary', 'N', '0', 'admin', '2025-01-15 09:31:07', 'admin', '2025-01-15 09:31:15', NULL);
INSERT INTO `sys_dict_data` VALUES (116, 2, '中等', '2', 'question_difficulty', NULL, 'warning', 'N', '0', 'admin', '2025-01-15 09:31:38', 'admin', '2025-01-15 09:34:10', NULL);
INSERT INTO `sys_dict_data` VALUES (117, 3, '困难', '3', 'question_difficulty', NULL, 'danger', 'N', '0', 'admin', '2025-01-15 09:31:46', 'admin', '2025-01-15 09:34:04', NULL);
INSERT INTO `sys_dict_data` VALUES (118, 1, '未发布', '0', 'paper_published', NULL, 'info', 'N', '0', 'admin', '2025-01-15 14:32:49', 'admin', '2025-01-15 14:33:02', NULL);
INSERT INTO `sys_dict_data` VALUES (119, 2, '已发布', '1', 'paper_published', NULL, 'success', 'N', '0', 'admin', '2025-01-15 14:33:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 6, '其他文件', '6', 'material_type', NULL, 'danger', 'N', '0', 'admin', '2025-01-21 17:21:27', 'admin', '2025-01-24 11:57:46', '包括压缩包、安装包、应用程序等');
INSERT INTO `sys_dict_data` VALUES (121, 1, '未开始', '0', 'common_status', NULL, 'info', 'N', '0', 'admin', '2025-01-24 16:55:35', 'admin', '2025-01-24 16:55:58', NULL);
INSERT INTO `sys_dict_data` VALUES (122, 2, '进行中', '1', 'common_status', NULL, 'primary', 'N', '0', 'admin', '2025-01-24 16:55:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 3, '已结束', '2', 'common_status', NULL, 'success', 'N', '0', 'admin', '2025-01-24 16:56:07', 'admin', '2025-02-18 11:35:02', NULL);
INSERT INTO `sys_dict_data` VALUES (127, 1, '未发布', '0', 'exam_publish_status', NULL, 'info', 'N', '0', 'admin', '2025-02-11 12:34:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 2, '已发布', '1', 'exam_publish_status', NULL, 'success', 'N', '0', 'admin', '2025-02-11 12:34:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 1, '未通过', '0', 'exam_passed', '', 'danger', 'N', '0', 'admin', '2025-02-11 22:05:33', 'admin', '2025-02-11 22:05:42', NULL);
INSERT INTO `sys_dict_data` VALUES (130, 2, '通过', '1', 'exam_passed', NULL, 'success', 'N', '0', 'admin', '2025-02-11 22:05:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 1, '未做', '0', 'homework_status', NULL, 'warning', 'N', '0', 'admin', '2025-02-19 10:09:37', 'admin', '2025-05-06 11:55:35', NULL);
INSERT INTO `sys_dict_data` VALUES (132, 2, '待批阅', '1', 'homework_status', NULL, 'primary', 'N', '0', 'admin', '2025-02-19 10:09:48', 'admin', '2025-05-06 11:55:27', NULL);
INSERT INTO `sys_dict_data` VALUES (133, 3, '已批阅', '2', 'homework_status', NULL, 'success', 'N', '0', 'admin', '2025-02-19 10:09:59', 'admin', '2025-05-06 11:55:20', NULL);
INSERT INTO `sys_dict_data` VALUES (134, 1, '未开始', '0', 'exam_submit_status', NULL, 'info', 'N', '0', 'admin', '2025-02-20 22:20:44', 'admin', '2025-02-20 22:21:52', NULL);
INSERT INTO `sys_dict_data` VALUES (135, 2, '进行中', '1', 'exam_submit_status', NULL, 'primary', 'N', '0', 'admin', '2025-02-20 22:20:57', 'admin', '2025-02-20 22:22:05', NULL);
INSERT INTO `sys_dict_data` VALUES (136, 3, '待阅卷', '2', 'exam_submit_status', NULL, 'warning', 'N', '0', 'admin', '2025-02-20 22:21:06', 'admin', '2025-02-20 22:22:08', NULL);
INSERT INTO `sys_dict_data` VALUES (137, 4, '已完成', '3', 'exam_submit_status', NULL, 'success', 'N', '0', 'admin', '2025-02-20 22:21:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (138, 0, '未完成', '0', 'goal_status', NULL, 'danger', 'N', '0', 'admin', '2025-03-12 10:25:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (139, 1, '已完成', '1', 'goal_status', NULL, 'success', 'N', '0', 'admin', '2025-03-12 10:25:54', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-10-05 13:28:49', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '学生账号状态', 'student_status', '0', 'admin', '2024-10-06 23:21:06', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '资料类型', 'material_type', '0', 'admin', '2024-10-16 10:40:59', '', NULL, '资料类型');
INSERT INTO `sys_dict_type` VALUES (103, '题目类型', 'question_type', '0', 'admin', '2025-01-10 15:40:32', '', NULL, '题目类型');
INSERT INTO `sys_dict_type` VALUES (104, '题目难易程度', 'question_difficulty', '0', 'admin', '2025-01-15 09:30:52', 'admin', '2025-01-15 09:30:56', '题目难易程度');
INSERT INTO `sys_dict_type` VALUES (105, '试卷发布状态', 'paper_published', '0', 'admin', '2025-01-15 14:32:24', '', NULL, '试卷发布状态');
INSERT INTO `sys_dict_type` VALUES (106, '通用状态', 'common_status', '0', 'admin', '2025-01-24 16:55:13', 'admin', '2025-02-11 21:49:19', '通用状态');
INSERT INTO `sys_dict_type` VALUES (108, '考试发布状态', 'exam_publish_status', '0', 'admin', '2025-02-11 12:32:48', 'admin', '2025-02-11 12:34:11', '考试发布状态');
INSERT INTO `sys_dict_type` VALUES (109, '考试通过状态', 'exam_passed', '0', 'admin', '2025-02-11 22:04:42', '', NULL, '考试通过状态');
INSERT INTO `sys_dict_type` VALUES (110, '作业状态', 'homework_status', '0', 'admin', '2025-02-19 10:09:25', '', NULL, '作业状态');
INSERT INTO `sys_dict_type` VALUES (111, '考试提交状态', 'exam_submit_status', '0', 'admin', '2025-02-20 22:20:13', '', NULL, '考试提交状态');
INSERT INTO `sys_dict_type` VALUES (112, '目标完成状态', 'goal_status', '0', 'admin', '2025-03-12 10:25:30', '', NULL, '目标完成状态');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-10-05 13:28:49', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-10-05 13:28:49', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-10-05 13:28:49', 'admin', '2025-02-19 22:40:44', '');
INSERT INTO `sys_job` VALUES (141, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '0 0/10 * * * ?', '1', '0', '0', 'admin', '2025-03-30 00:36:33', '', NULL, '');
INSERT INTO `sys_job` VALUES (142, '强制交卷-1908046415452082178', 'DEFAULT', 'breakExamTask.ryParams(1908046415452082178L)', '0 0 10 28 5 ? 2025', '1', '1', '0', '', '2025-04-04 14:38:09', '', '2025-04-04 14:38:54', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1294 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (17, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：43毫秒', '0', '', '2025-03-31 10:30:00');
INSERT INTO `sys_job_log` VALUES (18, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 10:40:00');
INSERT INTO `sys_job_log` VALUES (19, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-03-31 10:50:00');
INSERT INTO `sys_job_log` VALUES (20, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 11:00:00');
INSERT INTO `sys_job_log` VALUES (21, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 11:10:00');
INSERT INTO `sys_job_log` VALUES (22, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 11:20:00');
INSERT INTO `sys_job_log` VALUES (23, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-03-31 11:30:00');
INSERT INTO `sys_job_log` VALUES (24, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 11:40:00');
INSERT INTO `sys_job_log` VALUES (25, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 11:50:00');
INSERT INTO `sys_job_log` VALUES (26, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 12:00:00');
INSERT INTO `sys_job_log` VALUES (27, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 12:10:00');
INSERT INTO `sys_job_log` VALUES (28, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 12:20:00');
INSERT INTO `sys_job_log` VALUES (29, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 12:30:00');
INSERT INTO `sys_job_log` VALUES (30, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 12:40:00');
INSERT INTO `sys_job_log` VALUES (31, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 12:50:00');
INSERT INTO `sys_job_log` VALUES (32, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 13:00:00');
INSERT INTO `sys_job_log` VALUES (33, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-03-31 13:10:00');
INSERT INTO `sys_job_log` VALUES (34, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 13:20:00');
INSERT INTO `sys_job_log` VALUES (35, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-03-31 13:30:00');
INSERT INTO `sys_job_log` VALUES (36, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 13:40:00');
INSERT INTO `sys_job_log` VALUES (37, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 13:50:00');
INSERT INTO `sys_job_log` VALUES (38, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 14:00:00');
INSERT INTO `sys_job_log` VALUES (39, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 14:10:00');
INSERT INTO `sys_job_log` VALUES (40, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 14:20:00');
INSERT INTO `sys_job_log` VALUES (41, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 14:30:00');
INSERT INTO `sys_job_log` VALUES (42, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 14:40:00');
INSERT INTO `sys_job_log` VALUES (43, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 14:50:00');
INSERT INTO `sys_job_log` VALUES (44, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 15:00:00');
INSERT INTO `sys_job_log` VALUES (45, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 15:10:00');
INSERT INTO `sys_job_log` VALUES (46, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 15:20:00');
INSERT INTO `sys_job_log` VALUES (47, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 15:30:00');
INSERT INTO `sys_job_log` VALUES (48, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-03-31 15:40:00');
INSERT INTO `sys_job_log` VALUES (49, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 15:50:00');
INSERT INTO `sys_job_log` VALUES (50, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 16:00:00');
INSERT INTO `sys_job_log` VALUES (51, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-03-31 16:10:00');
INSERT INTO `sys_job_log` VALUES (52, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 16:20:00');
INSERT INTO `sys_job_log` VALUES (53, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 16:30:00');
INSERT INTO `sys_job_log` VALUES (54, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 16:40:00');
INSERT INTO `sys_job_log` VALUES (55, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 16:50:00');
INSERT INTO `sys_job_log` VALUES (56, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 17:00:00');
INSERT INTO `sys_job_log` VALUES (57, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 17:10:00');
INSERT INTO `sys_job_log` VALUES (58, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 17:20:00');
INSERT INTO `sys_job_log` VALUES (59, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 17:30:00');
INSERT INTO `sys_job_log` VALUES (60, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-03-31 17:40:00');
INSERT INTO `sys_job_log` VALUES (61, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 17:50:00');
INSERT INTO `sys_job_log` VALUES (62, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 18:00:00');
INSERT INTO `sys_job_log` VALUES (63, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 18:10:00');
INSERT INTO `sys_job_log` VALUES (64, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 18:20:00');
INSERT INTO `sys_job_log` VALUES (65, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 18:30:00');
INSERT INTO `sys_job_log` VALUES (66, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 18:40:00');
INSERT INTO `sys_job_log` VALUES (67, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 18:50:00');
INSERT INTO `sys_job_log` VALUES (68, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 19:00:00');
INSERT INTO `sys_job_log` VALUES (69, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 19:10:00');
INSERT INTO `sys_job_log` VALUES (70, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 19:20:00');
INSERT INTO `sys_job_log` VALUES (71, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 19:30:00');
INSERT INTO `sys_job_log` VALUES (72, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 19:40:00');
INSERT INTO `sys_job_log` VALUES (73, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 19:50:00');
INSERT INTO `sys_job_log` VALUES (74, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 20:00:00');
INSERT INTO `sys_job_log` VALUES (75, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 20:10:00');
INSERT INTO `sys_job_log` VALUES (76, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 20:20:00');
INSERT INTO `sys_job_log` VALUES (77, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 20:30:00');
INSERT INTO `sys_job_log` VALUES (78, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 20:40:00');
INSERT INTO `sys_job_log` VALUES (79, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 20:50:00');
INSERT INTO `sys_job_log` VALUES (80, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 21:00:00');
INSERT INTO `sys_job_log` VALUES (81, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-03-31 21:10:00');
INSERT INTO `sys_job_log` VALUES (82, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 21:20:00');
INSERT INTO `sys_job_log` VALUES (83, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 21:30:00');
INSERT INTO `sys_job_log` VALUES (84, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 21:40:00');
INSERT INTO `sys_job_log` VALUES (85, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 21:50:00');
INSERT INTO `sys_job_log` VALUES (86, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 22:00:00');
INSERT INTO `sys_job_log` VALUES (87, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 22:10:00');
INSERT INTO `sys_job_log` VALUES (88, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 22:20:00');
INSERT INTO `sys_job_log` VALUES (89, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 22:30:00');
INSERT INTO `sys_job_log` VALUES (90, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 22:40:00');
INSERT INTO `sys_job_log` VALUES (91, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 22:50:00');
INSERT INTO `sys_job_log` VALUES (92, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 23:00:00');
INSERT INTO `sys_job_log` VALUES (93, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-03-31 23:10:00');
INSERT INTO `sys_job_log` VALUES (94, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 23:20:00');
INSERT INTO `sys_job_log` VALUES (95, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-03-31 23:30:00');
INSERT INTO `sys_job_log` VALUES (96, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 23:40:00');
INSERT INTO `sys_job_log` VALUES (97, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-03-31 23:50:00');
INSERT INTO `sys_job_log` VALUES (98, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：18毫秒', '0', '', '2025-04-01 00:00:00');
INSERT INTO `sys_job_log` VALUES (99, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 00:10:00');
INSERT INTO `sys_job_log` VALUES (100, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 00:20:00');
INSERT INTO `sys_job_log` VALUES (101, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 00:30:00');
INSERT INTO `sys_job_log` VALUES (102, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 00:40:00');
INSERT INTO `sys_job_log` VALUES (103, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 00:50:00');
INSERT INTO `sys_job_log` VALUES (104, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (105, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 01:10:00');
INSERT INTO `sys_job_log` VALUES (106, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 01:20:00');
INSERT INTO `sys_job_log` VALUES (107, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 01:30:00');
INSERT INTO `sys_job_log` VALUES (108, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 01:40:00');
INSERT INTO `sys_job_log` VALUES (109, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 01:50:00');
INSERT INTO `sys_job_log` VALUES (110, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 02:00:00');
INSERT INTO `sys_job_log` VALUES (111, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 02:10:00');
INSERT INTO `sys_job_log` VALUES (112, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 02:20:00');
INSERT INTO `sys_job_log` VALUES (113, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 02:30:00');
INSERT INTO `sys_job_log` VALUES (114, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-01 02:40:00');
INSERT INTO `sys_job_log` VALUES (115, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 02:50:00');
INSERT INTO `sys_job_log` VALUES (116, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 03:00:00');
INSERT INTO `sys_job_log` VALUES (117, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 03:10:00');
INSERT INTO `sys_job_log` VALUES (118, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：592毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (119, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：687毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (120, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：685毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (121, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：589毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (122, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：576毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (123, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：689毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (124, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：683毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (125, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：120毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (126, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：692毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (127, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：707毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (128, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：52毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (129, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：46毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (130, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：782毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (131, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：51毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (132, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：49毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (133, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (134, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (135, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (136, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (137, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：23毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (138, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：23毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (139, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：22毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (140, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：27毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (141, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (142, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (143, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (144, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：20毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (145, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (146, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：13毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (147, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：15毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (148, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：15毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (149, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-01 08:30:35');
INSERT INTO `sys_job_log` VALUES (150, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 08:40:00');
INSERT INTO `sys_job_log` VALUES (151, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-01 08:50:00');
INSERT INTO `sys_job_log` VALUES (152, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 09:00:00');
INSERT INTO `sys_job_log` VALUES (153, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 09:10:00');
INSERT INTO `sys_job_log` VALUES (154, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 09:20:00');
INSERT INTO `sys_job_log` VALUES (155, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 09:30:00');
INSERT INTO `sys_job_log` VALUES (156, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 09:40:00');
INSERT INTO `sys_job_log` VALUES (157, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 09:50:00');
INSERT INTO `sys_job_log` VALUES (158, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 10:00:00');
INSERT INTO `sys_job_log` VALUES (159, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 10:10:00');
INSERT INTO `sys_job_log` VALUES (160, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 10:20:00');
INSERT INTO `sys_job_log` VALUES (161, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 10:30:00');
INSERT INTO `sys_job_log` VALUES (162, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 10:40:00');
INSERT INTO `sys_job_log` VALUES (163, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-01 10:50:00');
INSERT INTO `sys_job_log` VALUES (164, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 11:00:00');
INSERT INTO `sys_job_log` VALUES (165, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 11:10:00');
INSERT INTO `sys_job_log` VALUES (166, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 11:20:00');
INSERT INTO `sys_job_log` VALUES (167, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 11:30:00');
INSERT INTO `sys_job_log` VALUES (168, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-01 11:40:00');
INSERT INTO `sys_job_log` VALUES (169, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-01 11:50:00');
INSERT INTO `sys_job_log` VALUES (170, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 12:00:00');
INSERT INTO `sys_job_log` VALUES (171, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 12:10:00');
INSERT INTO `sys_job_log` VALUES (172, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 12:20:00');
INSERT INTO `sys_job_log` VALUES (173, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 12:30:00');
INSERT INTO `sys_job_log` VALUES (174, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 12:40:00');
INSERT INTO `sys_job_log` VALUES (175, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 12:50:00');
INSERT INTO `sys_job_log` VALUES (176, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 13:00:00');
INSERT INTO `sys_job_log` VALUES (177, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 13:10:00');
INSERT INTO `sys_job_log` VALUES (178, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 13:20:00');
INSERT INTO `sys_job_log` VALUES (179, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-01 13:30:00');
INSERT INTO `sys_job_log` VALUES (180, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 13:40:00');
INSERT INTO `sys_job_log` VALUES (181, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 13:50:00');
INSERT INTO `sys_job_log` VALUES (182, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 14:00:00');
INSERT INTO `sys_job_log` VALUES (183, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 14:10:00');
INSERT INTO `sys_job_log` VALUES (184, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 14:20:00');
INSERT INTO `sys_job_log` VALUES (185, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 14:30:00');
INSERT INTO `sys_job_log` VALUES (186, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 14:40:00');
INSERT INTO `sys_job_log` VALUES (187, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 14:50:00');
INSERT INTO `sys_job_log` VALUES (188, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 15:00:00');
INSERT INTO `sys_job_log` VALUES (189, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 15:10:00');
INSERT INTO `sys_job_log` VALUES (190, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 15:20:00');
INSERT INTO `sys_job_log` VALUES (191, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 15:30:00');
INSERT INTO `sys_job_log` VALUES (192, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 15:40:00');
INSERT INTO `sys_job_log` VALUES (193, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 15:50:00');
INSERT INTO `sys_job_log` VALUES (194, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 16:00:00');
INSERT INTO `sys_job_log` VALUES (195, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 16:10:00');
INSERT INTO `sys_job_log` VALUES (196, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 16:20:00');
INSERT INTO `sys_job_log` VALUES (197, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 16:30:00');
INSERT INTO `sys_job_log` VALUES (198, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 16:40:00');
INSERT INTO `sys_job_log` VALUES (199, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 16:50:00');
INSERT INTO `sys_job_log` VALUES (200, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 17:00:00');
INSERT INTO `sys_job_log` VALUES (201, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 17:10:00');
INSERT INTO `sys_job_log` VALUES (202, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 17:20:00');
INSERT INTO `sys_job_log` VALUES (203, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 17:30:00');
INSERT INTO `sys_job_log` VALUES (204, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 17:40:00');
INSERT INTO `sys_job_log` VALUES (205, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 17:50:00');
INSERT INTO `sys_job_log` VALUES (206, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 18:00:00');
INSERT INTO `sys_job_log` VALUES (207, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 18:10:00');
INSERT INTO `sys_job_log` VALUES (208, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 18:20:00');
INSERT INTO `sys_job_log` VALUES (209, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 18:30:00');
INSERT INTO `sys_job_log` VALUES (210, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 18:40:00');
INSERT INTO `sys_job_log` VALUES (211, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 18:50:00');
INSERT INTO `sys_job_log` VALUES (212, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 19:00:00');
INSERT INTO `sys_job_log` VALUES (213, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 19:10:00');
INSERT INTO `sys_job_log` VALUES (214, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 19:20:00');
INSERT INTO `sys_job_log` VALUES (215, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 19:30:00');
INSERT INTO `sys_job_log` VALUES (216, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 19:40:00');
INSERT INTO `sys_job_log` VALUES (217, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 19:50:00');
INSERT INTO `sys_job_log` VALUES (218, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 20:00:00');
INSERT INTO `sys_job_log` VALUES (219, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 20:10:00');
INSERT INTO `sys_job_log` VALUES (220, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 20:20:00');
INSERT INTO `sys_job_log` VALUES (221, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 20:30:00');
INSERT INTO `sys_job_log` VALUES (222, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 20:40:00');
INSERT INTO `sys_job_log` VALUES (223, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 20:50:00');
INSERT INTO `sys_job_log` VALUES (224, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 21:00:00');
INSERT INTO `sys_job_log` VALUES (225, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 21:10:00');
INSERT INTO `sys_job_log` VALUES (226, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 21:20:00');
INSERT INTO `sys_job_log` VALUES (227, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 21:30:00');
INSERT INTO `sys_job_log` VALUES (228, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 21:40:00');
INSERT INTO `sys_job_log` VALUES (229, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 21:50:00');
INSERT INTO `sys_job_log` VALUES (230, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 22:00:00');
INSERT INTO `sys_job_log` VALUES (231, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 22:10:00');
INSERT INTO `sys_job_log` VALUES (232, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 22:20:00');
INSERT INTO `sys_job_log` VALUES (233, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 22:30:00');
INSERT INTO `sys_job_log` VALUES (234, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 22:40:00');
INSERT INTO `sys_job_log` VALUES (235, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-01 22:50:00');
INSERT INTO `sys_job_log` VALUES (236, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-01 23:00:00');
INSERT INTO `sys_job_log` VALUES (237, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-01 23:10:00');
INSERT INTO `sys_job_log` VALUES (238, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 23:20:00');
INSERT INTO `sys_job_log` VALUES (239, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 23:30:00');
INSERT INTO `sys_job_log` VALUES (240, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 23:40:00');
INSERT INTO `sys_job_log` VALUES (241, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-01 23:50:00');
INSERT INTO `sys_job_log` VALUES (242, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-02 00:00:00');
INSERT INTO `sys_job_log` VALUES (243, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-02 00:19:38');
INSERT INTO `sys_job_log` VALUES (244, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 00:20:00');
INSERT INTO `sys_job_log` VALUES (245, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：16毫秒', '0', '', '2025-04-02 08:28:00');
INSERT INTO `sys_job_log` VALUES (246, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：17毫秒', '0', '', '2025-04-02 08:28:00');
INSERT INTO `sys_job_log` VALUES (247, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：29毫秒', '0', '', '2025-04-02 08:28:01');
INSERT INTO `sys_job_log` VALUES (248, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：298毫秒', '0', '', '2025-04-02 08:28:01');
INSERT INTO `sys_job_log` VALUES (249, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：40毫秒', '0', '', '2025-04-02 08:28:01');
INSERT INTO `sys_job_log` VALUES (250, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2186毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (251, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2088毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (252, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2083毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (253, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2090毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (254, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2048毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (255, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2049毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (256, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2051毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (257, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：1400毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (258, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：1420毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (259, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：42毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (260, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：39毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (261, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：35毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (262, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：48毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (263, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：30毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (264, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：31毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (265, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2062毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (266, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：66毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (267, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：37毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (268, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：61毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (269, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：53毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (270, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：15毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (271, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：33毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (272, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：47毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (273, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：71毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (274, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：44毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (275, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：65毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (276, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：74毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (277, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：52毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (278, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：91毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (279, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：54毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (280, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：54毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (281, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：20毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (282, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：47毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (283, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：43毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (284, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：21毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (285, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：22毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (286, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：15毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (287, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：16毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (288, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：19毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (289, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：44毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (290, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：21毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (291, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：27毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (292, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：39毫秒', '0', '', '2025-04-02 08:28:03');
INSERT INTO `sys_job_log` VALUES (293, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-02 08:30:00');
INSERT INTO `sys_job_log` VALUES (294, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 08:40:00');
INSERT INTO `sys_job_log` VALUES (295, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 08:50:00');
INSERT INTO `sys_job_log` VALUES (296, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 09:00:00');
INSERT INTO `sys_job_log` VALUES (297, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 09:10:00');
INSERT INTO `sys_job_log` VALUES (298, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 09:20:00');
INSERT INTO `sys_job_log` VALUES (299, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 09:30:00');
INSERT INTO `sys_job_log` VALUES (300, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 09:40:00');
INSERT INTO `sys_job_log` VALUES (301, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 09:50:00');
INSERT INTO `sys_job_log` VALUES (302, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 10:00:00');
INSERT INTO `sys_job_log` VALUES (303, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 10:10:00');
INSERT INTO `sys_job_log` VALUES (304, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 10:20:00');
INSERT INTO `sys_job_log` VALUES (305, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 10:30:00');
INSERT INTO `sys_job_log` VALUES (306, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 10:40:00');
INSERT INTO `sys_job_log` VALUES (307, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 10:50:00');
INSERT INTO `sys_job_log` VALUES (308, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 11:00:00');
INSERT INTO `sys_job_log` VALUES (309, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-02 11:10:00');
INSERT INTO `sys_job_log` VALUES (310, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-02 11:20:00');
INSERT INTO `sys_job_log` VALUES (311, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-02 11:30:00');
INSERT INTO `sys_job_log` VALUES (312, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 11:40:00');
INSERT INTO `sys_job_log` VALUES (313, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 11:50:00');
INSERT INTO `sys_job_log` VALUES (314, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 12:00:00');
INSERT INTO `sys_job_log` VALUES (315, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 12:10:00');
INSERT INTO `sys_job_log` VALUES (316, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 12:20:00');
INSERT INTO `sys_job_log` VALUES (317, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-02 12:30:00');
INSERT INTO `sys_job_log` VALUES (318, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-02 12:40:00');
INSERT INTO `sys_job_log` VALUES (319, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 12:50:00');
INSERT INTO `sys_job_log` VALUES (320, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 13:00:00');
INSERT INTO `sys_job_log` VALUES (321, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 13:10:00');
INSERT INTO `sys_job_log` VALUES (322, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 13:20:00');
INSERT INTO `sys_job_log` VALUES (323, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 13:30:00');
INSERT INTO `sys_job_log` VALUES (324, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 13:40:00');
INSERT INTO `sys_job_log` VALUES (325, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 13:50:00');
INSERT INTO `sys_job_log` VALUES (326, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 14:00:00');
INSERT INTO `sys_job_log` VALUES (327, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 14:10:00');
INSERT INTO `sys_job_log` VALUES (328, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 14:20:00');
INSERT INTO `sys_job_log` VALUES (329, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 14:30:00');
INSERT INTO `sys_job_log` VALUES (330, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 14:40:00');
INSERT INTO `sys_job_log` VALUES (331, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 14:50:00');
INSERT INTO `sys_job_log` VALUES (332, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-02 15:00:00');
INSERT INTO `sys_job_log` VALUES (333, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 15:10:00');
INSERT INTO `sys_job_log` VALUES (334, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 15:20:00');
INSERT INTO `sys_job_log` VALUES (335, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 15:30:00');
INSERT INTO `sys_job_log` VALUES (336, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 15:40:00');
INSERT INTO `sys_job_log` VALUES (337, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 15:50:00');
INSERT INTO `sys_job_log` VALUES (338, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 16:00:00');
INSERT INTO `sys_job_log` VALUES (339, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 16:10:00');
INSERT INTO `sys_job_log` VALUES (340, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 16:20:00');
INSERT INTO `sys_job_log` VALUES (341, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 16:30:00');
INSERT INTO `sys_job_log` VALUES (342, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 16:40:00');
INSERT INTO `sys_job_log` VALUES (343, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 16:50:00');
INSERT INTO `sys_job_log` VALUES (344, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 17:00:00');
INSERT INTO `sys_job_log` VALUES (345, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 17:10:00');
INSERT INTO `sys_job_log` VALUES (346, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 17:20:00');
INSERT INTO `sys_job_log` VALUES (347, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 17:30:00');
INSERT INTO `sys_job_log` VALUES (348, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 17:40:00');
INSERT INTO `sys_job_log` VALUES (349, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 17:50:00');
INSERT INTO `sys_job_log` VALUES (350, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 18:00:00');
INSERT INTO `sys_job_log` VALUES (351, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-02 18:10:00');
INSERT INTO `sys_job_log` VALUES (352, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-02 18:20:00');
INSERT INTO `sys_job_log` VALUES (353, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 18:30:00');
INSERT INTO `sys_job_log` VALUES (354, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 18:40:00');
INSERT INTO `sys_job_log` VALUES (355, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 18:50:00');
INSERT INTO `sys_job_log` VALUES (356, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 19:00:00');
INSERT INTO `sys_job_log` VALUES (357, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 19:10:00');
INSERT INTO `sys_job_log` VALUES (358, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 19:20:00');
INSERT INTO `sys_job_log` VALUES (359, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 19:30:00');
INSERT INTO `sys_job_log` VALUES (360, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 19:40:00');
INSERT INTO `sys_job_log` VALUES (361, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 19:50:00');
INSERT INTO `sys_job_log` VALUES (362, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 20:00:00');
INSERT INTO `sys_job_log` VALUES (363, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 20:10:00');
INSERT INTO `sys_job_log` VALUES (364, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 20:20:00');
INSERT INTO `sys_job_log` VALUES (365, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 20:30:00');
INSERT INTO `sys_job_log` VALUES (366, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 20:40:00');
INSERT INTO `sys_job_log` VALUES (367, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 20:50:00');
INSERT INTO `sys_job_log` VALUES (368, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 21:00:00');
INSERT INTO `sys_job_log` VALUES (369, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 21:10:00');
INSERT INTO `sys_job_log` VALUES (370, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 21:20:00');
INSERT INTO `sys_job_log` VALUES (371, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 21:30:00');
INSERT INTO `sys_job_log` VALUES (372, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-02 21:40:00');
INSERT INTO `sys_job_log` VALUES (373, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 21:50:00');
INSERT INTO `sys_job_log` VALUES (374, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 22:00:00');
INSERT INTO `sys_job_log` VALUES (375, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-02 22:10:00');
INSERT INTO `sys_job_log` VALUES (376, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 22:20:00');
INSERT INTO `sys_job_log` VALUES (377, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 22:30:00');
INSERT INTO `sys_job_log` VALUES (378, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 22:40:00');
INSERT INTO `sys_job_log` VALUES (379, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 22:50:00');
INSERT INTO `sys_job_log` VALUES (380, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 23:00:00');
INSERT INTO `sys_job_log` VALUES (381, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-02 23:10:00');
INSERT INTO `sys_job_log` VALUES (382, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 23:20:00');
INSERT INTO `sys_job_log` VALUES (383, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 23:30:00');
INSERT INTO `sys_job_log` VALUES (384, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-02 23:40:00');
INSERT INTO `sys_job_log` VALUES (385, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-02 23:50:00');
INSERT INTO `sys_job_log` VALUES (386, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：54毫秒', '0', '', '2025-04-03 00:00:00');
INSERT INTO `sys_job_log` VALUES (387, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：69毫秒', '0', '', '2025-04-04 09:09:30');
INSERT INTO `sys_job_log` VALUES (388, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：122毫秒', '0', '', '2025-04-04 09:09:30');
INSERT INTO `sys_job_log` VALUES (389, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：78毫秒', '0', '', '2025-04-04 09:09:35');
INSERT INTO `sys_job_log` VALUES (390, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11822毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (391, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：29毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (392, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4956毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (393, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4951毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (394, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11811毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (395, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6934毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (396, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4954毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (397, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6928毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (398, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11783毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (399, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4945毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (400, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (401, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (402, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (403, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：14毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (404, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (405, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (406, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (407, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：13毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (408, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：15毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (409, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (410, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：24毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (411, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (412, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (413, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (414, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (415, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (416, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (417, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (418, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：13毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (419, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：14毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (420, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (421, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (422, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (423, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (424, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：15毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (425, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (426, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：14毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (427, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (428, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (429, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (430, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (431, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (432, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (433, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (434, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (435, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (436, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (437, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (438, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (439, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (440, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (441, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (442, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (443, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (444, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (445, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (446, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (447, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (448, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (449, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (450, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (451, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (452, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (453, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：127毫秒', '0', '', '2025-04-04 09:09:42');
INSERT INTO `sys_job_log` VALUES (454, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (455, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (456, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (457, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (458, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (459, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (460, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (461, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (462, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (463, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (464, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (465, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (466, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (467, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (468, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (469, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (470, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (471, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (472, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (473, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (474, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (475, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (476, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (477, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (478, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (479, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (480, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (481, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (482, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (483, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：15毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (484, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：14毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (485, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：14毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (486, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (487, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (488, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (489, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (490, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (491, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：17毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (492, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：19毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (493, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：19毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (494, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：16毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (495, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：16毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (496, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：17毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (497, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (498, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (499, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (500, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (501, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (502, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (503, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (504, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (505, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (506, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (507, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (508, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (509, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (510, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (511, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (512, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (513, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (514, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (515, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (516, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (517, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (518, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (519, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (520, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (521, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (522, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (523, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (524, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (525, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (526, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (527, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (528, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (529, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (530, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (531, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (532, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (533, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (534, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (535, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (536, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (537, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (538, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (539, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (540, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (541, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (542, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (543, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (544, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (545, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (546, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (547, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (548, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (549, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (550, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：17毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (551, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (552, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (553, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (554, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (555, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (556, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (557, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (558, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (559, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (560, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (561, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (562, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (563, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (564, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (565, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (566, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (567, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (568, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (569, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (570, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (571, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (572, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (573, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (574, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (575, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (576, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 09:09:43');
INSERT INTO `sys_job_log` VALUES (577, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2294毫秒', '0', '', '2025-04-04 09:09:45');
INSERT INTO `sys_job_log` VALUES (578, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2296毫秒', '0', '', '2025-04-04 09:09:45');
INSERT INTO `sys_job_log` VALUES (579, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2296毫秒', '0', '', '2025-04-04 09:09:45');
INSERT INTO `sys_job_log` VALUES (580, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2287毫秒', '0', '', '2025-04-04 09:09:45');
INSERT INTO `sys_job_log` VALUES (581, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2286毫秒', '0', '', '2025-04-04 09:09:45');
INSERT INTO `sys_job_log` VALUES (582, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2284毫秒', '0', '', '2025-04-04 09:09:45');
INSERT INTO `sys_job_log` VALUES (583, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2283毫秒', '0', '', '2025-04-04 09:09:45');
INSERT INTO `sys_job_log` VALUES (584, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：2281毫秒', '0', '', '2025-04-04 09:09:45');
INSERT INTO `sys_job_log` VALUES (585, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 09:10:00');
INSERT INTO `sys_job_log` VALUES (586, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 09:20:00');
INSERT INTO `sys_job_log` VALUES (587, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-04 09:30:00');
INSERT INTO `sys_job_log` VALUES (588, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-04 09:40:00');
INSERT INTO `sys_job_log` VALUES (589, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 09:50:00');
INSERT INTO `sys_job_log` VALUES (590, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 10:00:00');
INSERT INTO `sys_job_log` VALUES (591, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 10:10:00');
INSERT INTO `sys_job_log` VALUES (592, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 10:20:00');
INSERT INTO `sys_job_log` VALUES (593, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：102毫秒', '0', '', '2025-04-04 12:00:00');
INSERT INTO `sys_job_log` VALUES (594, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 12:10:00');
INSERT INTO `sys_job_log` VALUES (595, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 12:20:00');
INSERT INTO `sys_job_log` VALUES (596, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 12:30:00');
INSERT INTO `sys_job_log` VALUES (597, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 12:40:00');
INSERT INTO `sys_job_log` VALUES (598, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 12:50:00');
INSERT INTO `sys_job_log` VALUES (599, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 13:00:00');
INSERT INTO `sys_job_log` VALUES (600, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 13:10:00');
INSERT INTO `sys_job_log` VALUES (601, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 13:20:00');
INSERT INTO `sys_job_log` VALUES (602, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 13:30:00');
INSERT INTO `sys_job_log` VALUES (603, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 13:40:00');
INSERT INTO `sys_job_log` VALUES (604, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 13:50:00');
INSERT INTO `sys_job_log` VALUES (605, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 14:00:00');
INSERT INTO `sys_job_log` VALUES (606, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 14:10:00');
INSERT INTO `sys_job_log` VALUES (607, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 14:20:00');
INSERT INTO `sys_job_log` VALUES (608, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 14:30:00');
INSERT INTO `sys_job_log` VALUES (609, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 14:40:00');
INSERT INTO `sys_job_log` VALUES (610, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 14:50:00');
INSERT INTO `sys_job_log` VALUES (611, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 15:00:00');
INSERT INTO `sys_job_log` VALUES (612, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 15:10:00');
INSERT INTO `sys_job_log` VALUES (613, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 15:20:00');
INSERT INTO `sys_job_log` VALUES (614, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 15:30:00');
INSERT INTO `sys_job_log` VALUES (615, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 15:40:00');
INSERT INTO `sys_job_log` VALUES (616, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 15:50:00');
INSERT INTO `sys_job_log` VALUES (617, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 16:00:00');
INSERT INTO `sys_job_log` VALUES (618, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 16:10:00');
INSERT INTO `sys_job_log` VALUES (619, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 16:20:00');
INSERT INTO `sys_job_log` VALUES (620, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 16:30:00');
INSERT INTO `sys_job_log` VALUES (621, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 16:40:00');
INSERT INTO `sys_job_log` VALUES (622, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 16:50:00');
INSERT INTO `sys_job_log` VALUES (623, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 17:00:00');
INSERT INTO `sys_job_log` VALUES (624, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 17:10:00');
INSERT INTO `sys_job_log` VALUES (625, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 17:20:00');
INSERT INTO `sys_job_log` VALUES (626, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 17:30:00');
INSERT INTO `sys_job_log` VALUES (627, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 17:40:00');
INSERT INTO `sys_job_log` VALUES (628, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 17:50:00');
INSERT INTO `sys_job_log` VALUES (629, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 18:00:00');
INSERT INTO `sys_job_log` VALUES (630, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 18:10:00');
INSERT INTO `sys_job_log` VALUES (631, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 18:20:00');
INSERT INTO `sys_job_log` VALUES (632, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-04 18:30:00');
INSERT INTO `sys_job_log` VALUES (633, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 18:40:00');
INSERT INTO `sys_job_log` VALUES (634, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 18:50:00');
INSERT INTO `sys_job_log` VALUES (635, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 19:00:00');
INSERT INTO `sys_job_log` VALUES (636, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 19:10:00');
INSERT INTO `sys_job_log` VALUES (637, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-04 19:20:00');
INSERT INTO `sys_job_log` VALUES (638, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 19:30:00');
INSERT INTO `sys_job_log` VALUES (639, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 19:40:00');
INSERT INTO `sys_job_log` VALUES (640, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-04 19:50:00');
INSERT INTO `sys_job_log` VALUES (641, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 20:00:00');
INSERT INTO `sys_job_log` VALUES (642, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 20:10:00');
INSERT INTO `sys_job_log` VALUES (643, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 20:20:00');
INSERT INTO `sys_job_log` VALUES (644, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 20:30:00');
INSERT INTO `sys_job_log` VALUES (645, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 20:40:00');
INSERT INTO `sys_job_log` VALUES (646, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 20:50:00');
INSERT INTO `sys_job_log` VALUES (647, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 21:00:00');
INSERT INTO `sys_job_log` VALUES (648, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：14毫秒', '0', '', '2025-04-04 21:10:00');
INSERT INTO `sys_job_log` VALUES (649, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 21:20:00');
INSERT INTO `sys_job_log` VALUES (650, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 21:30:00');
INSERT INTO `sys_job_log` VALUES (651, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 21:40:00');
INSERT INTO `sys_job_log` VALUES (652, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-04 21:50:00');
INSERT INTO `sys_job_log` VALUES (653, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 22:00:00');
INSERT INTO `sys_job_log` VALUES (654, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 22:10:00');
INSERT INTO `sys_job_log` VALUES (655, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 22:20:00');
INSERT INTO `sys_job_log` VALUES (656, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 22:30:00');
INSERT INTO `sys_job_log` VALUES (657, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 22:40:00');
INSERT INTO `sys_job_log` VALUES (658, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 22:50:00');
INSERT INTO `sys_job_log` VALUES (659, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 23:00:00');
INSERT INTO `sys_job_log` VALUES (660, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 23:10:00');
INSERT INTO `sys_job_log` VALUES (661, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 23:20:00');
INSERT INTO `sys_job_log` VALUES (662, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-04 23:30:00');
INSERT INTO `sys_job_log` VALUES (663, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-04 23:40:00');
INSERT INTO `sys_job_log` VALUES (664, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-04 23:50:00');
INSERT INTO `sys_job_log` VALUES (665, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：156毫秒', '0', '', '2025-04-05 00:00:00');
INSERT INTO `sys_job_log` VALUES (666, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 00:10:00');
INSERT INTO `sys_job_log` VALUES (667, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 00:20:00');
INSERT INTO `sys_job_log` VALUES (668, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 00:30:00');
INSERT INTO `sys_job_log` VALUES (669, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 00:40:00');
INSERT INTO `sys_job_log` VALUES (670, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-05 00:50:00');
INSERT INTO `sys_job_log` VALUES (671, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (672, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-05 01:10:00');
INSERT INTO `sys_job_log` VALUES (673, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 01:20:00');
INSERT INTO `sys_job_log` VALUES (674, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：18毫秒', '0', '', '2025-04-05 11:14:56');
INSERT INTO `sys_job_log` VALUES (675, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：31毫秒', '0', '', '2025-04-05 11:14:56');
INSERT INTO `sys_job_log` VALUES (676, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：35毫秒', '0', '', '2025-04-05 11:14:56');
INSERT INTO `sys_job_log` VALUES (677, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：16毫秒', '0', '', '2025-04-05 11:14:57');
INSERT INTO `sys_job_log` VALUES (678, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：99毫秒', '0', '', '2025-04-05 11:14:57');
INSERT INTO `sys_job_log` VALUES (679, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：113毫秒', '0', '', '2025-04-05 11:14:57');
INSERT INTO `sys_job_log` VALUES (680, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：192毫秒', '0', '', '2025-04-05 11:14:57');
INSERT INTO `sys_job_log` VALUES (681, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：184毫秒', '0', '', '2025-04-05 11:15:02');
INSERT INTO `sys_job_log` VALUES (682, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：112毫秒', '0', '', '2025-04-05 11:15:02');
INSERT INTO `sys_job_log` VALUES (683, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：174毫秒', '0', '', '2025-04-05 11:15:02');
INSERT INTO `sys_job_log` VALUES (684, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：174毫秒', '0', '', '2025-04-05 11:15:02');
INSERT INTO `sys_job_log` VALUES (685, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：217毫秒', '0', '', '2025-04-05 11:15:02');
INSERT INTO `sys_job_log` VALUES (686, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：175毫秒', '0', '', '2025-04-05 11:15:02');
INSERT INTO `sys_job_log` VALUES (687, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5419毫秒', '0', '', '2025-04-05 11:15:02');
INSERT INTO `sys_job_log` VALUES (688, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4771毫秒', '0', '', '2025-04-05 11:15:02');
INSERT INTO `sys_job_log` VALUES (689, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5251毫秒', '0', '', '2025-04-05 11:15:02');
INSERT INTO `sys_job_log` VALUES (690, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4757毫秒', '0', '', '2025-04-05 11:15:02');
INSERT INTO `sys_job_log` VALUES (691, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：67毫秒', '0', '', '2025-04-05 11:15:02');
INSERT INTO `sys_job_log` VALUES (692, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：17毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (693, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：16毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (694, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：16毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (695, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：27毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (696, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：15毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (697, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：19毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (698, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (699, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (700, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (701, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：17毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (702, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (703, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (704, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (705, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：89毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (706, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：91毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (707, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：90毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (708, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：92毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (709, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：91毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (710, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：100毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (711, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：99毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (712, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：106毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (713, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：102毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (714, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：97毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (715, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (716, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：50毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (717, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：51毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (718, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：54毫秒', '0', '', '2025-04-05 11:15:03');
INSERT INTO `sys_job_log` VALUES (719, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：57毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (720, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：48毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (721, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：49毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (722, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (723, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (724, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：48毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (725, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (726, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：24毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (727, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (728, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (729, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：37毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (730, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：61毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (731, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5987毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (732, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-05 11:15:09');
INSERT INTO `sys_job_log` VALUES (733, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-05 11:20:00');
INSERT INTO `sys_job_log` VALUES (734, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-05 11:30:00');
INSERT INTO `sys_job_log` VALUES (735, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-05 11:40:00');
INSERT INTO `sys_job_log` VALUES (736, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-05 11:50:00');
INSERT INTO `sys_job_log` VALUES (737, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-05 12:00:00');
INSERT INTO `sys_job_log` VALUES (738, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-05 12:10:00');
INSERT INTO `sys_job_log` VALUES (739, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-05 12:20:00');
INSERT INTO `sys_job_log` VALUES (740, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 12:30:00');
INSERT INTO `sys_job_log` VALUES (741, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-05 12:40:00');
INSERT INTO `sys_job_log` VALUES (742, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-05 12:50:00');
INSERT INTO `sys_job_log` VALUES (743, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-05 13:00:00');
INSERT INTO `sys_job_log` VALUES (744, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-05 13:10:00');
INSERT INTO `sys_job_log` VALUES (745, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-05 13:20:00');
INSERT INTO `sys_job_log` VALUES (746, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 13:30:00');
INSERT INTO `sys_job_log` VALUES (747, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 13:40:00');
INSERT INTO `sys_job_log` VALUES (748, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 13:50:00');
INSERT INTO `sys_job_log` VALUES (749, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：22毫秒', '0', '', '2025-04-05 14:00:00');
INSERT INTO `sys_job_log` VALUES (750, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 14:10:00');
INSERT INTO `sys_job_log` VALUES (751, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 14:20:00');
INSERT INTO `sys_job_log` VALUES (752, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-05 14:30:00');
INSERT INTO `sys_job_log` VALUES (753, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-05 14:40:00');
INSERT INTO `sys_job_log` VALUES (754, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-05 14:50:00');
INSERT INTO `sys_job_log` VALUES (755, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-05 15:00:00');
INSERT INTO `sys_job_log` VALUES (756, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-05 15:10:00');
INSERT INTO `sys_job_log` VALUES (757, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-05 15:20:00');
INSERT INTO `sys_job_log` VALUES (758, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-05 15:30:00');
INSERT INTO `sys_job_log` VALUES (759, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-05 15:40:00');
INSERT INTO `sys_job_log` VALUES (760, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-05 15:50:00');
INSERT INTO `sys_job_log` VALUES (761, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-05 16:00:00');
INSERT INTO `sys_job_log` VALUES (762, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：36毫秒', '0', '', '2025-04-06 21:00:00');
INSERT INTO `sys_job_log` VALUES (763, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-06 21:10:00');
INSERT INTO `sys_job_log` VALUES (764, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-06 21:20:00');
INSERT INTO `sys_job_log` VALUES (765, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-06 21:30:00');
INSERT INTO `sys_job_log` VALUES (766, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-06 21:40:00');
INSERT INTO `sys_job_log` VALUES (767, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-06 21:50:00');
INSERT INTO `sys_job_log` VALUES (768, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-06 22:00:00');
INSERT INTO `sys_job_log` VALUES (769, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-06 22:10:00');
INSERT INTO `sys_job_log` VALUES (770, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-06 22:20:00');
INSERT INTO `sys_job_log` VALUES (771, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-06 22:30:00');
INSERT INTO `sys_job_log` VALUES (772, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-06 22:40:00');
INSERT INTO `sys_job_log` VALUES (773, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-06 22:50:00');
INSERT INTO `sys_job_log` VALUES (774, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：19毫秒', '0', '', '2025-04-06 23:00:00');
INSERT INTO `sys_job_log` VALUES (775, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-06 23:10:00');
INSERT INTO `sys_job_log` VALUES (776, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-06 23:20:00');
INSERT INTO `sys_job_log` VALUES (777, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-06 23:30:00');
INSERT INTO `sys_job_log` VALUES (778, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：65毫秒', '0', '', '2025-04-07 09:20:00');
INSERT INTO `sys_job_log` VALUES (779, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-07 09:30:00');
INSERT INTO `sys_job_log` VALUES (780, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 09:40:00');
INSERT INTO `sys_job_log` VALUES (781, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-07 09:50:00');
INSERT INTO `sys_job_log` VALUES (782, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 10:00:00');
INSERT INTO `sys_job_log` VALUES (783, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-07 10:10:00');
INSERT INTO `sys_job_log` VALUES (784, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：112毫秒', '0', '', '2025-04-07 10:20:00');
INSERT INTO `sys_job_log` VALUES (785, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 10:30:00');
INSERT INTO `sys_job_log` VALUES (786, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 10:40:00');
INSERT INTO `sys_job_log` VALUES (787, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-07 10:50:00');
INSERT INTO `sys_job_log` VALUES (788, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-07 11:00:00');
INSERT INTO `sys_job_log` VALUES (789, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：17毫秒', '0', '', '2025-04-07 11:10:00');
INSERT INTO `sys_job_log` VALUES (790, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-07 11:20:00');
INSERT INTO `sys_job_log` VALUES (791, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 11:30:00');
INSERT INTO `sys_job_log` VALUES (792, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：15毫秒', '0', '', '2025-04-07 11:40:00');
INSERT INTO `sys_job_log` VALUES (793, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-07 11:50:00');
INSERT INTO `sys_job_log` VALUES (794, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 12:00:00');
INSERT INTO `sys_job_log` VALUES (795, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 12:10:00');
INSERT INTO `sys_job_log` VALUES (796, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：29毫秒', '0', '', '2025-04-07 12:20:00');
INSERT INTO `sys_job_log` VALUES (797, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 12:30:00');
INSERT INTO `sys_job_log` VALUES (798, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-07 12:40:00');
INSERT INTO `sys_job_log` VALUES (799, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 12:50:00');
INSERT INTO `sys_job_log` VALUES (800, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 13:00:00');
INSERT INTO `sys_job_log` VALUES (801, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 13:10:00');
INSERT INTO `sys_job_log` VALUES (802, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-07 13:20:00');
INSERT INTO `sys_job_log` VALUES (803, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-07 13:30:00');
INSERT INTO `sys_job_log` VALUES (804, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-07 13:40:00');
INSERT INTO `sys_job_log` VALUES (805, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：59毫秒', '0', '', '2025-04-07 13:50:00');
INSERT INTO `sys_job_log` VALUES (806, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-07 14:00:00');
INSERT INTO `sys_job_log` VALUES (807, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-07 14:10:00');
INSERT INTO `sys_job_log` VALUES (808, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：126毫秒', '0', '', '2025-04-07 14:20:00');
INSERT INTO `sys_job_log` VALUES (809, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-07 14:30:00');
INSERT INTO `sys_job_log` VALUES (810, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 14:40:00');
INSERT INTO `sys_job_log` VALUES (811, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-07 14:50:00');
INSERT INTO `sys_job_log` VALUES (812, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 15:00:00');
INSERT INTO `sys_job_log` VALUES (813, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 15:10:00');
INSERT INTO `sys_job_log` VALUES (814, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-07 15:20:00');
INSERT INTO `sys_job_log` VALUES (815, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-07 15:30:00');
INSERT INTO `sys_job_log` VALUES (816, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 15:40:00');
INSERT INTO `sys_job_log` VALUES (817, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-07 15:50:00');
INSERT INTO `sys_job_log` VALUES (818, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 16:00:00');
INSERT INTO `sys_job_log` VALUES (819, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-07 16:10:00');
INSERT INTO `sys_job_log` VALUES (820, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：19毫秒', '0', '', '2025-04-07 16:20:00');
INSERT INTO `sys_job_log` VALUES (821, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 16:30:00');
INSERT INTO `sys_job_log` VALUES (822, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 16:40:00');
INSERT INTO `sys_job_log` VALUES (823, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 16:50:00');
INSERT INTO `sys_job_log` VALUES (824, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 17:00:00');
INSERT INTO `sys_job_log` VALUES (825, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 17:10:00');
INSERT INTO `sys_job_log` VALUES (826, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-07 17:20:00');
INSERT INTO `sys_job_log` VALUES (827, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 17:30:00');
INSERT INTO `sys_job_log` VALUES (828, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-07 17:40:00');
INSERT INTO `sys_job_log` VALUES (829, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-07 17:50:00');
INSERT INTO `sys_job_log` VALUES (830, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-07 18:00:00');
INSERT INTO `sys_job_log` VALUES (831, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-07 18:10:00');
INSERT INTO `sys_job_log` VALUES (832, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：26毫秒', '0', '', '2025-04-07 18:20:00');
INSERT INTO `sys_job_log` VALUES (833, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 18:30:00');
INSERT INTO `sys_job_log` VALUES (834, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 18:40:00');
INSERT INTO `sys_job_log` VALUES (835, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-07 18:50:00');
INSERT INTO `sys_job_log` VALUES (836, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 19:00:00');
INSERT INTO `sys_job_log` VALUES (837, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 19:10:00');
INSERT INTO `sys_job_log` VALUES (838, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 19:20:00');
INSERT INTO `sys_job_log` VALUES (839, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-07 19:30:00');
INSERT INTO `sys_job_log` VALUES (840, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 19:40:00');
INSERT INTO `sys_job_log` VALUES (841, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 19:50:00');
INSERT INTO `sys_job_log` VALUES (842, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 20:00:00');
INSERT INTO `sys_job_log` VALUES (843, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 20:10:00');
INSERT INTO `sys_job_log` VALUES (844, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：33毫秒', '0', '', '2025-04-07 20:20:00');
INSERT INTO `sys_job_log` VALUES (845, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-07 20:30:00');
INSERT INTO `sys_job_log` VALUES (846, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-07 20:40:00');
INSERT INTO `sys_job_log` VALUES (847, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 20:50:00');
INSERT INTO `sys_job_log` VALUES (848, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：219毫秒', '0', '', '2025-04-07 22:20:00');
INSERT INTO `sys_job_log` VALUES (849, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-07 22:30:00');
INSERT INTO `sys_job_log` VALUES (850, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-07 22:40:00');
INSERT INTO `sys_job_log` VALUES (851, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-07 22:50:00');
INSERT INTO `sys_job_log` VALUES (852, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-07 23:00:00');
INSERT INTO `sys_job_log` VALUES (853, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-07 23:10:00');
INSERT INTO `sys_job_log` VALUES (854, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-07 23:20:00');
INSERT INTO `sys_job_log` VALUES (855, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-07 23:30:00');
INSERT INTO `sys_job_log` VALUES (856, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-07 23:40:00');
INSERT INTO `sys_job_log` VALUES (857, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-07 23:50:00');
INSERT INTO `sys_job_log` VALUES (858, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：70毫秒', '0', '', '2025-04-08 20:50:00');
INSERT INTO `sys_job_log` VALUES (859, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-08 21:00:00');
INSERT INTO `sys_job_log` VALUES (860, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-08 21:10:00');
INSERT INTO `sys_job_log` VALUES (861, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-08 21:20:00');
INSERT INTO `sys_job_log` VALUES (862, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-08 21:30:00');
INSERT INTO `sys_job_log` VALUES (863, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-08 21:40:00');
INSERT INTO `sys_job_log` VALUES (864, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-08 21:50:00');
INSERT INTO `sys_job_log` VALUES (865, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-08 22:00:00');
INSERT INTO `sys_job_log` VALUES (866, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-08 22:10:00');
INSERT INTO `sys_job_log` VALUES (867, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-08 22:20:00');
INSERT INTO `sys_job_log` VALUES (868, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-08 22:30:00');
INSERT INTO `sys_job_log` VALUES (869, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-08 22:40:00');
INSERT INTO `sys_job_log` VALUES (870, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-08 22:50:00');
INSERT INTO `sys_job_log` VALUES (871, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-08 23:00:00');
INSERT INTO `sys_job_log` VALUES (872, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-08 23:10:00');
INSERT INTO `sys_job_log` VALUES (873, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：47毫秒', '0', '', '2025-04-08 23:20:00');
INSERT INTO `sys_job_log` VALUES (874, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：17毫秒', '0', '', '2025-04-09 22:30:00');
INSERT INTO `sys_job_log` VALUES (875, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-09 22:40:00');
INSERT INTO `sys_job_log` VALUES (876, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：56毫秒', '0', '', '2025-04-09 22:50:00');
INSERT INTO `sys_job_log` VALUES (877, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-09 23:00:00');
INSERT INTO `sys_job_log` VALUES (878, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-09 23:10:00');
INSERT INTO `sys_job_log` VALUES (879, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-09 23:20:00');
INSERT INTO `sys_job_log` VALUES (880, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-09 23:30:00');
INSERT INTO `sys_job_log` VALUES (881, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-09 23:40:00');
INSERT INTO `sys_job_log` VALUES (882, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-09 23:50:00');
INSERT INTO `sys_job_log` VALUES (883, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：22毫秒', '0', '', '2025-04-10 00:00:00');
INSERT INTO `sys_job_log` VALUES (884, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：21毫秒', '0', '', '2025-04-11 10:30:00');
INSERT INTO `sys_job_log` VALUES (885, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 10:40:00');
INSERT INTO `sys_job_log` VALUES (886, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：42毫秒', '0', '', '2025-04-11 10:50:00');
INSERT INTO `sys_job_log` VALUES (887, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-11 11:00:00');
INSERT INTO `sys_job_log` VALUES (888, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-11 11:10:00');
INSERT INTO `sys_job_log` VALUES (889, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-11 11:20:00');
INSERT INTO `sys_job_log` VALUES (890, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 11:30:00');
INSERT INTO `sys_job_log` VALUES (891, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 11:40:00');
INSERT INTO `sys_job_log` VALUES (892, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 11:50:00');
INSERT INTO `sys_job_log` VALUES (893, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 12:00:00');
INSERT INTO `sys_job_log` VALUES (894, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 12:10:00');
INSERT INTO `sys_job_log` VALUES (895, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 12:20:00');
INSERT INTO `sys_job_log` VALUES (896, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-11 12:30:00');
INSERT INTO `sys_job_log` VALUES (897, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-11 12:40:00');
INSERT INTO `sys_job_log` VALUES (898, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 12:50:00');
INSERT INTO `sys_job_log` VALUES (899, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 13:00:00');
INSERT INTO `sys_job_log` VALUES (900, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 13:10:00');
INSERT INTO `sys_job_log` VALUES (901, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 13:20:00');
INSERT INTO `sys_job_log` VALUES (902, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-11 13:30:00');
INSERT INTO `sys_job_log` VALUES (903, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 13:40:00');
INSERT INTO `sys_job_log` VALUES (904, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-11 13:50:00');
INSERT INTO `sys_job_log` VALUES (905, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 14:00:00');
INSERT INTO `sys_job_log` VALUES (906, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 14:10:00');
INSERT INTO `sys_job_log` VALUES (907, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 14:20:00');
INSERT INTO `sys_job_log` VALUES (908, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-04-11 14:30:00');
INSERT INTO `sys_job_log` VALUES (909, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-11 14:40:00');
INSERT INTO `sys_job_log` VALUES (910, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 14:50:00');
INSERT INTO `sys_job_log` VALUES (911, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 15:00:00');
INSERT INTO `sys_job_log` VALUES (912, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 15:10:00');
INSERT INTO `sys_job_log` VALUES (913, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 15:20:00');
INSERT INTO `sys_job_log` VALUES (914, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 15:30:00');
INSERT INTO `sys_job_log` VALUES (915, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-11 15:40:00');
INSERT INTO `sys_job_log` VALUES (916, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 15:50:00');
INSERT INTO `sys_job_log` VALUES (917, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 16:00:00');
INSERT INTO `sys_job_log` VALUES (918, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 16:10:00');
INSERT INTO `sys_job_log` VALUES (919, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-11 16:20:00');
INSERT INTO `sys_job_log` VALUES (920, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 16:30:00');
INSERT INTO `sys_job_log` VALUES (921, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-11 16:40:00');
INSERT INTO `sys_job_log` VALUES (922, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 16:50:00');
INSERT INTO `sys_job_log` VALUES (923, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 17:00:00');
INSERT INTO `sys_job_log` VALUES (924, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 17:10:00');
INSERT INTO `sys_job_log` VALUES (925, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 17:20:00');
INSERT INTO `sys_job_log` VALUES (926, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-11 17:30:00');
INSERT INTO `sys_job_log` VALUES (927, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 17:40:00');
INSERT INTO `sys_job_log` VALUES (928, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 17:50:00');
INSERT INTO `sys_job_log` VALUES (929, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-11 18:00:00');
INSERT INTO `sys_job_log` VALUES (930, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 18:10:00');
INSERT INTO `sys_job_log` VALUES (931, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-11 18:20:00');
INSERT INTO `sys_job_log` VALUES (932, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：23毫秒', '0', '', '2025-04-12 23:10:00');
INSERT INTO `sys_job_log` VALUES (933, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-12 23:20:00');
INSERT INTO `sys_job_log` VALUES (934, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-12 23:30:00');
INSERT INTO `sys_job_log` VALUES (935, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：29毫秒', '0', '', '2025-04-13 13:30:00');
INSERT INTO `sys_job_log` VALUES (936, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-13 13:40:00');
INSERT INTO `sys_job_log` VALUES (937, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：63毫秒', '0', '', '2025-04-13 13:50:00');
INSERT INTO `sys_job_log` VALUES (938, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：60毫秒', '0', '', '2025-04-13 14:00:24');
INSERT INTO `sys_job_log` VALUES (939, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：28毫秒', '0', '', '2025-04-13 18:00:03');
INSERT INTO `sys_job_log` VALUES (940, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-13 18:10:00');
INSERT INTO `sys_job_log` VALUES (941, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-13 18:20:00');
INSERT INTO `sys_job_log` VALUES (942, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-13 18:30:00');
INSERT INTO `sys_job_log` VALUES (943, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-13 18:40:00');
INSERT INTO `sys_job_log` VALUES (944, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-13 18:50:00');
INSERT INTO `sys_job_log` VALUES (945, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-13 19:00:00');
INSERT INTO `sys_job_log` VALUES (946, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-13 19:10:00');
INSERT INTO `sys_job_log` VALUES (947, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-13 19:20:00');
INSERT INTO `sys_job_log` VALUES (948, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-13 19:30:00');
INSERT INTO `sys_job_log` VALUES (949, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：78毫秒', '0', '', '2025-04-14 23:00:00');
INSERT INTO `sys_job_log` VALUES (950, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-14 23:10:00');
INSERT INTO `sys_job_log` VALUES (951, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-14 23:20:00');
INSERT INTO `sys_job_log` VALUES (952, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-14 23:30:00');
INSERT INTO `sys_job_log` VALUES (953, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：22毫秒', '0', '', '2025-04-14 23:40:00');
INSERT INTO `sys_job_log` VALUES (954, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-14 23:50:00');
INSERT INTO `sys_job_log` VALUES (955, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：36毫秒', '0', '', '2025-04-15 00:00:00');
INSERT INTO `sys_job_log` VALUES (956, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：45毫秒', '0', '', '2025-04-15 00:10:00');
INSERT INTO `sys_job_log` VALUES (957, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：19毫秒', '0', '', '2025-04-15 00:20:00');
INSERT INTO `sys_job_log` VALUES (958, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：36毫秒', '0', '', '2025-04-15 00:30:00');
INSERT INTO `sys_job_log` VALUES (959, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：65毫秒', '0', '', '2025-04-15 22:20:00');
INSERT INTO `sys_job_log` VALUES (960, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-15 22:30:00');
INSERT INTO `sys_job_log` VALUES (961, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：28毫秒', '0', '', '2025-04-15 22:40:00');
INSERT INTO `sys_job_log` VALUES (962, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-15 22:50:00');
INSERT INTO `sys_job_log` VALUES (963, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-15 23:00:00');
INSERT INTO `sys_job_log` VALUES (964, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：67毫秒', '0', '', '2025-04-15 23:10:00');
INSERT INTO `sys_job_log` VALUES (965, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-15 23:20:00');
INSERT INTO `sys_job_log` VALUES (966, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：63毫秒', '0', '', '2025-04-17 15:00:00');
INSERT INTO `sys_job_log` VALUES (967, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-17 15:10:00');
INSERT INTO `sys_job_log` VALUES (968, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-17 15:20:00');
INSERT INTO `sys_job_log` VALUES (969, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-17 15:30:00');
INSERT INTO `sys_job_log` VALUES (970, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 15:40:00');
INSERT INTO `sys_job_log` VALUES (971, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-17 15:50:00');
INSERT INTO `sys_job_log` VALUES (972, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-17 16:00:00');
INSERT INTO `sys_job_log` VALUES (973, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-17 16:10:00');
INSERT INTO `sys_job_log` VALUES (974, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 16:20:00');
INSERT INTO `sys_job_log` VALUES (975, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 16:30:00');
INSERT INTO `sys_job_log` VALUES (976, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 16:40:00');
INSERT INTO `sys_job_log` VALUES (977, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 16:50:00');
INSERT INTO `sys_job_log` VALUES (978, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：15毫秒', '0', '', '2025-04-17 17:00:00');
INSERT INTO `sys_job_log` VALUES (979, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-17 17:10:00');
INSERT INTO `sys_job_log` VALUES (980, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-17 17:20:00');
INSERT INTO `sys_job_log` VALUES (981, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 17:30:00');
INSERT INTO `sys_job_log` VALUES (982, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 17:40:00');
INSERT INTO `sys_job_log` VALUES (983, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-17 17:50:00');
INSERT INTO `sys_job_log` VALUES (984, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-17 18:00:00');
INSERT INTO `sys_job_log` VALUES (985, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 18:10:00');
INSERT INTO `sys_job_log` VALUES (986, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-17 18:20:00');
INSERT INTO `sys_job_log` VALUES (987, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 18:30:00');
INSERT INTO `sys_job_log` VALUES (988, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-17 18:40:00');
INSERT INTO `sys_job_log` VALUES (989, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-17 18:50:00');
INSERT INTO `sys_job_log` VALUES (990, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-17 19:00:00');
INSERT INTO `sys_job_log` VALUES (991, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 19:10:00');
INSERT INTO `sys_job_log` VALUES (992, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 19:20:00');
INSERT INTO `sys_job_log` VALUES (993, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：63毫秒', '0', '', '2025-04-17 20:10:00');
INSERT INTO `sys_job_log` VALUES (994, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：18毫秒', '0', '', '2025-04-17 20:20:00');
INSERT INTO `sys_job_log` VALUES (995, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：72毫秒', '0', '', '2025-04-17 20:30:00');
INSERT INTO `sys_job_log` VALUES (996, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：30毫秒', '0', '', '2025-04-17 20:40:00');
INSERT INTO `sys_job_log` VALUES (997, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-17 20:50:00');
INSERT INTO `sys_job_log` VALUES (998, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 21:00:00');
INSERT INTO `sys_job_log` VALUES (999, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-17 21:10:00');
INSERT INTO `sys_job_log` VALUES (1000, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-17 21:20:00');
INSERT INTO `sys_job_log` VALUES (1001, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-17 21:30:00');
INSERT INTO `sys_job_log` VALUES (1002, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-17 21:40:00');
INSERT INTO `sys_job_log` VALUES (1003, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 21:50:00');
INSERT INTO `sys_job_log` VALUES (1004, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-17 22:00:00');
INSERT INTO `sys_job_log` VALUES (1005, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 22:10:00');
INSERT INTO `sys_job_log` VALUES (1006, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-17 22:20:00');
INSERT INTO `sys_job_log` VALUES (1007, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：93毫秒', '0', '', '2025-04-19 16:50:00');
INSERT INTO `sys_job_log` VALUES (1008, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (1009, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：103毫秒', '0', '', '2025-04-22 09:50:00');
INSERT INTO `sys_job_log` VALUES (1010, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-22 10:00:00');
INSERT INTO `sys_job_log` VALUES (1011, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：58毫秒', '0', '', '2025-04-22 10:10:00');
INSERT INTO `sys_job_log` VALUES (1012, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-22 10:20:00');
INSERT INTO `sys_job_log` VALUES (1013, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 10:30:00');
INSERT INTO `sys_job_log` VALUES (1014, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-22 10:40:00');
INSERT INTO `sys_job_log` VALUES (1015, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：10毫秒', '0', '', '2025-04-22 10:50:00');
INSERT INTO `sys_job_log` VALUES (1016, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 11:00:00');
INSERT INTO `sys_job_log` VALUES (1017, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-22 11:10:00');
INSERT INTO `sys_job_log` VALUES (1018, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-22 11:20:00');
INSERT INTO `sys_job_log` VALUES (1019, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-22 11:30:00');
INSERT INTO `sys_job_log` VALUES (1020, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 11:40:00');
INSERT INTO `sys_job_log` VALUES (1021, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 11:50:00');
INSERT INTO `sys_job_log` VALUES (1022, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 12:00:00');
INSERT INTO `sys_job_log` VALUES (1023, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-22 12:10:00');
INSERT INTO `sys_job_log` VALUES (1024, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-22 12:20:00');
INSERT INTO `sys_job_log` VALUES (1025, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 12:30:00');
INSERT INTO `sys_job_log` VALUES (1026, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 12:40:00');
INSERT INTO `sys_job_log` VALUES (1027, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 12:50:00');
INSERT INTO `sys_job_log` VALUES (1028, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-22 13:00:00');
INSERT INTO `sys_job_log` VALUES (1029, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 13:10:00');
INSERT INTO `sys_job_log` VALUES (1030, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 13:20:00');
INSERT INTO `sys_job_log` VALUES (1031, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 13:30:00');
INSERT INTO `sys_job_log` VALUES (1032, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 13:40:00');
INSERT INTO `sys_job_log` VALUES (1033, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-22 13:50:00');
INSERT INTO `sys_job_log` VALUES (1034, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 14:00:00');
INSERT INTO `sys_job_log` VALUES (1035, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 14:10:00');
INSERT INTO `sys_job_log` VALUES (1036, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 14:20:00');
INSERT INTO `sys_job_log` VALUES (1037, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 14:30:00');
INSERT INTO `sys_job_log` VALUES (1038, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 14:40:00');
INSERT INTO `sys_job_log` VALUES (1039, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 14:50:00');
INSERT INTO `sys_job_log` VALUES (1040, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 15:00:00');
INSERT INTO `sys_job_log` VALUES (1041, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-22 15:10:00');
INSERT INTO `sys_job_log` VALUES (1042, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 15:20:00');
INSERT INTO `sys_job_log` VALUES (1043, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 15:30:00');
INSERT INTO `sys_job_log` VALUES (1044, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 15:40:00');
INSERT INTO `sys_job_log` VALUES (1045, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 15:50:00');
INSERT INTO `sys_job_log` VALUES (1046, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 16:00:00');
INSERT INTO `sys_job_log` VALUES (1047, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 16:10:00');
INSERT INTO `sys_job_log` VALUES (1048, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-22 16:20:00');
INSERT INTO `sys_job_log` VALUES (1049, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 16:30:00');
INSERT INTO `sys_job_log` VALUES (1050, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-22 16:40:00');
INSERT INTO `sys_job_log` VALUES (1051, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-22 16:50:00');
INSERT INTO `sys_job_log` VALUES (1052, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 17:00:00');
INSERT INTO `sys_job_log` VALUES (1053, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 17:10:00');
INSERT INTO `sys_job_log` VALUES (1054, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-22 17:20:00');
INSERT INTO `sys_job_log` VALUES (1055, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 17:30:00');
INSERT INTO `sys_job_log` VALUES (1056, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 17:40:00');
INSERT INTO `sys_job_log` VALUES (1057, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 17:50:00');
INSERT INTO `sys_job_log` VALUES (1058, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 18:00:00');
INSERT INTO `sys_job_log` VALUES (1059, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 18:10:00');
INSERT INTO `sys_job_log` VALUES (1060, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 18:20:00');
INSERT INTO `sys_job_log` VALUES (1061, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 18:30:00');
INSERT INTO `sys_job_log` VALUES (1062, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 18:40:00');
INSERT INTO `sys_job_log` VALUES (1063, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 18:50:00');
INSERT INTO `sys_job_log` VALUES (1064, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 19:00:00');
INSERT INTO `sys_job_log` VALUES (1065, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 19:10:00');
INSERT INTO `sys_job_log` VALUES (1066, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 19:20:00');
INSERT INTO `sys_job_log` VALUES (1067, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 19:30:00');
INSERT INTO `sys_job_log` VALUES (1068, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 19:40:00');
INSERT INTO `sys_job_log` VALUES (1069, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 19:50:00');
INSERT INTO `sys_job_log` VALUES (1070, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-22 20:00:00');
INSERT INTO `sys_job_log` VALUES (1071, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：21毫秒', '0', '', '2025-04-22 23:20:00');
INSERT INTO `sys_job_log` VALUES (1072, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-22 23:30:00');
INSERT INTO `sys_job_log` VALUES (1073, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：40毫秒', '0', '', '2025-04-22 23:40:00');
INSERT INTO `sys_job_log` VALUES (1074, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-22 23:50:00');
INSERT INTO `sys_job_log` VALUES (1075, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：16毫秒', '0', '', '2025-04-23 00:00:00');
INSERT INTO `sys_job_log` VALUES (1076, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-23 00:10:00');
INSERT INTO `sys_job_log` VALUES (1077, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：77毫秒', '0', '', '2025-04-23 12:00:00');
INSERT INTO `sys_job_log` VALUES (1078, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-23 12:10:00');
INSERT INTO `sys_job_log` VALUES (1079, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-23 12:20:00');
INSERT INTO `sys_job_log` VALUES (1080, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-23 12:30:00');
INSERT INTO `sys_job_log` VALUES (1081, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-23 12:40:00');
INSERT INTO `sys_job_log` VALUES (1082, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-23 12:50:00');
INSERT INTO `sys_job_log` VALUES (1083, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：12毫秒', '0', '', '2025-04-23 13:00:00');
INSERT INTO `sys_job_log` VALUES (1084, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-23 13:10:00');
INSERT INTO `sys_job_log` VALUES (1085, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-23 13:20:00');
INSERT INTO `sys_job_log` VALUES (1086, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-23 13:30:00');
INSERT INTO `sys_job_log` VALUES (1087, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 13:40:00');
INSERT INTO `sys_job_log` VALUES (1088, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 13:50:00');
INSERT INTO `sys_job_log` VALUES (1089, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-23 14:00:00');
INSERT INTO `sys_job_log` VALUES (1090, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 14:10:00');
INSERT INTO `sys_job_log` VALUES (1091, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-23 14:20:00');
INSERT INTO `sys_job_log` VALUES (1092, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-23 14:30:00');
INSERT INTO `sys_job_log` VALUES (1093, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-23 14:40:00');
INSERT INTO `sys_job_log` VALUES (1094, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 14:50:00');
INSERT INTO `sys_job_log` VALUES (1095, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-23 15:00:00');
INSERT INTO `sys_job_log` VALUES (1096, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-23 15:10:00');
INSERT INTO `sys_job_log` VALUES (1097, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-23 15:20:00');
INSERT INTO `sys_job_log` VALUES (1098, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-23 15:30:00');
INSERT INTO `sys_job_log` VALUES (1099, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 15:40:00');
INSERT INTO `sys_job_log` VALUES (1100, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 15:50:00');
INSERT INTO `sys_job_log` VALUES (1101, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 16:00:00');
INSERT INTO `sys_job_log` VALUES (1102, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 16:10:00');
INSERT INTO `sys_job_log` VALUES (1103, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 16:20:00');
INSERT INTO `sys_job_log` VALUES (1104, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 16:30:00');
INSERT INTO `sys_job_log` VALUES (1105, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-23 16:40:00');
INSERT INTO `sys_job_log` VALUES (1106, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-23 16:50:00');
INSERT INTO `sys_job_log` VALUES (1107, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-23 17:00:00');
INSERT INTO `sys_job_log` VALUES (1108, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 17:10:00');
INSERT INTO `sys_job_log` VALUES (1109, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 17:20:00');
INSERT INTO `sys_job_log` VALUES (1110, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 17:30:00');
INSERT INTO `sys_job_log` VALUES (1111, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-23 17:40:00');
INSERT INTO `sys_job_log` VALUES (1112, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 17:50:00');
INSERT INTO `sys_job_log` VALUES (1113, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 18:00:00');
INSERT INTO `sys_job_log` VALUES (1114, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 18:10:00');
INSERT INTO `sys_job_log` VALUES (1115, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 18:20:00');
INSERT INTO `sys_job_log` VALUES (1116, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-23 18:30:00');
INSERT INTO `sys_job_log` VALUES (1117, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-23 18:40:00');
INSERT INTO `sys_job_log` VALUES (1118, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-23 18:50:00');
INSERT INTO `sys_job_log` VALUES (1119, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 19:00:00');
INSERT INTO `sys_job_log` VALUES (1120, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 19:10:00');
INSERT INTO `sys_job_log` VALUES (1121, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-23 19:20:00');
INSERT INTO `sys_job_log` VALUES (1122, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-23 19:30:00');
INSERT INTO `sys_job_log` VALUES (1123, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-23 19:40:00');
INSERT INTO `sys_job_log` VALUES (1124, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-04-23 19:50:00');
INSERT INTO `sys_job_log` VALUES (1125, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-23 20:00:00');
INSERT INTO `sys_job_log` VALUES (1126, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 20:10:00');
INSERT INTO `sys_job_log` VALUES (1127, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-23 20:20:00');
INSERT INTO `sys_job_log` VALUES (1128, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：18毫秒', '0', '', '2025-04-23 23:40:00');
INSERT INTO `sys_job_log` VALUES (1129, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-23 23:50:00');
INSERT INTO `sys_job_log` VALUES (1130, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-24 00:00:00');
INSERT INTO `sys_job_log` VALUES (1131, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：20毫秒', '0', '', '2025-04-24 09:20:00');
INSERT INTO `sys_job_log` VALUES (1132, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：9毫秒', '0', '', '2025-04-24 09:30:00');
INSERT INTO `sys_job_log` VALUES (1133, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-24 09:40:00');
INSERT INTO `sys_job_log` VALUES (1134, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-24 09:50:00');
INSERT INTO `sys_job_log` VALUES (1135, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-24 10:00:00');
INSERT INTO `sys_job_log` VALUES (1136, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-24 10:10:00');
INSERT INTO `sys_job_log` VALUES (1137, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-24 10:20:00');
INSERT INTO `sys_job_log` VALUES (1138, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-04-24 10:30:00');
INSERT INTO `sys_job_log` VALUES (1139, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-24 10:40:00');
INSERT INTO `sys_job_log` VALUES (1140, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-24 10:50:00');
INSERT INTO `sys_job_log` VALUES (1141, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-24 11:00:00');
INSERT INTO `sys_job_log` VALUES (1142, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-24 11:10:00');
INSERT INTO `sys_job_log` VALUES (1143, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-24 11:20:00');
INSERT INTO `sys_job_log` VALUES (1144, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-04-24 11:30:00');
INSERT INTO `sys_job_log` VALUES (1145, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-24 11:40:00');
INSERT INTO `sys_job_log` VALUES (1146, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-24 11:50:00');
INSERT INTO `sys_job_log` VALUES (1147, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-24 12:00:00');
INSERT INTO `sys_job_log` VALUES (1148, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-24 12:10:00');
INSERT INTO `sys_job_log` VALUES (1149, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-24 12:20:00');
INSERT INTO `sys_job_log` VALUES (1150, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-24 12:30:00');
INSERT INTO `sys_job_log` VALUES (1151, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-24 12:40:00');
INSERT INTO `sys_job_log` VALUES (1152, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-24 12:50:00');
INSERT INTO `sys_job_log` VALUES (1153, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：50毫秒', '0', '', '2025-04-25 22:40:00');
INSERT INTO `sys_job_log` VALUES (1154, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：21毫秒', '0', '', '2025-04-29 11:20:00');
INSERT INTO `sys_job_log` VALUES (1155, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-29 11:30:00');
INSERT INTO `sys_job_log` VALUES (1156, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-29 11:40:00');
INSERT INTO `sys_job_log` VALUES (1157, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-04-29 11:50:00');
INSERT INTO `sys_job_log` VALUES (1158, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-29 12:00:00');
INSERT INTO `sys_job_log` VALUES (1159, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-04-29 12:10:00');
INSERT INTO `sys_job_log` VALUES (1160, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-29 12:20:00');
INSERT INTO `sys_job_log` VALUES (1161, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-29 12:30:00');
INSERT INTO `sys_job_log` VALUES (1162, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-04-29 12:40:00');
INSERT INTO `sys_job_log` VALUES (1163, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：67毫秒', '0', '', '2025-05-06 10:20:00');
INSERT INTO `sys_job_log` VALUES (1164, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 10:30:00');
INSERT INTO `sys_job_log` VALUES (1165, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：45毫秒', '0', '', '2025-05-06 10:50:00');
INSERT INTO `sys_job_log` VALUES (1166, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 11:00:00');
INSERT INTO `sys_job_log` VALUES (1167, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-05-06 11:10:00');
INSERT INTO `sys_job_log` VALUES (1168, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：30毫秒', '0', '', '2025-05-06 11:20:00');
INSERT INTO `sys_job_log` VALUES (1169, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：33毫秒', '0', '', '2025-05-06 11:30:00');
INSERT INTO `sys_job_log` VALUES (1170, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 11:40:00');
INSERT INTO `sys_job_log` VALUES (1171, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-05-06 11:50:00');
INSERT INTO `sys_job_log` VALUES (1172, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-06 12:00:00');
INSERT INTO `sys_job_log` VALUES (1173, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-05-06 12:10:00');
INSERT INTO `sys_job_log` VALUES (1174, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 12:20:00');
INSERT INTO `sys_job_log` VALUES (1175, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 12:30:00');
INSERT INTO `sys_job_log` VALUES (1176, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 12:40:00');
INSERT INTO `sys_job_log` VALUES (1177, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 12:50:00');
INSERT INTO `sys_job_log` VALUES (1178, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 13:00:00');
INSERT INTO `sys_job_log` VALUES (1179, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 13:10:00');
INSERT INTO `sys_job_log` VALUES (1180, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-06 13:20:00');
INSERT INTO `sys_job_log` VALUES (1181, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 13:30:00');
INSERT INTO `sys_job_log` VALUES (1182, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 13:40:00');
INSERT INTO `sys_job_log` VALUES (1183, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 13:50:00');
INSERT INTO `sys_job_log` VALUES (1184, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 14:00:00');
INSERT INTO `sys_job_log` VALUES (1185, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-05-06 14:10:00');
INSERT INTO `sys_job_log` VALUES (1186, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 14:20:00');
INSERT INTO `sys_job_log` VALUES (1187, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-06 14:30:00');
INSERT INTO `sys_job_log` VALUES (1188, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 14:40:00');
INSERT INTO `sys_job_log` VALUES (1189, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 14:50:00');
INSERT INTO `sys_job_log` VALUES (1190, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 15:00:00');
INSERT INTO `sys_job_log` VALUES (1191, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 15:10:00');
INSERT INTO `sys_job_log` VALUES (1192, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 15:20:00');
INSERT INTO `sys_job_log` VALUES (1193, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 15:30:00');
INSERT INTO `sys_job_log` VALUES (1194, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 15:40:00');
INSERT INTO `sys_job_log` VALUES (1195, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 15:50:00');
INSERT INTO `sys_job_log` VALUES (1196, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-06 16:00:00');
INSERT INTO `sys_job_log` VALUES (1197, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 16:10:00');
INSERT INTO `sys_job_log` VALUES (1198, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 16:20:00');
INSERT INTO `sys_job_log` VALUES (1199, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：32毫秒', '0', '', '2025-05-06 16:30:00');
INSERT INTO `sys_job_log` VALUES (1200, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-06 16:40:00');
INSERT INTO `sys_job_log` VALUES (1201, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-05-06 16:50:00');
INSERT INTO `sys_job_log` VALUES (1202, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-05-06 17:00:00');
INSERT INTO `sys_job_log` VALUES (1203, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-06 17:10:00');
INSERT INTO `sys_job_log` VALUES (1204, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-06 17:20:00');
INSERT INTO `sys_job_log` VALUES (1205, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 17:30:00');
INSERT INTO `sys_job_log` VALUES (1206, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-05-06 17:40:00');
INSERT INTO `sys_job_log` VALUES (1207, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 17:50:00');
INSERT INTO `sys_job_log` VALUES (1208, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-05-06 18:00:00');
INSERT INTO `sys_job_log` VALUES (1209, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-05-06 18:10:00');
INSERT INTO `sys_job_log` VALUES (1210, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-05-06 18:20:00');
INSERT INTO `sys_job_log` VALUES (1211, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-05-06 18:30:00');
INSERT INTO `sys_job_log` VALUES (1212, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 18:40:00');
INSERT INTO `sys_job_log` VALUES (1213, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-05-06 18:50:00');
INSERT INTO `sys_job_log` VALUES (1214, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 19:00:00');
INSERT INTO `sys_job_log` VALUES (1215, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 19:10:00');
INSERT INTO `sys_job_log` VALUES (1216, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 19:20:00');
INSERT INTO `sys_job_log` VALUES (1217, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-06 19:30:00');
INSERT INTO `sys_job_log` VALUES (1218, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 19:40:00');
INSERT INTO `sys_job_log` VALUES (1219, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 19:50:00');
INSERT INTO `sys_job_log` VALUES (1220, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 20:00:00');
INSERT INTO `sys_job_log` VALUES (1221, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-06 20:10:00');
INSERT INTO `sys_job_log` VALUES (1222, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 20:20:00');
INSERT INTO `sys_job_log` VALUES (1223, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 20:30:00');
INSERT INTO `sys_job_log` VALUES (1224, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 20:40:00');
INSERT INTO `sys_job_log` VALUES (1225, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 20:50:00');
INSERT INTO `sys_job_log` VALUES (1226, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 21:00:00');
INSERT INTO `sys_job_log` VALUES (1227, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-05-06 21:10:00');
INSERT INTO `sys_job_log` VALUES (1228, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-06 21:20:00');
INSERT INTO `sys_job_log` VALUES (1229, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-06 21:30:00');
INSERT INTO `sys_job_log` VALUES (1230, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-06 21:40:00');
INSERT INTO `sys_job_log` VALUES (1231, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：24毫秒', '0', '', '2025-05-08 09:50:00');
INSERT INTO `sys_job_log` VALUES (1232, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：51毫秒', '0', '', '2025-05-08 10:00:00');
INSERT INTO `sys_job_log` VALUES (1233, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-08 10:10:00');
INSERT INTO `sys_job_log` VALUES (1234, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-08 10:20:00');
INSERT INTO `sys_job_log` VALUES (1235, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 10:30:00');
INSERT INTO `sys_job_log` VALUES (1236, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-05-08 10:40:00');
INSERT INTO `sys_job_log` VALUES (1237, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-08 10:50:00');
INSERT INTO `sys_job_log` VALUES (1238, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-08 11:00:00');
INSERT INTO `sys_job_log` VALUES (1239, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：18毫秒', '0', '', '2025-05-08 11:10:00');
INSERT INTO `sys_job_log` VALUES (1240, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：71毫秒', '0', '', '2025-05-08 11:20:00');
INSERT INTO `sys_job_log` VALUES (1241, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：26毫秒', '0', '', '2025-05-08 11:30:00');
INSERT INTO `sys_job_log` VALUES (1242, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 11:40:00');
INSERT INTO `sys_job_log` VALUES (1243, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-08 11:50:00');
INSERT INTO `sys_job_log` VALUES (1244, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-08 12:00:00');
INSERT INTO `sys_job_log` VALUES (1245, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-05-08 12:10:00');
INSERT INTO `sys_job_log` VALUES (1246, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-08 12:20:00');
INSERT INTO `sys_job_log` VALUES (1247, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 12:30:00');
INSERT INTO `sys_job_log` VALUES (1248, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 12:40:00');
INSERT INTO `sys_job_log` VALUES (1249, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 12:50:00');
INSERT INTO `sys_job_log` VALUES (1250, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-05-08 13:00:00');
INSERT INTO `sys_job_log` VALUES (1251, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-08 13:10:00');
INSERT INTO `sys_job_log` VALUES (1252, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：77毫秒', '0', '', '2025-05-08 13:20:00');
INSERT INTO `sys_job_log` VALUES (1253, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：61毫秒', '0', '', '2025-05-08 13:30:00');
INSERT INTO `sys_job_log` VALUES (1254, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：21毫秒', '0', '', '2025-05-08 13:40:00');
INSERT INTO `sys_job_log` VALUES (1255, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：41毫秒', '0', '', '2025-05-08 13:50:00');
INSERT INTO `sys_job_log` VALUES (1256, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-05-08 14:00:00');
INSERT INTO `sys_job_log` VALUES (1257, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 14:10:00');
INSERT INTO `sys_job_log` VALUES (1258, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 14:20:00');
INSERT INTO `sys_job_log` VALUES (1259, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-08 14:30:00');
INSERT INTO `sys_job_log` VALUES (1260, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 14:40:00');
INSERT INTO `sys_job_log` VALUES (1261, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 14:50:00');
INSERT INTO `sys_job_log` VALUES (1262, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-05-08 15:00:00');
INSERT INTO `sys_job_log` VALUES (1263, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 15:10:00');
INSERT INTO `sys_job_log` VALUES (1264, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 15:20:00');
INSERT INTO `sys_job_log` VALUES (1265, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：3毫秒', '0', '', '2025-05-08 15:30:00');
INSERT INTO `sys_job_log` VALUES (1266, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-08 15:40:00');
INSERT INTO `sys_job_log` VALUES (1267, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 15:50:00');
INSERT INTO `sys_job_log` VALUES (1268, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 16:00:00');
INSERT INTO `sys_job_log` VALUES (1269, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：11毫秒', '0', '', '2025-05-08 16:10:00');
INSERT INTO `sys_job_log` VALUES (1270, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：17毫秒', '0', '', '2025-05-08 16:20:00');
INSERT INTO `sys_job_log` VALUES (1271, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-05-08 16:30:00');
INSERT INTO `sys_job_log` VALUES (1272, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-08 16:40:00');
INSERT INTO `sys_job_log` VALUES (1273, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：65毫秒', '0', '', '2025-05-08 16:50:00');
INSERT INTO `sys_job_log` VALUES (1274, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：63毫秒', '0', '', '2025-05-08 17:00:00');
INSERT INTO `sys_job_log` VALUES (1275, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：47毫秒', '0', '', '2025-05-08 17:20:00');
INSERT INTO `sys_job_log` VALUES (1276, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-08 17:30:00');
INSERT INTO `sys_job_log` VALUES (1277, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：30毫秒', '0', '', '2025-05-08 17:40:00');
INSERT INTO `sys_job_log` VALUES (1278, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：32毫秒', '0', '', '2025-05-08 17:50:00');
INSERT INTO `sys_job_log` VALUES (1279, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：35毫秒', '0', '', '2025-05-08 18:00:00');
INSERT INTO `sys_job_log` VALUES (1280, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-08 18:10:00');
INSERT INTO `sys_job_log` VALUES (1281, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-08 18:20:00');
INSERT INTO `sys_job_log` VALUES (1282, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-08 18:30:00');
INSERT INTO `sys_job_log` VALUES (1283, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：8毫秒', '0', '', '2025-05-08 18:40:00');
INSERT INTO `sys_job_log` VALUES (1284, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 18:50:00');
INSERT INTO `sys_job_log` VALUES (1285, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：4毫秒', '0', '', '2025-05-08 19:00:00');
INSERT INTO `sys_job_log` VALUES (1286, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：7毫秒', '0', '', '2025-05-08 19:10:00');
INSERT INTO `sys_job_log` VALUES (1287, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-08 19:20:00');
INSERT INTO `sys_job_log` VALUES (1288, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-08 19:30:00');
INSERT INTO `sys_job_log` VALUES (1289, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-08 19:40:00');
INSERT INTO `sys_job_log` VALUES (1290, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：6毫秒', '0', '', '2025-05-08 19:50:00');
INSERT INTO `sys_job_log` VALUES (1291, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：5毫秒', '0', '', '2025-05-08 20:00:00');
INSERT INTO `sys_job_log` VALUES (1292, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：79毫秒', '0', '', '2025-05-10 09:00:00');
INSERT INTO `sys_job_log` VALUES (1293, '自动调控学习计划', 'SYSTEM', 'planAdjustTask.adjustPlan()', '自动调控学习计划 总共耗时：25毫秒', '0', '', '2025-05-10 09:20:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 647 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-24 09:23:13');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-24 11:09:41');
INSERT INTO `sys_logininfor` VALUES (448, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-24 12:00:20');
INSERT INTO `sys_logininfor` VALUES (449, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-24 12:00:24');
INSERT INTO `sys_logininfor` VALUES (450, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-24 13:18:25');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-24 16:37:20');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-24 16:37:23');
INSERT INTO `sys_logininfor` VALUES (453, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-24 16:37:26');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-02-25 10:56:23');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 10:56:26');
INSERT INTO `sys_logininfor` VALUES (456, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 11:45:00');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 13:17:10');
INSERT INTO `sys_logininfor` VALUES (458, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 13:34:28');
INSERT INTO `sys_logininfor` VALUES (459, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 20:53:58');
INSERT INTO `sys_logininfor` VALUES (460, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 22:17:04');
INSERT INTO `sys_logininfor` VALUES (461, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-25 22:22:23');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 22:22:32');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-25 22:22:47');
INSERT INTO `sys_logininfor` VALUES (464, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 22:22:57');
INSERT INTO `sys_logininfor` VALUES (465, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 23:43:59');
INSERT INTO `sys_logininfor` VALUES (466, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-26 00:09:49');
INSERT INTO `sys_logininfor` VALUES (467, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-04 10:51:48');
INSERT INTO `sys_logininfor` VALUES (468, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-04 15:26:17');
INSERT INTO `sys_logininfor` VALUES (469, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 16:39:04');
INSERT INTO `sys_logininfor` VALUES (470, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-11 10:58:26');
INSERT INTO `sys_logininfor` VALUES (471, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-11 13:04:38');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-11 17:38:39');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-11 17:38:42');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 09:19:22');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 10:12:33');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 13:12:11');
INSERT INTO `sys_logininfor` VALUES (477, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 16:02:40');
INSERT INTO `sys_logininfor` VALUES (478, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-12 19:17:25');
INSERT INTO `sys_logininfor` VALUES (479, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 19:17:27');
INSERT INTO `sys_logininfor` VALUES (480, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 20:44:31');
INSERT INTO `sys_logininfor` VALUES (481, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 23:15:38');
INSERT INTO `sys_logininfor` VALUES (482, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-13 11:41:57');
INSERT INTO `sys_logininfor` VALUES (483, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-13 13:10:50');
INSERT INTO `sys_logininfor` VALUES (484, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-13 14:41:08');
INSERT INTO `sys_logininfor` VALUES (485, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-13 16:48:48');
INSERT INTO `sys_logininfor` VALUES (486, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-13 17:08:39');
INSERT INTO `sys_logininfor` VALUES (487, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-13 17:08:45');
INSERT INTO `sys_logininfor` VALUES (488, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-13 17:12:55');
INSERT INTO `sys_logininfor` VALUES (489, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-13 17:13:00');
INSERT INTO `sys_logininfor` VALUES (490, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-13 19:24:06');
INSERT INTO `sys_logininfor` VALUES (491, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-13 21:13:51');
INSERT INTO `sys_logininfor` VALUES (492, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-13 22:10:13');
INSERT INTO `sys_logininfor` VALUES (493, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-13 23:20:28');
INSERT INTO `sys_logininfor` VALUES (494, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-14 13:21:30');
INSERT INTO `sys_logininfor` VALUES (495, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-14 16:08:38');
INSERT INTO `sys_logininfor` VALUES (496, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-14 19:43:37');
INSERT INTO `sys_logininfor` VALUES (497, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-14 21:09:44');
INSERT INTO `sys_logininfor` VALUES (498, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-14 21:54:46');
INSERT INTO `sys_logininfor` VALUES (499, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 00:03:54');
INSERT INTO `sys_logininfor` VALUES (500, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 12:04:33');
INSERT INTO `sys_logininfor` VALUES (501, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 12:53:08');
INSERT INTO `sys_logininfor` VALUES (502, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 14:17:45');
INSERT INTO `sys_logininfor` VALUES (503, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 15:27:31');
INSERT INTO `sys_logininfor` VALUES (504, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 17:24:30');
INSERT INTO `sys_logininfor` VALUES (505, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-15 18:02:16');
INSERT INTO `sys_logininfor` VALUES (506, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 18:02:22');
INSERT INTO `sys_logininfor` VALUES (507, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 21:52:59');
INSERT INTO `sys_logininfor` VALUES (508, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-15 21:53:02');
INSERT INTO `sys_logininfor` VALUES (509, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 21:53:07');
INSERT INTO `sys_logininfor` VALUES (510, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 22:47:21');
INSERT INTO `sys_logininfor` VALUES (511, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-15 23:25:35');
INSERT INTO `sys_logininfor` VALUES (512, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 23:25:38');
INSERT INTO `sys_logininfor` VALUES (513, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 23:51:45');
INSERT INTO `sys_logininfor` VALUES (514, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-16 00:29:44');
INSERT INTO `sys_logininfor` VALUES (515, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-16 17:02:16');
INSERT INTO `sys_logininfor` VALUES (516, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-17 09:59:16');
INSERT INTO `sys_logininfor` VALUES (517, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 10:35:02');
INSERT INTO `sys_logininfor` VALUES (518, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 11:05:36');
INSERT INTO `sys_logininfor` VALUES (519, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 13:09:06');
INSERT INTO `sys_logininfor` VALUES (520, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 14:59:59');
INSERT INTO `sys_logininfor` VALUES (521, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 23:18:53');
INSERT INTO `sys_logininfor` VALUES (522, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-18 23:18:57');
INSERT INTO `sys_logininfor` VALUES (523, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-18 23:19:05');
INSERT INTO `sys_logininfor` VALUES (524, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 23:19:06');
INSERT INTO `sys_logininfor` VALUES (525, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 23:37:26');
INSERT INTO `sys_logininfor` VALUES (526, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-19 09:45:40');
INSERT INTO `sys_logininfor` VALUES (527, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-19 11:04:17');
INSERT INTO `sys_logininfor` VALUES (528, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-19 15:19:40');
INSERT INTO `sys_logininfor` VALUES (529, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-19 17:27:26');
INSERT INTO `sys_logininfor` VALUES (530, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-19 20:50:29');
INSERT INTO `sys_logininfor` VALUES (531, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-20 21:21:27');
INSERT INTO `sys_logininfor` VALUES (532, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-20 21:57:24');
INSERT INTO `sys_logininfor` VALUES (533, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-20 22:42:13');
INSERT INTO `sys_logininfor` VALUES (534, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-20 23:39:16');
INSERT INTO `sys_logininfor` VALUES (535, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-24 09:37:44');
INSERT INTO `sys_logininfor` VALUES (536, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-24 22:01:58');
INSERT INTO `sys_logininfor` VALUES (537, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-24 22:02:01');
INSERT INTO `sys_logininfor` VALUES (538, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-25 23:11:37');
INSERT INTO `sys_logininfor` VALUES (539, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-26 11:15:53');
INSERT INTO `sys_logininfor` VALUES (540, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-26 13:02:38');
INSERT INTO `sys_logininfor` VALUES (541, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-26 15:20:49');
INSERT INTO `sys_logininfor` VALUES (542, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-26 21:52:43');
INSERT INTO `sys_logininfor` VALUES (543, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-26 22:31:42');
INSERT INTO `sys_logininfor` VALUES (544, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-26 23:39:25');
INSERT INTO `sys_logininfor` VALUES (545, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-26 23:58:10');
INSERT INTO `sys_logininfor` VALUES (546, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-27 09:33:08');
INSERT INTO `sys_logininfor` VALUES (547, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-27 09:47:49');
INSERT INTO `sys_logininfor` VALUES (548, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-27 16:44:33');
INSERT INTO `sys_logininfor` VALUES (549, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-27 17:09:28');
INSERT INTO `sys_logininfor` VALUES (550, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-27 21:02:51');
INSERT INTO `sys_logininfor` VALUES (551, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-27 21:05:17');
INSERT INTO `sys_logininfor` VALUES (552, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-27 23:27:54');
INSERT INTO `sys_logininfor` VALUES (553, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-27 23:28:04');
INSERT INTO `sys_logininfor` VALUES (554, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 09:40:17');
INSERT INTO `sys_logininfor` VALUES (555, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 11:03:27');
INSERT INTO `sys_logininfor` VALUES (556, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 13:03:55');
INSERT INTO `sys_logininfor` VALUES (557, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 13:50:03');
INSERT INTO `sys_logininfor` VALUES (558, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 15:51:07');
INSERT INTO `sys_logininfor` VALUES (559, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 17:49:30');
INSERT INTO `sys_logininfor` VALUES (560, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 21:24:32');
INSERT INTO `sys_logininfor` VALUES (561, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 21:34:22');
INSERT INTO `sys_logininfor` VALUES (562, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 23:14:03');
INSERT INTO `sys_logininfor` VALUES (563, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-29 10:46:01');
INSERT INTO `sys_logininfor` VALUES (564, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-29 10:46:03');
INSERT INTO `sys_logininfor` VALUES (565, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-29 11:26:34');
INSERT INTO `sys_logininfor` VALUES (566, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-29 19:08:00');
INSERT INTO `sys_logininfor` VALUES (567, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-29 19:54:32');
INSERT INTO `sys_logininfor` VALUES (568, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-29 22:29:19');
INSERT INTO `sys_logininfor` VALUES (569, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-30 00:30:56');
INSERT INTO `sys_logininfor` VALUES (570, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 11:09:19');
INSERT INTO `sys_logininfor` VALUES (571, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 11:52:18');
INSERT INTO `sys_logininfor` VALUES (572, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 12:57:22');
INSERT INTO `sys_logininfor` VALUES (573, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 15:16:52');
INSERT INTO `sys_logininfor` VALUES (574, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 16:11:47');
INSERT INTO `sys_logininfor` VALUES (575, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 10:08:58');
INSERT INTO `sys_logininfor` VALUES (576, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 21:44:24');
INSERT INTO `sys_logininfor` VALUES (577, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 23:52:38');
INSERT INTO `sys_logininfor` VALUES (578, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-02 19:29:21');
INSERT INTO `sys_logininfor` VALUES (579, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-02 20:03:57');
INSERT INTO `sys_logininfor` VALUES (580, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-02 21:25:34');
INSERT INTO `sys_logininfor` VALUES (581, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-02 22:07:08');
INSERT INTO `sys_logininfor` VALUES (582, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-02 22:11:07');
INSERT INTO `sys_logininfor` VALUES (583, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-02 22:11:13');
INSERT INTO `sys_logininfor` VALUES (584, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 12:00:30');
INSERT INTO `sys_logininfor` VALUES (585, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 14:32:49');
INSERT INTO `sys_logininfor` VALUES (586, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 14:37:52');
INSERT INTO `sys_logininfor` VALUES (587, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-04 14:37:56');
INSERT INTO `sys_logininfor` VALUES (588, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 14:38:03');
INSERT INTO `sys_logininfor` VALUES (589, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 15:03:41');
INSERT INTO `sys_logininfor` VALUES (590, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 20:56:52');
INSERT INTO `sys_logininfor` VALUES (591, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 21:07:27');
INSERT INTO `sys_logininfor` VALUES (592, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 21:19:59');
INSERT INTO `sys_logininfor` VALUES (593, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 21:38:59');
INSERT INTO `sys_logininfor` VALUES (594, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 21:39:04');
INSERT INTO `sys_logininfor` VALUES (595, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 22:52:48');
INSERT INTO `sys_logininfor` VALUES (596, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-07 13:08:44');
INSERT INTO `sys_logininfor` VALUES (597, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-08 21:30:47');
INSERT INTO `sys_logininfor` VALUES (598, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-08 22:35:30');
INSERT INTO `sys_logininfor` VALUES (599, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 22:21:51');
INSERT INTO `sys_logininfor` VALUES (600, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 22:24:21');
INSERT INTO `sys_logininfor` VALUES (601, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 10:26:34');
INSERT INTO `sys_logininfor` VALUES (602, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-12 23:07:52');
INSERT INTO `sys_logininfor` VALUES (603, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-13 13:27:45');
INSERT INTO `sys_logininfor` VALUES (604, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-13 17:59:50');
INSERT INTO `sys_logininfor` VALUES (605, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-13 19:30:36');
INSERT INTO `sys_logininfor` VALUES (606, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 23:21:39');
INSERT INTO `sys_logininfor` VALUES (607, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 22:33:06');
INSERT INTO `sys_logininfor` VALUES (608, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 22:35:17');
INSERT INTO `sys_logininfor` VALUES (609, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-17 20:16:21');
INSERT INTO `sys_logininfor` VALUES (610, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-17 20:17:07');
INSERT INTO `sys_logininfor` VALUES (611, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-20 22:35:14');
INSERT INTO `sys_logininfor` VALUES (612, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 22:35:28');
INSERT INTO `sys_logininfor` VALUES (613, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 12:54:02');
INSERT INTO `sys_logininfor` VALUES (614, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 14:06:51');
INSERT INTO `sys_logininfor` VALUES (615, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 17:45:37');
INSERT INTO `sys_logininfor` VALUES (616, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 19:18:56');
INSERT INTO `sys_logininfor` VALUES (617, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-22 23:13:56');
INSERT INTO `sys_logininfor` VALUES (618, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 23:13:58');
INSERT INTO `sys_logininfor` VALUES (619, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 23:25:46');
INSERT INTO `sys_logininfor` VALUES (620, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-23 23:34:20');
INSERT INTO `sys_logininfor` VALUES (621, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 09:18:45');
INSERT INTO `sys_logininfor` VALUES (622, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 22:39:56');
INSERT INTO `sys_logininfor` VALUES (623, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-25 22:40:02');
INSERT INTO `sys_logininfor` VALUES (624, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 22:40:07');
INSERT INTO `sys_logininfor` VALUES (625, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-25 22:41:07');
INSERT INTO `sys_logininfor` VALUES (626, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-25 22:41:09');
INSERT INTO `sys_logininfor` VALUES (627, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-25 22:41:15');
INSERT INTO `sys_logininfor` VALUES (628, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 22:41:18');
INSERT INTO `sys_logininfor` VALUES (629, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 11:14:43');
INSERT INTO `sys_logininfor` VALUES (630, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-29 11:29:18');
INSERT INTO `sys_logininfor` VALUES (631, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 11:29:24');
INSERT INTO `sys_logininfor` VALUES (632, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-06 10:21:40');
INSERT INTO `sys_logininfor` VALUES (633, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-06 11:53:11');
INSERT INTO `sys_logininfor` VALUES (634, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-06 16:22:03');
INSERT INTO `sys_logininfor` VALUES (635, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-08 09:47:49');
INSERT INTO `sys_logininfor` VALUES (636, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-08 11:07:50');
INSERT INTO `sys_logininfor` VALUES (637, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-05-08 11:32:15');
INSERT INTO `sys_logininfor` VALUES (638, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-08 11:32:18');
INSERT INTO `sys_logininfor` VALUES (639, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-08 13:20:23');
INSERT INTO `sys_logininfor` VALUES (640, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-08 16:19:33');
INSERT INTO `sys_logininfor` VALUES (641, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-10 09:00:15');
INSERT INTO `sys_logininfor` VALUES (642, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-10 09:01:48');
INSERT INTO `sys_logininfor` VALUES (643, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-10 09:01:57');
INSERT INTO `sys_logininfor` VALUES (644, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-10 09:15:41');
INSERT INTO `sys_logininfor` VALUES (645, '202325350123', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-10 09:17:15');
INSERT INTO `sys_logininfor` VALUES (646, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-10 09:17:24');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 9, 'admin/system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-10-05 13:28:48', 'admin', '2025-03-26 14:01:02', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 10, 'admin/monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-10-05 13:28:48', 'admin', '2025-03-26 14:01:18', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 11, 'admin/tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-10-05 13:28:48', 'admin', '2025-03-26 14:02:35', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-10-05 13:28:48', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-10-05 13:28:48', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-10-05 13:28:48', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-10-05 13:28:48', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-10-05 13:28:48', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-10-05 13:28:48', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-10-05 13:28:48', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-10-05 13:28:48', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-10-05 13:28:48', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-10-05 13:28:48', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-10-05 13:28:48', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-10-05 13:28:48', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-10-05 13:28:48', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-10-05 13:28:48', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-10-05 13:28:48', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-10-05 13:28:48', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-10-05 13:28:48', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-10-05 13:28:48', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-10-05 13:28:48', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-10-05 13:28:48', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '用户管理', 0, 2, 'admin/base', NULL, NULL, '', 1, 0, 'M', '0', '0', '', '基础管理', 'admin', '2024-10-05 14:55:21', 'admin', '2025-02-14 00:12:23', '');
INSERT INTO `sys_menu` VALUES (2019, '教师管理', 2000, 1, 'teacher', 'manage/teacher/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:teacher:list', '教师管理', 'admin', '2024-10-05 23:35:45', 'admin', '2025-02-12 23:29:42', '教师管理菜单');
INSERT INTO `sys_menu` VALUES (2020, '教师管理查询', 2019, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:teacher:query', '#', 'admin', '2024-10-05 23:35:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '教师管理新增', 2019, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:teacher:add', '#', 'admin', '2024-10-05 23:35:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '教师管理修改', 2019, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:teacher:edit', '#', 'admin', '2024-10-05 23:35:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '教师管理删除', 2019, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:teacher:remove', '#', 'admin', '2024-10-05 23:35:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '教师管理导出', 2019, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:teacher:export', '#', 'admin', '2024-10-05 23:35:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '学生管理', 2000, 1, 'student', 'manage/student/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:student:list', '学生管理', 'admin', '2024-10-06 23:28:13', 'admin', '2024-10-09 09:43:01', '学生管理菜单');
INSERT INTO `sys_menu` VALUES (2026, '学生管理查询', 2025, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:student:query', '#', 'admin', '2024-10-06 23:28:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '学生管理新增', 2025, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:student:add', '#', 'admin', '2024-10-06 23:28:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '学生管理修改', 2025, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:student:edit', '#', 'admin', '2024-10-06 23:28:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '学生管理删除', 2025, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:student:remove', '#', 'admin', '2024-10-06 23:28:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '学生管理导出', 2025, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:student:export', '#', 'admin', '2024-10-06 23:28:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '课程管理', 0, 3, 'admin/course', NULL, NULL, '', 1, 0, 'M', '0', '0', '', '课程管理', 'admin', '2024-10-10 18:47:36', 'admin', '2025-03-24 09:52:31', '');
INSERT INTO `sys_menu` VALUES (2032, '课程管理', 2031, 2, 'course', 'manage/course/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:course:list', '课程管理', 'admin', '2024-10-10 20:58:03', 'admin', '2025-03-26 13:07:31', '课程管理菜单');
INSERT INTO `sys_menu` VALUES (2033, '课程管理查询', 2032, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:course:query', '#', 'admin', '2024-10-10 20:58:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '课程管理新增', 2032, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:course:add', '#', 'admin', '2024-10-10 20:58:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '课程管理修改', 2032, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:course:edit', '#', 'admin', '2024-10-10 20:58:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '课程管理删除', 2032, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:course:remove', '#', 'admin', '2024-10-10 20:58:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '课程管理导出', 2032, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:course:export', '#', 'admin', '2024-10-10 20:58:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '课程内容章节管理', 2031, 5, 'chapter', 'manage/chapter/index', NULL, '', 1, 0, 'C', '1', '0', 'manage:chapter:list', '#', 'admin', '2024-10-16 23:05:06', 'admin', '2025-01-26 11:30:29', '课程内容章节管理菜单');
INSERT INTO `sys_menu` VALUES (2045, '课程内容章节管理查询', 2044, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:chapter:query', '#', 'admin', '2024-10-16 23:05:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '课程内容章节管理新增', 2044, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:chapter:add', '#', 'admin', '2024-10-16 23:05:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '课程内容章节管理修改', 2044, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:chapter:edit', '#', 'admin', '2024-10-16 23:05:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '课程内容章节管理删除', 2044, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:chapter:remove', '#', 'admin', '2024-10-16 23:05:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '课程内容章节管理导出', 2044, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:chapter:export', '#', 'admin', '2024-10-16 23:05:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '课程资料', 2031, 6, 'material', 'manage/material/index', NULL, '', 1, 0, 'C', '1', '0', 'manage:material:list', '#', 'admin', '2024-10-16 23:05:51', 'admin', '2025-01-26 11:30:25', '课程资料菜单');
INSERT INTO `sys_menu` VALUES (2051, '课程资料查询', 2050, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:material:query', '#', 'admin', '2024-10-16 23:05:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '课程资料新增', 2050, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:material:add', '#', 'admin', '2024-10-16 23:05:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '课程资料修改', 2050, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:material:edit', '#', 'admin', '2024-10-16 23:05:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '课程资料删除', 2050, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:material:remove', '#', 'admin', '2024-10-16 23:05:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '课程资料导出', 2050, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:material:export', '#', 'admin', '2024-10-16 23:05:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '作业管理', 2031, 3, 'homework', 'manage/homework/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:homework:list', '作业管理', 'admin', '2024-11-23 21:55:57', 'admin', '2025-01-26 11:30:36', '作业管理菜单');
INSERT INTO `sys_menu` VALUES (2057, '作业管理查询', 2056, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:homework:query', '#', 'admin', '2024-11-23 21:55:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '作业管理新增', 2056, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:homework:add', '#', 'admin', '2024-11-23 21:55:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '作业管理修改', 2056, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:homework:edit', '#', 'admin', '2024-11-23 21:55:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '作业管理删除', 2056, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:homework:remove', '#', 'admin', '2024-11-23 21:55:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '作业管理导出', 2056, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:homework:export', '#', 'admin', '2024-11-23 21:55:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '考试管理', 0, 6, 'admin/exams', NULL, NULL, '', 1, 0, 'M', '0', '0', '', '题库管理', 'admin', '2025-01-10 15:38:50', 'admin', '2025-03-26 13:06:33', '');
INSERT INTO `sys_menu` VALUES (2075, '试卷管理', 2068, 3, 'paper', 'manage/paper/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:paper:list', '试卷管理', 'admin', '2025-01-10 16:32:58', 'admin', '2025-03-26 13:56:00', '试卷管理菜单');
INSERT INTO `sys_menu` VALUES (2076, '试卷管理查询', 2075, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:paper:query', '#', 'admin', '2025-01-10 16:32:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '试卷管理新增', 2075, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:paper:add', '#', 'admin', '2025-01-10 16:32:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '试卷管理修改', 2075, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:paper:edit', '#', 'admin', '2025-01-10 16:32:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '试卷管理删除', 2075, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:paper:remove', '#', 'admin', '2025-01-10 16:32:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '试卷管理导出', 2075, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:paper:export', '#', 'admin', '2025-01-10 16:32:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '题目管理', 2068, 2, 'question', 'manage/question/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:question:list', '题目管理', 'admin', '2025-01-10 16:32:58', 'admin', '2025-03-26 13:55:46', '题目管理菜单');
INSERT INTO `sys_menu` VALUES (2082, '题目管理查询', 2081, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:question:query', '#', 'admin', '2025-01-10 16:32:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '题目管理新增', 2081, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:question:add', '#', 'admin', '2025-01-10 16:32:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '题目管理修改', 2081, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:question:edit', '#', 'admin', '2025-01-10 16:32:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '题目管理删除', 2081, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:question:remove', '#', 'admin', '2025-01-10 16:32:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '题目管理导出', 2081, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:question:export', '#', 'admin', '2025-01-10 16:32:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '评论管理', 0, 4, 'admin/comment', 'manage/comment/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:comment:list', '评论管理', 'admin', '2025-01-21 13:07:21', 'admin', '2025-02-13 21:13:05', '评论管理菜单');
INSERT INTO `sys_menu` VALUES (2089, '评论管理查询', 2088, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:comment:query', '#', 'admin', '2025-01-21 13:07:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '评论管理新增', 2088, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:comment:add', '#', 'admin', '2025-01-21 13:07:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '评论管理修改', 2088, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:comment:edit', '#', 'admin', '2025-01-21 13:07:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2092, '评论管理删除', 2088, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:comment:remove', '#', 'admin', '2025-01-21 13:07:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2093, '评论管理导出', 2088, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:comment:export', '#', 'admin', '2025-01-21 13:07:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2094, '资源管理', 0, 8, 'admin/file', 'manage/file/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:file:list', '资源管理', 'admin', '2025-01-21 13:07:21', 'admin', '2025-03-26 14:01:09', '资源管理菜单');
INSERT INTO `sys_menu` VALUES (2095, '资源管理查询', 2094, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:file:query', '#', 'admin', '2025-01-21 13:07:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2096, '资源管理新增', 2094, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:file:add', '#', 'admin', '2025-01-21 13:07:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2097, '资源管理修改', 2094, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:file:edit', '#', 'admin', '2025-01-21 13:07:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2098, '资源管理删除', 2094, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:file:remove', '#', 'admin', '2025-01-21 13:07:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2099, '资源管理导出', 2094, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:file:export', '#', 'admin', '2025-01-21 13:07:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2100, '学习管理', 0, 7, 'admin/study', NULL, NULL, '', 1, 0, 'M', '0', '0', '', '#', 'admin', '2025-01-24 16:58:37', 'admin', '2025-03-26 13:06:43', '');
INSERT INTO `sys_menu` VALUES (2101, '学习目标管理', 2100, 1, 'goal', 'manage/goal/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:goal:list', '#', 'admin', '2025-01-24 17:07:42', '', NULL, '学习目标管理菜单');
INSERT INTO `sys_menu` VALUES (2102, '学习目标管理查询', 2101, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:goal:query', '#', 'admin', '2025-01-24 17:07:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2103, '学习目标管理新增', 2101, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:goal:add', '#', 'admin', '2025-01-24 17:07:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2104, '学习目标管理修改', 2101, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:goal:edit', '#', 'admin', '2025-01-24 17:07:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2105, '学习目标管理删除', 2101, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:goal:remove', '#', 'admin', '2025-01-24 17:07:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2106, '学习目标管理导出', 2101, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:goal:export', '#', 'admin', '2025-01-24 17:07:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2131, '题库管理', 2068, 1, 'repo', 'manage/repo/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:repo:list', '#', 'admin', '2025-02-09 20:51:22', 'admin', '2025-03-26 13:55:42', '题库管理菜单');
INSERT INTO `sys_menu` VALUES (2132, '题库管理查询', 2131, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:repo:query', '#', 'admin', '2025-02-09 20:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2133, '题库管理新增', 2131, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:repo:add', '#', 'admin', '2025-02-09 20:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2134, '题库管理修改', 2131, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:repo:edit', '#', 'admin', '2025-02-09 20:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2135, '题库管理删除', 2131, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:repo:remove', '#', 'admin', '2025-02-09 20:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2136, '题库管理导出', 2131, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:repo:export', '#', 'admin', '2025-02-09 20:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2143, '考试管理', 2068, 4, 'exam', 'manage/exam/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:exam:list', '#', 'admin', '2025-02-11 12:51:33', 'admin', '2025-03-26 13:55:55', '考试管理菜单');
INSERT INTO `sys_menu` VALUES (2144, '考试管理查询', 2143, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:exam:query', '#', 'admin', '2025-02-11 12:51:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2145, '考试管理新增', 2143, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:exam:add', '#', 'admin', '2025-02-11 12:51:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2146, '考试管理修改', 2143, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:exam:edit', '#', 'admin', '2025-02-11 12:51:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2147, '考试管理删除', 2143, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:exam:remove', '#', 'admin', '2025-02-11 12:51:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2148, '考试管理导出', 2143, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:exam:export', '#', 'admin', '2025-02-11 12:51:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2149, '首页', 0, 1, 'admin/index', 'index', NULL, '', 1, 0, 'C', '0', '0', '', 'dashboard', 'admin', '2025-02-12 22:26:40', 'admin', '2025-02-16 18:25:20', '');
INSERT INTO `sys_menu` VALUES (2150, '课程方向', 2031, 1, 'direction', 'manage/direction/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:direction:list', '#', 'admin', '2025-02-12 23:51:04', '', NULL, '课程方向菜单');
INSERT INTO `sys_menu` VALUES (2151, '课程方向查询', 2150, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:direction:query', '#', 'admin', '2025-02-12 23:51:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2152, '课程方向新增', 2150, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:direction:add', '#', 'admin', '2025-02-12 23:51:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2153, '课程方向修改', 2150, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:direction:edit', '#', 'admin', '2025-02-12 23:51:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2154, '课程方向删除', 2150, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:direction:remove', '#', 'admin', '2025-02-12 23:51:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2155, '课程方向导出', 2150, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:direction:export', '#', 'admin', '2025-02-12 23:51:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2156, '评价管理', 0, 5, 'admin/evaluation', 'manage/evaluation/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:evalutation:list', '#', 'admin', '2025-02-25 10:59:47', 'admin', '2025-03-26 13:06:51', '课程评价管理菜单');
INSERT INTO `sys_menu` VALUES (2157, '课程评价管理查询', 2156, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:evalutation:query', '#', 'admin', '2025-02-25 10:59:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2158, '课程评价管理新增', 2156, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:evalutation:add', '#', 'admin', '2025-02-25 10:59:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2159, '课程评价管理修改', 2156, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:evalutation:edit', '#', 'admin', '2025-02-25 10:59:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2160, '课程评价管理删除', 2156, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:evalutation:remove', '#', 'admin', '2025-02-25 10:59:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2161, '课程评价管理导出', 2156, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:evalutation:export', '#', 'admin', '2025-02-25 10:59:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2162, '学习计划管理', 2100, 1, 'plan', 'manage/plan/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:plan:list', '#', 'admin', '2025-03-12 13:35:16', '', NULL, '学习计划管理菜单');
INSERT INTO `sys_menu` VALUES (2163, '学习计划管理查询', 2162, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:plan:query', '#', 'admin', '2025-03-12 13:35:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2164, '学习计划管理新增', 2162, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:plan:add', '#', 'admin', '2025-03-12 13:35:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2165, '学习计划管理修改', 2162, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:plan:edit', '#', 'admin', '2025-03-12 13:35:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2166, '学习计划管理删除', 2162, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:plan:remove', '#', 'admin', '2025-03-12 13:35:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2167, '学习计划管理导出', 2162, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:plan:export', '#', 'admin', '2025-03-12 13:35:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2168, '轮播图管理', 1, 1, 'carousel', 'manage/carousel/index', NULL, '', 1, 0, 'C', '0', '0', 'manage:carousel:list', '#', 'admin', '2025-05-07 13:24:02', 'admin', '2025-05-07 13:34:08', '轮播图菜单');
INSERT INTO `sys_menu` VALUES (2169, '轮播图查询', 2168, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:carousel:query', '#', 'admin', '2025-05-07 13:24:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2170, '轮播图新增', 2168, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:carousel:add', '#', 'admin', '2025-05-07 13:24:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2171, '轮播图修改', 2168, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:carousel:edit', '#', 'admin', '2025-05-07 13:24:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2172, '轮播图删除', 2168, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:carousel:remove', '#', 'admin', '2025-05-07 13:24:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2173, '轮播图导出', 2168, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'manage:carousel:export', '#', 'admin', '2025-05-07 13:24:02', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-10-05 13:28:49', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-10-05 13:28:49', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1425 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1100, '定时任务', 2, 'com.eduflex.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"\",\"createTime\":\"2025-02-19 23:08:34\",\"cronExpression\":\"40 19 23 19 2 ?\",\"invokeTarget\":\"breakExamTask.ryParams(1892229797649448962L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"强制交卷-1892229797649448962\",\"misfirePolicy\":\"2\",\"nextValidTime\":\"2025-02-19 23:19:40\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-19 23:19:24', 19);
INSERT INTO `sys_oper_log` VALUES (1101, '定时任务', 1, 'com.eduflex.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"* * * * * ?\",\"invokeTarget\":\"ryTask.ryNoParams\",\"jobId\":103,\"jobName\":\"1\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2025-02-19 23:23:04\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-19 23:23:03', 14);
INSERT INTO `sys_oper_log` VALUES (1102, '字典类型', 1, 'com.eduflex.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"考试提交状态\",\"dictType\":\"exam_submit_status\",\"params\":{},\"remark\":\"考试提交状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-20 22:20:13', 19);
INSERT INTO `sys_oper_log` VALUES (1103, '字典数据', 1, 'com.eduflex.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未开始\",\"dictSort\":1,\"dictType\":\"exam_submit_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-20 22:20:44', 13);
INSERT INTO `sys_oper_log` VALUES (1104, '字典数据', 1, 'com.eduflex.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"进行中\",\"dictSort\":2,\"dictType\":\"exam_submit_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-20 22:20:57', 10);
INSERT INTO `sys_oper_log` VALUES (1105, '字典数据', 1, 'com.eduflex.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待阅卷\",\"dictSort\":3,\"dictType\":\"exam_submit_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-20 22:21:06', 9);
INSERT INTO `sys_oper_log` VALUES (1106, '字典数据', 1, 'com.eduflex.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已完成\",\"dictSort\":4,\"dictType\":\"exam_submit_status\",\"dictValue\":\"3\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-20 22:21:21', 9);
INSERT INTO `sys_oper_log` VALUES (1107, '字典数据', 2, 'com.eduflex.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-02-20 22:21:06\",\"default\":false,\"dictCode\":136,\"dictLabel\":\"待阅卷\",\"dictSort\":3,\"dictType\":\"exam_submit_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-20 22:21:42', 12);
INSERT INTO `sys_oper_log` VALUES (1108, '字典数据', 2, 'com.eduflex.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-02-20 22:20:44\",\"default\":false,\"dictCode\":134,\"dictLabel\":\"未开始\",\"dictSort\":1,\"dictType\":\"exam_submit_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-20 22:21:52', 14);
INSERT INTO `sys_oper_log` VALUES (1109, '字典数据', 2, 'com.eduflex.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-02-20 22:20:57\",\"default\":false,\"dictCode\":135,\"dictLabel\":\"进行中\",\"dictSort\":2,\"dictType\":\"exam_submit_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-20 22:22:00', 15);
INSERT INTO `sys_oper_log` VALUES (1110, '字典数据', 2, 'com.eduflex.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-02-20 22:20:57\",\"default\":false,\"dictCode\":135,\"dictLabel\":\"进行中\",\"dictSort\":2,\"dictType\":\"exam_submit_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-20 22:22:05', 12);
INSERT INTO `sys_oper_log` VALUES (1111, '字典数据', 2, 'com.eduflex.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-02-20 22:21:06\",\"default\":false,\"dictCode\":136,\"dictLabel\":\"待阅卷\",\"dictSort\":3,\"dictType\":\"exam_submit_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-20 22:22:08', 12);
INSERT INTO `sys_oper_log` VALUES (1112, '课程方向', 1, 'com.eduflex.manage.direction.controller.DirectionController.add()', 'POST', 1, 'admin', '研发部门', '/manage/direction', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-02-22 14:39:03\",\"id\":1893188738571264002,\"name\":\"方向1\",\"params\":{},\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 14:39:03', 130);
INSERT INTO `sys_oper_log` VALUES (1113, '课程方向', 2, 'com.eduflex.manage.direction.controller.DirectionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/direction', '127.0.0.1', '内网IP', '{\"id\":1893188738571264002,\"params\":{},\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-22 14:39:05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 14:39:05', 24);
INSERT INTO `sys_oper_log` VALUES (1114, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1891000268121681922,\"createTime\":\"2024-10-11 13:42:40\",\"deleted\":0,\"description\":\"Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程Java 基础教程\",\"directionId\":1889707213995606018,\"endTime\":\"2024-12-31\",\"id\":1,\"name\":\"Java EE\",\"params\":{},\"startTime\":\"2024-09-03\",\"status\":1,\"teacherId\":100,\"updateBy\":\"admin\",\"updateTime\":\"2024-12-07 14:17:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:38:10', 27);
INSERT INTO `sys_oper_log` VALUES (1115, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777547125346306,\"cover\":1891000294214447106,\"createTime\":\"2024-11-23 22:40:10\",\"deleted\":0,\"description\":\"计算机操作系统\",\"directionId\":1889705530327379970,\"endTime\":\"2024-12-18\",\"id\":3,\"name\":\"计算机操作系统\",\"params\":{},\"startTime\":\"2024-09-03\",\"status\":2,\"teacherId\":106,\"updateBy\":\"admin\",\"updateTime\":\"2024-11-23 22:40:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:38:32', 12);
INSERT INTO `sys_oper_log` VALUES (1116, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865774804440600577,\"cover\":1891000318868566018,\"createBy\":\"admin\",\"createTime\":\"2025-01-14 17:57:16\",\"deleted\":0,\"directionId\":1889707595454877697,\"endTime\":\"2025-01-16\",\"id\":1879105493781590018,\"name\":\"计算机网络\",\"params\":{},\"startTime\":\"2025-01-14\",\"status\":1,\"teacherId\":106,\"updateBy\":\"admin\",\"updateTime\":\"2025-01-14 17:57:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:38:54', 10);
INSERT INTO `sys_oper_log` VALUES (1117, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865774917003137026,\"cover\":1891000365639249921,\"createBy\":\"admin\",\"createTime\":\"2025-01-14 17:58:13\",\"deleted\":0,\"directionId\":1889707757073993730,\"endTime\":\"2025-01-15\",\"id\":1879105733238599681,\"name\":\"高等数学\",\"params\":{},\"startTime\":\"2025-01-13\",\"status\":1,\"teacherId\":100,\"updateBy\":\"admin\",\"updateTime\":\"2025-01-14 17:58:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:38:59', 12);
INSERT INTO `sys_oper_log` VALUES (1118, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1888589040311214082,\"cover\":1891000384131936257,\"createBy\":\"admin\",\"createTime\":\"2025-02-09 22:01:52\",\"deleted\":0,\"directionId\":1889707213995606018,\"endTime\":\"2025-02-13\",\"id\":1888589132753674241,\"name\":\"Python入门\",\"params\":{},\"startTime\":\"2025-01-29\",\"status\":1,\"teacherId\":100,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-09 22:01:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:39:06', 9);
INSERT INTO `sys_oper_log` VALUES (1119, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1891072649119965186,\"createBy\":\"admin\",\"createTime\":\"2025-02-16 18:30:29\",\"deleted\":0,\"description\":\"从0开始 独立完成企业级Java电商网站服务端开发\",\"directionId\":1889705530327379970,\"endTime\":\"2025-02-18\",\"id\":1891072653180051457,\"name\":\"从0开始 独立完成企业级Java电商网站服务端开发\",\"params\":{},\"startTime\":\"2025-02-03\",\"status\":2,\"teacherId\":112,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-16 18:30:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:39:21', 13);
INSERT INTO `sys_oper_log` VALUES (1120, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1891072584389271554,\"createBy\":\"admin\",\"createTime\":\"2025-02-16 18:30:14\",\"deleted\":0,\"directionId\":1889705530327379970,\"endTime\":\"2025-02-19\",\"id\":1891072587992178689,\"name\":\"从0开始 独立完成企业级Java电商网站服务端开发\",\"params\":{},\"startTime\":\"2025-01-29\",\"status\":0,\"teacherId\":112,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-16 18:30:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:39:24', 10);
INSERT INTO `sys_oper_log` VALUES (1121, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1891072518488367105,\"createBy\":\"admin\",\"createTime\":\"2025-02-16 18:29:59\",\"deleted\":0,\"description\":\"从0开始 独立完成企业级Java电商网站服务端开发\",\"directionId\":1889705530327379970,\"endTime\":\"2025-02-25\",\"id\":1891072528177209345,\"name\":\"从0开始 独立完成企业级Java电商网站服务端开发\",\"params\":{},\"startTime\":\"2025-02-09\",\"status\":1,\"teacherId\":106,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-16 18:29:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:39:28', 12);
INSERT INTO `sys_oper_log` VALUES (1122, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1891072518488367105,\"createBy\":\"admin\",\"createTime\":\"2025-02-16 18:29:59\",\"deleted\":0,\"description\":\"从0开始 独立完成企业级Java电商网站服务端开发\",\"directionId\":1889707213995606018,\"endTime\":\"2025-02-25\",\"id\":1891072528177209345,\"name\":\"从0开始 独立完成企业级Java电商网站服务端开发\",\"params\":{},\"startTime\":\"2025-02-09\",\"status\":1,\"teacherId\":106,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-16 18:29:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:39:33', 9);
INSERT INTO `sys_oper_log` VALUES (1123, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1891072584389271554,\"createBy\":\"admin\",\"createTime\":\"2025-02-16 18:30:14\",\"deleted\":0,\"directionId\":1889707213995606018,\"endTime\":\"2025-02-19\",\"id\":1891072587992178689,\"name\":\"从0开始 独立完成企业级Java电商网站服务端开发\",\"params\":{},\"startTime\":\"2025-01-29\",\"status\":0,\"teacherId\":112,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-16 18:30:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:39:39', 7);
INSERT INTO `sys_oper_log` VALUES (1124, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865774893179490305,\"cover\":1891072354658852865,\"createBy\":\"admin\",\"createTime\":\"2025-02-16 18:29:21\",\"deleted\":0,\"description\":\"算法与数据结构\",\"directionId\":1889707757073993730,\"endTime\":\"2025-02-19\",\"id\":1891072368944652289,\"name\":\"算法与数据结构\",\"params\":{},\"startTime\":\"2025-02-10\",\"status\":1,\"teacherId\":112,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-16 18:29:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:39:45', 9);
INSERT INTO `sys_oper_log` VALUES (1125, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1891072068464713729,\"createBy\":\"admin\",\"createTime\":\"2025-02-16 18:28:02\",\"deleted\":0,\"description\":\"深入浅出Java多线程\",\"directionId\":1889707213995606018,\"endTime\":\"2025-02-20\",\"id\":1891072036286013442,\"name\":\"深入浅出Java多线程\",\"params\":{},\"startTime\":\"2025-02-09\",\"status\":1,\"teacherId\":100,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-16 18:28:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:39:59', 11);
INSERT INTO `sys_oper_log` VALUES (1126, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865774917003137026,\"cover\":1891000365639249921,\"createBy\":\"admin\",\"createTime\":\"2025-01-14 17:58:13\",\"deleted\":0,\"directionId\":1889707757073993730,\"endTime\":\"2025-01-15\",\"id\":1879105733238599681,\"name\":\"高等数学\",\"params\":{},\"startTime\":\"2025-01-13\",\"status\":1,\"teacherId\":100,\"updateBy\":\"admin\",\"updateTime\":\"2025-01-14 17:58:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:40:16', 7);
INSERT INTO `sys_oper_log` VALUES (1127, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1891072718145626113,\"createBy\":\"admin\",\"createTime\":\"2025-02-16 18:30:45\",\"deleted\":0,\"directionId\":1889707213995606018,\"endTime\":\"2025-02-12\",\"id\":1891072721425571841,\"name\":\"从0开始 独立完成企业级Java电商网站服务端开发\",\"params\":{},\"startTime\":\"2025-02-04\",\"status\":1,\"teacherId\":103,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-16 18:30:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:41:25', 11);
INSERT INTO `sys_oper_log` VALUES (1128, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1891072789939527682,\"createBy\":\"admin\",\"createTime\":\"2025-02-16 18:31:03\",\"deleted\":0,\"directionId\":1889707213995606018,\"endTime\":\"2025-02-20\",\"id\":1891072793651486721,\"name\":\"从0开始 独立完成企业级Java电商网站服务端开发\",\"params\":{},\"startTime\":\"2025-02-12\",\"status\":1,\"teacherId\":106,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-16 18:31:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:41:37', 19);
INSERT INTO `sys_oper_log` VALUES (1129, '课程管理', 2, 'com.eduflex.manage.course.controller.CourseController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1891087041463099393,\"createBy\":\"admin\",\"createTime\":\"2025-02-16 19:27:40\",\"deleted\":0,\"directionId\":1889707213995606018,\"endTime\":\"2025-02-19\",\"id\":1891087044944371713,\"name\":\"从0开始 独立完成企业级Java电商网站服务端开发\",\"params\":{},\"startTime\":\"2025-02-02\",\"status\":1,\"teacherId\":112,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-16 19:27:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 17:41:40', 10);
INSERT INTO `sys_oper_log` VALUES (1130, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":2,\"fileId\":1893308617739612161,\"id\":1893308627680112642,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第1章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:35:27', 34);
INSERT INTO `sys_oper_log` VALUES (1131, '课程资料', 3, 'com.eduflex.manage.course_material.controller.CourseMaterialController.remove()', 'DELETE', 1, 'admin', '研发部门', '/manage/material/1876561583700119553', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: UPDATE tb_course_chapter    WHERE id=? AND deleted=0', '2025-02-22 22:35:31', 233);
INSERT INTO `sys_oper_log` VALUES (1132, '课程资料', 3, 'com.eduflex.manage.course_material.controller.CourseMaterialController.remove()', 'DELETE', 1, 'admin', '研发部门', '/manage/material/1876561583700119553', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: UPDATE tb_course_chapter    WHERE id=? AND deleted=0', '2025-02-22 22:35:37', 21);
INSERT INTO `sys_oper_log` VALUES (1133, '课程资料', 3, 'com.eduflex.manage.course_material.controller.CourseMaterialController.remove()', 'DELETE', 1, 'admin', '研发部门', '/manage/material/1881637028783136770', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: UPDATE tb_course_chapter    WHERE id=? AND deleted=0', '2025-02-22 22:35:44', 19);
INSERT INTO `sys_oper_log` VALUES (1134, '课程资料', 3, 'com.eduflex.manage.course_material.controller.CourseMaterialController.remove()', 'DELETE', 1, 'admin', '研发部门', '/manage/material/1876561583700119553', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:39:59', 57);
INSERT INTO `sys_oper_log` VALUES (1135, '课程管理', 1, 'com.eduflex.manage.course.controller.CourseController.add()', 'POST', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865773357393215489,\"cover\":1893310297873047554,\"createBy\":\"admin\",\"description\":\"HTML5设计基础\",\"directionId\":1889705530327379970,\"endTime\":\"2025-02-28\",\"id\":1893310305557012481,\"name\":\"HTML5设计基础\",\"params\":{},\"startTime\":\"2025-02-01\",\"status\":1,\"teacherId\":106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:42:07', 23);
INSERT INTO `sys_oper_log` VALUES (1136, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:42:41\",\"id\":1893310447278350338,\"name\":\"第一章\",\"orderNum\":1,\"params\":{},\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:42:41', 15);
INSERT INTO `sys_oper_log` VALUES (1137, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:42:46\",\"id\":1893310468660912129,\"name\":\"第二章\",\"orderNum\":5,\"params\":{},\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:42:46', 15);
INSERT INTO `sys_oper_log` VALUES (1138, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:42:50\",\"id\":1893310487820492802,\"name\":\"第三章\",\"orderNum\":6,\"params\":{},\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:42:50', 11);
INSERT INTO `sys_oper_log` VALUES (1139, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:42:55\",\"id\":1893310508284502018,\"name\":\"第四章\",\"orderNum\":7,\"params\":{},\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:42:55', 15);
INSERT INTO `sys_oper_log` VALUES (1140, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:43:00\",\"id\":1893310528354246658,\"name\":\"第五章\",\"orderNum\":8,\"params\":{},\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:43:00', 11);
INSERT INTO `sys_oper_log` VALUES (1141, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:43:04\",\"id\":1893310545513144322,\"name\":\"第六章\",\"orderNum\":9,\"params\":{},\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:43:04', 13);
INSERT INTO `sys_oper_log` VALUES (1142, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:43:10\",\"id\":1893310568959303681,\"name\":\"第七章\",\"orderNum\":10,\"params\":{},\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:43:10', 12);
INSERT INTO `sys_oper_log` VALUES (1143, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:43:14\",\"id\":1893310587779145730,\"name\":\"第八章\",\"orderNum\":11,\"params\":{},\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:43:14', 9);
INSERT INTO `sys_oper_log` VALUES (1144, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:43:22\",\"id\":1893310621455212545,\"name\":\"第九章\",\"orderNum\":12,\"params\":{},\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:43:22', 8);
INSERT INTO `sys_oper_log` VALUES (1145, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:43:27\",\"id\":1893310642997157890,\"name\":\"第十章\",\"orderNum\":13,\"params\":{},\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:43:27', 8);
INSERT INTO `sys_oper_log` VALUES (1146, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:44:05\",\"id\":1893310802049359874,\"name\":\"了解Web前端开发\",\"orderNum\":1,\"params\":{},\"parentId\":1893310447278350338}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:44:05', 10);
INSERT INTO `sys_oper_log` VALUES (1147, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893310802049359874,\"fileId\":1893310851416317953,\"id\":1893310863483330561,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第1章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:44:20', 10);
INSERT INTO `sys_oper_log` VALUES (1148, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:46:14\",\"id\":1893311343458508801,\"name\":\"HTML 5页面的构建与简单控制\",\"orderNum\":1,\"params\":{},\"parentId\":1893310468660912129}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:46:14', 12);
INSERT INTO `sys_oper_log` VALUES (1149, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893311343458508801,\"fileId\":1893311371832975362,\"id\":1893311378090876929,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第2章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:46:23', 5);
INSERT INTO `sys_oper_log` VALUES (1150, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseId\":1893310305557012481,\"createTime\":\"2025-02-22 22:46:42\",\"id\":1893311456893460481,\"name\":\"CSS 3基础入门\",\"orderNum\":1,\"params\":{},\"parentId\":1893310487820492802}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:46:42', 11);
INSERT INTO `sys_oper_log` VALUES (1151, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893311456893460481,\"fileId\":1893311484043190273,\"id\":1893311490850545665,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第3章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 22:46:50', 7);
INSERT INTO `sys_oper_log` VALUES (1152, '课程分类', 1, 'com.eduflex.manage.category.controller.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/manage/category', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"directionId\":1889705530327379970,\"id\":1893329879890436097,\"name\":\"HTML\",\"params\":{},\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-22 23:59:54', 134);
INSERT INTO `sys_oper_log` VALUES (1153, '课程管理', 1, 'com.eduflex.manage.course.controller.CourseController.add()', 'POST', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1893329879890436097,\"cover\":1893330038930055169,\"createBy\":\"admin\",\"description\":\"HTML5设计基础\\nHTML5设计基础\\nHTML5设计基础\\nHTML5设计基础\",\"directionId\":1889705530327379970,\"endTime\":\"2025-02-28\",\"id\":1893330048954441729,\"name\":\"HTML5设计基础\",\"params\":{},\"startTime\":\"2024-02-01\",\"status\":1,\"teacherId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:00:34', 23);
INSERT INTO `sys_oper_log` VALUES (1154, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"id\":1893330375090937858,\"name\":\"Web前端职业前景与重要理念\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:01:52', 11);
INSERT INTO `sys_oper_log` VALUES (1155, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"id\":1893332503612112897,\"name\":\"Web前端职业前景与重要理念\",\"params\":{},\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:10:20', 167);
INSERT INTO `sys_oper_log` VALUES (1156, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"id\":1893332997474631682,\"name\":\"HTML 5页面的构建与简单控制\",\"params\":{},\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:12:17', 17);
INSERT INTO `sys_oper_log` VALUES (1157, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"id\":1893333416405909505,\"name\":\"CSS 3基础入门\",\"params\":{},\"sort\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:13:57', 9);
INSERT INTO `sys_oper_log` VALUES (1158, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"id\":1893333478926204929,\"name\":\"实现Web前端排版的基本美化\",\"params\":{},\"sort\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:14:12', 9);
INSERT INTO `sys_oper_log` VALUES (1159, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"id\":1893333537092812801,\"name\":\"浮动、定位与列表\",\"params\":{},\"sort\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:14:26', 7);
INSERT INTO `sys_oper_log` VALUES (1160, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"id\":1893333583070773249,\"name\":\"HTML 5增强型表单与简易表格\",\"params\":{},\"sort\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:14:37', 6);
INSERT INTO `sys_oper_log` VALUES (1161, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"id\":1893333634367111170,\"name\":\"CSS3与HTML5的高级应用\",\"params\":{},\"sort\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:14:49', 7);
INSERT INTO `sys_oper_log` VALUES (1162, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"id\":1893333680500260866,\"name\":\"PC端典型页面的设计与实现\",\"params\":{},\"sort\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:15:00', 6);
INSERT INTO `sys_oper_log` VALUES (1163, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"id\":1893333729997242370,\"name\":\"多设备响应式页面的实现\",\"params\":{},\"sort\":9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:15:12', 12);
INSERT INTO `sys_oper_log` VALUES (1164, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"id\":1893333796795727874,\"name\":\"Web App类页面的设计与实现\",\"params\":{},\"sort\":10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:15:28', 5);
INSERT INTO `sys_oper_log` VALUES (1165, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893332503612112897,\"fileId\":1893338870162919426,\"id\":1893338904111616001,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第1章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:35:45', 26);
INSERT INTO `sys_oper_log` VALUES (1166, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893332503612112897,\"fileId\":1893340282775154689,\"id\":1893340374244536321,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第1章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:41:36', 21);
INSERT INTO `sys_oper_log` VALUES (1167, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893332997474631682,\"fileId\":1893340620781531137,\"id\":1893340632542359554,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第2章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:42:38', 8);
INSERT INTO `sys_oper_log` VALUES (1168, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893333416405909505,\"fileId\":1893340723030274049,\"id\":1893340904169680898,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第3章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:43:42', 8);
INSERT INTO `sys_oper_log` VALUES (1169, '用户头像', 2, 'com.eduflex.web.controller.system.SysProfileController.avatar()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '{\"fileId\":\"1893341139906342913\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:44:39', 66);
INSERT INTO `sys_oper_log` VALUES (1170, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893333478926204929,\"fileId\":1893341754787115010,\"id\":1893341762248781826,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第4章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:47:07', 7);
INSERT INTO `sys_oper_log` VALUES (1171, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893333537092812801,\"fileId\":1893341874337361921,\"id\":1893341878602969090,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第5章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:47:35', 6);
INSERT INTO `sys_oper_log` VALUES (1172, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893333583070773249,\"fileId\":1893341911775719426,\"id\":1893341915349266433,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第6章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:47:43', 9);
INSERT INTO `sys_oper_log` VALUES (1173, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893333634367111170,\"fileId\":1893342145029353474,\"id\":1893342149114605570,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第7章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:48:39', 5);
INSERT INTO `sys_oper_log` VALUES (1174, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893333680500260866,\"createBy\":\"admin\",\"fileId\":1893342847294263297,\"id\":1893342853338255362,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第8章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:51:27', 39);
INSERT INTO `sys_oper_log` VALUES (1175, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893333729997242370,\"createBy\":\"admin\",\"fileId\":1893342876255932417,\"id\":1893342883612741633,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第9章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:51:34', 7);
INSERT INTO `sys_oper_log` VALUES (1176, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893333796795727874,\"createBy\":\"admin\",\"fileId\":1893342906727550978,\"id\":1893342914789003265,\"materialType\":4,\"name\":\"HTML5+CSS3 Web前端设计基础教程（第10章）.pptx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 00:51:42', 16);
INSERT INTO `sys_oper_log` VALUES (1177, '课程内容章节管理', 2, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"createTime\":\"2025-02-23 00:10:20\",\"deleted\":0,\"id\":1893332503612112897,\"name\":\"Web前端职业前景与重要理念\",\"params\":{},\"sort\":11,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 01:10:44', 45);
INSERT INTO `sys_oper_log` VALUES (1178, '课程内容章节管理', 2, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"createTime\":\"2025-02-23 00:10:20\",\"deleted\":0,\"id\":1893332503612112897,\"name\":\"Web前端职业前景与重要理念\",\"params\":{},\"sort\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-23 01:10:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 01:10:50', 18);
INSERT INTO `sys_oper_log` VALUES (1179, '课程内容章节管理', 2, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"createTime\":\"2025-02-23 00:10:20\",\"deleted\":0,\"id\":1893332503612112897,\"name\":\"Web前端职业前景与重要理念\",\"params\":{},\"sort\":11,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-23 01:10:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 01:11:55', 105);
INSERT INTO `sys_oper_log` VALUES (1180, '课程内容章节管理', 2, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"createTime\":\"2025-02-23 00:10:20\",\"deleted\":0,\"id\":1893332503612112897,\"name\":\"Web前端职业前景与重要理念\",\"params\":{},\"sort\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-23 01:10:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 01:11:59', 16);
INSERT INTO `sys_oper_log` VALUES (1181, '用户头像', 2, 'com.eduflex.web.controller.system.SysProfileController.avatar()', 'PUT', 1, '202325350123', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '{\"fileId\":\"1893349589973471233\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 01:18:13', 10);
INSERT INTO `sys_oper_log` VALUES (1182, '课程管理', 1, 'com.eduflex.manage.course.controller.CourseController.add()', 'POST', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1893505291283075074,\"createBy\":\"admin\",\"description\":\"Java零基础视频教程_上部\",\"directionId\":1889707213995606018,\"endTime\":\"2025-06-30\",\"id\":1893505297209626626,\"name\":\"Java零基础视频教程_上部\",\"params\":{},\"startTime\":\"2024-09-01\",\"teacherId\":112}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\r\n### The error may exist in com/eduflex/manage/course_chapter/mapper/CourseMapper.java (best guess)\r\n### The error may involve com.eduflex.manage.course_chapter.mapper.CourseMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO tb_course  ( id, name, description, direction_id, category_id, teacher_id, cover, start_time, end_time,  create_by )  VALUES (  ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?  )\r\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2025-02-23 11:36:57', 179);
INSERT INTO `sys_oper_log` VALUES (1183, '课程管理', 1, 'com.eduflex.manage.course.controller.CourseController.add()', 'POST', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1893505291283075074,\"createBy\":\"admin\",\"description\":\"Java零基础视频教程_上部\",\"directionId\":1889707213995606018,\"endTime\":\"2025-06-30\",\"id\":1893505426658430978,\"name\":\"Java零基础视频教程_上部\",\"params\":{},\"startTime\":\"2024-09-01\",\"teacherId\":112}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:37:28', 11);
INSERT INTO `sys_oper_log` VALUES (1184, '课程管理', 1, 'com.eduflex.manage.course.controller.CourseController.add()', 'POST', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"cover\":1893505965064577026,\"createBy\":\"admin\",\"description\":\"Java零基础视频教程_上部\",\"directionId\":1889707213995606018,\"endTime\":\"2025-09-01\",\"id\":1893505970768830465,\"name\":\"Java零基础视频教程_上部\",\"params\":{},\"startTime\":\"2024-09-01\",\"status\":1,\"teacherId\":112}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:39:37', 96);
INSERT INTO `sys_oper_log` VALUES (1185, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506289502380033,\"name\":\"Java入门\",\"params\":{},\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:40:53', 18);
INSERT INTO `sys_oper_log` VALUES (1186, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506341381726210,\"name\":\"Java基础概念\",\"params\":{},\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:41:06', 8);
INSERT INTO `sys_oper_log` VALUES (1187, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506381718347778,\"name\":\"运算符\",\"params\":{},\"sort\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:41:15', 6);
INSERT INTO `sys_oper_log` VALUES (1188, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506429021708290,\"name\":\"判断和循环\",\"params\":{},\"sort\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:41:27', 6);
INSERT INTO `sys_oper_log` VALUES (1189, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506483899981826,\"name\":\"循环高级综合练习\",\"params\":{},\"sort\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:41:40', 9);
INSERT INTO `sys_oper_log` VALUES (1190, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506529949245441,\"name\":\"数组\",\"params\":{},\"sort\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:41:51', 9);
INSERT INTO `sys_oper_log` VALUES (1191, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506546214756354,\"name\":\"方法\",\"params\":{},\"sort\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:41:54', 9);
INSERT INTO `sys_oper_log` VALUES (1192, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506655379906561,\"name\":\"综合练习\",\"params\":{},\"sort\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:42:20', 8);
INSERT INTO `sys_oper_log` VALUES (1193, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506674514321410,\"name\":\"面向对象\",\"params\":{},\"sort\":9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:42:25', 8);
INSERT INTO `sys_oper_log` VALUES (1194, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506718403518466,\"name\":\"面向对象综合练习\",\"params\":{},\"sort\":10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:42:36', 6);
INSERT INTO `sys_oper_log` VALUES (1195, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506745167372289,\"name\":\"字符串\",\"params\":{},\"sort\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:42:42', 7);
INSERT INTO `sys_oper_log` VALUES (1196, '课程内容章节管理', 1, 'com.eduflex.manage.course_chapter.controller.CourseChapterController.add()', 'POST', 1, 'admin', '研发部门', '/manage/chapter', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"id\":1893506764423421954,\"name\":\"ArrayList\",\"params\":{},\"sort\":12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:42:46', 6);
INSERT INTO `sys_oper_log` VALUES (1197, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893506289502380033,\"createBy\":\"admin\",\"duration\":499,\"fileId\":1893507826061385730,\"id\":1893507970781650946,\"materialType\":3,\"name\":\"Java学习介绍\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:47:34', 19);
INSERT INTO `sys_oper_log` VALUES (1198, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893506289502380033,\"createBy\":\"admin\",\"duration\":498,\"fileId\":1893508177074298881,\"id\":1893508218337861634,\"materialType\":3,\"name\":\"人机交互-图形化界面的使用\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:48:33', 7);
INSERT INTO `sys_oper_log` VALUES (1199, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893506289502380033,\"createBy\":\"admin\",\"duration\":266,\"fileId\":1893508263103668226,\"id\":1893508286923120642,\"materialType\":3,\"name\":\"打开CMD\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:48:49', 10);
INSERT INTO `sys_oper_log` VALUES (1200, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893506289502380033,\"createBy\":\"admin\",\"duration\":448,\"fileId\":1893508314236428289,\"id\":1893508345710485505,\"materialType\":3,\"name\":\"常用的CMD命令\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:49:03', 8);
INSERT INTO `sys_oper_log` VALUES (1201, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893506289502380033,\"createBy\":\"admin\",\"duration\":590,\"fileId\":1893508394603487234,\"id\":1893508448470933506,\"materialType\":3,\"name\":\"练习-利用CMD打开QQ\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:49:28', 6);
INSERT INTO `sys_oper_log` VALUES (1202, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893506289502380033,\"createBy\":\"admin\",\"duration\":263,\"fileId\":1893508481996005377,\"id\":1893508510743764994,\"materialType\":3,\"name\":\"Java概述和学习方法\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:49:43', 8);
INSERT INTO `sys_oper_log` VALUES (1203, '课程资料', 1, 'com.eduflex.manage.course_material.controller.CourseMaterialController.add()', 'POST', 1, 'admin', '研发部门', '/manage/material', '127.0.0.1', '内网IP', '{\"chapterId\":1893506289502380033,\"createBy\":\"admin\",\"duration\":1002,\"fileId\":1893508673075912705,\"id\":1893508724015734786,\"materialType\":3,\"name\":\"Java学习-JDK下载和安装\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 11:50:34', 8);
INSERT INTO `sys_oper_log` VALUES (1204, '用户头像', 2, 'com.eduflex.web.controller.system.SysProfileController.avatar()', 'PUT', 1, '202325350123', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '{\"fileId\":\"1893581199318724609\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 16:38:33', 21);
INSERT INTO `sys_oper_log` VALUES (1205, '个人信息', 2, 'com.eduflex.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, '202325350123', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"19722112424@qq.com\",\"nickName\":\"林煜鋒\",\"params\":{},\"phonenumber\":\"15815161606\",\"sex\":0}', '{\"msg\":\"修改用户\'202325350123\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2025-02-23 16:40:30', 5);
INSERT INTO `sys_oper_log` VALUES (1206, '个人信息', 2, 'com.eduflex.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, '202325350123', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"6225587563@qq.com\",\"nickName\":\"林煜鋒\",\"params\":{},\"phonenumber\":\"15815161605\",\"sex\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 16:41:33', 26);
INSERT INTO `sys_oper_log` VALUES (1207, '个人信息', 2, 'com.eduflex.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, '202325350123', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"1972212424@qq.com\",\"nickName\":\"林煜鋒\",\"params\":{},\"phonenumber\":\"15815161605\",\"sex\":0}', '{\"msg\":\"修改用户\'202325350123\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2025-02-23 16:41:38', 7);
INSERT INTO `sys_oper_log` VALUES (1208, '个人信息', 2, 'com.eduflex.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, '202325350123', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"1972212424@qq.com\",\"nickName\":\"林煜鋒\",\"params\":{},\"phonenumber\":\"15815161605\",\"sex\":0}', '{\"msg\":\"修改用户\'202325350123\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2025-02-23 16:42:03', 6);
INSERT INTO `sys_oper_log` VALUES (1209, '个人信息', 2, 'com.eduflex.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, '202325350123', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"1972212424@qq.com\",\"nickName\":\"林煜鋒\",\"params\":{},\"phonenumber\":\"15815161605\",\"sex\":0}', '{\"msg\":\"修改用户\'202325350123\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2025-02-23 16:42:27', 6);
INSERT INTO `sys_oper_log` VALUES (1210, '个人信息', 2, 'com.eduflex.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, '202325350123', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"noexist@qq.com\",\"nickName\":\"林煜鋒\",\"params\":{},\"phonenumber\":\"13090000000\",\"sex\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 16:44:29', 21);
INSERT INTO `sys_oper_log` VALUES (1211, '作业管理', 1, 'com.eduflex.manage.homework.controller.HomeworkController.add()', 'POST', 1, 'admin', '研发部门', '/manage/homework', '127.0.0.1', '内网IP', '{\"content\":\"<p>使用DreamWeaver工具创建一个简单的HTML页面</p>\",\"courseId\":1893330048954441729,\"deadline\":\"2025-02-28 00:00:00\",\"id\":1893592426396831746,\"params\":{},\"title\":\"作业1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 17:23:10', 23);
INSERT INTO `sys_oper_log` VALUES (1212, '课程管理', 1, 'com.eduflex.manage.course.controller.CourseController.add()', 'POST', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1888589040311214082,\"cover\":1893597682493050881,\"createBy\":\"admin\",\"description\":\"Python基础入门\",\"directionId\":1889707213995606018,\"endTime\":\"2025-05-30\",\"id\":1893597689472372737,\"name\":\"Python基础入门\",\"params\":{},\"startTime\":\"2024-10-01\",\"status\":1,\"teacherId\":106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 17:44:05', 83);
INSERT INTO `sys_oper_log` VALUES (1213, '试卷管理', 1, 'com.eduflex.manage.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/manage/paper', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"id\":1893598009229332481,\"params\":{},\"title\":\"Java考试1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 17:45:21', 12);
INSERT INTO `sys_oper_log` VALUES (1214, '考试管理', 1, 'com.eduflex.manage.exam.controller.ExamController.add()', 'POST', 1, 'admin', '研发部门', '/manage/exam', '127.0.0.1', '内网IP', '{\"courseId\":1893505970768830465,\"createBy\":\"admin\",\"createTime\":\"2025-02-23 18:03:28\",\"duration\":120,\"endTime\":\"2025-02-28 12:00:00\",\"id\":1893602567447924737,\"limited\":1,\"name\":\"Java期末考试\",\"paperId\":1893598009229332481,\"params\":{},\"passScore\":70,\"startTime\":\"2025-02-01 12:00:00\",\"totalScore\":140}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 18:03:28', 12);
INSERT INTO `sys_oper_log` VALUES (1215, '考试管理', 2, 'com.eduflex.manage.exam.controller.ExamController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/exam', '127.0.0.1', '内网IP', '{\"endTime\":\"2025-02-28 12:00:00\",\"id\":1893602567447924737,\"limited\":1,\"params\":{},\"published\":1,\"startTime\":\"2025-02-01 12:00:00\",\"updateBy\":\"admin\",\"updateTime\":\"2025-02-23 18:03:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 18:03:33', 11);
INSERT INTO `sys_oper_log` VALUES (1216, '考试管理', 2, 'com.eduflex.manage.exam.controller.ExamController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/exam', '127.0.0.1', '内网IP', '{\"id\":1893602567447924737,\"params\":{},\"status\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-23 18:03:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 18:03:35', 8);
INSERT INTO `sys_oper_log` VALUES (1217, '教师管理', 5, 'com.eduflex.manage.teacher.controller.TeacherController.export()', 'POST', 1, 'admin', '研发部门', '/manage/teacher/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-23 18:42:23', 864);
INSERT INTO `sys_oper_log` VALUES (1218, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"analysis\":\"GET、POST、DELETE 和 CONNECT 都是 HTTP 请求方法，用于客户端与服务器之间的通信。\",\"answer\":\"[\\\"A\\\",\\\"B\\\",\\\"C\\\",\\\"D\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-01-14 17:21:58\",\"deleted\":0,\"difficulty\":1,\"id\":1879096608295407618,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"GET\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"POST\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"DELETE\\\"},{\\\"key\\\":\\\"D\\\",\\\"value\\\":\\\"CONNECT\\\"}]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"以下哪些是 HTTP 的请求方法？\",\"type\":2,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-24 10:09:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-24 10:09:23', 32);
INSERT INTO `sys_oper_log` VALUES (1219, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"answer\":\"[\\\"A\\\",\\\"D\\\",\\\"B\\\",\\\"C\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-02-09 22:07:39\",\"deleted\":0,\"difficulty\":1,\"id\":1888590586725933058,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"根据太阳高度的差异,划分出五带：北寒、北温、热带、南温、南寒；\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"根据获得热量多少的时间差异,划分出四季：春、夏、秋、冬；\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"昼夜长短的变化现象；\\\"},{\\\"key\\\":\\\"D\\\",\\\"value\\\":\\\"正午太阳高度的变化；夏至日太阳直射北回归线，全球正午太阳高度从北回归线向南北两侧逐渐递减；二分日太阳直射赤道，全球正午太阳高度从赤道向两极递减，全球昼夜平分；冬至日太阳直射南回归线，全球正午高度从南回归线向南北两侧逐渐递减，南回归线及其以南的地区正午太阳高度达到最大值，北半球各纬度正午太阳高度达到最小值。\\\"}]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"地球公转产生的现象有（）\",\"type\":2,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-24 10:19:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-24 10:19:35', 11);
INSERT INTO `sys_oper_log` VALUES (1220, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"answer\":\"[\\\"A\\\",\\\"D\\\",\\\"B\\\",\\\"C\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-02-09 22:07:39\",\"deleted\":0,\"difficulty\":1,\"id\":1888590586725933058,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"根据太阳高度的差异,划分出五带：北寒、北温、热带、南温、南寒；\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"根据获得热量多少的时间差异,划分出四季：春、夏、秋、冬；\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"昼夜长短的变化现象；\\\"},{\\\"key\\\":\\\"D\\\",\\\"value\\\":\\\"正午太阳高度的变化；夏至日太阳直射北回归线，全球正午太阳高度从北回归线向南北两侧逐渐递减；二分日太阳直射赤道，全球正午太阳高度从赤道向两极递减，全球昼夜平分；冬至日太阳直射南回归线，全球正午高度从南回归线向南北两侧逐渐递减，南回归线及其以南的地区正午太阳高度达到最大值，北半球各纬度正午太阳高度达到最小值。\\\"}]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"地球公转产生的现象有（）\",\"type\":2,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-24 10:25:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-24 10:25:21', 9);
INSERT INTO `sys_oper_log` VALUES (1221, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"answer\":\"\\\"[\\\\\\\"A\\\\\\\",\\\\\\\"B\\\\\\\",\\\\\\\"C\\\\\\\",\\\\\\\"D\\\\\\\"]\\\"\",\"createBy\":\"admin\",\"createTime\":\"2025-02-09 22:07:39\",\"deleted\":0,\"difficulty\":1,\"id\":1888590586725933058,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"根据太阳高度的差异,划分出五带：北寒、北温、热带、南温、南寒；\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"根据获得热量多少的时间差异,划分出四季：春、夏、秋、冬；\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"昼夜长短的变化现象；\\\"},{\\\"key\\\":\\\"D\\\",\\\"value\\\":\\\"正午太阳高度的变化；夏至日太阳直射北回归线，全球正午太阳高度从北回归线向南北两侧逐渐递减；二分日太阳直射赤道，全球正午太阳高度从赤道向两极递减，全球昼夜平分；冬至日太阳直射南回归线，全球正午高度从南回归线向南北两侧逐渐递减，南回归线及其以南的地区正午太阳高度达到最大值，北半球各纬度正午太阳高度达到最小值。\\\"}]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"地球公转产生的现象有（）\",\"type\":2,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-24 10:25:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-24 10:25:55', 10);
INSERT INTO `sys_oper_log` VALUES (1222, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"answer\":\"[\\\"A\\\",\\\"B\\\",\\\"C\\\",\\\"D\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-02-09 22:07:39\",\"deleted\":0,\"difficulty\":1,\"id\":1888590586725933058,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"根据太阳高度的差异,划分出五带：北寒、北温、热带、南温、南寒；\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"根据获得热量多少的时间差异,划分出四季：春、夏、秋、冬；\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"昼夜长短的变化现象；\\\"},{\\\"key\\\":\\\"D\\\",\\\"value\\\":\\\"正午太阳高度的变化；夏至日太阳直射北回归线，全球正午太阳高度从北回归线向南北两侧逐渐递减；二分日太阳直射赤道，全球正午太阳高度从赤道向两极递减，全球昼夜平分；冬至日太阳直射南回归线，全球正午高度从南回归线向南北两侧逐渐递减，南回归线及其以南的地区正午太阳高度达到最大值，北半球各纬度正午太阳高度达到最小值。\\\"}]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"地球公转产生的现象有（）\",\"type\":2,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-24 10:27:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-24 10:27:03', 7);
INSERT INTO `sys_oper_log` VALUES (1223, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"analysis\":\"三种标准创建方式\",\"answer\":\"[\\\"A\\\",\\\"B\\\",\\\"C\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-02-10 23:43:30\",\"deleted\":0,\"difficulty\":3,\"id\":1888977097418018817,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"继承Thread类\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"实现Runnable接口\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"使用ExecutorService\\\"},{\\\"key\\\":\\\"D\\\",\\\"value\\\":\\\"使用Timer\\\"}]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"实现多线程的方式包括？\",\"type\":2,\"updateBy\":\"admin\",\"updateTime\":\"2025-02-24 10:27:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-24 10:27:21', 6);
INSERT INTO `sys_oper_log` VALUES (1224, '代码生成', 6, 'com.eduflex.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_evalutation\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 10:56:36', 34);
INSERT INTO `sys_oper_log` VALUES (1225, '代码生成', 2, 'com.eduflex.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"evalutation\",\"className\":\"Evalutation\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":327,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-02-25 10:56:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":37,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Score\",\"columnComment\":\"评分\",\"columnId\":328,\"columnName\":\"score\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2025-02-25 10:56:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"score\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":37,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"评论\",\"columnId\":329,\"columnName\":\"content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-02-25 10:56:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":37,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":330,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-02-25 10:56:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"L', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 10:58:28', 42);
INSERT INTO `sys_oper_log` VALUES (1226, '代码生成', 2, 'com.eduflex.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"evalutation\",\"className\":\"Evalutation\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":327,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-02-25 10:56:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":37,\"updateBy\":\"\",\"updateTime\":\"2025-02-25 10:58:28\",\"usableColumn\":false},{\"capJavaField\":\"Score\",\"columnComment\":\"评分\",\"columnId\":328,\"columnName\":\"score\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2025-02-25 10:56:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"score\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":37,\"updateBy\":\"\",\"updateTime\":\"2025-02-25 10:58:28\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"评论\",\"columnId\":329,\"columnName\":\"content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-02-25 10:56:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":37,\"updateBy\":\"\",\"updateTime\":\"2025-02-25 10:58:28\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":330,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-02-25 10:56:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 10:59:15', 34);
INSERT INTO `sys_oper_log` VALUES (1227, '代码生成', 8, 'com.eduflex.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_evalutation\"}', NULL, 0, NULL, '2025-02-25 10:59:19', 119);
INSERT INTO `sys_oper_log` VALUES (1228, '课程评价管理', 1, 'com.eduflex.manage.evaluation.controller.EvaluationController.add()', 'POST', 1, 'admin', '研发部门', '/manage/evaluation', '127.0.0.1', '内网IP', '{\"content\":\"<p>课程很好，资料很齐全</p>\",\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"createTime\":\"2025-02-25 11:18:07\",\"id\":1894225336214188033,\"params\":{},\"score\":5}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in com/eduflex/manage/evaluation/mapper/EvaluationMapper.java (best guess)\r\n### The error may involve com.eduflex.manage.evaluation.mapper.EvaluationMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO tb_evaluation  ( id, score, content,  course_id, create_by, create_time )  VALUES (  ?, ?, ?,  ?, ?, ?  )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2025-02-25 11:18:08', 189);
INSERT INTO `sys_oper_log` VALUES (1229, '课程评价管理', 1, 'com.eduflex.manage.evaluation.controller.EvaluationController.add()', 'POST', 1, 'admin', '研发部门', '/manage/evaluation', '127.0.0.1', '内网IP', '{\"content\":\"<p>课程很好，资料很齐全</p>\",\"courseId\":1893330048954441729,\"createBy\":\"admin\",\"id\":1894225649113419778,\"params\":{},\"score\":5,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 11:19:22', 69);
INSERT INTO `sys_oper_log` VALUES (1230, '学习目标管理', 1, 'com.eduflex.manage.goal.controller.GoalController.add()', 'POST', 1, 'admin', '研发部门', '/manage/goal', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deadline\":\"2025-03-25\",\"description\":\"10天学会Java\",\"goalName\":\"10天学会Java\",\"id\":1899400422510723073,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in com/eduflex/manage/goal/mapper/GoalMapper.java (best guess)\r\n### The error may involve com.eduflex.manage.goal.mapper.GoalMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO tb_goal  ( id,  goal_name, description, deadline, create_by )  VALUES (  ?,  ?, ?, ?, ?  )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2025-03-11 18:02:04', 2912);
INSERT INTO `sys_oper_log` VALUES (1231, '学习目标管理', 1, 'com.eduflex.manage.goal.controller.GoalController.add()', 'POST', 1, 'admin', '研发部门', '/manage/goal', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deadline\":\"2025-03-25\",\"description\":\"10天学会Java\",\"goalName\":\"10天学会Java\",\"id\":1899400460947324930,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in com/eduflex/manage/goal/mapper/GoalMapper.java (best guess)\r\n### The error may involve com.eduflex.manage.goal.mapper.GoalMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO tb_goal  ( id,  goal_name, description, deadline, create_by )  VALUES (  ?,  ?, ?, ?, ?  )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2025-03-11 18:02:13', 5);
INSERT INTO `sys_oper_log` VALUES (1232, '学习目标管理', 1, 'com.eduflex.manage.goal.controller.GoalController.add()', 'POST', 1, 'admin', '研发部门', '/manage/goal', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deadline\":\"2025-03-25\",\"description\":\"10天学会Java\",\"goalName\":\"10天学会Java\",\"id\":1899400965371080705,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 18:04:14', 145);
INSERT INTO `sys_oper_log` VALUES (1233, '学习目标管理', 2, 'com.eduflex.manage.goal.controller.GoalController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/goal', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-11 18:04:14\",\"deadline\":\"2025-03-25\",\"deleted\":0,\"description\":\"10天学会Java10天学会Java10天学会Java10天学会Java10天学会Java10天学会Java10天学会Java\",\"goalName\":\"10天学会Java\",\"id\":1899400965371080705,\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 10:15:19', 35);
INSERT INTO `sys_oper_log` VALUES (1234, '字典类型', 1, 'com.eduflex.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"目标完成状态\",\"dictType\":\"goal_status\",\"params\":{},\"remark\":\"目标完成状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 10:25:30', 14);
INSERT INTO `sys_oper_log` VALUES (1235, '字典数据', 1, 'com.eduflex.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未完成\",\"dictSort\":0,\"dictType\":\"goal_status\",\"dictValue\":\"0\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 10:25:46', 19);
INSERT INTO `sys_oper_log` VALUES (1236, '字典数据', 1, 'com.eduflex.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已完成\",\"dictSort\":1,\"dictType\":\"goal_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 10:25:54', 18);
INSERT INTO `sys_oper_log` VALUES (1237, '代码生成', 3, 'com.eduflex.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/31', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 13:12:25', 95);
INSERT INTO `sys_oper_log` VALUES (1238, '代码生成', 3, 'com.eduflex.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/26', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 13:12:35', 17);
INSERT INTO `sys_oper_log` VALUES (1239, '代码生成', 3, 'com.eduflex.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/25', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 13:12:43', 29);
INSERT INTO `sys_oper_log` VALUES (1240, '代码生成', 6, 'com.eduflex.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_plan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 13:12:51', 123);
INSERT INTO `sys_oper_log` VALUES (1241, '代码生成', 2, 'com.eduflex.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"plan\",\"className\":\"Plan\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":337,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 13:12:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":38,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":338,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 13:12:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":38,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GoalId\",\"columnComment\":\"学习目标ID\",\"columnId\":339,\"columnName\":\"goal_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 13:12:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"goalId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":38,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"计划标题\",\"columnId\":340,\"columnName\":\"title\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 13:12:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 13:14:14', 163);
INSERT INTO `sys_oper_log` VALUES (1242, '代码生成', 8, 'com.eduflex.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_plan\"}', NULL, 0, NULL, '2025-03-12 13:14:17', 550);
INSERT INTO `sys_oper_log` VALUES (1243, '代码生成', 8, 'com.eduflex.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_plan\"}', NULL, 0, NULL, '2025-03-12 13:14:19', 216);
INSERT INTO `sys_oper_log` VALUES (1244, '代码生成', 8, 'com.eduflex.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_plan\"}', NULL, 0, NULL, '2025-03-12 13:14:38', 117);
INSERT INTO `sys_oper_log` VALUES (1245, '代码生成', 8, 'com.eduflex.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_plan\"}', NULL, 0, NULL, '2025-03-12 13:14:38', 104);
INSERT INTO `sys_oper_log` VALUES (1246, '学习目标管理', 1, 'com.eduflex.manage.goal.controller.GoalController.add()', 'POST', 1, 'admin', '研发部门', '/manage/goal', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deadline\":\"2025-03-31\",\"description\":\"10天学会Java\",\"goalName\":\"10天学会Java\",\"id\":1899700088586534913,\"params\":{},\"status\":0,\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 13:52:50', 137);
INSERT INTO `sys_oper_log` VALUES (1247, '学习计划管理', 1, 'com.eduflex.manage.plan.controller.PlanController.add()', 'POST', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"content\":\"学会Java的下载与安装\",\"createBy\":\"admin\",\"createTime\":\"2025-03-12 14:30:49\",\"endTime\":\"2025-03-13\",\"goalId\":1899700088586534913,\"params\":{},\"startTime\":\"2025-03-11\",\"title\":\"Java下载与安装\",\"userId\":104}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in com/eduflex/manage/plan/mapper/PlanMapper.java (best guess)\r\n### The error may involve com.eduflex.manage.plan.mapper.PlanMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO tb_plan  ( user_id, goal_id, title, content, start_time, end_time, create_by, create_time )  VALUES (  ?, ?, ?, ?, ?, ?, ?, ?  )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2025-03-12 14:30:49', 142);
INSERT INTO `sys_oper_log` VALUES (1248, '学习计划管理', 1, 'com.eduflex.manage.plan.controller.PlanController.add()', 'POST', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"content\":\"学会Java的下载与安装\",\"createBy\":\"admin\",\"endTime\":\"2025-03-13\",\"goalId\":1899700088586534913,\"id\":1899711358400368641,\"params\":{},\"startTime\":\"2025-03-11\",\"title\":\"Java下载与安装\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 14:37:37', 145);
INSERT INTO `sys_oper_log` VALUES (1249, '学习计划管理', 1, 'com.eduflex.manage.plan.controller.PlanController.add()', 'POST', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"content\":\"练习Java入门小程序\",\"createBy\":\"admin\",\"endTime\":\"2025-03-14 15:00:00\",\"goalId\":1899700088586534913,\"params\":{},\"startTime\":\"2025-03-13 13:00:00\",\"title\":\"Java入门小程序\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-13 17:12:41', 261);
INSERT INTO `sys_oper_log` VALUES (1250, '课程方向', 3, 'com.eduflex.manage.direction.controller.DirectionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/manage/direction/1893188738571264002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:21:54', 38);
INSERT INTO `sys_oper_log` VALUES (1251, '课程分类', 2, 'com.eduflex.manage.category.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/category', '127.0.0.1', '内网IP', '{\"id\":1893329879890436097,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:28:10', 15);
INSERT INTO `sys_oper_log` VALUES (1252, '课程分类', 2, 'com.eduflex.manage.category.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/category', '127.0.0.1', '内网IP', '{\"id\":1893329879890436097,\"params\":{},\"status\":1,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:28:11', 9);
INSERT INTO `sys_oper_log` VALUES (1253, '课程分类', 2, 'com.eduflex.manage.category.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/category', '127.0.0.1', '内网IP', '{\"id\":1893329879890436097,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:28:38', 7);
INSERT INTO `sys_oper_log` VALUES (1254, '课程分类', 2, 'com.eduflex.manage.category.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/category', '127.0.0.1', '内网IP', '{\"id\":1893329879890436097,\"params\":{},\"status\":1,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:28:39', 10);
INSERT INTO `sys_oper_log` VALUES (1255, '课程分类', 1, 'com.eduflex.manage.category.controller.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/manage/category', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"directionId\":1889705530327379970,\"id\":1902262099632390145,\"name\":\"Vue\",\"params\":{},\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:33:21', 9);
INSERT INTO `sys_oper_log` VALUES (1256, '课程分类', 1, 'com.eduflex.manage.category.controller.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/manage/category', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"directionId\":1889705530327379970,\"id\":1902262140237447169,\"name\":\"React\",\"params\":{},\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:33:31', 8);
INSERT INTO `sys_oper_log` VALUES (1257, '课程分类', 1, 'com.eduflex.manage.category.controller.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/manage/category', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"directionId\":1889705530327379970,\"id\":1902262159128592386,\"name\":\"Angular\",\"params\":{},\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:33:35', 6);
INSERT INTO `sys_oper_log` VALUES (1258, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-10-10 18:47:36\",\"icon\":\"课程管理\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"课程管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"admin/course\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 09:52:31', 35);
INSERT INTO `sys_oper_log` VALUES (1259, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-01-10 15:38:50\",\"icon\":\"题库管理\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2068,\"menuName\":\"考试管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"admin/exams\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 09:52:35', 19);
INSERT INTO `sys_oper_log` VALUES (1260, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"manage/evaluation/index\",\"createTime\":\"2025-02-25 10:59:47\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2156,\"menuName\":\"评价管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"evaluation\",\"perms\":\"manage:evalutation:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 13:06:13', 29);
INSERT INTO `sys_oper_log` VALUES (1261, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"manage/evaluation/index\",\"createTime\":\"2025-02-25 10:59:47\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2156,\"menuName\":\"评价管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"evaluation\",\"perms\":\"manage:evalutation:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 13:06:27', 15);
INSERT INTO `sys_oper_log` VALUES (1262, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-01-10 15:38:50\",\"icon\":\"题库管理\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2068,\"menuName\":\"考试管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"admin/exams\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 13:06:33', 14);
INSERT INTO `sys_oper_log` VALUES (1263, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-01-24 16:58:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2100,\"menuName\":\"学习管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"admin/study\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 13:06:43', 10);
INSERT INTO `sys_oper_log` VALUES (1264, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"manage/evaluation/index\",\"createTime\":\"2025-02-25 10:59:47\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2156,\"menuName\":\"评价管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"evaluation\",\"perms\":\"manage:evalutation:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 13:06:51', 9);
INSERT INTO `sys_oper_log` VALUES (1265, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"manage/course/index\",\"createTime\":\"2024-10-10 20:58:03\",\"icon\":\"课程管理\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2031,\"path\":\"course\",\"perms\":\"manage:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 13:07:31', 13);
INSERT INTO `sys_oper_log` VALUES (1266, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"manage/repo/index\",\"createTime\":\"2025-02-09 20:51:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2131,\"menuName\":\"题库管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2068,\"path\":\"repo\",\"perms\":\"manage:repo:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 13:55:42', 35);
INSERT INTO `sys_oper_log` VALUES (1267, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"manage/question/index\",\"createTime\":\"2025-01-10 16:32:58\",\"icon\":\"题目管理\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2081,\"menuName\":\"题目管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2068,\"path\":\"question\",\"perms\":\"manage:question:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 13:55:46', 13);
INSERT INTO `sys_oper_log` VALUES (1268, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"manage/exam/index\",\"createTime\":\"2025-02-11 12:51:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2143,\"menuName\":\"考试管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2068,\"path\":\"exam\",\"perms\":\"manage:exam:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 13:55:55', 13);
INSERT INTO `sys_oper_log` VALUES (1269, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"manage/paper/index\",\"createTime\":\"2025-01-10 16:32:58\",\"icon\":\"试卷管理\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2075,\"menuName\":\"试卷管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2068,\"path\":\"paper\",\"perms\":\"manage:paper:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 13:56:00', 12);
INSERT INTO `sys_oper_log` VALUES (1270, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"manage/file/index\",\"createTime\":\"2025-01-21 13:07:21\",\"icon\":\"资源管理\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2094,\"menuName\":\"资源管理\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"admin/file\",\"perms\":\"manage:file:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 14:00:48', 13);
INSERT INTO `sys_oper_log` VALUES (1271, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-10-05 13:28:48\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"admin/system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 14:01:02', 12);
INSERT INTO `sys_oper_log` VALUES (1272, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"manage/file/index\",\"createTime\":\"2025-01-21 13:07:21\",\"icon\":\"资源管理\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2094,\"menuName\":\"资源管理\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"admin/file\",\"perms\":\"manage:file:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 14:01:09', 14);
INSERT INTO `sys_oper_log` VALUES (1273, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-10-05 13:28:48\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"admin/monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 14:01:18', 14);
INSERT INTO `sys_oper_log` VALUES (1274, '菜单管理', 3, 'com.eduflex.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-03-26 14:01:23', 12);
INSERT INTO `sys_oper_log` VALUES (1275, '菜单管理', 2, 'com.eduflex.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-10-05 13:28:48\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"admin/tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 14:02:35', 11);
INSERT INTO `sys_oper_log` VALUES (1276, '课程管理', 1, 'com.eduflex.manage.course.controller.CourseController.add()', 'POST', 1, 'admin', '研发部门', '/manage/course', '127.0.0.1', '内网IP', '{\"categoryId\":1865777929406795777,\"createBy\":\"admin\",\"description\":\"Java零基础视频教程_下部\",\"directionId\":1889707213995606018,\"id\":1904925771873423362,\"name\":\"Java零基础视频教程_下部\",\"params\":{},\"teacherId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-26 23:57:50', 28);
INSERT INTO `sys_oper_log` VALUES (1277, '学习计划管理', 1, 'com.eduflex.manage.plan.controller.PlanController.add()', 'POST', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"content\":\"123\",\"createBy\":\"admin\",\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"·123\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 11:24:43', 33);
INSERT INTO `sys_oper_log` VALUES (1278, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"123\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:26:03\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:26:03', 33);
INSERT INTO `sys_oper_log` VALUES (1279, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"1231\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:26:37\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:26:37', 14);
INSERT INTO `sys_oper_log` VALUES (1280, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"1231\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:27:49\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:27:49', 12);
INSERT INTO `sys_oper_log` VALUES (1281, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"12311\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:31:09\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:31:09', 10);
INSERT INTO `sys_oper_log` VALUES (1282, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"123111\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:31:20\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:31:20', 13);
INSERT INTO `sys_oper_log` VALUES (1283, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"1231111\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:33:08\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:33:08', 11);
INSERT INTO `sys_oper_log` VALUES (1284, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"123\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:33:45\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:33:45', 13);
INSERT INTO `sys_oper_log` VALUES (1285, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"123\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:33:58\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:33:58', 16);
INSERT INTO `sys_oper_log` VALUES (1286, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"123\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:34:57\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:34:57', 9);
INSERT INTO `sys_oper_log` VALUES (1287, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"123\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:35:07\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:35:07', 13);
INSERT INTO `sys_oper_log` VALUES (1288, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"123\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:35:46\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:35:46', 20);
INSERT INTO `sys_oper_log` VALUES (1289, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"123\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:36:28\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:36:28', 11);
INSERT INTO `sys_oper_log` VALUES (1290, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"123\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:36:38\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:36:38', 8);
INSERT INTO `sys_oper_log` VALUES (1291, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"123\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:36:55\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:36:55', 10);
INSERT INTO `sys_oper_log` VALUES (1292, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"123\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:37:09\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:37:09', 12);
INSERT INTO `sys_oper_log` VALUES (1293, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"1232\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:37:16\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:37:16', 17);
INSERT INTO `sys_oper_log` VALUES (1294, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"1232\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:43:55\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:43:56', 9);
INSERT INTO `sys_oper_log` VALUES (1295, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"1232\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:44:14\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:44:14', 9);
INSERT INTO `sys_oper_log` VALUES (1296, '学习计划管理', 2, 'com.eduflex.manage.plan.controller.PlanController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/plan', '127.0.0.1', '内网IP', '{\"adjustCount\":0,\"content\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2025-03-29 11:24:43\",\"deleted\":0,\"endTime\":\"2025-03-01 03:00:00\",\"goalId\":1899700088586534913,\"id\":1905823408306450434,\"params\":{},\"priority\":1,\"reminderTime\":\"2025-02-28 23:50:00\",\"startTime\":\"2025-03-01 00:00:00\",\"status\":0,\"title\":\"1232\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-29 19:45:15\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:45:15', 13);
INSERT INTO `sys_oper_log` VALUES (1297, '学习计划管理', 3, 'com.eduflex.manage.plan.controller.PlanController.remove()', 'DELETE', 1, 'admin', '研发部门', '/manage/plan/1905823408306450434', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-29 19:57:59', 22);
INSERT INTO `sys_oper_log` VALUES (1298, '定时任务', 3, 'com.eduflex.quartz.controller.SysJobController.remove()', 'DELETE', 1, 'admin', '研发部门', '/monitor/job/138', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-30 00:31:12', 100);
INSERT INTO `sys_oper_log` VALUES (1299, '定时任务', 3, 'com.eduflex.quartz.controller.SysJobController.remove()', 'DELETE', 1, 'admin', '研发部门', '/monitor/job/139', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-30 00:31:14', 13);
INSERT INTO `sys_oper_log` VALUES (1300, '定时任务', 1, 'com.eduflex.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"0\",\"cronExpression\":\"0 0/10 * * * ?\",\"invokeTarget\":\"planAdjustTask.adjustPlan()\",\"jobGroup\":\"SYSTEM\",\"jobName\":\"自动调控学习计划\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2025-03-30 00:40:00\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'No bean named \'planAdjustTask\' available', '2025-03-30 00:33:14', 14);
INSERT INTO `sys_oper_log` VALUES (1301, '定时任务', 1, 'com.eduflex.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"0\",\"cronExpression\":\"0 0/10 * * * ?\",\"invokeTarget\":\"planAdjustTask.adjustPlan()\",\"jobGroup\":\"SYSTEM\",\"jobName\":\"自动调控学习计划\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2025-03-30 00:40:00\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"新增任务\'自动调控学习计划\'失败，目标字符串不在白名单内\",\"code\":500}', 0, NULL, '2025-03-30 00:34:02', 10);
INSERT INTO `sys_oper_log` VALUES (1302, '定时任务', 1, 'com.eduflex.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"0\",\"cronExpression\":\"0 0/10 * * * ?\",\"invokeTarget\":\"planAdjustTask.adjustPlan()\",\"jobGroup\":\"SYSTEM\",\"jobName\":\"自动调控学习计划\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2025-03-30 00:40:00\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"新增任务\'自动调控学习计划\'失败，目标字符串不在白名单内\",\"code\":500}', 0, NULL, '2025-03-30 00:34:08', 1);
INSERT INTO `sys_oper_log` VALUES (1303, '定时任务', 1, 'com.eduflex.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"0\",\"cronExpression\":\"0 0/10 * * * ?\",\"invokeTarget\":\"planAdjustTask.adjustPlan()\",\"jobGroup\":\"SYSTEM\",\"jobName\":\"自动调控学习计划\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2025-03-30 00:40:00\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"新增任务\'自动调控学习计划\'失败，目标字符串不在白名单内\",\"code\":500}', 0, NULL, '2025-03-30 00:34:19', 1);
INSERT INTO `sys_oper_log` VALUES (1304, '定时任务', 1, 'com.eduflex.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"0\",\"createBy\":\"admin\",\"cronExpression\":\"0 0/10 * * * ?\",\"invokeTarget\":\"planAdjustTask.adjustPlan()\",\"jobGroup\":\"SYSTEM\",\"jobId\":141,\"jobName\":\"自动调控学习计划\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2025-03-30 00:40:00\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-30 00:36:33', 158);
INSERT INTO `sys_oper_log` VALUES (1305, '学生管理', 2, 'com.eduflex.manage.student.controller.StudentController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/manage/student/resetPwd', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2025-04-02 22:49:28\",\"userId\":115,\"userName\":\"20250223\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 22:49:28', 220);
INSERT INTO `sys_oper_log` VALUES (1306, '试卷管理', 1, 'com.eduflex.manage.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/manage/paper', '127.0.0.1', '内网IP', '{\"courseId\":1893330048954441729,\"id\":1908008725755105282,\"params\":{},\"title\":\"考试1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-04 12:08:24', 24);
INSERT INTO `sys_oper_log` VALUES (1307, '考试管理', 2, 'com.eduflex.manage.exam.controller.ExamController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/exam', '127.0.0.1', '内网IP', '{\"id\":1893602567447924737,\"params\":{},\"published\":0,\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-04 14:33:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-04 14:33:48', 24);
INSERT INTO `sys_oper_log` VALUES (1308, '考试管理', 2, 'com.eduflex.manage.exam.controller.ExamController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/exam', '127.0.0.1', '内网IP', '{\"endTime\":\"2025-05-28 12:00:00\",\"id\":1893602567447924737,\"limited\":1,\"params\":{},\"published\":1,\"startTime\":\"2025-02-01 12:00:00\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-04 14:34:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-04 14:34:00', 9);
INSERT INTO `sys_oper_log` VALUES (1309, '考试管理', 2, 'com.eduflex.manage.exam.controller.ExamController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/exam', '127.0.0.1', '内网IP', '{\"id\":1893602567447924737,\"params\":{},\"published\":0,\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-04 14:34:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-04 14:34:04', 8);
INSERT INTO `sys_oper_log` VALUES (1310, '考试管理', 2, 'com.eduflex.manage.exam.controller.ExamController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/exam', '127.0.0.1', '内网IP', '{\"endTime\":\"2025-05-28 12:00:00\",\"id\":1893602567447924737,\"limited\":1,\"params\":{},\"published\":1,\"startTime\":\"2025-02-01 12:00:00\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-04 14:34:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-04 14:34:09', 9);
INSERT INTO `sys_oper_log` VALUES (1311, '考试管理', 2, 'com.eduflex.manage.exam.controller.ExamController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/exam', '127.0.0.1', '内网IP', '{\"id\":1893602567447924737,\"params\":{},\"status\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-04 14:34:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-04 14:34:50', 10);
INSERT INTO `sys_oper_log` VALUES (1312, '考试管理', 2, 'com.eduflex.manage.exam.controller.ExamController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/exam', '127.0.0.1', '内网IP', '{\"id\":1893602567447924737,\"params\":{},\"status\":2,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-04 14:34:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-04 14:34:51', 8);
INSERT INTO `sys_oper_log` VALUES (1313, '考试管理', 2, 'com.eduflex.manage.exam.controller.ExamController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/exam', '127.0.0.1', '内网IP', '{\"id\":1893602567447924737,\"params\":{},\"status\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-04 14:34:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-04 14:34:53', 9);
INSERT INTO `sys_oper_log` VALUES (1314, '题目管理', 1, 'com.eduflex.manage.question.controller.QuestionController.add()', 'POST', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"analysis\":\"123\",\"answer\":\"[\\\"A\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-04-09 22:55:06\",\"difficulty\":1,\"id\":1909983415008636930,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"A\\\"}]\",\"params\":{},\"repoId\":1888589932884271105,\"title\":\"<p>以下哪种语言是面向对象的？<img src=\\\"/dev-api/common/preview/1909983360524627969\\\"></p>\",\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 22:55:06', 20);
INSERT INTO `sys_oper_log` VALUES (1315, '题目管理', 3, 'com.eduflex.manage.question.controller.QuestionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/manage/question/1909983415008636930', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 22:55:26', 35);
INSERT INTO `sys_oper_log` VALUES (1316, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"analysis\":\"StringBuffer线程安全但速度慢\",\"answer\":\"[\\\"A\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-02-10 23:46:00\",\"deleted\":0,\"difficulty\":2,\"id\":1888977725078835201,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"线程安全\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"执行速度\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"存储结构\\\"},{\\\"key\\\":\\\"D\\\",\\\"value\\\":\\\"继承关系\\\"}]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"StringBuffer与StringBuilder的主要区别？\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-09 22:58:27\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 22:58:27', 12);
INSERT INTO `sys_oper_log` VALUES (1317, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"analysis\":\"Python 是一种面向对象的编程语言，支持多种编程范式。\",\"answer\":\"[\\\"A\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-01-14 16:25:17\",\"deleted\":0,\"difficulty\":1,\"id\":1879082351088553986,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"Python\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"C++\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"HTML\\\"}]\",\"params\":{},\"repoId\":1888589932884271105,\"title\":\"<p>以下哪种语言是面向对象的？</p>\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-09 22:58:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 22:58:45', 11);
INSERT INTO `sys_oper_log` VALUES (1318, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"analysis\":\"404 状态码表示客户端请求的资源在服务器上不存在。\",\"answer\":\"[\\\"B\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-01-14 17:21:01\",\"deleted\":0,\"difficulty\":1,\"id\":1879096369215885314,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"请求成功\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"未找到资源\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"服务器错误\\\"},{\\\"key\\\":\\\"D\\\",\\\"value\\\":\\\"无权限访问\\\"}]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"<p>HTTP 状态码 404 的含义是什么？</p>\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-09 22:58:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 22:58:54', 14);
INSERT INTO `sys_oper_log` VALUES (1319, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"analysis\":\"Python 和 C++ 是编程语言，而 HTML 是标记语言，JSON 是数据格式。\",\"answer\":\"[\\\"A\\\",\\\"C\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-01-14 17:21:33\",\"deleted\":0,\"difficulty\":1,\"id\":1879096505274912770,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"Python\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"HTML\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"C++\\\"},{\\\"key\\\":\\\"D\\\",\\\"value\\\":\\\"JSON\\\"}]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"<p>以下哪些是编程语言？</p>\",\"type\":2,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-09 22:58:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 22:58:57', 12);
INSERT INTO `sys_oper_log` VALUES (1320, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"analysis\":\"GET、POST、DELETE 和 CONNECT 都是 HTTP 请求方法，用于客户端与服务器之间的通信。\",\"answer\":\"[\\\"A\\\",\\\"B\\\",\\\"C\\\",\\\"D\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-01-14 17:21:58\",\"deleted\":0,\"difficulty\":1,\"id\":1879096608295407618,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"GET\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"POST\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"DELETE\\\"},{\\\"key\\\":\\\"D\\\",\\\"value\\\":\\\"CONNECT\\\"}]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"<p>以下哪些是 HTTP 的请求方法？</p>\",\"type\":2,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-09 22:59:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 22:59:01', 12);
INSERT INTO `sys_oper_log` VALUES (1321, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"analysis\":\"TCP 是面向连接的协议，提供可靠的数据传输服务。\",\"answer\":\"[false]\",\"createBy\":\"admin\",\"createTime\":\"2025-01-14 17:22:31\",\"deleted\":0,\"difficulty\":1,\"id\":1879096745101021186,\"options\":\"[]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"<p>TCP 协议是无连接的。</p>\",\"type\":3,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-09 22:59:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 22:59:15', 13);
INSERT INTO `sys_oper_log` VALUES (1322, '题目管理', 2, 'com.eduflex.manage.question.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/question', '127.0.0.1', '内网IP', '{\"answer\":\"[\\\"A\\\",\\\"B\\\",\\\"C\\\",\\\"D\\\"]\",\"createBy\":\"admin\",\"createTime\":\"2025-02-09 22:07:39\",\"deleted\":0,\"difficulty\":1,\"id\":1888590586725933058,\"options\":\"[{\\\"key\\\":\\\"A\\\",\\\"value\\\":\\\"根据太阳高度的差异,划分出五带：北寒、北温、热带、南温、南寒；\\\"},{\\\"key\\\":\\\"B\\\",\\\"value\\\":\\\"根据获得热量多少的时间差异,划分出四季：春、夏、秋、冬；\\\"},{\\\"key\\\":\\\"C\\\",\\\"value\\\":\\\"昼夜长短的变化现象；\\\"},{\\\"key\\\":\\\"D\\\",\\\"value\\\":\\\"正午太阳高度的变化；夏至日太阳直射北回归线，全球正午太阳高度从北回归线向南北两侧逐渐递减；二分日太阳直射赤道，全球正午太阳高度从赤道向两极递减，全球昼夜平分；冬至日太阳直射南回归线，全球正午高度从南回归线向南北两侧逐渐递减，南回归线及其以南的地区正午太阳高度达到最大值，北半球各纬度正午太阳高度达到最小值。\\\"}]\",\"params\":{},\"repoId\":1888576625653796865,\"title\":\"<p>地球公转产生的现象有（）</p>\",\"type\":2,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-09 22:59:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 22:59:18', 10);
INSERT INTO `sys_oper_log` VALUES (1323, '学生管理', 5, 'com.eduflex.manage.student.controller.StudentController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-13 13:32:44', 47);
INSERT INTO `sys_oper_log` VALUES (1324, '学生管理', 5, 'com.eduflex.manage.student.controller.StudentController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-13 13:50:26', 980);
INSERT INTO `sys_oper_log` VALUES (1325, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, 'Index 1 out of bounds for length 1', '2025-04-13 13:58:07', 241);
INSERT INTO `sys_oper_log` VALUES (1326, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, 'Index 1 out of bounds for length 1', '2025-04-13 13:58:31', 22);
INSERT INTO `sys_oper_log` VALUES (1327, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, 'Index 1 out of bounds for length 1', '2025-04-13 13:58:43', 19);
INSERT INTO `sys_oper_log` VALUES (1328, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, 'Index 1 out of bounds for length 1', '2025-04-13 14:00:24', 72278);
INSERT INTO `sys_oper_log` VALUES (1329, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, 'Index 1 out of bounds for length 1', '2025-04-13 18:02:31', 152228);
INSERT INTO `sys_oper_log` VALUES (1330, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, 'Index 1 out of bounds for length 1', '2025-04-13 18:03:22', 3009);
INSERT INTO `sys_oper_log` VALUES (1331, '用户管理', 6, 'com.eduflex.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '研发部门', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 202325350100 导入成功\",\"code\":200}', 0, NULL, '2025-04-13 18:04:55', 165);
INSERT INTO `sys_oper_log` VALUES (1332, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, 'Index 1 out of bounds for length 1', '2025-04-13 18:05:44', 18);
INSERT INTO `sys_oper_log` VALUES (1333, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 1222111 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\r\n### The error may exist in file [C:\\Study\\SCAUZJ\\FinalExam\\Backend\\EduFlex\\eduflex-system\\target\\classes\\mapper\\system\\SysUserRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, role_id) values         (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\n; Column \'role_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null', '2025-04-13 19:31:18', 415);
INSERT INTO `sys_oper_log` VALUES (1334, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 9 条数据格式不正确，错误如下：<br/>1、账号 202325350100 已存在<br/>2、账号 202325350101 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\r\n### The error may exist in file [C:\\Study\\SCAUZJ\\FinalExam\\Backend\\EduFlex\\eduflex-system\\target\\classes\\mapper\\system\\SysUserRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, role_id) values         (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\n; Column \'role_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null<br/>3、账号 202325350102 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\r\n### The error may exist in file [C:\\Study\\SCAUZJ\\FinalExam\\Backend\\EduFlex\\eduflex-system\\target\\classes\\mapper\\system\\SysUserRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, role_id) values         (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\n; Column \'role_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null<br/>4、账号 202325350103 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\r\n### The error may exist in file [C:\\Study\\SCAUZJ\\FinalExam\\Backend\\EduFlex\\eduflex-system\\target\\classes\\mapper\\system\\SysUserRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, role_id) values         (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be n', '2025-04-13 19:31:39', 675);
INSERT INTO `sys_oper_log` VALUES (1335, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 9 条数据格式不正确，错误如下：<br/>1、账号 202325350100 已存在<br/>2、账号 202325350101 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\r\n### The error may exist in file [C:\\Study\\SCAUZJ\\FinalExam\\Backend\\EduFlex\\eduflex-system\\target\\classes\\mapper\\system\\SysUserRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, role_id) values         (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\n; Column \'role_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null<br/>3、账号 202325350102 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\r\n### The error may exist in file [C:\\Study\\SCAUZJ\\FinalExam\\Backend\\EduFlex\\eduflex-system\\target\\classes\\mapper\\system\\SysUserRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, role_id) values         (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\n; Column \'role_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null<br/>4、账号 202325350103 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be null\r\n### The error may exist in file [C:\\Study\\SCAUZJ\\FinalExam\\Backend\\EduFlex\\eduflex-system\\target\\classes\\mapper\\system\\SysUserRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, role_id) values         (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'role_id\' cannot be n', '2025-04-13 19:34:07', 85898);
INSERT INTO `sys_oper_log` VALUES (1336, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 202325350100 已存在<br/>2、账号 202325350106 已存在', '2025-04-13 19:38:12', 1387);
INSERT INTO `sys_oper_log` VALUES (1337, '学生管理', 6, 'com.eduflex.manage.student.controller.StudentController.importData()', 'POST', 1, 'admin', '研发部门', '/manage/student/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 202325350106 已存在', '2025-04-13 19:41:16', 1718);
INSERT INTO `sys_oper_log` VALUES (1338, '学生管理', 2, 'com.eduflex.manage.student.controller.StudentController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/manage/student/resetPwd', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 19:41:36\",\"userId\":143,\"userName\":\"202325350104\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-13 19:41:36', 107);
INSERT INTO `sys_oper_log` VALUES (1339, '学生管理', 2, 'com.eduflex.manage.student.controller.StudentController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/manage/student/resetPwd', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 19:41:40\",\"userId\":143,\"userName\":\"202325350104\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-13 19:41:40', 82);
INSERT INTO `sys_oper_log` VALUES (1340, '学生管理', 2, 'com.eduflex.manage.student.controller.StudentController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/manage/student/resetPwd', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 19:42:18\",\"userId\":142,\"userName\":\"202325350103\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-13 19:42:18', 79);
INSERT INTO `sys_oper_log` VALUES (1341, '学生管理', 5, 'com.eduflex.manage.student.controller.StudentController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-13 19:42:26', 357);
INSERT INTO `sys_oper_log` VALUES (1342, '学生管理', 5, 'com.eduflex.manage.student.controller.StudentController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-14 23:21:48', 1133);
INSERT INTO `sys_oper_log` VALUES (1343, '教师管理', 5, 'com.eduflex.manage.teacher.controller.TeacherController.export()', 'POST', 1, 'admin', '研发部门', '/manage/teacher/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-14 23:23:27', 42);
INSERT INTO `sys_oper_log` VALUES (1344, '教师管理', 5, 'com.eduflex.manage.teacher.controller.TeacherController.export()', 'POST', 1, 'admin', '研发部门', '/manage/teacher/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-14 23:58:22', 1251);
INSERT INTO `sys_oper_log` VALUES (1345, '教师管理', 1, 'com.eduflex.manage.teacher.controller.TeacherController.add()', 'POST', 1, 'admin', '研发部门', '/manage/teacher', '127.0.0.1', '内网IP', '{\"avatar\":1893339122660020225,\"createBy\":\"admin\",\"email\":\"625587563@qq.com\",\"nickName\":\"王冰冰\",\"params\":{},\"phonenumber\":\"13800000000\",\"roleId\":3,\"sex\":2,\"status\":0,\"userId\":112,\"userName\":\"wangbingbing\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'112\' for key \'sys_user.PRIMARY\'\r\n### The error may exist in file [C:\\Study\\SCAUZJ\\FinalExam\\Backend\\EduFlex\\eduflex-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.eduflex.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,       avatar,       phonenumber,       sex,       password,       status,       create_by,      create_time    )values(      ?,             ?,       ?,       ?,       ?,       ?,       ?,       ?,       ?,       ?,      sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'112\' for key \'sys_user.PRIMARY\'\n; Duplicate entry \'112\' for key \'sys_user.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'112\' for key \'sys_user.PRIMARY\'', '2025-04-15 00:18:29', 313);
INSERT INTO `sys_oper_log` VALUES (1346, '教师管理', 1, 'com.eduflex.manage.teacher.controller.TeacherController.add()', 'POST', 1, 'admin', '研发部门', '/manage/teacher', '127.0.0.1', '内网IP', '{\"avatar\":1893339122660020225,\"createBy\":\"admin\",\"email\":\"625587563@qq.com\",\"nickName\":\"王冰冰\",\"params\":{},\"phonenumber\":\"13800000000\",\"roleId\":3,\"sex\":2,\"status\":0,\"userId\":112,\"userName\":\"wangbingbing\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'112\' for key \'sys_user.PRIMARY\'\r\n### The error may exist in file [C:\\Study\\SCAUZJ\\FinalExam\\Backend\\EduFlex\\eduflex-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.eduflex.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,             user_name,       nick_name,       email,       avatar,       phonenumber,       sex,       password,       status,       create_by,      create_time    )values(      ?,             ?,       ?,       ?,       ?,       ?,       ?,       ?,       ?,       ?,      sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'112\' for key \'sys_user.PRIMARY\'\n; Duplicate entry \'112\' for key \'sys_user.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'112\' for key \'sys_user.PRIMARY\'', '2025-04-15 00:18:39', 95);
INSERT INTO `sys_oper_log` VALUES (1347, '教师管理', 2, 'com.eduflex.manage.teacher.controller.TeacherController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/teacher', '127.0.0.1', '内网IP', '{\"avatar\":1891509518936834049,\"email\":\"625587563@qq.com\",\"nickName\":\"王冰冰\",\"params\":{},\"phonenumber\":\"13800000000\",\"roleId\":3,\"sex\":2,\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-15 00:19:13\",\"userId\":112,\"userName\":\"wangbingbing\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-04-15 00:19:13', 125);
INSERT INTO `sys_oper_log` VALUES (1348, '教师管理', 2, 'com.eduflex.manage.teacher.controller.TeacherController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/teacher', '127.0.0.1', '内网IP', '{\"avatar\":1891509518936834049,\"email\":\"625587563@qq.com\",\"nickName\":\"王冰冰\",\"params\":{},\"phonenumber\":\"13800000000\",\"roleId\":3,\"sex\":2,\"status\":0,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-15 00:19:20\",\"userId\":112,\"userName\":\"wangbingbing\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-04-15 00:19:20', 50);
INSERT INTO `sys_oper_log` VALUES (1349, '教师管理', 2, 'com.eduflex.manage.teacher.controller.TeacherController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/teacher', '127.0.0.1', '内网IP', '{\"avatar\":1891509518936834049,\"email\":\"625587563@qq.com\",\"nickName\":\"王冰冰\",\"params\":{},\"phonenumber\":\"13800000000\",\"roleId\":3,\"sex\":2,\"status\":0,\"updateBy\":\"admin\",\"userId\":112,\"userName\":\"wangbingbing\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-04-15 00:21:47', 301);
INSERT INTO `sys_oper_log` VALUES (1350, '教师管理', 2, 'com.eduflex.manage.teacher.controller.TeacherController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/teacher', '127.0.0.1', '内网IP', '{\"avatar\":1891509518936834049,\"email\":\"625587563@qq.com\",\"nickName\":\"王冰冰\",\"params\":{},\"phonenumber\":\"13800000000\",\"roleId\":3,\"sex\":2,\"status\":0,\"updateBy\":\"admin\",\"userId\":112,\"userName\":\"wangbingbing\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-04-15 00:28:41', 66903);
INSERT INTO `sys_oper_log` VALUES (1351, '教师管理', 2, 'com.eduflex.manage.teacher.controller.TeacherController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/teacher', '127.0.0.1', '内网IP', '{\"avatar\":1891509518936834049,\"email\":\"1972212424@qq.com\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"15815161602\",\"roleId\":3,\"sex\":0,\"status\":0,\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"zhangsan\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-04-15 22:33:44', 3058);
INSERT INTO `sys_oper_log` VALUES (1352, '教师管理', 2, 'com.eduflex.manage.teacher.controller.TeacherController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/teacher', '127.0.0.1', '内网IP', '{\"avatar\":1891509518936834049,\"email\":\"1972212424@qq.com\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"15815161602\",\"roleId\":3,\"sex\":0,\"status\":0,\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"zhangsan\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-04-15 22:33:45', 41);
INSERT INTO `sys_oper_log` VALUES (1353, '教师管理', 2, 'com.eduflex.manage.teacher.controller.TeacherController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/teacher', '127.0.0.1', '内网IP', '{\"avatar\":1891509518936834049,\"email\":\"1972212424@qq.com\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"15815161602\",\"roleId\":3,\"sex\":0,\"status\":0,\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"zhangsan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 22:34:48', 2569);
INSERT INTO `sys_oper_log` VALUES (1354, '教师管理', 2, 'com.eduflex.manage.teacher.controller.TeacherController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/teacher', '127.0.0.1', '内网IP', '{\"avatar\":1891509518936834049,\"email\":\"1972212424@qq.com\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"15815161602\",\"roleId\":3,\"sex\":1,\"status\":0,\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"zhangsan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 22:34:52', 39);
INSERT INTO `sys_oper_log` VALUES (1355, '教师管理', 2, 'com.eduflex.manage.teacher.controller.TeacherController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/teacher', '127.0.0.1', '内网IP', '{\"avatar\":1891509518936834049,\"email\":\"1972212424@qq.com\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"15815161602\",\"roleId\":3,\"sex\":0,\"status\":0,\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"zhangsan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 22:34:57', 33);
INSERT INTO `sys_oper_log` VALUES (1356, '课程方向', 3, 'com.eduflex.manage.direction.controller.DirectionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/manage/direction/1889707641961320449', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 22:37:12', 26);
INSERT INTO `sys_oper_log` VALUES (1357, '课程方向', 3, 'com.eduflex.manage.direction.controller.DirectionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/manage/direction/1889707708529119234', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 22:37:24', 6);
INSERT INTO `sys_oper_log` VALUES (1358, '课程方向', 3, 'com.eduflex.manage.direction.controller.DirectionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/manage/direction/1889707731149000706', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 22:37:26', 8);
INSERT INTO `sys_oper_log` VALUES (1359, '课程方向', 3, 'com.eduflex.manage.direction.controller.DirectionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/manage/direction/1889707757073993730', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 23:01:45', 106);
INSERT INTO `sys_oper_log` VALUES (1360, '课程管理', 5, 'com.eduflex.manage.course.controller.CourseController.export()', 'POST', 1, 'admin', '研发部门', '/manage/course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-15 23:07:14', 1011);
INSERT INTO `sys_oper_log` VALUES (1361, '课程管理', 5, 'com.eduflex.manage.course.controller.CourseController.export()', 'POST', 1, 'admin', '研发部门', '/manage/course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-15 23:27:14', 1156);
INSERT INTO `sys_oper_log` VALUES (1362, '学生选课', 5, 'com.eduflex.manage.student.controller.StudentCourseController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student_course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\",\"progressList[1]\":\"100\",\"progressList[0]\":\"0\"}', NULL, 0, NULL, '2025-04-17 20:18:26', 1061);
INSERT INTO `sys_oper_log` VALUES (1363, '学生选课', 5, 'com.eduflex.manage.student.controller.StudentCourseController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student_course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\",\"progressList[1]\":\"100\",\"progressList[0]\":\"0\"}', NULL, 0, NULL, '2025-04-17 20:21:21', 1589);
INSERT INTO `sys_oper_log` VALUES (1364, '学生选课', 5, 'com.eduflex.manage.student.controller.StudentCourseController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student_course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\",\"progressList[1]\":\"100\",\"progressList[0]\":\"0\"}', NULL, 0, NULL, '2025-04-17 20:25:15', 1768);
INSERT INTO `sys_oper_log` VALUES (1365, '学生选课', 5, 'com.eduflex.manage.student.controller.StudentCourseController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student_course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\",\"progressList[1]\":\"100\",\"progressList[0]\":\"0\"}', NULL, 0, NULL, '2025-04-17 20:26:12', 192);
INSERT INTO `sys_oper_log` VALUES (1366, '学生选课', 5, 'com.eduflex.manage.student.controller.StudentCourseController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student_course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\",\"progressList[1]\":\"100\",\"progressList[0]\":\"0\"}', NULL, 0, NULL, '2025-04-17 20:30:50', 1756);
INSERT INTO `sys_oper_log` VALUES (1367, '作业管理', 2, 'com.eduflex.manage.homework.controller.HomeworkController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/homework', '127.0.0.1', '内网IP', '{\"content\":\"<p>使用DreamWeaver工具创建一个简单的HTML页面</p>\",\"courseId\":1893330048954441729,\"createTime\":\"2025-02-23 17:23:10\",\"deleted\":0,\"id\":1893592426396831746,\"params\":{},\"title\":\"作业1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 21:06:00', 34);
INSERT INTO `sys_oper_log` VALUES (1368, '课程管理', 5, 'com.eduflex.manage.course.controller.CourseController.export()', 'POST', 1, 'admin', '研发部门', '/manage/course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-22 19:19:08', 928);
INSERT INTO `sys_oper_log` VALUES (1369, '学生选课', 5, 'com.eduflex.manage.student.controller.StudentCourseController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student_course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\",\"progressList[1]\":\"100\",\"progressList[0]\":\"0\"}', NULL, 0, NULL, '2025-04-22 19:19:59', 152);
INSERT INTO `sys_oper_log` VALUES (1370, '作业管理', 5, 'com.eduflex.manage.homework.controller.HomeworkController.export()', 'POST', 1, 'admin', '研发部门', '/manage/homework/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-04-22 19:24:14', 36);
INSERT INTO `sys_oper_log` VALUES (1371, '作业管理', 2, 'com.eduflex.manage.homework.controller.HomeworkController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/homework', '127.0.0.1', '内网IP', '{\"content\":\"<p>使用DreamWeaver工具创建一个简单的HTML页面</p><p><img src=\\\"/dev-api/common/preview/1914641983745961986\\\"></p>\",\"courseId\":1893330048954441729,\"createTime\":\"2025-02-23 17:23:10\",\"deleted\":0,\"id\":1893592426396831746,\"params\":{},\"title\":\"作业1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-22 19:26:37', 18);
INSERT INTO `sys_oper_log` VALUES (1372, '作业管理', 5, 'com.eduflex.manage.homework.controller.HomeworkController.export()', 'POST', 1, 'admin', '研发部门', '/manage/homework/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-04-22 19:37:52', 38);
INSERT INTO `sys_oper_log` VALUES (1373, '作业管理', 5, 'com.eduflex.manage.homework.controller.HomeworkController.export()', 'POST', 1, 'admin', '研发部门', '/manage/homework/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-04-22 19:40:29', 28);
INSERT INTO `sys_oper_log` VALUES (1374, '学生管理', 5, 'com.eduflex.manage.student.controller.StudentController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-22 23:14:06', 1106);
INSERT INTO `sys_oper_log` VALUES (1375, '作业管理', 5, 'com.eduflex.manage.homework.controller.HomeworkController.export()', 'POST', 1, 'admin', '研发部门', '/manage/homework/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-04-22 23:22:30', 34);
INSERT INTO `sys_oper_log` VALUES (1376, '作业管理', 2, 'com.eduflex.manage.homework.controller.HomeworkController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/homework', '127.0.0.1', '内网IP', '{\"content\":\"<p>使用DreamWeaver工具创建一个简单的HTML页面</p><p><img src=\\\"/dev-api/common/preview/1914705912840986626\\\"></p>\",\"courseId\":1893330048954441729,\"createTime\":\"2025-02-23 17:23:10\",\"deleted\":0,\"id\":1893592426396831746,\"params\":{},\"title\":\"作业1\",\"updateTime\":\"2025-04-22 19:26:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-22 23:40:38', 37);
INSERT INTO `sys_oper_log` VALUES (1377, '作业管理', 2, 'com.eduflex.manage.homework.controller.HomeworkController.edit()', 'PUT', 1, 'admin', '研发部门', '/manage/homework', '127.0.0.1', '内网IP', '{\"content\":\"<p>使用DreamWeaver工具创建一个简单的HTML页面</p><p><img src=\\\"/dev-api/common/preview/1914706087395336194\\\"><img src=\\\"/dev-api/common/preview/1914705912840986626\\\"></p>\",\"courseId\":1893330048954441729,\"createTime\":\"2025-02-23 17:23:10\",\"deleted\":0,\"id\":1893592426396831746,\"params\":{},\"title\":\"作业1\",\"updateTime\":\"2025-04-22 19:26:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-22 23:46:38', 15);
INSERT INTO `sys_oper_log` VALUES (1378, '用户头像', 2, 'com.eduflex.web.controller.system.SysProfileController.avatar()', 'PUT', 1, '202325350123', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '{\"fileId\":\"1915213883945689090\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 09:19:07', 18);
INSERT INTO `sys_oper_log` VALUES (1379, '字典数据', 2, 'com.eduflex.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-02-19 10:09:59\",\"default\":false,\"dictCode\":133,\"dictLabel\":\"已批阅\",\"dictSort\":3,\"dictType\":\"homework_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 11:55:20', 22);
INSERT INTO `sys_oper_log` VALUES (1380, '字典数据', 2, 'com.eduflex.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-02-19 10:09:48\",\"default\":false,\"dictCode\":132,\"dictLabel\":\"待批阅\",\"dictSort\":2,\"dictType\":\"homework_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 11:55:27', 17);
INSERT INTO `sys_oper_log` VALUES (1381, '字典数据', 2, 'com.eduflex.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-02-19 10:09:37\",\"default\":false,\"dictCode\":131,\"dictLabel\":\"未做\",\"dictSort\":1,\"dictType\":\"homework_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-06 11:55:35', 15);
INSERT INTO `sys_oper_log` VALUES (1382, '批阅作业', 2, 'com.eduflex.manage.homework.controller.StudentHomeworkController.check()', 'PUT', 1, 'admin', '研发部门', '/manage/student_homework/check', '127.0.0.1', '内网IP', '{\"answer\":\"<p>啦啦啦啦</p><pre class=\\\"ql-syntax\\\" spellcheck=\\\"false\\\">import pandas as pd\\n\\nprint(\\\"hello world\\\")\\n</pre>\\n<pre class=\\\"ql-syntax\\\" spellcheck=\\\"false\\\">import pandas as pd\\n\\nprint(\\\"hello world\\\")\\n</pre>\\n<pre class=\\\"ql-syntax\\\" spellcheck=\\\"false\\\">import pandas as pd\\n\\nprint(\\\"hello world\\\")\\n</pre>\\n<pre class=\\\"ql-syntax\\\" spellcheck=\\\"false\\\">import pandas as pd\\n\\nprint(\\\"hello world\\\")\\n</pre>\\n<pre class=\\\"ql-syntax\\\" spellcheck=\\\"false\\\">import pandas as pd\\n\\nprint(\\\"hello world\\\")\\n</pre>\\n<pre class=\\\"ql-syntax\\\" spellcheck=\\\"false\\\">import pandas as pd\\n\\nprint(\\\"hello world\\\")\\n</pre>\",\"createBy\":\"202325350123\",\"createTime\":\"2025-04-23 00:06:28\",\"deleted\":0,\"homeworkId\":1893592426396831746,\"id\":1914712418953076738,\"params\":{},\"score\":4,\"status\":2,\"submitTime\":\"2025-04-23 00:06:29\",\"suggestion\":\"21312312\",\"updateBy\":\"admin\",\"updateTime\":\"2025-05-06 16:35:26\",\"userId\":104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-08 10:12:37', 49);
INSERT INTO `sys_oper_log` VALUES (1383, '学生作业管理', 5, 'com.eduflex.manage.homework.controller.StudentHomeworkController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student_homework/export', '127.0.0.1', '内网IP', '{\"homeworkId\":\"1893592426396831746\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-08 11:08:47', 1069);
INSERT INTO `sys_oper_log` VALUES (1384, '学生作业管理', 5, 'com.eduflex.manage.homework.controller.StudentHomeworkController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student_homework/export', '127.0.0.1', '内网IP', '{\"homeworkId\":\"1893592426396831746\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-08 11:12:12', 65);
INSERT INTO `sys_oper_log` VALUES (1385, '作业管理', 5, 'com.eduflex.manage.homework.controller.HomeworkController.export()', 'POST', 1, 'admin', '研发部门', '/manage/homework/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 11:12:37', 43);
INSERT INTO `sys_oper_log` VALUES (1386, '轮播图', 1, 'com.eduflex.manage.carousel.controller.CarouselController.add()', 'POST', 1, 'admin', '研发部门', '/manage/carousel', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"id\":1920320724153339906,\"imgIds\":\"1920320715106226178,1920320715106226179,1920320715106226177\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-08 11:31:53', 18);
INSERT INTO `sys_oper_log` VALUES (1387, '轮播图', 2, 'com.eduflex.manage.carousel.controller.CarouselController.enable()', 'PUT', 1, 'admin', '研发部门', '/manage/carousel/enable/1920320724153339906', '127.0.0.1', '内网IP', '1920320724153339906', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-08 11:31:54', 52);
INSERT INTO `sys_oper_log` VALUES (1388, '轮播图', 1, 'com.eduflex.manage.carousel.controller.CarouselController.add()', 'POST', 1, 'admin', '研发部门', '/manage/carousel', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"id\":1920321752231776258,\"imgIds\":\"1920321745915154434,1920321745915154435,1920321745982263297\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-08 11:35:58', 5);
INSERT INTO `sys_oper_log` VALUES (1389, '轮播图', 2, 'com.eduflex.manage.carousel.controller.CarouselController.enable()', 'PUT', 1, 'admin', '研发部门', '/manage/carousel/enable/1920321752231776258', '127.0.0.1', '内网IP', '1920321752231776258', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-08 11:35:59', 27);
INSERT INTO `sys_oper_log` VALUES (1390, '课程管理', 5, 'com.eduflex.manage.course.controller.CourseController.export()', 'POST', 1, 'admin', '研发部门', '/manage/course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-08 13:21:05', 1221);
INSERT INTO `sys_oper_log` VALUES (1391, '学生选课', 5, 'com.eduflex.manage.student.controller.StudentCourseController.export()', 'POST', 1, 'admin', '研发部门', '/manage/student_course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\",\"progressList[1]\":\"100\",\"progressList[0]\":\"0\"}', NULL, 0, NULL, '2025-05-08 13:21:22', 190);
INSERT INTO `sys_oper_log` VALUES (1392, '评论管理', 5, 'com.eduflex.manage.comment.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/manage/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:22:26', 84);
INSERT INTO `sys_oper_log` VALUES (1393, '评论管理', 5, 'com.eduflex.manage.comment.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/manage/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:23:56', 98);
INSERT INTO `sys_oper_log` VALUES (1394, '评论管理', 5, 'com.eduflex.manage.comment.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/manage/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:25:43', 1305);
INSERT INTO `sys_oper_log` VALUES (1395, '评论管理', 5, 'com.eduflex.manage.comment.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/manage/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:27:59', 1231);
INSERT INTO `sys_oper_log` VALUES (1396, '评论管理', 5, 'com.eduflex.manage.comment.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/manage/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:30:31', 1058);
INSERT INTO `sys_oper_log` VALUES (1397, '课程评价管理', 5, 'com.eduflex.manage.evaluation.controller.EvaluationController.export()', 'POST', 1, 'admin', '研发部门', '/manage/evaluation/export', '127.0.0.1', '内网IP', '{\"score\":\"0\",\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:31:07', 60);
INSERT INTO `sys_oper_log` VALUES (1398, '课程评价管理', 5, 'com.eduflex.manage.evaluation.controller.EvaluationController.export()', 'POST', 1, 'admin', '研发部门', '/manage/evaluation/export', '127.0.0.1', '内网IP', '{\"score\":\"0\",\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:36:27', 885);
INSERT INTO `sys_oper_log` VALUES (1399, '课程评价管理', 5, 'com.eduflex.manage.evaluation.controller.EvaluationController.export()', 'POST', 1, 'admin', '研发部门', '/manage/evaluation/export', '127.0.0.1', '内网IP', '{\"score\":\"0\",\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:37:13', 10973);
INSERT INTO `sys_oper_log` VALUES (1400, '课程评价管理', 5, 'com.eduflex.manage.evaluation.controller.EvaluationController.export()', 'POST', 1, 'admin', '研发部门', '/manage/evaluation/export', '127.0.0.1', '内网IP', '{\"score\":\"0\",\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:37:38', 17987);
INSERT INTO `sys_oper_log` VALUES (1401, '课程评价管理', 5, 'com.eduflex.manage.evaluation.controller.EvaluationController.export()', 'POST', 1, 'admin', '研发部门', '/manage/evaluation/export', '127.0.0.1', '内网IP', '{\"score\":\"0\",\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:38:40', 59181);
INSERT INTO `sys_oper_log` VALUES (1402, '课程评价管理', 5, 'com.eduflex.manage.evaluation.controller.EvaluationController.export()', 'POST', 1, 'admin', '研发部门', '/manage/evaluation/export', '127.0.0.1', '内网IP', '{\"score\":\"0\",\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:39:36', 33001);
INSERT INTO `sys_oper_log` VALUES (1403, '课程评价管理', 5, 'com.eduflex.manage.evaluation.controller.EvaluationController.export()', 'POST', 1, 'admin', '研发部门', '/manage/evaluation/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:39:49', 9876);
INSERT INTO `sys_oper_log` VALUES (1404, '课程评价管理', 5, 'com.eduflex.manage.evaluation.controller.EvaluationController.export()', 'POST', 1, 'admin', '研发部门', '/manage/evaluation/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:39:56', 53);
INSERT INTO `sys_oper_log` VALUES (1405, '题库管理', 5, 'com.eduflex.manage.repo.controller.RepoController.export()', 'POST', 1, 'admin', '研发部门', '/manage/repo/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:40:19', 62);
INSERT INTO `sys_oper_log` VALUES (1406, '题库管理', 5, 'com.eduflex.manage.repo.controller.RepoController.export()', 'POST', 1, 'admin', '研发部门', '/manage/repo/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 13:44:51', 1172);
INSERT INTO `sys_oper_log` VALUES (1407, '题库管理', 5, 'com.eduflex.manage.repo.controller.RepoController.export()', 'POST', 1, 'admin', '研发部门', '/manage/repo/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893505970768830465\"}', NULL, 0, NULL, '2025-05-08 13:45:05', 101);
INSERT INTO `sys_oper_log` VALUES (1408, '题目管理', 5, 'com.eduflex.manage.question.controller.QuestionController.export()', 'POST', 1, 'admin', '研发部门', '/manage/question/export', '127.0.0.1', '内网IP', '{\"repoId\":\"1888576625653796865\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-08 13:49:14', 307);
INSERT INTO `sys_oper_log` VALUES (1409, '题目管理', 5, 'com.eduflex.manage.question.controller.QuestionController.export()', 'POST', 1, 'admin', '研发部门', '/manage/question/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-08 13:49:53', 299);
INSERT INTO `sys_oper_log` VALUES (1410, '题目管理', 5, 'com.eduflex.manage.question.controller.QuestionController.export()', 'POST', 1, 'admin', '研发部门', '/manage/question/export', '127.0.0.1', '内网IP', '{\"repoId\":\"1888589932884271105\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-08 13:50:14', 51);
INSERT INTO `sys_oper_log` VALUES (1411, '试卷管理', 5, 'com.eduflex.manage.paper.controller.PaperController.export()', 'POST', 1, 'admin', '研发部门', '/manage/paper/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 16:43:36', 986);
INSERT INTO `sys_oper_log` VALUES (1412, '试卷管理', 5, 'com.eduflex.manage.paper.controller.PaperController.export()', 'POST', 1, 'admin', '研发部门', '/manage/paper/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893330048954441729\"}', NULL, 0, NULL, '2025-05-08 16:51:41', 1085);
INSERT INTO `sys_oper_log` VALUES (1413, '考试管理', 5, 'com.eduflex.manage.exam.controller.ExamController.export()', 'POST', 1, 'admin', '研发部门', '/manage/exam/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893505970768830465\"}', NULL, 0, NULL, '2025-05-08 16:52:06', 58);
INSERT INTO `sys_oper_log` VALUES (1414, '考试管理', 5, 'com.eduflex.manage.exam.controller.ExamController.export()', 'POST', 1, 'admin', '研发部门', '/manage/exam/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893505970768830465\"}', NULL, 0, NULL, '2025-05-08 17:00:16', 1040);
INSERT INTO `sys_oper_log` VALUES (1415, '考试管理', 5, 'com.eduflex.manage.exam.controller.ExamController.export()', 'POST', 1, 'admin', '研发部门', '/manage/exam/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"courseId\":\"1893505970768830465\"}', NULL, 0, NULL, '2025-05-08 17:09:11', 982);
INSERT INTO `sys_oper_log` VALUES (1416, '学习目标管理', 5, 'com.eduflex.manage.goal.controller.GoalController.export()', 'POST', 1, 'admin', '研发部门', '/manage/goal/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"userId\":\"104\"}', NULL, 0, NULL, '2025-05-08 17:33:12', 957);
INSERT INTO `sys_oper_log` VALUES (1417, '学习目标管理', 5, 'com.eduflex.manage.goal.controller.GoalController.export()', 'POST', 1, 'admin', '研发部门', '/manage/goal/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"userId\":\"104\"}', NULL, 0, NULL, '2025-05-08 17:34:08', 49);
INSERT INTO `sys_oper_log` VALUES (1418, '学习计划管理', 5, 'com.eduflex.manage.plan.controller.PlanController.export()', 'POST', 1, 'admin', '研发部门', '/manage/plan/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"userId\":\"104\"}', NULL, 0, NULL, '2025-05-08 17:39:26', 1049);
INSERT INTO `sys_oper_log` VALUES (1419, '学习计划管理', 5, 'com.eduflex.manage.plan.controller.PlanController.export()', 'POST', 1, 'admin', '研发部门', '/manage/plan/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"userId\":\"104\"}', NULL, 0, NULL, '2025-05-08 17:42:20', 1109);
INSERT INTO `sys_oper_log` VALUES (1420, '学习目标管理', 5, 'com.eduflex.manage.goal.controller.GoalController.export()', 'POST', 1, 'admin', '研发部门', '/manage/goal/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"userId\":\"104\"}', NULL, 0, NULL, '2025-05-08 17:44:15', 118);
INSERT INTO `sys_oper_log` VALUES (1421, '学习目标管理', 5, 'com.eduflex.manage.goal.controller.GoalController.export()', 'POST', 1, 'admin', '研发部门', '/manage/goal/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"userId\":\"104\"}', NULL, 0, NULL, '2025-05-08 17:46:28', 994);
INSERT INTO `sys_oper_log` VALUES (1422, '资源管理', 5, 'com.eduflex.manage.file.controller.OssFileController.export()', 'POST', 1, 'admin', '研发部门', '/manage/files/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-08 17:52:06', 1254);
INSERT INTO `sys_oper_log` VALUES (1423, '用户管理', 5, 'com.eduflex.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-08 17:55:53', 70);
INSERT INTO `sys_oper_log` VALUES (1424, '操作日志', 5, 'com.eduflex.web.controller.monitor.SysOperlogController.export()', 'POST', 1, 'admin', '研发部门', '/monitor/operlog/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-08 17:57:53', 124);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-10-05 13:28:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-10-05 13:28:48', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', 0, 'admin', '2024-10-05 13:28:48', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '教师', 'teacher', 3, '1', 1, 1, '0', 0, 'admin', '2024-10-05 23:47:42', 'admin', '2025-02-12 22:43:51', '教师');
INSERT INTO `sys_role` VALUES (4, '学生', 'student', 4, '1', 1, 1, '0', 0, 'admin', '2024-10-07 16:49:08', '', NULL, '学生');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 2031);
INSERT INTO `sys_role_menu` VALUES (3, 2032);
INSERT INTO `sys_role_menu` VALUES (3, 2033);
INSERT INTO `sys_role_menu` VALUES (3, 2034);
INSERT INTO `sys_role_menu` VALUES (3, 2035);
INSERT INTO `sys_role_menu` VALUES (3, 2036);
INSERT INTO `sys_role_menu` VALUES (3, 2037);
INSERT INTO `sys_role_menu` VALUES (3, 2044);
INSERT INTO `sys_role_menu` VALUES (3, 2045);
INSERT INTO `sys_role_menu` VALUES (3, 2046);
INSERT INTO `sys_role_menu` VALUES (3, 2047);
INSERT INTO `sys_role_menu` VALUES (3, 2048);
INSERT INTO `sys_role_menu` VALUES (3, 2049);
INSERT INTO `sys_role_menu` VALUES (3, 2050);
INSERT INTO `sys_role_menu` VALUES (3, 2051);
INSERT INTO `sys_role_menu` VALUES (3, 2052);
INSERT INTO `sys_role_menu` VALUES (3, 2053);
INSERT INTO `sys_role_menu` VALUES (3, 2054);
INSERT INTO `sys_role_menu` VALUES (3, 2055);
INSERT INTO `sys_role_menu` VALUES (3, 2056);
INSERT INTO `sys_role_menu` VALUES (3, 2057);
INSERT INTO `sys_role_menu` VALUES (3, 2058);
INSERT INTO `sys_role_menu` VALUES (3, 2059);
INSERT INTO `sys_role_menu` VALUES (3, 2060);
INSERT INTO `sys_role_menu` VALUES (3, 2061);
INSERT INTO `sys_role_menu` VALUES (3, 2068);
INSERT INTO `sys_role_menu` VALUES (3, 2075);
INSERT INTO `sys_role_menu` VALUES (3, 2076);
INSERT INTO `sys_role_menu` VALUES (3, 2077);
INSERT INTO `sys_role_menu` VALUES (3, 2078);
INSERT INTO `sys_role_menu` VALUES (3, 2079);
INSERT INTO `sys_role_menu` VALUES (3, 2080);
INSERT INTO `sys_role_menu` VALUES (3, 2081);
INSERT INTO `sys_role_menu` VALUES (3, 2082);
INSERT INTO `sys_role_menu` VALUES (3, 2083);
INSERT INTO `sys_role_menu` VALUES (3, 2084);
INSERT INTO `sys_role_menu` VALUES (3, 2085);
INSERT INTO `sys_role_menu` VALUES (3, 2086);
INSERT INTO `sys_role_menu` VALUES (3, 2088);
INSERT INTO `sys_role_menu` VALUES (3, 2089);
INSERT INTO `sys_role_menu` VALUES (3, 2093);
INSERT INTO `sys_role_menu` VALUES (3, 2100);
INSERT INTO `sys_role_menu` VALUES (3, 2101);
INSERT INTO `sys_role_menu` VALUES (3, 2102);
INSERT INTO `sys_role_menu` VALUES (3, 2107);
INSERT INTO `sys_role_menu` VALUES (3, 2108);
INSERT INTO `sys_role_menu` VALUES (3, 2112);
INSERT INTO `sys_role_menu` VALUES (3, 2119);
INSERT INTO `sys_role_menu` VALUES (3, 2120);
INSERT INTO `sys_role_menu` VALUES (3, 2125);
INSERT INTO `sys_role_menu` VALUES (3, 2126);
INSERT INTO `sys_role_menu` VALUES (3, 2130);
INSERT INTO `sys_role_menu` VALUES (3, 2131);
INSERT INTO `sys_role_menu` VALUES (3, 2132);
INSERT INTO `sys_role_menu` VALUES (3, 2133);
INSERT INTO `sys_role_menu` VALUES (3, 2134);
INSERT INTO `sys_role_menu` VALUES (3, 2135);
INSERT INTO `sys_role_menu` VALUES (3, 2136);
INSERT INTO `sys_role_menu` VALUES (3, 2143);
INSERT INTO `sys_role_menu` VALUES (3, 2144);
INSERT INTO `sys_role_menu` VALUES (3, 2145);
INSERT INTO `sys_role_menu` VALUES (3, 2146);
INSERT INTO `sys_role_menu` VALUES (3, 2147);
INSERT INTO `sys_role_menu` VALUES (3, 2148);
INSERT INTO `sys_role_menu` VALUES (3, 2149);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` tinyint NULL DEFAULT 2 COMMENT '用户性别（0男 1女 2保密）',
  `avatar` bigint NULL DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '帐号状态（0正常 1停用）',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', 1, 1893341139906342913, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', 0, 0, '127.0.0.1', '2025-05-10 09:17:25', 'admin', '2024-10-05 13:28:48', '', '2025-05-10 09:17:24');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', 1, NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', 0, 1, '127.0.0.1', '2024-10-05 13:28:48', 'admin', '2024-10-05 13:28:48', 'admin', '2024-10-06 16:03:47');
INSERT INTO `sys_user` VALUES (100, NULL, 'zhangsan', '张三', '00', '1972212424@qq.com', '15815161602', 0, 1891509518936834049, '$2a$10$gnDVpc1oEeeHL9oMuVrRaulVsqNuT1SPeSdpqkIh7ERDD65pPmkJa', 0, 0, '127.0.0.1', '2025-04-02 22:07:08', 'admin', '2024-10-06 00:52:44', 'admin', '2025-04-15 22:34:57');
INSERT INTO `sys_user` VALUES (102, NULL, 'lisi', '李四', '00', 'admin123@qq.com', '13888888888', 1, NULL, '$2a$10$nZvTWdZ1BlIHdGlwHMkGMOTKKagqC8yN9piQ.6gHtaSzCHF1Bl0A2', 0, 1, '', NULL, 'admin', '2024-10-06 16:56:27', '', NULL);
INSERT INTO `sys_user` VALUES (103, NULL, 'lisi', '李四', '00', 'admin123@qq.com', '13888888888', 1, 1891509518936834049, '$2a$10$iUGV11YL2hDcxSe4w9d2PuFmmV85a732C50aNHemmTN2iLkMvqJxe', 0, 0, '', NULL, 'admin', '2024-10-06 17:46:05', '', NULL);
INSERT INTO `sys_user` VALUES (104, NULL, '202325350123', '林煜鋒', '00', 'noexist@qq.com', '13090000000', 0, 1915213883945689090, '$2a$10$OCjnneWR4TDUNmei14e/FOxzE2UDPuG/MShnXh5rGAdKaGyREYQnG', 0, 0, '127.0.0.1', '2025-05-10 09:15:41', 'admin', '2024-10-08 10:47:31', 'admin', '2025-05-10 09:15:40');
INSERT INTO `sys_user` VALUES (105, NULL, '202325350124', '张三', '00', 'admin@qq.com', '15815161606', 0, 1891509518936834049, '$2a$10$axR.MY2O2nNR.LlDbTRvTe2tDCYMbai7AmnoQKQk.iFiSIkqBG0Su', 0, 0, '', NULL, 'admin', '2024-10-08 11:11:09', 'admin', '2025-02-07 11:42:34');
INSERT INTO `sys_user` VALUES (106, NULL, 'wangwu', '王五', '00', '13900000000@qq.com', '13900000000', 0, 1891509518936834049, '$2a$10$RnCSylS/jYWsZJpL7Sko3ObfRkPD2b0es7NoJwl0MELTWQ4Ps6NpC', 0, 0, '', NULL, 'admin', '2024-10-11 11:33:43', '', NULL);
INSERT INTO `sys_user` VALUES (107, NULL, '202325350130', '张三三', '00', '', '', 0, 1891509518936834049, '$2a$10$62ShaMC7ZrJVSzgL8Cu4bOCJjDhXaqXemRB.DX1rekKnhRTG82s6S', 0, 0, '', NULL, 'admin', '2024-12-08 13:49:32', 'admin', '2024-12-08 16:48:01');
INSERT INTO `sys_user` VALUES (110, NULL, '202325350132', '李思思', '00', '', '', 1, 1891509518936834049, '$2a$10$OYaA6RqXeamfmxnx4c/3wOhXy1lcvyD1LRw0p0Hm7dYlDGCw9T60S', 0, 0, '', NULL, 'admin', '2024-12-08 16:48:19', 'admin', '2025-02-07 11:42:39');
INSERT INTO `sys_user` VALUES (111, NULL, '202325350106', '郭沫若', '00', '', '', 0, 1891509518936834049, '$2a$10$ti9OO2HodqYbgda8sS840uPYF23SPuYMO7UE5PuNQZB3BNlqkiKm6', 0, 0, '', NULL, 'admin', '2025-02-07 11:42:56', '', NULL);
INSERT INTO `sys_user` VALUES (112, NULL, 'wangbingbing', '王冰冰', '00', '625587563@qq.com', '13800000000', 2, 1891509518936834049, '$2a$10$tM1IBHuKzeUw7iive1wWduhN31b4vru2h2PR0MDmBtmSP5GtckK6S', 0, 0, '127.0.0.1', '2025-02-17 23:37:00', 'admin', '2025-02-07 13:25:42', 'admin', '2025-04-15 00:27:40');
INSERT INTO `sys_user` VALUES (113, NULL, 'yaya', '丫丫', '00', 'yaya@163.com', '13548481602', 1, 1891509518936834049, '$2a$10$A8DE98HFrMsw1kGQ55n6SuxWxrl7X4N57aDVS84ZmVdR7E8XfGxla', 0, 0, '', NULL, 'admin', '2025-02-07 13:26:15', '', NULL);
INSERT INTO `sys_user` VALUES (115, NULL, '20250223', '丫丫', '00', '', '', 2, NULL, '$2a$10$QBp8s0ZDuCaxzYpf4xGN1en10ZlMeH8e/50hHTL/ZVN4PrIhojhge', 0, 0, '127.0.0.1', '2025-02-23 16:08:50', '', '2025-02-23 16:08:40', 'admin', '2025-04-02 22:49:28');
INSERT INTO `sys_user` VALUES (139, NULL, '202325350100', '张伟', '00', 'zhangwei1@qq.com', '13800000001', 2, 1893339122660020225, '$2a$10$plOMFZVRRhUJPKhIXs/.CepGBj.DaKb8r9t1K7qXV7VNh7B/G.NGW', 0, 0, '', NULL, 'admin', '2025-04-13 19:41:15', '', NULL);
INSERT INTO `sys_user` VALUES (140, NULL, '202325350101', '李娜', '00', 'lina2@163.com', '13800000002', 2, 1893339122660020225, '$2a$10$AbUEiBQncTQOXtKFSrDOZ.xxsJ3xpYqecKlPDzFtAVuDFbf.7LoVO', 0, 0, '', NULL, 'admin', '2025-04-13 19:41:16', '', NULL);
INSERT INTO `sys_user` VALUES (141, NULL, '202325350102', '王磊', '00', 'wanglei3@gmail.com', '13800000003', 2, 1893339122660020225, '$2a$10$3nxg843VMsisJUlTQsAKZuzo1xwu8fQLnySZ6QDmEEaa9dX7..EZ2', 0, 0, '', NULL, 'admin', '2025-04-13 19:41:16', '', NULL);
INSERT INTO `sys_user` VALUES (142, NULL, '202325350103', '刘洋', '00', 'liuyang4@sina.com', '13800000004', 2, 1893339122660020225, '$2a$10$0H9EACxhfQTmTkkwOrFxvOTgQB1Tyd/UWTcc370Fx3Miek7bC4Voe', 0, 0, '', NULL, 'admin', '2025-04-13 19:41:16', 'admin', '2025-04-13 19:42:18');
INSERT INTO `sys_user` VALUES (143, NULL, '202325350104', '陈静', '00', 'chenjing5@outlook.com', '13800000005', 2, 1893339122660020225, '$2a$10$iePB6ZkXyrawV2TvCvFBz.KjBqhH.CCTgwZqcua1B/EBOaxJ1KYca', 0, 0, '', NULL, 'admin', '2025-04-13 19:41:16', 'admin', '2025-04-13 19:41:40');
INSERT INTO `sys_user` VALUES (144, NULL, '202325350105', '赵敏', '00', 'zhaomin6@qq.com', '13800000006', 2, 1893339122660020225, '$2a$10$nUe1EFV5H3vgs4qZhc5eiu7EZr.Cd9mVyPgAiEO9oNIgLp/z4VM3e', 0, 0, '', NULL, 'admin', '2025-04-13 19:41:16', '', NULL);
INSERT INTO `sys_user` VALUES (145, NULL, '202325350107', '杨丽', '00', 'yangli8@gmail.com', '13800000008', 2, 1893339122660020225, '$2a$10$sLTN.UXaSXQVxxVz7g6CmeIUTNyrTNjg6MrS3bcUgJROhy1LGe/2e', 0, 0, '', NULL, 'admin', '2025-04-13 19:41:16', '', NULL);
INSERT INTO `sys_user` VALUES (146, NULL, '202325350108', '周杰', '00', 'zhoujie9@sina.com', '13800000009', 2, 1893339122660020225, '$2a$10$ihLK5V2FuXir5oPYIqyUFeQygVLHjhCbnuTf4DUy5A1QLNYl5YSPK', 0, 0, '', NULL, 'admin', '2025-04-13 19:41:16', '', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 3);
INSERT INTO `sys_user_role` VALUES (103, 3);
INSERT INTO `sys_user_role` VALUES (104, 4);
INSERT INTO `sys_user_role` VALUES (105, 4);
INSERT INTO `sys_user_role` VALUES (106, 3);
INSERT INTO `sys_user_role` VALUES (107, 4);
INSERT INTO `sys_user_role` VALUES (110, 4);
INSERT INTO `sys_user_role` VALUES (111, 4);
INSERT INTO `sys_user_role` VALUES (112, 3);
INSERT INTO `sys_user_role` VALUES (113, 3);
INSERT INTO `sys_user_role` VALUES (115, 4);
INSERT INTO `sys_user_role` VALUES (139, 4);
INSERT INTO `sys_user_role` VALUES (140, 4);
INSERT INTO `sys_user_role` VALUES (141, 4);
INSERT INTO `sys_user_role` VALUES (142, 4);
INSERT INTO `sys_user_role` VALUES (143, 4);
INSERT INTO `sys_user_role` VALUES (144, 4);
INSERT INTO `sys_user_role` VALUES (145, 4);
INSERT INTO `sys_user_role` VALUES (146, 4);

-- ----------------------------
-- Table structure for tb_carousel
-- ----------------------------
DROP TABLE IF EXISTS `tb_carousel`;
CREATE TABLE `tb_carousel`  (
  `id` bigint NOT NULL COMMENT '主键',
  `img_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片ID集合',
  `enabled` tinyint NOT NULL DEFAULT 0 COMMENT '启用状态(0-禁用 1-启用)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '轮播图表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_carousel
-- ----------------------------
INSERT INTO `tb_carousel` VALUES (1920320724153339906, '1920320715106226178,1920320715106226179,1920320715106226177', 0, 'admin', '2025-05-08 11:31:53', NULL, '2025-05-08 11:31:54', 0);
INSERT INTO `tb_carousel` VALUES (1920321752231776258, '1920321745915154434,1920321745915154435,1920321745982263297', 1, 'admin', '2025-05-08 11:35:58', NULL, '2025-05-08 11:35:59', 0);

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
  `id` bigint NOT NULL COMMENT '分类ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `direction_id` bigint NOT NULL COMMENT '关联方向ID',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态(0-禁用 1-启用)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES (1865772427033673729, '计算机科学', 1889705530327379970, 1, 'admin', '2024-12-08 22:56:26', 'admin', '2025-02-13 00:28:23', 0);
INSERT INTO `tb_category` VALUES (1865773357393215489, '编程语言', 1889705530327379970, 1, 'admin', '2024-12-08 23:00:07', NULL, '2025-02-13 00:28:23', 0);
INSERT INTO `tb_category` VALUES (1865774804440600577, '计算机网络', 1889707595454877697, 1, 'admin', '2024-12-08 23:05:52', NULL, '2025-02-13 00:28:23', 0);
INSERT INTO `tb_category` VALUES (1865774893179490305, '数学', 1889707757073993730, 1, 'admin', '2024-12-08 23:06:14', NULL, '2025-04-15 23:01:44', 1);
INSERT INTO `tb_category` VALUES (1865774917003137026, '高等数学', 1889707757073993730, 1, 'admin', '2024-12-08 23:06:19', NULL, '2025-04-15 23:01:44', 1);
INSERT INTO `tb_category` VALUES (1865774943993483266, '离散数学', 1889707757073993730, 1, 'admin', '2024-12-08 23:06:26', NULL, '2025-04-15 23:01:44', 1);
INSERT INTO `tb_category` VALUES (1865777547125346306, '操作系统', 1889705530327379970, 1, 'admin', '2024-12-08 23:16:46', NULL, '2025-02-13 00:28:23', 0);
INSERT INTO `tb_category` VALUES (1865777929406795777, 'Java', 1889707213995606018, 1, 'admin', '2024-12-08 23:18:18', 'admin', '2025-02-13 00:28:23', 0);
INSERT INTO `tb_category` VALUES (1888589040311214082, 'Python', 1889707213995606018, 1, 'admin', '2025-02-09 22:01:30', NULL, '2025-02-13 00:28:23', 0);
INSERT INTO `tb_category` VALUES (1889714096638754817, 'PHP', 1889707213995606018, 1, 'admin', '2025-02-13 00:32:04', NULL, NULL, 0);
INSERT INTO `tb_category` VALUES (1889714142264393729, 'C', 1889705530327379970, 1, 'admin', '2025-02-13 00:32:15', NULL, NULL, 0);
INSERT INTO `tb_category` VALUES (1893329879890436097, 'HTML', 1889705530327379970, 1, 'admin', '2025-02-22 23:59:54', 'admin', '2025-03-19 15:28:39', 0);
INSERT INTO `tb_category` VALUES (1902262099632390145, 'Vue', 1889705530327379970, 1, 'admin', '2025-03-19 15:33:21', NULL, NULL, 0);
INSERT INTO `tb_category` VALUES (1902262140237447169, 'React', 1889705530327379970, 1, 'admin', '2025-03-19 15:33:31', NULL, NULL, 0);
INSERT INTO `tb_category` VALUES (1902262159128592386, 'Angular', 1889705530327379970, 1, 'admin', '2025-03-19 15:33:35', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `id` bigint NOT NULL COMMENT '评论ID',
  `course_id` bigint NOT NULL COMMENT '关联课程ID',
  `user_id` bigint NOT NULL COMMENT '关联用户ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父级评论ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES (1893594148452225026, 1893330048954441729, 104, '<p>测试评论</p>', 0, '202325350123', '2025-02-23 17:30:00', NULL, '2025-03-11 13:17:20', 0);
INSERT INTO `tb_comment` VALUES (1899328141524635650, 1893330048954441729, 104, '<p>测试评论</p>', 0, '202325350123', '2025-03-11 13:14:51', NULL, '2025-03-11 13:17:20', 0);
INSERT INTO `tb_comment` VALUES (1901835217144541185, 1893330048954441729, 104, '<p>嘻嘻嘻</p>', 1893594148452225026, '202325350123', '2025-03-18 11:17:04', NULL, NULL, 0);
INSERT INTO `tb_comment` VALUES (1901838167787073538, 1893330048954441729, 104, '<p>啦啦啦啦</p>', 1893594148452225026, '202325350123', '2025-03-18 11:28:48', NULL, NULL, 0);
INSERT INTO `tb_comment` VALUES (1901840132684279810, 1893330048954441729, 104, '<p>芭芭拉</p>', 1899328141524635650, '202325350123', '2025-03-18 11:36:36', NULL, NULL, 0);
INSERT INTO `tb_comment` VALUES (1901840283096215554, 1893330048954441729, 104, '<p>123</p>', 1899328141524635650, '202325350123', '2025-03-18 11:37:12', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tb_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '课程描述',
  `direction_id` bigint NOT NULL COMMENT '方向ID',
  `category_id` bigint NOT NULL COMMENT '分类ID',
  `teacher_id` bigint NULL DEFAULT NULL COMMENT '任课老师ID',
  `cover` bigint NULL DEFAULT NULL COMMENT '课程封面',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1904925771873423363 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_course
-- ----------------------------
INSERT INTO `tb_course` VALUES (1893330048954441729, 'HTML5设计基础', 'HTML5设计基础\nHTML5设计基础\nHTML5设计基础\nHTML5设计基础', 1889705530327379970, 1893329879890436097, 100, 1893330038930055169, 'admin', '2025-02-23 00:00:34', NULL, '2025-02-23 00:00:34', 0);
INSERT INTO `tb_course` VALUES (1893505970768830465, 'Java零基础视频教程_上部', 'Java零基础视频教程_上部', 1889707213995606018, 1865777929406795777, 112, 1893505965064577026, 'admin', '2025-02-23 11:39:37', NULL, '2025-02-23 11:39:37', 0);
INSERT INTO `tb_course` VALUES (1893597689472372737, 'Python基础入门', 'Python基础入门', 1889707213995606018, 1888589040311214082, 106, 1893597682493050881, 'admin', '2025-02-23 17:44:05', NULL, '2025-02-23 17:44:05', 0);
INSERT INTO `tb_course` VALUES (1904925771873423362, 'Java零基础视频教程_下部', 'Java零基础视频教程_下部', 1889707213995606018, 1865777929406795777, 100, NULL, 'admin', '2025-03-26 23:57:50', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tb_course_chapter
-- ----------------------------
DROP TABLE IF EXISTS `tb_course_chapter`;
CREATE TABLE `tb_course_chapter`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `course_id` bigint NOT NULL COMMENT '关联课程ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节名称',
  `sort` int NULL DEFAULT 1 COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1893506764423421955 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程内容章节表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_course_chapter
-- ----------------------------
INSERT INTO `tb_course_chapter` VALUES (1893332503612112897, 1893330048954441729, 'Web前端职业前景与重要理念', 1, 'admin', '2025-02-23 00:10:20', 'admin', '2025-02-23 01:10:44', 0);
INSERT INTO `tb_course_chapter` VALUES (1893332997474631682, 1893330048954441729, 'HTML 5页面的构建与简单控制', 2, 'admin', '2025-02-23 00:12:17', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893333416405909505, 1893330048954441729, 'CSS 3基础入门', 3, 'admin', '2025-02-23 00:13:57', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893333478926204929, 1893330048954441729, '实现Web前端排版的基本美化', 4, 'admin', '2025-02-23 00:14:12', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893333537092812801, 1893330048954441729, '浮动、定位与列表', 5, 'admin', '2025-02-23 00:14:26', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893333583070773249, 1893330048954441729, 'HTML 5增强型表单与简易表格', 6, 'admin', '2025-02-23 00:14:37', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893333634367111170, 1893330048954441729, 'CSS3与HTML5的高级应用', 7, 'admin', '2025-02-23 00:14:49', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893333680500260866, 1893330048954441729, 'PC端典型页面的设计与实现', 8, 'admin', '2025-02-23 00:15:00', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893333729997242370, 1893330048954441729, '多设备响应式页面的实现', 9, 'admin', '2025-02-23 00:15:12', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893333796795727874, 1893330048954441729, 'Web App类页面的设计与实现', 10, 'admin', '2025-02-23 00:15:28', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506289502380033, 1893505970768830465, 'Java入门', 1, 'admin', '2025-02-23 11:40:53', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506341381726210, 1893505970768830465, 'Java基础概念', 2, 'admin', '2025-02-23 11:41:06', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506381718347778, 1893505970768830465, '运算符', 3, 'admin', '2025-02-23 11:41:15', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506429021708290, 1893505970768830465, '判断和循环', 4, 'admin', '2025-02-23 11:41:26', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506483899981826, 1893505970768830465, '循环高级综合练习', 5, 'admin', '2025-02-23 11:41:40', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506529949245441, 1893505970768830465, '数组', 6, 'admin', '2025-02-23 11:41:51', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506546214756354, 1893505970768830465, '方法', 7, 'admin', '2025-02-23 11:41:54', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506655379906561, 1893505970768830465, '综合练习', 8, 'admin', '2025-02-23 11:42:20', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506674514321410, 1893505970768830465, '面向对象', 9, 'admin', '2025-02-23 11:42:25', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506718403518466, 1893505970768830465, '面向对象综合练习', 10, 'admin', '2025-02-23 11:42:35', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506745167372289, 1893505970768830465, '字符串', 11, 'admin', '2025-02-23 11:42:42', NULL, NULL, 0);
INSERT INTO `tb_course_chapter` VALUES (1893506764423421954, 1893505970768830465, 'ArrayList', 12, 'admin', '2025-02-23 11:42:46', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tb_course_material
-- ----------------------------
DROP TABLE IF EXISTS `tb_course_material`;
CREATE TABLE `tb_course_material`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `chapter_id` bigint NOT NULL COMMENT '关联章节ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资料名称',
  `file_id` bigint NULL DEFAULT NULL COMMENT '文件ID',
  `material_type` tinyint NULL DEFAULT NULL COMMENT '资料类型(1-纯文本 2-图片 3-音视频 4-幻灯片 5-PDF 6-其他文件)',
  `duration` int NULL DEFAULT NULL COMMENT '音视频时长(秒)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1893508724015734787 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程资料表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_course_material
-- ----------------------------
INSERT INTO `tb_course_material` VALUES (1893340374244536321, 1893332503612112897, 'HTML5+CSS3 Web前端设计基础教程（第1章）.pptx', 1893340282775154689, 4, NULL, 'admin', '2025-02-23 00:41:36', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893340632542359554, 1893332997474631682, 'HTML5+CSS3 Web前端设计基础教程（第2章）.pptx', 1893340620781531137, 4, NULL, 'admin', '2025-02-23 00:42:38', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893340904169680898, 1893333416405909505, 'HTML5+CSS3 Web前端设计基础教程（第3章）.pptx', 1893340723030274049, 4, NULL, 'admin', '2025-02-23 00:43:42', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893341762248781826, 1893333478926204929, 'HTML5+CSS3 Web前端设计基础教程（第4章）.pptx', 1893341754787115010, 4, NULL, 'admin', '2025-02-23 00:47:07', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893341878602969090, 1893333537092812801, 'HTML5+CSS3 Web前端设计基础教程（第5章）.pptx', 1893341874337361921, 4, NULL, 'admin', '2025-02-23 00:47:35', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893341915349266433, 1893333583070773249, 'HTML5+CSS3 Web前端设计基础教程（第6章）.pptx', 1893341911775719426, 4, NULL, 'admin', '2025-02-23 00:47:43', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893342149114605570, 1893333634367111170, 'HTML5+CSS3 Web前端设计基础教程（第7章）.pptx', 1893342145029353474, 4, NULL, 'admin', '2025-02-23 00:48:39', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893342853338255362, 1893333680500260866, 'HTML5+CSS3 Web前端设计基础教程（第8章）.pptx', 1893342847294263297, 4, NULL, 'admin', '2025-02-23 00:51:27', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893342883612741633, 1893333729997242370, 'HTML5+CSS3 Web前端设计基础教程（第9章）.pptx', 1893342876255932417, 4, NULL, 'admin', '2025-02-23 00:51:34', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893342914789003265, 1893333796795727874, 'HTML5+CSS3 Web前端设计基础教程（第10章）.pptx', 1893342906727550978, 4, NULL, 'admin', '2025-02-23 00:51:42', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893507970781650946, 1893506289502380033, 'Java学习介绍', 1893507826061385730, 3, 499, 'admin', '2025-02-23 11:47:34', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893508218337861634, 1893506289502380033, '人机交互-图形化界面的使用', 1893508177074298881, 3, 498, 'admin', '2025-02-23 11:48:33', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893508286923120642, 1893506289502380033, '打开CMD', 1893508263103668226, 3, 266, 'admin', '2025-02-23 11:48:49', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893508345710485505, 1893506289502380033, '常用的CMD命令', 1893508314236428289, 3, 448, 'admin', '2025-02-23 11:49:03', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893508448470933506, 1893506289502380033, '练习-利用CMD打开QQ', 1893508394603487234, 3, 590, 'admin', '2025-02-23 11:49:28', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893508510743764994, 1893506289502380033, 'Java概述和学习方法', 1893508481996005377, 3, 263, 'admin', '2025-02-23 11:49:43', NULL, NULL, 0);
INSERT INTO `tb_course_material` VALUES (1893508724015734786, 1893506289502380033, 'Java学习-JDK下载和安装', 1893508673075912705, 3, 1002, 'admin', '2025-02-23 11:50:34', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tb_direction
-- ----------------------------
DROP TABLE IF EXISTS `tb_direction`;
CREATE TABLE `tb_direction`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `status` tinyint NULL DEFAULT NULL COMMENT '启用状态(0-禁用 1-启用)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程方向表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_direction
-- ----------------------------
INSERT INTO `tb_direction` VALUES (1889705530327379970, '前端开发', 1, 'admin', '2025-02-12 23:58:02', 'admin', '2025-02-13 00:02:05', 0);
INSERT INTO `tb_direction` VALUES (1889707213995606018, '后端开发', 1, 'admin', '2025-02-13 00:04:44', NULL, NULL, 0);
INSERT INTO `tb_direction` VALUES (1889707324762980353, '移动开发', 1, 'admin', '2025-02-13 00:05:10', NULL, NULL, 0);
INSERT INTO `tb_direction` VALUES (1889707366336921602, '数据库', 1, 'admin', '2025-02-13 00:05:20', NULL, NULL, 0);
INSERT INTO `tb_direction` VALUES (1889707595454877697, '计算机基础', 1, 'admin', '2025-02-13 00:06:14', NULL, NULL, 0);
INSERT INTO `tb_direction` VALUES (1889707641961320449, 'UI设计', 1, 'admin', '2025-02-13 00:06:26', NULL, '2025-04-15 22:37:12', 1);
INSERT INTO `tb_direction` VALUES (1889707676753072130, '运维&测试', 1, 'admin', '2025-02-13 00:06:34', NULL, NULL, 0);
INSERT INTO `tb_direction` VALUES (1889707708529119234, '游戏', 1, 'admin', '2025-02-13 00:06:41', NULL, '2025-04-15 22:37:24', 1);
INSERT INTO `tb_direction` VALUES (1889707731149000706, '前沿技术', 1, 'admin', '2025-02-13 00:06:47', NULL, '2025-04-15 22:37:26', 1);
INSERT INTO `tb_direction` VALUES (1889707757073993730, '算法', 1, 'admin', '2025-02-13 00:06:53', NULL, '2025-04-15 23:01:44', 1);
INSERT INTO `tb_direction` VALUES (1893188738571264002, '方向1', 0, 'admin', '2025-02-22 14:39:04', 'admin', '2025-03-19 15:21:54', 1);

-- ----------------------------
-- Table structure for tb_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `tb_evaluation`;
CREATE TABLE `tb_evaluation`  (
  `id` bigint NOT NULL COMMENT '评价ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `score` tinyint NOT NULL COMMENT '评分',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程评价表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_evaluation
-- ----------------------------
INSERT INTO `tb_evaluation` VALUES (1894225649113419778, 1893330048954441729, 1, 5, '课程很好，资料很齐全', 'admin', '2025-02-25 11:19:22', NULL, '2025-02-25 13:10:01', 0);
INSERT INTO `tb_evaluation` VALUES (1894260138841681921, 1893330048954441729, 104, 4, '课程很好，资料很齐全', '202325350123', '2025-02-25 13:36:25', NULL, NULL, 0);
INSERT INTO `tb_evaluation` VALUES (1914713103853559810, 1893505970768830465, 104, 5, '这个课程非常棒', '202325350123', '2025-04-23 00:09:12', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tb_exam
-- ----------------------------
DROP TABLE IF EXISTS `tb_exam`;
CREATE TABLE `tb_exam`  (
  `id` bigint NOT NULL COMMENT '主键',
  `course_id` bigint NOT NULL COMMENT '关联课程ID',
  `paper_id` bigint NOT NULL COMMENT '关联试卷ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试名称',
  `total_score` int NOT NULL COMMENT '总分数',
  `pass_score` int NOT NULL COMMENT '及格分数',
  `duration` int NOT NULL COMMENT '考试时长(分钟)',
  `limited` tinyint NOT NULL DEFAULT 0 COMMENT '是否限时(0-否 1-是)',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态(0-未开始 1-进行中 2-已结束)',
  `published` tinyint NOT NULL DEFAULT 0 COMMENT '发布状态(0-未发布 1-已发布)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '考试表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_exam
-- ----------------------------
INSERT INTO `tb_exam` VALUES (1893602567447924737, 1893505970768830465, 1893598009229332481, 'Java期末考试', 140, 90, 120, 1, '2025-02-01 12:00:00', '2025-05-28 12:00:00', 1, 1, 'admin', '2025-02-23 18:03:28', 'admin', '2025-04-04 14:34:54', 0);

-- ----------------------------
-- Table structure for tb_exam_answer
-- ----------------------------
DROP TABLE IF EXISTS `tb_exam_answer`;
CREATE TABLE `tb_exam_answer`  (
  `id` bigint NOT NULL COMMENT '记录ID',
  `record_id` bigint NOT NULL COMMENT '考试记录ID',
  `question_id` bigint NOT NULL COMMENT '题目ID',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '答案',
  `is_checked` tinyint NOT NULL DEFAULT 0 COMMENT '是否已批阅(0-否 1-是)',
  `score` int NOT NULL DEFAULT 0 COMMENT '得分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '考试答案记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_exam_answer
-- ----------------------------
INSERT INTO `tb_exam_answer` VALUES (1894418955499438082, 1894418939623997442, 1888975963009781762, '[\"B\"]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1894418965771288577, 1894418939623997442, 1888975852141744130, '[\"A\"]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1894418973237149698, 1894418939623997442, 1879096369215885314, '[\"B\"]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1894418979541188610, 1894418939623997442, 1888976099630845953, '[\"A\"]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1894418983727104002, 1894418939623997442, 1888977725078835201, '[\"A\"]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1894418994535825410, 1894418939623997442, 1888590586725933058, '[\"A\",\"B\",\"C\",\"D\"]', 0, 10);
INSERT INTO `tb_exam_answer` VALUES (1894419002412728322, 1894418939623997442, 1879096505274912770, '[\"A\",\"C\"]', 0, 10);
INSERT INTO `tb_exam_answer` VALUES (1894419045286903809, 1894418939623997442, 1879096608295407618, '[\"A\",\"B\",\"C\",\"D\"]', 0, 10);
INSERT INTO `tb_exam_answer` VALUES (1894419061418196994, 1894418939623997442, 1888976760510550018, '[\"B\"]', 0, 0);
INSERT INTO `tb_exam_answer` VALUES (1894419067332165633, 1894418939623997442, 1879096689383886850, '[true]', 0, 0);
INSERT INTO `tb_exam_answer` VALUES (1894419079210434562, 1894418939623997442, 1888866274851782658, '[false]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1894419085963264001, 1894418939623997442, 1888976836628779009, '[true]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1894419088807002114, 1894418939623997442, 1879096745101021186, '[true]', 0, 0);
INSERT INTO `tb_exam_answer` VALUES (1894419094301540353, 1894418939623997442, 1888976948063047681, '[true]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1894419106586656770, 1894418939623997442, 1879096862541533186, '[\"7\"]', 1, 10);
INSERT INTO `tb_exam_answer` VALUES (1894419130917814274, 1894418939623997442, 1888977792670044161, '[\"s\"]', 1, 0);
INSERT INTO `tb_exam_answer` VALUES (1894419138106851330, 1894418939623997442, 1888866180559634433, '[\"是\"]', 1, 0);
INSERT INTO `tb_exam_answer` VALUES (1894419660595494914, 1894418939623997442, 1888978080407687169, '[]', 1, 0);
INSERT INTO `tb_exam_answer` VALUES (1908046449870540801, 1908046415452082178, 1888975963009781762, '[\"B\"]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1908046459169312770, 1908046415452082178, 1888975852141744130, '[\"A\"]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1908046470540070913, 1908046415452082178, 1879096369215885314, '[\"B\"]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1908046476684726273, 1908046415452082178, 1888976099630845953, '[\"A\"]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1908046486818164738, 1908046415452082178, 1888977725078835201, '[\"A\"]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1908046498209894401, 1908046415452082178, 1888590586725933058, '[\"A\",\"B\",\"C\",\"D\"]', 0, 10);
INSERT INTO `tb_exam_answer` VALUES (1908046511438729217, 1908046415452082178, 1879096505274912770, '[\"A\",\"C\"]', 0, 10);
INSERT INTO `tb_exam_answer` VALUES (1908046520246767618, 1908046415452082178, 1879096608295407618, '[\"A\",\"B\",\"C\",\"D\"]', 0, 10);
INSERT INTO `tb_exam_answer` VALUES (1908046531130986498, 1908046415452082178, 1888976760510550018, '[\"A\",\"B\",\"C\",\"D\"]', 0, 0);
INSERT INTO `tb_exam_answer` VALUES (1908046541272813569, 1908046415452082178, 1879096689383886850, '[true]', 0, 0);
INSERT INTO `tb_exam_answer` VALUES (1908046545479700482, 1908046415452082178, 1888866274851782658, '[true]', 0, 0);
INSERT INTO `tb_exam_answer` VALUES (1908046548994527234, 1908046415452082178, 1888976836628779009, '[true]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1908046552190586881, 1908046415452082178, 1879096745101021186, '[true]', 0, 0);
INSERT INTO `tb_exam_answer` VALUES (1908046555210485762, 1908046415452082178, 1888976948063047681, '[true]', 0, 5);
INSERT INTO `tb_exam_answer` VALUES (1908046565884989441, 1908046415452082178, 1879096862541533186, '[\"7\"]', 0, 0);

-- ----------------------------
-- Table structure for tb_exam_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_exam_record`;
CREATE TABLE `tb_exam_record`  (
  `id` bigint NOT NULL COMMENT '记录ID',
  `exam_id` bigint NOT NULL COMMENT '考试ID',
  `paper_id` bigint NOT NULL COMMENT '试卷ID',
  `user_id` bigint NOT NULL COMMENT '关联用户ID',
  `score` int NULL DEFAULT 0 COMMENT '分数',
  `passed` tinyint NULL DEFAULT NULL COMMENT '是否通过(0-未通过 1-通过)',
  `duration` int NOT NULL DEFAULT 0 COMMENT '用时',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '考试记录状态(0-未开始 1-进行中 2-待批阅 3-已完成)',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `job_id` bigint NULL DEFAULT NULL COMMENT '自动任务ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '考试记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_exam_record
-- ----------------------------
INSERT INTO `tb_exam_record` VALUES (1894418939623997442, 1893602567447924737, 1893598009229332481, 104, 80, 0, 50, 3, '2025-02-26 00:07:26', '2025-02-26 00:08:17', 140, '202325350123', '2025-02-26 00:07:26', 'System', '2025-04-02 00:01:15', 1);
INSERT INTO `tb_exam_record` VALUES (1908046415452082178, 1893602567447924737, 1893598009229332481, 104, 65, NULL, 44, 2, '2025-04-04 14:38:10', '2025-04-04 14:38:55', 142, '202325350123', '2025-04-04 14:38:09', 'System', '2025-04-04 14:38:45', 0);

-- ----------------------------
-- Table structure for tb_file_images
-- ----------------------------
DROP TABLE IF EXISTS `tb_file_images`;
CREATE TABLE `tb_file_images`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `file_id` bigint NOT NULL COMMENT '关联Oss文件ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片存储路径',
  `page_number` int NULL DEFAULT NULL COMMENT '图片所处页面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件转换存储表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_file_images
-- ----------------------------
INSERT INTO `tb_file_images` VALUES (1893340766151913474, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf4e', 1);
INSERT INTO `tb_file_images` VALUES (1893340766168690689, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf4f', 2);
INSERT INTO `tb_file_images` VALUES (1893340766168690690, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf50', 3);
INSERT INTO `tb_file_images` VALUES (1893340766177079297, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf51', 4);
INSERT INTO `tb_file_images` VALUES (1893340766177079298, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf52', 5);
INSERT INTO `tb_file_images` VALUES (1893340766189662210, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf53', 6);
INSERT INTO `tb_file_images` VALUES (1893340766189662211, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf54', 7);
INSERT INTO `tb_file_images` VALUES (1893340766189662212, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf55', 8);
INSERT INTO `tb_file_images` VALUES (1893340766202245121, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf56', 9);
INSERT INTO `tb_file_images` VALUES (1893340766202245122, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf57', 10);
INSERT INTO `tb_file_images` VALUES (1893340766202245123, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf58', 11);
INSERT INTO `tb_file_images` VALUES (1893340766214828033, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf59', 12);
INSERT INTO `tb_file_images` VALUES (1893340766219022338, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf5a', 13);
INSERT INTO `tb_file_images` VALUES (1893340766223216642, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf5b', 14);
INSERT INTO `tb_file_images` VALUES (1893340766223216643, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf5c', 15);
INSERT INTO `tb_file_images` VALUES (1893340766231605250, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf5d', 16);
INSERT INTO `tb_file_images` VALUES (1893340766244188161, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf5e', 17);
INSERT INTO `tb_file_images` VALUES (1893340766252576770, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf5f', 18);
INSERT INTO `tb_file_images` VALUES (1893340766256771073, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf60', 19);
INSERT INTO `tb_file_images` VALUES (1893340766256771074, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf61', 20);
INSERT INTO `tb_file_images` VALUES (1893340766256771075, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf62', 21);
INSERT INTO `tb_file_images` VALUES (1893340766256771076, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf63', 22);
INSERT INTO `tb_file_images` VALUES (1893340766265159681, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf64', 23);
INSERT INTO `tb_file_images` VALUES (1893340766265159682, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf65', 24);
INSERT INTO `tb_file_images` VALUES (1893340766265159683, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf66', 25);
INSERT INTO `tb_file_images` VALUES (1893340766265159684, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf67', 26);
INSERT INTO `tb_file_images` VALUES (1893340766273548289, 1893340620781531137, 'local-plus/1893340620781531137/67b9fe9d3522a4f17ae2cf68', 27);
INSERT INTO `tb_file_images` VALUES (1893340793276477441, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf69', 1);
INSERT INTO `tb_file_images` VALUES (1893340793284866049, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf6a', 2);
INSERT INTO `tb_file_images` VALUES (1893340793284866050, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf6b', 3);
INSERT INTO `tb_file_images` VALUES (1893340793284866051, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf6c', 4);
INSERT INTO `tb_file_images` VALUES (1893340793293254657, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf6d', 5);
INSERT INTO `tb_file_images` VALUES (1893340793293254658, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf6e', 6);
INSERT INTO `tb_file_images` VALUES (1893340793297448961, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf6f', 7);
INSERT INTO `tb_file_images` VALUES (1893340793297448962, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf70', 8);
INSERT INTO `tb_file_images` VALUES (1893340793301643265, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf71', 9);
INSERT INTO `tb_file_images` VALUES (1893340793301643266, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf72', 10);
INSERT INTO `tb_file_images` VALUES (1893340793301643267, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf73', 11);
INSERT INTO `tb_file_images` VALUES (1893340793301643268, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf74', 12);
INSERT INTO `tb_file_images` VALUES (1893340793310031873, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf75', 13);
INSERT INTO `tb_file_images` VALUES (1893340793310031874, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf76', 14);
INSERT INTO `tb_file_images` VALUES (1893340793310031875, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf77', 15);
INSERT INTO `tb_file_images` VALUES (1893340793314226177, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf78', 16);
INSERT INTO `tb_file_images` VALUES (1893340793314226178, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf79', 17);
INSERT INTO `tb_file_images` VALUES (1893340793322614785, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf7a', 18);
INSERT INTO `tb_file_images` VALUES (1893340793326809090, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf7b', 19);
INSERT INTO `tb_file_images` VALUES (1893340793326809091, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf7c', 20);
INSERT INTO `tb_file_images` VALUES (1893340793326809092, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf7d', 21);
INSERT INTO `tb_file_images` VALUES (1893340793335197698, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf7e', 22);
INSERT INTO `tb_file_images` VALUES (1893340793335197699, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf7f', 23);
INSERT INTO `tb_file_images` VALUES (1893340793339392001, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf80', 24);
INSERT INTO `tb_file_images` VALUES (1893340793339392002, 1893340723030274049, 'local-plus/1893340723030274049/67b9fea43522a4f17ae2cf81', 25);
INSERT INTO `tb_file_images` VALUES (1893341814916657154, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfb6', 1);
INSERT INTO `tb_file_images` VALUES (1893341814916657155, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfb7', 2);
INSERT INTO `tb_file_images` VALUES (1893341814925045762, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfb8', 3);
INSERT INTO `tb_file_images` VALUES (1893341814925045763, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfb9', 4);
INSERT INTO `tb_file_images` VALUES (1893341814929240066, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfba', 5);
INSERT INTO `tb_file_images` VALUES (1893341814929240067, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfbb', 6);
INSERT INTO `tb_file_images` VALUES (1893341814929240068, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfbc', 7);
INSERT INTO `tb_file_images` VALUES (1893341814929240069, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfbd', 8);
INSERT INTO `tb_file_images` VALUES (1893341814929240070, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfbe', 9);
INSERT INTO `tb_file_images` VALUES (1893341814933434369, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfbf', 10);
INSERT INTO `tb_file_images` VALUES (1893341814933434370, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfc0', 11);
INSERT INTO `tb_file_images` VALUES (1893341814933434371, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfc1', 12);
INSERT INTO `tb_file_images` VALUES (1893341814933434372, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfc2', 13);
INSERT INTO `tb_file_images` VALUES (1893341814937628674, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfc3', 14);
INSERT INTO `tb_file_images` VALUES (1893341814937628675, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfc4', 15);
INSERT INTO `tb_file_images` VALUES (1893341814937628676, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfc5', 16);
INSERT INTO `tb_file_images` VALUES (1893341814937628677, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfc6', 17);
INSERT INTO `tb_file_images` VALUES (1893341814937628678, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfc7', 18);
INSERT INTO `tb_file_images` VALUES (1893341814937628679, 1893341754787115010, 'local-plus/1893341754787115010/67b9ff973522a4f17ae2cfc8', 19);
INSERT INTO `tb_file_images` VALUES (1893341931803521026, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfcb', 1);
INSERT INTO `tb_file_images` VALUES (1893341931807715330, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfcc', 2);
INSERT INTO `tb_file_images` VALUES (1893341931807715331, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfcd', 3);
INSERT INTO `tb_file_images` VALUES (1893341931807715332, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfce', 4);
INSERT INTO `tb_file_images` VALUES (1893341931807715333, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfcf', 5);
INSERT INTO `tb_file_images` VALUES (1893341931807715334, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfd0', 6);
INSERT INTO `tb_file_images` VALUES (1893341931816103938, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfd1', 7);
INSERT INTO `tb_file_images` VALUES (1893341931820298242, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfd2', 8);
INSERT INTO `tb_file_images` VALUES (1893341931820298243, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfd3', 9);
INSERT INTO `tb_file_images` VALUES (1893341931820298244, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfd4', 10);
INSERT INTO `tb_file_images` VALUES (1893341931820298245, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfd5', 11);
INSERT INTO `tb_file_images` VALUES (1893341931832881154, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfd6', 12);
INSERT INTO `tb_file_images` VALUES (1893341931832881155, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfd7', 13);
INSERT INTO `tb_file_images` VALUES (1893341931832881156, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfd8', 14);
INSERT INTO `tb_file_images` VALUES (1893341931837075457, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfd9', 15);
INSERT INTO `tb_file_images` VALUES (1893341931837075458, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfda', 16);
INSERT INTO `tb_file_images` VALUES (1893341931837075459, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfdb', 17);
INSERT INTO `tb_file_images` VALUES (1893341931837075460, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfdc', 18);
INSERT INTO `tb_file_images` VALUES (1893341931837075461, 1893341874337361921, 'local-plus/1893341874337361921/67b9ffb33522a4f17ae2cfdd', 19);
INSERT INTO `tb_file_images` VALUES (1893341967731929090, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfde', 1);
INSERT INTO `tb_file_images` VALUES (1893341967740317697, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfdf', 2);
INSERT INTO `tb_file_images` VALUES (1893341967744512001, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfe0', 3);
INSERT INTO `tb_file_images` VALUES (1893341967744512002, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfe1', 4);
INSERT INTO `tb_file_images` VALUES (1893341967744512003, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfe2', 5);
INSERT INTO `tb_file_images` VALUES (1893341967744512004, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfe3', 6);
INSERT INTO `tb_file_images` VALUES (1893341967744512005, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfe4', 7);
INSERT INTO `tb_file_images` VALUES (1893341967744512006, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfe5', 8);
INSERT INTO `tb_file_images` VALUES (1893341967748706306, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfe6', 9);
INSERT INTO `tb_file_images` VALUES (1893341967748706307, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfe7', 10);
INSERT INTO `tb_file_images` VALUES (1893341967748706308, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfe8', 11);
INSERT INTO `tb_file_images` VALUES (1893341967748706309, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfe9', 12);
INSERT INTO `tb_file_images` VALUES (1893341967748706310, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfea', 13);
INSERT INTO `tb_file_images` VALUES (1893341967748706311, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfeb', 14);
INSERT INTO `tb_file_images` VALUES (1893341967748706312, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfec', 15);
INSERT INTO `tb_file_images` VALUES (1893341967748706313, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfed', 16);
INSERT INTO `tb_file_images` VALUES (1893341967748706314, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfee', 17);
INSERT INTO `tb_file_images` VALUES (1893341967748706315, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cfef', 18);
INSERT INTO `tb_file_images` VALUES (1893341967748706316, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cff0', 19);
INSERT INTO `tb_file_images` VALUES (1893341967748706317, 1893341911775719426, 'local-plus/1893341911775719426/67b9ffbc3522a4f17ae2cff1', 20);
INSERT INTO `tb_file_images` VALUES (1893342194337591297, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cff3', 1);
INSERT INTO `tb_file_images` VALUES (1893342194341785602, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cff4', 2);
INSERT INTO `tb_file_images` VALUES (1893342194341785603, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cff5', 3);
INSERT INTO `tb_file_images` VALUES (1893342194341785604, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cff6', 4);
INSERT INTO `tb_file_images` VALUES (1893342194341785605, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cff7', 5);
INSERT INTO `tb_file_images` VALUES (1893342194341785606, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cff8', 6);
INSERT INTO `tb_file_images` VALUES (1893342194341785607, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cff9', 7);
INSERT INTO `tb_file_images` VALUES (1893342194341785608, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cffa', 8);
INSERT INTO `tb_file_images` VALUES (1893342194341785609, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cffb', 9);
INSERT INTO `tb_file_images` VALUES (1893342194350174209, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cffc', 10);
INSERT INTO `tb_file_images` VALUES (1893342194350174210, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cffd', 11);
INSERT INTO `tb_file_images` VALUES (1893342194350174211, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cffe', 12);
INSERT INTO `tb_file_images` VALUES (1893342194350174212, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2cfff', 13);
INSERT INTO `tb_file_images` VALUES (1893342194350174213, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2d000', 14);
INSERT INTO `tb_file_images` VALUES (1893342194350174214, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2d001', 15);
INSERT INTO `tb_file_images` VALUES (1893342194350174215, 1893342145029353474, 'local-plus/1893342145029353474/67b9fff23522a4f17ae2d002', 16);
INSERT INTO `tb_file_images` VALUES (1893342960796323842, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a83522adb4125c8c29', 1);
INSERT INTO `tb_file_images` VALUES (1893342960800518146, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a83522adb4125c8c2a', 2);
INSERT INTO `tb_file_images` VALUES (1893342960808906753, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a83522adb4125c8c2b', 3);
INSERT INTO `tb_file_images` VALUES (1893342960808906754, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a83522adb4125c8c2c', 4);
INSERT INTO `tb_file_images` VALUES (1893342960808906755, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a83522adb4125c8c2d', 5);
INSERT INTO `tb_file_images` VALUES (1893342960817295362, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a83522adb4125c8c2e', 6);
INSERT INTO `tb_file_images` VALUES (1893342960821489665, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a93522adb4125c8c2f', 7);
INSERT INTO `tb_file_images` VALUES (1893342960821489666, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a93522adb4125c8c30', 8);
INSERT INTO `tb_file_images` VALUES (1893342960829878273, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a93522adb4125c8c31', 9);
INSERT INTO `tb_file_images` VALUES (1893342960829878274, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a93522adb4125c8c32', 10);
INSERT INTO `tb_file_images` VALUES (1893342960829878275, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a93522adb4125c8c33', 11);
INSERT INTO `tb_file_images` VALUES (1893342960838266882, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a93522adb4125c8c34', 12);
INSERT INTO `tb_file_images` VALUES (1893342960838266883, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a93522adb4125c8c35', 13);
INSERT INTO `tb_file_images` VALUES (1893342960846655489, 1893342847294263297, 'local-plus/1893342847294263297/67ba00a93522adb4125c8c36', 14);
INSERT INTO `tb_file_images` VALUES (1893342972666204161, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c37', 1);
INSERT INTO `tb_file_images` VALUES (1893342972666204162, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c38', 2);
INSERT INTO `tb_file_images` VALUES (1893342972666204163, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c39', 3);
INSERT INTO `tb_file_images` VALUES (1893342972729118721, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c3a', 4);
INSERT INTO `tb_file_images` VALUES (1893342972729118722, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c3b', 5);
INSERT INTO `tb_file_images` VALUES (1893342972729118723, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c3c', 6);
INSERT INTO `tb_file_images` VALUES (1893342972729118724, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c3d', 7);
INSERT INTO `tb_file_images` VALUES (1893342972729118725, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c3e', 8);
INSERT INTO `tb_file_images` VALUES (1893342972729118726, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c3f', 9);
INSERT INTO `tb_file_images` VALUES (1893342972729118727, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c40', 10);
INSERT INTO `tb_file_images` VALUES (1893342972729118728, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c41', 11);
INSERT INTO `tb_file_images` VALUES (1893342972729118729, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c42', 12);
INSERT INTO `tb_file_images` VALUES (1893342972729118730, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c43', 13);
INSERT INTO `tb_file_images` VALUES (1893342972729118731, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c44', 14);
INSERT INTO `tb_file_images` VALUES (1893342972729118732, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c45', 15);
INSERT INTO `tb_file_images` VALUES (1893342972729118733, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c46', 16);
INSERT INTO `tb_file_images` VALUES (1893342972729118734, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c47', 17);
INSERT INTO `tb_file_images` VALUES (1893342972729118735, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c48', 18);
INSERT INTO `tb_file_images` VALUES (1893342972729118736, 1893342876255932417, 'local-plus/1893342876255932417/67ba00ab3522adb4125c8c49', 19);
INSERT INTO `tb_file_images` VALUES (1893342982174691330, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ad3522adb4125c8c4a', 1);
INSERT INTO `tb_file_images` VALUES (1893342982174691331, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ad3522adb4125c8c4b', 2);
INSERT INTO `tb_file_images` VALUES (1893342982174691332, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ad3522adb4125c8c4c', 3);
INSERT INTO `tb_file_images` VALUES (1893342982174691333, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ad3522adb4125c8c4d', 4);
INSERT INTO `tb_file_images` VALUES (1893342982174691334, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c4e', 5);
INSERT INTO `tb_file_images` VALUES (1893342982174691335, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c4f', 6);
INSERT INTO `tb_file_images` VALUES (1893342982174691336, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c50', 7);
INSERT INTO `tb_file_images` VALUES (1893342982174691337, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c51', 8);
INSERT INTO `tb_file_images` VALUES (1893342982174691338, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c52', 9);
INSERT INTO `tb_file_images` VALUES (1893342982174691339, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c53', 10);
INSERT INTO `tb_file_images` VALUES (1893342982241800193, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c54', 11);
INSERT INTO `tb_file_images` VALUES (1893342982241800194, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c55', 12);
INSERT INTO `tb_file_images` VALUES (1893342982241800195, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c56', 13);
INSERT INTO `tb_file_images` VALUES (1893342982241800196, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c57', 14);
INSERT INTO `tb_file_images` VALUES (1893342982241800197, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c58', 15);
INSERT INTO `tb_file_images` VALUES (1893342982241800198, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c59', 16);
INSERT INTO `tb_file_images` VALUES (1893342982241800199, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c5a', 17);
INSERT INTO `tb_file_images` VALUES (1893342982241800200, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c5b', 18);
INSERT INTO `tb_file_images` VALUES (1893342982241800201, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c5c', 19);
INSERT INTO `tb_file_images` VALUES (1893342982241800202, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c5d', 20);
INSERT INTO `tb_file_images` VALUES (1893342982241800203, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c5e', 21);
INSERT INTO `tb_file_images` VALUES (1893342982241800204, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c5f', 22);
INSERT INTO `tb_file_images` VALUES (1893342982241800205, 1893342906727550978, 'local-plus/1893342906727550978/67ba00ae3522adb4125c8c60', 23);
INSERT INTO `tb_file_images` VALUES (1893348695160655873, 1893340282775154689, 'local-plus/1893340282775154689/67ba05ff3522726853d0a3ab', 1);
INSERT INTO `tb_file_images` VALUES (1893348695160655874, 1893340282775154689, 'local-plus/1893340282775154689/67ba05ff3522726853d0a3ac', 2);
INSERT INTO `tb_file_images` VALUES (1893348695173238785, 1893340282775154689, 'local-plus/1893340282775154689/67ba05ff3522726853d0a3ad', 3);
INSERT INTO `tb_file_images` VALUES (1893348695177433089, 1893340282775154689, 'local-plus/1893340282775154689/67ba05ff3522726853d0a3ae', 4);
INSERT INTO `tb_file_images` VALUES (1893348695177433090, 1893340282775154689, 'local-plus/1893340282775154689/67ba05ff3522726853d0a3af', 5);
INSERT INTO `tb_file_images` VALUES (1893348695185821698, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3b0', 6);
INSERT INTO `tb_file_images` VALUES (1893348695185821699, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3b1', 7);
INSERT INTO `tb_file_images` VALUES (1893348695185821700, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3b2', 8);
INSERT INTO `tb_file_images` VALUES (1893348695190016002, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3b3', 9);
INSERT INTO `tb_file_images` VALUES (1893348695194210305, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3b4', 10);
INSERT INTO `tb_file_images` VALUES (1893348695194210306, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3b5', 11);
INSERT INTO `tb_file_images` VALUES (1893348695194210307, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3b6', 12);
INSERT INTO `tb_file_images` VALUES (1893348695194210308, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3b7', 13);
INSERT INTO `tb_file_images` VALUES (1893348695206793218, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3b8', 14);
INSERT INTO `tb_file_images` VALUES (1893348695206793219, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3b9', 15);
INSERT INTO `tb_file_images` VALUES (1893348695215181825, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3ba', 16);
INSERT INTO `tb_file_images` VALUES (1893348695227764737, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3bb', 17);
INSERT INTO `tb_file_images` VALUES (1893348695236153345, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3bc', 18);
INSERT INTO `tb_file_images` VALUES (1893348695236153346, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3bd', 19);
INSERT INTO `tb_file_images` VALUES (1893348695236153347, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3be', 20);
INSERT INTO `tb_file_images` VALUES (1893348695236153348, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3bf', 21);
INSERT INTO `tb_file_images` VALUES (1893348695236153349, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3c0', 22);
INSERT INTO `tb_file_images` VALUES (1893348695244541953, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3c1', 23);
INSERT INTO `tb_file_images` VALUES (1893348695244541954, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3c2', 24);
INSERT INTO `tb_file_images` VALUES (1893348695244541955, 1893340282775154689, 'local-plus/1893340282775154689/67ba06003522726853d0a3c3', 25);
INSERT INTO `tb_file_images` VALUES (1909111476367036417, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505801', 1);
INSERT INTO `tb_file_images` VALUES (1909111476375425026, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505802', 2);
INSERT INTO `tb_file_images` VALUES (1909111476375425027, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505803', 3);
INSERT INTO `tb_file_images` VALUES (1909111476375425028, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505804', 4);
INSERT INTO `tb_file_images` VALUES (1909111476375425029, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505805', 5);
INSERT INTO `tb_file_images` VALUES (1909111476375425030, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505806', 6);
INSERT INTO `tb_file_images` VALUES (1909111476375425031, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505807', 7);
INSERT INTO `tb_file_images` VALUES (1909111476383813634, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505808', 8);
INSERT INTO `tb_file_images` VALUES (1909111476383813635, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505809', 9);
INSERT INTO `tb_file_images` VALUES (1909111476383813636, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950580a', 10);
INSERT INTO `tb_file_images` VALUES (1909111476383813637, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950580b', 11);
INSERT INTO `tb_file_images` VALUES (1909111476383813638, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950580c', 12);
INSERT INTO `tb_file_images` VALUES (1909111476383813639, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950580d', 13);
INSERT INTO `tb_file_images` VALUES (1909111476383813640, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950580e', 14);
INSERT INTO `tb_file_images` VALUES (1909111476392202241, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950580f', 15);
INSERT INTO `tb_file_images` VALUES (1909111476392202242, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505810', 16);
INSERT INTO `tb_file_images` VALUES (1909111476396396545, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505811', 17);
INSERT INTO `tb_file_images` VALUES (1909111476404785153, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505812', 18);
INSERT INTO `tb_file_images` VALUES (1909111476404785154, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505813', 19);
INSERT INTO `tb_file_images` VALUES (1909111476404785155, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505814', 20);
INSERT INTO `tb_file_images` VALUES (1909111476404785156, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505815', 21);
INSERT INTO `tb_file_images` VALUES (1909111476404785157, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505816', 22);
INSERT INTO `tb_file_images` VALUES (1909111476404785158, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505817', 23);
INSERT INTO `tb_file_images` VALUES (1909111476413173762, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505818', 24);
INSERT INTO `tb_file_images` VALUES (1909111476413173763, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505819', 25);
INSERT INTO `tb_file_images` VALUES (1909111476417368066, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950581a', 26);
INSERT INTO `tb_file_images` VALUES (1909111476417368067, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950581b', 27);
INSERT INTO `tb_file_images` VALUES (1909111476417368068, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950581c', 28);
INSERT INTO `tb_file_images` VALUES (1909111476417368069, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950581d', 29);
INSERT INTO `tb_file_images` VALUES (1909111476417368070, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950581e', 30);
INSERT INTO `tb_file_images` VALUES (1909111476417368071, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba9950581f', 31);
INSERT INTO `tb_file_images` VALUES (1909111476417368072, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505820', 32);
INSERT INTO `tb_file_images` VALUES (1909111476417368073, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505821', 33);
INSERT INTO `tb_file_images` VALUES (1909111476417368074, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505822', 34);
INSERT INTO `tb_file_images` VALUES (1909111476425756673, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505823', 35);
INSERT INTO `tb_file_images` VALUES (1909111476425756674, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3af6e1dcba99505824', 36);
INSERT INTO `tb_file_images` VALUES (1909111476425756675, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505825', 37);
INSERT INTO `tb_file_images` VALUES (1909111476425756676, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505826', 38);
INSERT INTO `tb_file_images` VALUES (1909111476425756677, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505827', 39);
INSERT INTO `tb_file_images` VALUES (1909111476425756678, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505828', 40);
INSERT INTO `tb_file_images` VALUES (1909111476425756679, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505829', 41);
INSERT INTO `tb_file_images` VALUES (1909111476425756680, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950582a', 42);
INSERT INTO `tb_file_images` VALUES (1909111476425756681, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950582b', 43);
INSERT INTO `tb_file_images` VALUES (1909111476434145281, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950582c', 44);
INSERT INTO `tb_file_images` VALUES (1909111476434145282, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950582d', 45);
INSERT INTO `tb_file_images` VALUES (1909111476434145283, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950582e', 46);
INSERT INTO `tb_file_images` VALUES (1909111476434145284, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950582f', 47);
INSERT INTO `tb_file_images` VALUES (1909111476434145285, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505830', 48);
INSERT INTO `tb_file_images` VALUES (1909111476438339585, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505831', 49);
INSERT INTO `tb_file_images` VALUES (1909111476438339586, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505832', 50);
INSERT INTO `tb_file_images` VALUES (1909111476438339587, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505833', 51);
INSERT INTO `tb_file_images` VALUES (1909111476438339588, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505834', 52);
INSERT INTO `tb_file_images` VALUES (1909111476438339589, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505835', 53);
INSERT INTO `tb_file_images` VALUES (1909111476438339590, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505836', 54);
INSERT INTO `tb_file_images` VALUES (1909111476438339591, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505837', 55);
INSERT INTO `tb_file_images` VALUES (1909111476438339592, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505838', 56);
INSERT INTO `tb_file_images` VALUES (1909111476438339593, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505839', 57);
INSERT INTO `tb_file_images` VALUES (1909111476438339594, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950583a', 58);
INSERT INTO `tb_file_images` VALUES (1909111476438339595, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950583b', 59);
INSERT INTO `tb_file_images` VALUES (1909111476438339596, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950583c', 60);
INSERT INTO `tb_file_images` VALUES (1909111476446728194, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950583d', 61);
INSERT INTO `tb_file_images` VALUES (1909111476446728195, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950583e', 62);
INSERT INTO `tb_file_images` VALUES (1909111476446728196, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950583f', 63);
INSERT INTO `tb_file_images` VALUES (1909111476455116801, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505840', 64);
INSERT INTO `tb_file_images` VALUES (1909111476455116802, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505841', 65);
INSERT INTO `tb_file_images` VALUES (1909111476455116803, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505842', 66);
INSERT INTO `tb_file_images` VALUES (1909111476455116804, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505843', 67);
INSERT INTO `tb_file_images` VALUES (1909111476455116805, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505844', 68);
INSERT INTO `tb_file_images` VALUES (1909111476455116806, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505845', 69);
INSERT INTO `tb_file_images` VALUES (1909111476455116807, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505846', 70);
INSERT INTO `tb_file_images` VALUES (1909111476455116808, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505847', 71);
INSERT INTO `tb_file_images` VALUES (1909111476455116809, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505848', 72);
INSERT INTO `tb_file_images` VALUES (1909111476455116810, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505849', 73);
INSERT INTO `tb_file_images` VALUES (1909111476455116811, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950584a', 74);
INSERT INTO `tb_file_images` VALUES (1909111476463505409, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950584b', 75);
INSERT INTO `tb_file_images` VALUES (1909111476463505410, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950584c', 76);
INSERT INTO `tb_file_images` VALUES (1909111476463505411, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950584d', 77);
INSERT INTO `tb_file_images` VALUES (1909111476463505412, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950584e', 78);
INSERT INTO `tb_file_images` VALUES (1909111476463505413, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba9950584f', 79);
INSERT INTO `tb_file_images` VALUES (1909111476463505414, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505850', 80);
INSERT INTO `tb_file_images` VALUES (1909111476463505415, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505851', 81);
INSERT INTO `tb_file_images` VALUES (1909111476463505416, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505852', 82);
INSERT INTO `tb_file_images` VALUES (1909111476463505417, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505853', 83);
INSERT INTO `tb_file_images` VALUES (1909111476463505418, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3bf6e1dcba99505854', 84);
INSERT INTO `tb_file_images` VALUES (1909111476463505419, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3cf6e1dcba99505855', 85);
INSERT INTO `tb_file_images` VALUES (1909111476463505420, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3cf6e1dcba99505856', 86);
INSERT INTO `tb_file_images` VALUES (1909111476463505421, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3cf6e1dcba99505857', 87);
INSERT INTO `tb_file_images` VALUES (1909111476471894018, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3cf6e1dcba99505858', 88);
INSERT INTO `tb_file_images` VALUES (1909111476471894019, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3cf6e1dcba99505859', 89);
INSERT INTO `tb_file_images` VALUES (1909111476471894020, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3cf6e1dcba9950585a', 90);
INSERT INTO `tb_file_images` VALUES (1909111476471894021, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3cf6e1dcba9950585b', 91);
INSERT INTO `tb_file_images` VALUES (1909111476471894022, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3cf6e1dcba9950585c', 92);
INSERT INTO `tb_file_images` VALUES (1909111476476088322, 1909111294267133953, 'local-plus/1909111294267133953/67f35e3cf6e1dcba9950585d', 93);
INSERT INTO `tb_file_images` VALUES (1909111745003819010, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7bf6e1dcba9950585f', 1);
INSERT INTO `tb_file_images` VALUES (1909111745003819011, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7bf6e1dcba99505860', 2);
INSERT INTO `tb_file_images` VALUES (1909111745003819012, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7bf6e1dcba99505861', 3);
INSERT INTO `tb_file_images` VALUES (1909111745003819013, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7bf6e1dcba99505862', 4);
INSERT INTO `tb_file_images` VALUES (1909111745003819014, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505863', 5);
INSERT INTO `tb_file_images` VALUES (1909111745003819015, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505864', 6);
INSERT INTO `tb_file_images` VALUES (1909111745003819016, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505865', 7);
INSERT INTO `tb_file_images` VALUES (1909111745012207618, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505866', 8);
INSERT INTO `tb_file_images` VALUES (1909111745012207619, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505867', 9);
INSERT INTO `tb_file_images` VALUES (1909111745012207620, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505868', 10);
INSERT INTO `tb_file_images` VALUES (1909111745012207621, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505869', 11);
INSERT INTO `tb_file_images` VALUES (1909111745016401921, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba9950586a', 12);
INSERT INTO `tb_file_images` VALUES (1909111745016401922, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba9950586b', 13);
INSERT INTO `tb_file_images` VALUES (1909111745016401923, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba9950586c', 14);
INSERT INTO `tb_file_images` VALUES (1909111745016401924, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba9950586d', 15);
INSERT INTO `tb_file_images` VALUES (1909111745016401925, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba9950586e', 16);
INSERT INTO `tb_file_images` VALUES (1909111745020596225, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba9950586f', 17);
INSERT INTO `tb_file_images` VALUES (1909111745020596226, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505870', 18);
INSERT INTO `tb_file_images` VALUES (1909111745020596227, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505871', 19);
INSERT INTO `tb_file_images` VALUES (1909111745020596228, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505872', 20);
INSERT INTO `tb_file_images` VALUES (1909111745020596229, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505873', 21);
INSERT INTO `tb_file_images` VALUES (1909111745020596230, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505874', 22);
INSERT INTO `tb_file_images` VALUES (1909111745020596231, 1909111670957576194, 'local-plus/1909111670957576194/67f35e7cf6e1dcba99505875', 23);
INSERT INTO `tb_file_images` VALUES (1909112397436194818, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505877', 1);
INSERT INTO `tb_file_images` VALUES (1909112397436194819, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505878', 2);
INSERT INTO `tb_file_images` VALUES (1909112397436194820, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505879', 3);
INSERT INTO `tb_file_images` VALUES (1909112397436194821, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba9950587a', 4);
INSERT INTO `tb_file_images` VALUES (1909112397436194822, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba9950587b', 5);
INSERT INTO `tb_file_images` VALUES (1909112397436194823, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba9950587c', 6);
INSERT INTO `tb_file_images` VALUES (1909112397436194824, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba9950587d', 7);
INSERT INTO `tb_file_images` VALUES (1909112397436194825, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba9950587e', 8);
INSERT INTO `tb_file_images` VALUES (1909112397436194826, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba9950587f', 9);
INSERT INTO `tb_file_images` VALUES (1909112397436194827, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505880', 10);
INSERT INTO `tb_file_images` VALUES (1909112397499109378, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505881', 11);
INSERT INTO `tb_file_images` VALUES (1909112397499109379, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505882', 12);
INSERT INTO `tb_file_images` VALUES (1909112397499109380, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505883', 13);
INSERT INTO `tb_file_images` VALUES (1909112397499109381, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505884', 14);
INSERT INTO `tb_file_images` VALUES (1909112397499109382, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505885', 15);
INSERT INTO `tb_file_images` VALUES (1909112397499109383, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505886', 16);
INSERT INTO `tb_file_images` VALUES (1909112397499109384, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505887', 17);
INSERT INTO `tb_file_images` VALUES (1909112397499109385, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505888', 18);
INSERT INTO `tb_file_images` VALUES (1909112397499109386, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba99505889', 19);
INSERT INTO `tb_file_images` VALUES (1909112397499109387, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba9950588a', 20);
INSERT INTO `tb_file_images` VALUES (1909112397499109388, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba9950588b', 21);
INSERT INTO `tb_file_images` VALUES (1909112397499109389, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba9950588c', 22);
INSERT INTO `tb_file_images` VALUES (1909112397499109390, 1909112333699551233, 'local-plus/1909112333699551233/67f35f17f6e1dcba9950588d', 23);
INSERT INTO `tb_file_images` VALUES (1909115550709747713, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba9950588f', 1);
INSERT INTO `tb_file_images` VALUES (1909115550709747714, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba99505890', 2);
INSERT INTO `tb_file_images` VALUES (1909115550709747715, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba99505891', 3);
INSERT INTO `tb_file_images` VALUES (1909115550709747716, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba99505892', 4);
INSERT INTO `tb_file_images` VALUES (1909115550709747717, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba99505893', 5);
INSERT INTO `tb_file_images` VALUES (1909115550709747718, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba99505894', 6);
INSERT INTO `tb_file_images` VALUES (1909115550709747719, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba99505895', 7);
INSERT INTO `tb_file_images` VALUES (1909115550709747720, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba99505896', 8);
INSERT INTO `tb_file_images` VALUES (1909115550709747721, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba99505897', 9);
INSERT INTO `tb_file_images` VALUES (1909115550709747722, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba99505898', 10);
INSERT INTO `tb_file_images` VALUES (1909115550709747723, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba99505899', 11);
INSERT INTO `tb_file_images` VALUES (1909115550709747724, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba9950589a', 12);
INSERT INTO `tb_file_images` VALUES (1909115550709747725, 1909115478714519553, 'local-plus/1909115478714519553/67f36205f6e1dcba9950589b', 13);
INSERT INTO `tb_file_images` VALUES (1909115550709747726, 1909115478714519553, 'local-plus/1909115478714519553/67f36206f6e1dcba9950589c', 14);
INSERT INTO `tb_file_images` VALUES (1909115550709747727, 1909115478714519553, 'local-plus/1909115478714519553/67f36206f6e1dcba9950589d', 15);
INSERT INTO `tb_file_images` VALUES (1909115550709747728, 1909115478714519553, 'local-plus/1909115478714519553/67f36206f6e1dcba9950589e', 16);
INSERT INTO `tb_file_images` VALUES (1909115550709747729, 1909115478714519553, 'local-plus/1909115478714519553/67f36206f6e1dcba9950589f', 17);
INSERT INTO `tb_file_images` VALUES (1909115550776856577, 1909115478714519553, 'local-plus/1909115478714519553/67f36206f6e1dcba995058a0', 18);
INSERT INTO `tb_file_images` VALUES (1909115550776856578, 1909115478714519553, 'local-plus/1909115478714519553/67f36207f6e1dcba995058a1', 19);
INSERT INTO `tb_file_images` VALUES (1909115550776856579, 1909115478714519553, 'local-plus/1909115478714519553/67f36207f6e1dcba995058a2', 20);
INSERT INTO `tb_file_images` VALUES (1909115550776856580, 1909115478714519553, 'local-plus/1909115478714519553/67f36207f6e1dcba995058a3', 21);
INSERT INTO `tb_file_images` VALUES (1909115550776856581, 1909115478714519553, 'local-plus/1909115478714519553/67f36207f6e1dcba995058a4', 22);
INSERT INTO `tb_file_images` VALUES (1909115550776856582, 1909115478714519553, 'local-plus/1909115478714519553/67f36207f6e1dcba995058a5', 23);

-- ----------------------------
-- Table structure for tb_goal
-- ----------------------------
DROP TABLE IF EXISTS `tb_goal`;
CREATE TABLE `tb_goal`  (
  `id` bigint NOT NULL COMMENT '学习目标ID',
  `user_id` bigint NOT NULL COMMENT '关联用户ID',
  `goal_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学习目标名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '目标描述',
  `deadline` timestamp NOT NULL COMMENT '目标完成日期',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态(0-未完成 1-已完成)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学习目标表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_goal
-- ----------------------------
INSERT INTO `tb_goal` VALUES (1899700088586534913, 104, '10天学会Java', '10天学会Java', '2025-03-31 00:00:00', 0, 'admin', '2025-03-12 13:52:50', NULL, NULL, 0);
INSERT INTO `tb_goal` VALUES (1899700088586534914, 104, '10天学会Python', '10天学会Python', '2025-03-31 00:00:00', 0, 'admin', '2025-03-12 13:52:50', NULL, NULL, 0);
INSERT INTO `tb_goal` VALUES (1900946006267256834, 104, '10天学会C++', '10天学会C++', '2025-03-31 00:00:00', 0, '202325350123', '2025-03-16 00:23:40', NULL, '2025-03-28 23:23:05', 0);

-- ----------------------------
-- Table structure for tb_homework
-- ----------------------------
DROP TABLE IF EXISTS `tb_homework`;
CREATE TABLE `tb_homework`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '作业ID',
  `course_id` bigint NOT NULL COMMENT '所属课程ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作业标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作业内容',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT (now()) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1893592426396831747 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '作业表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_homework
-- ----------------------------
INSERT INTO `tb_homework` VALUES (1893592426396831746, 1893330048954441729, '作业1', '<p>使用DreamWeaver工具创建一个简单的HTML页面</p><p><img src=\"/dev-api/common/preview/1914706087395336194\"><img src=\"/dev-api/common/preview/1914705912840986626\"></p>', NULL, '2025-02-23 17:23:10', NULL, '2025-04-22 19:26:37', 0);

-- ----------------------------
-- Table structure for tb_homework_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_homework_student`;
CREATE TABLE `tb_homework_student`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `homework_id` bigint NOT NULL COMMENT '作业ID',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '作答内容',
  `submit_time` timestamp NULL DEFAULT NULL COMMENT '提交时间',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '提交状态(0-未做 1-待批阅 2-已批阅)',
  `score` int NULL DEFAULT NULL COMMENT '分数',
  `suggestion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '批阅意见',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生作业表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_homework_student
-- ----------------------------
INSERT INTO `tb_homework_student` VALUES (1914712418953076738, 104, 1893592426396831746, '<p>啦啦啦啦</p><pre class=\"ql-syntax\" spellcheck=\"false\">import pandas as pd\n\nprint(\"hello world\")\n</pre>\n<pre class=\"ql-syntax\" spellcheck=\"false\">import pandas as pd\n\nprint(\"hello world\")\n</pre>\n<pre class=\"ql-syntax\" spellcheck=\"false\">import pandas as pd\n\nprint(\"hello world\")\n</pre>\n<pre class=\"ql-syntax\" spellcheck=\"false\">import pandas as pd\n\nprint(\"hello world\")\n</pre>\n<pre class=\"ql-syntax\" spellcheck=\"false\">import pandas as pd\n\nprint(\"hello world\")\n</pre>\n<pre class=\"ql-syntax\" spellcheck=\"false\">import pandas as pd\n\nprint(\"hello world\")\n</pre>', '2025-04-23 00:06:29', 2, 4, '21312312', '202325350123', '2025-04-23 00:06:28', 'admin', '2025-05-06 16:35:26', 0);

-- ----------------------------
-- Table structure for tb_oss_file
-- ----------------------------
DROP TABLE IF EXISTS `tb_oss_file`;
CREATE TABLE `tb_oss_file`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名',
  `suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件后缀名',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件路径',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件类型',
  `size` bigint NOT NULL COMMENT '文件大小',
  `origin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '源文件名称',
  `file_type` int NOT NULL COMMENT '文件类型',
  `duration` int NULL DEFAULT NULL COMMENT '音视频时长',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '是否已删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_oss_file
-- ----------------------------
INSERT INTO `tb_oss_file` VALUES (1893330038930055169, '67b9f4a035222c6dc9735ca1.jpeg', 'jpeg', 'local-plus/67b9f4a035222c6dc9735ca1.jpeg', 'image/jpeg', 43744, 'HTML5.jpeg', 2, NULL, 0, 'admin', '2025-02-23 00:00:32', NULL, '2025-02-23 00:00:32');
INSERT INTO `tb_oss_file` VALUES (1893339122660020225, '67b9fd163522b4bdac232ac5.png', 'png', 'local-plus/67b9fd163522b4bdac232ac5.png', 'image/png', 4314, 'avatar.png', 2, NULL, 0, 'admin', '2025-02-23 00:36:38', NULL, '2025-02-23 00:36:38');
INSERT INTO `tb_oss_file` VALUES (1893340282775154689, '67b9fe2a3522a4f17ae2cf4b.pptx', 'pptx', 'local-plus/67b9fe2a3522a4f17ae2cf4b.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 5647723, 'HTML5+CSS3 Web前端设计基础教程（第1章）.pptx', 4, NULL, 0, 'admin', '2025-02-23 00:41:14', NULL, '2025-02-23 00:41:14');
INSERT INTO `tb_oss_file` VALUES (1893340620781531137, '67b9fe7b3522a4f17ae2cf4c.pptx', 'pptx', 'local-plus/67b9fe7b3522a4f17ae2cf4c.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 3648216, 'HTML5+CSS3 Web前端设计基础教程（第2章）.pptx', 4, NULL, 0, 'admin', '2025-02-23 00:42:35', NULL, '2025-02-23 00:42:35');
INSERT INTO `tb_oss_file` VALUES (1893340723030274049, '67b9fe933522a4f17ae2cf4d.pptx', 'pptx', 'local-plus/67b9fe933522a4f17ae2cf4d.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 3445570, 'HTML5+CSS3 Web前端设计基础教程（第3章）.pptx', 4, NULL, 0, 'admin', '2025-02-23 00:42:59', NULL, '2025-02-23 00:42:59');
INSERT INTO `tb_oss_file` VALUES (1893341139906342913, '67b9fef63522a4f17ae2cfb4.png', 'png', 'local-plus/67b9fef63522a4f17ae2cfb4.png', 'image/png', 132116, 'img-17079237190318b0c63b7274e8792f6fcbaff3d73803dd861e42caed97a2ae4b2504de279e6e9.png', 2, NULL, 0, 'admin', '2025-02-23 00:44:38', NULL, '2025-02-23 00:44:38');
INSERT INTO `tb_oss_file` VALUES (1893341754787115010, '67b9ff893522a4f17ae2cfb5.pptx', 'pptx', 'local-plus/67b9ff893522a4f17ae2cfb5.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 3692139, 'HTML5+CSS3 Web前端设计基础教程（第4章）.pptx', 4, NULL, 0, 'admin', '2025-02-23 00:47:05', NULL, '2025-02-23 00:47:05');
INSERT INTO `tb_oss_file` VALUES (1893341874337361921, '67b9ffa53522a4f17ae2cfc9.pptx', 'pptx', 'local-plus/67b9ffa53522a4f17ae2cfc9.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 4257454, 'HTML5+CSS3 Web前端设计基础教程（第5章）.pptx', 4, NULL, 0, 'admin', '2025-02-23 00:47:34', NULL, '2025-02-23 00:47:34');
INSERT INTO `tb_oss_file` VALUES (1893341911775719426, '67b9ffae3522a4f17ae2cfca.pptx', 'pptx', 'local-plus/67b9ffae3522a4f17ae2cfca.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 3471282, 'HTML5+CSS3 Web前端设计基础教程（第6章）.pptx', 4, NULL, 0, 'admin', '2025-02-23 00:47:43', NULL, '2025-02-23 00:47:43');
INSERT INTO `tb_oss_file` VALUES (1893342145029353474, '67b9ffe63522a4f17ae2cff2.pptx', 'pptx', 'local-plus/67b9ffe63522a4f17ae2cff2.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 4130759, 'HTML5+CSS3 Web前端设计基础教程（第7章）.pptx', 4, NULL, 0, 'admin', '2025-02-23 00:48:38', NULL, '2025-02-23 00:48:38');
INSERT INTO `tb_oss_file` VALUES (1893342847294263297, '67ba008d3522adb4125c8c26.pptx', 'pptx', 'local-plus/67ba008d3522adb4125c8c26.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 4117393, 'HTML5+CSS3 Web前端设计基础教程（第8章）.pptx', 4, NULL, 0, 'admin', '2025-02-23 00:51:26', NULL, '2025-02-23 00:51:26');
INSERT INTO `tb_oss_file` VALUES (1893342876255932417, '67ba00943522adb4125c8c27.pptx', 'pptx', 'local-plus/67ba00943522adb4125c8c27.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 5755958, 'HTML5+CSS3 Web前端设计基础教程（第9章）.pptx', 4, NULL, 0, 'admin', '2025-02-23 00:51:32', NULL, '2025-02-23 00:51:32');
INSERT INTO `tb_oss_file` VALUES (1893342906727550978, '67ba009c3522adb4125c8c28.pptx', 'pptx', 'local-plus/67ba009c3522adb4125c8c28.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 4847372, 'HTML5+CSS3 Web前端设计基础教程（第10章）.pptx', 4, NULL, 0, 'admin', '2025-02-23 00:51:40', NULL, '2025-02-23 00:51:40');
INSERT INTO `tb_oss_file` VALUES (1893349589973471233, '67ba06d53522726853d0a3c4.png', 'png', 'local-plus/67ba06d53522726853d0a3c4.png', 'image/png', 103470, 'img-1708007776980a85e78bae784a7742fe1d36a98da8201ecb88f9b9f8d23b4b365adb32ffea5c2.png', 2, NULL, 0, '202325350123', '2025-02-23 01:18:13', NULL, '2025-02-23 01:18:13');
INSERT INTO `tb_oss_file` VALUES (1893505965064577026, '67ba9878352231ed8f77b33f.jpg', 'jpg', 'local-plus/67ba9878352231ed8f77b33f.jpg', 'image/jpeg', 26262, 'R.jpg', 2, NULL, 0, 'admin', '2025-02-23 11:39:36', NULL, '2025-02-23 11:39:36');
INSERT INTO `tb_oss_file` VALUES (1893507826061385730, '67ba9a33b2f5e6f33bddfd53.mp4', 'mp4', 'local-plus/67ba9a33b2f5e6f33bddfd53.mp4', 'video/mp4', 19316782, '黑马程序员Java零基础视频教程_上部(Java入门，含斯坦福大学练习题+力扣算法题和大厂java面试题）-p01-80.mp4', 3, 499, 0, 'admin', '2025-02-23 11:47:00', NULL, '2025-02-23 11:47:00');
INSERT INTO `tb_oss_file` VALUES (1893508177074298881, '67ba9a87b2f5e6f33bddfd54.mp4', 'mp4', 'local-plus/67ba9a87b2f5e6f33bddfd54.mp4', 'video/mp4', 18061891, '黑马程序员Java零基础视频教程_上部(Java入门，含斯坦福大学练习题+力扣算法题和大厂java面试题）-p02-80.mp4', 3, 498, 0, 'admin', '2025-02-23 11:48:23', NULL, '2025-02-23 11:48:23');
INSERT INTO `tb_oss_file` VALUES (1893508263103668226, '67ba9a9bb2f5e6f33bddfd55.mp4', 'mp4', 'local-plus/67ba9a9bb2f5e6f33bddfd55.mp4', 'video/mp4', 9488906, '黑马程序员Java零基础视频教程_上部(Java入门，含斯坦福大学练习题+力扣算法题和大厂java面试题）-p03-80.mp4', 3, 266, 0, 'admin', '2025-02-23 11:48:44', NULL, '2025-02-23 11:48:44');
INSERT INTO `tb_oss_file` VALUES (1893508314236428289, '67ba9aa7b2f5e6f33bddfd56.mp4', 'mp4', 'local-plus/67ba9aa7b2f5e6f33bddfd56.mp4', 'video/mp4', 22845543, '黑马程序员Java零基础视频教程_上部(Java入门，含斯坦福大学练习题+力扣算法题和大厂java面试题）-p04-80.mp4', 3, 448, 0, 'admin', '2025-02-23 11:48:56', NULL, '2025-02-23 11:48:56');
INSERT INTO `tb_oss_file` VALUES (1893508394603487234, '67ba9ab9b2f5e6f33bddfd57.mp4', 'mp4', 'local-plus/67ba9ab9b2f5e6f33bddfd57.mp4', 'video/mp4', 27655524, '黑马程序员Java零基础视频教程_上部(Java入门，含斯坦福大学练习题+力扣算法题和大厂java面试题）-p05-80.mp4', 3, 590, 0, 'admin', '2025-02-23 11:49:15', NULL, '2025-02-23 11:49:15');
INSERT INTO `tb_oss_file` VALUES (1893508481996005377, '67ba9acfb2f5e6f33bddfd58.mp4', 'mp4', 'local-plus/67ba9acfb2f5e6f33bddfd58.mp4', 'video/mp4', 10575800, '黑马程序员Java零基础视频教程_上部(Java入门，含斯坦福大学练习题+力扣算法题和大厂java面试题）-p06-80.mp4', 3, 263, 0, 'admin', '2025-02-23 11:49:36', NULL, '2025-02-23 11:49:36');
INSERT INTO `tb_oss_file` VALUES (1893508673075912705, '67ba9afdb2f5e6f33bddfd5a.mp4', 'mp4', 'local-plus/67ba9afdb2f5e6f33bddfd5a.mp4', 'video/mp4', 31145638, '黑马程序员Java零基础视频教程_上部(Java入门，含斯坦福大学练习题+力扣算法题和大厂java面试题）-p08-80.mp4', 3, 1002, 0, 'admin', '2025-02-23 11:50:22', NULL, '2025-02-23 11:50:22');
INSERT INTO `tb_oss_file` VALUES (1893581199318724609, '67bade8935224961f5350c56.png', 'png', 'local-plus/67bade8935224961f5350c56.png', 'image/png', 97707, 'img-1707923724973e6be34c2f4d6f9926aa227902eabd6523254eb54ff0fc8574252fc3745f3a77f.png', 2, NULL, 0, '202325350123', '2025-02-23 16:38:33', NULL, '2025-02-23 16:38:33');
INSERT INTO `tb_oss_file` VALUES (1893597682493050881, '67baede335225c3bfda27950.jpg', 'jpg', 'local-plus/67baede335225c3bfda27950.jpg', 'image/jpeg', 102107, 'lg_3596329_1607764813_5fd48b4db5596.jpg', 2, NULL, 0, 'admin', '2025-02-23 17:44:03', NULL, '2025-02-23 17:44:03');
INSERT INTO `tb_oss_file` VALUES (1893597682493050882, '17-22-53-3.mp4', 'mp4', 'local-plus/17-35-08-0.mp4', 'video/mp4', 61535920, '17-22-53-3.mp4', 3, NULL, 0, NULL, '2025-02-27 19:42:10', NULL, '2025-02-27 19:42:10');
INSERT INTO `tb_oss_file` VALUES (1909111294267133953, '67f35e10f6e1dcba99505800.pdf', 'pdf', 'local-plus/67f35e10f6e1dcba99505800.pdf', 'application/pdf', 5383693, '在线学习资源个性化推荐系统的设计与实现_许祥娟.pdf', 5, NULL, 0, 'admin', '2025-04-07 13:09:36', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1909111670957576194, '67f35e6af6e1dcba9950585e.pptx', 'pptx', 'local-plus/67f35e6af6e1dcba9950585e.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 4847372, 'HTML5+CSS3 Web前端设计基础教程（第10章）.pptx', 4, NULL, 0, 'admin', '2025-04-07 13:11:06', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1909112333699551233, '67f35f08f6e1dcba99505876.pptx', 'pptx', 'local-plus/67f35f08f6e1dcba99505876.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 4847372, 'HTML5+CSS3 Web前端设计基础教程（第10章）HTML5+CSS3 Web前端设计基础教程（第10章）HTML5+CSS3 Web前端设计基础教程（第10章）.pptx', 4, NULL, 0, 'admin', '2025-04-07 13:13:44', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1909115478714519553, '67f361f6f6e1dcba9950588e.pptx', 'pptx', 'local-plus/67f361f6f6e1dcba9950588e.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 4847372, 'HTML5+CSS3 Web前端设计基础教程（第10章）HTML5+CSS3 Web前端设计基础教程（第10章）HTML5+CSS3 Web前端设计基础教程（第10章）.pptx', 4, NULL, 0, 'admin', '2025-04-07 13:26:14', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1909983360524627969, '67f68a3d454f3eecd51e3972.png', 'png', 'local-plus/67f68a3d454f3eecd51e3972.png', 'image/png', 1959010, '屏幕截图 2023-04-12 103017.png', 2, NULL, 0, 'admin', '2025-04-09 22:54:53', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1914641983745961986, '68077ceb3b2377b4002f5b51.jpg', 'jpg', 'local-plus/68077ceb3b2377b4002f5b51.jpg', 'image/jpeg', 1231607, 'img-17079237190318b0c63b7274e8792f6fcbaff3d73803dd861e42caed97a2ae4b2504de279e6e9.jpg', 2, NULL, 0, 'admin', '2025-04-22 19:26:35', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1914705912840986626, '6807b8753e7fe1cacfee406b.png', 'png', 'local-plus/6807b8753e7fe1cacfee406b.png', 'image/png', 4314, 'avatar.png', 2, NULL, 0, 'admin', '2025-04-22 23:40:37', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1914706087395336194, '6807b89f3e7fe1cacfee406c.jpg', 'jpg', 'local-plus/6807b89f3e7fe1cacfee406c.jpg', 'image/jpeg', 1231607, 'img-17079237190318b0c63b7274e8792f6fcbaff3d73803dd861e42caed97a2ae4b2504de279e6e9.jpg', 2, NULL, 0, 'admin', '2025-04-22 23:41:19', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1915213883945689090, '6809918b3e7fc60363daed10.png', 'png', 'local-plus/6809918b3e7fc60363daed10.png', 'image/png', 24333, 'avatar.png', 2, NULL, 0, '202325350123', '2025-04-24 09:19:07', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1920320715106226177, '681c25a6e67a78a2c0213cd8.jpg', 'jpg', 'local-plus/681c25a6e67a78a2c0213cd8.jpg', 'image/jpeg', 964429, 'img-1707923724973e6be34c2f4d6f9926aa227902eabd6523254eb54ff0fc8574252fc3745f3a77f.jpg', 2, NULL, 0, 'admin', '2025-05-08 11:31:50', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1920320715106226178, '681c25a6e67a78a2c0213cd7.jpg', 'jpg', 'local-plus/681c25a6e67a78a2c0213cd7.jpg', 'image/jpeg', 1231607, 'img-17079237190318b0c63b7274e8792f6fcbaff3d73803dd861e42caed97a2ae4b2504de279e6e9.jpg', 2, NULL, 0, 'admin', '2025-05-08 11:31:50', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1920320715106226179, '681c25a6e67a78a2c0213cd9.jpg', 'jpg', 'local-plus/681c25a6e67a78a2c0213cd9.jpg', 'image/jpeg', 1286452, 'img-1708007776980a85e78bae784a7742fe1d36a98da8201ecb88f9b9f8d23b4b365adb32ffea5c2.jpg', 2, NULL, 0, 'admin', '2025-05-08 11:31:50', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1920321745915154434, '681c269ce67a78a2c0213cda.jpeg', 'jpeg', 'local-plus/681c269ce67a78a2c0213cda.jpeg', 'image/jpeg', 43744, '67b9f4a035222c6dc9735ca1.jpeg', 2, NULL, 0, 'admin', '2025-05-08 11:35:56', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1920321745915154435, '681c269ce67a78a2c0213cdb.jpg', 'jpg', 'local-plus/681c269ce67a78a2c0213cdb.jpg', 'image/jpeg', 102107, '67baede335225c3bfda27950.jpg', 2, NULL, 0, 'admin', '2025-05-08 11:35:56', NULL, NULL);
INSERT INTO `tb_oss_file` VALUES (1920321745982263297, '681c269ce67a78a2c0213cdc.jpg', 'jpg', 'local-plus/681c269ce67a78a2c0213cdc.jpg', 'image/jpeg', 26262, '67ba9878352231ed8f77b33f.jpg', 2, NULL, 0, 'admin', '2025-05-08 11:35:56', NULL, NULL);

-- ----------------------------
-- Table structure for tb_paper
-- ----------------------------
DROP TABLE IF EXISTS `tb_paper`;
CREATE TABLE `tb_paper`  (
  `id` bigint NOT NULL COMMENT '试卷ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '试卷名称',
  `total_score` int NOT NULL DEFAULT 0 COMMENT '总分',
  `course_id` bigint NOT NULL COMMENT '关联课程',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '试卷表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_paper
-- ----------------------------
INSERT INTO `tb_paper` VALUES (1893598009229332481, 'Java考试1', 140, 1893505970768830465, NULL, '2025-02-23 17:45:21', NULL, '2025-02-23 17:45:21', 0);
INSERT INTO `tb_paper` VALUES (1908008725755105282, '考试1', 0, 1893330048954441729, NULL, '2025-04-04 12:08:23', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tb_paper_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_paper_question`;
CREATE TABLE `tb_paper_question`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `paper_id` bigint NOT NULL COMMENT '试卷ID',
  `question_id` bigint NOT NULL COMMENT '题目ID',
  `type` int NOT NULL COMMENT '题目类型',
  `order_num` int NULL DEFAULT 0 COMMENT '题目顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '试卷题目关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_paper_question
-- ----------------------------
INSERT INTO `tb_paper_question` VALUES (1893602430017359874, 1893598009229332481, 1888975963009781762, 1, 1);
INSERT INTO `tb_paper_question` VALUES (1893602430025748482, 1893598009229332481, 1888975852141744130, 1, 2);
INSERT INTO `tb_paper_question` VALUES (1893602430029942785, 1893598009229332481, 1879096369215885314, 1, 3);
INSERT INTO `tb_paper_question` VALUES (1893602430029942786, 1893598009229332481, 1888976099630845953, 1, 4);
INSERT INTO `tb_paper_question` VALUES (1893602430029942787, 1893598009229332481, 1888977725078835201, 1, 5);
INSERT INTO `tb_paper_question` VALUES (1893602430029942788, 1893598009229332481, 1888590586725933058, 2, 6);
INSERT INTO `tb_paper_question` VALUES (1893602430038331394, 1893598009229332481, 1879096505274912770, 2, 7);
INSERT INTO `tb_paper_question` VALUES (1893602430038331395, 1893598009229332481, 1879096608295407618, 2, 8);
INSERT INTO `tb_paper_question` VALUES (1893602430038331396, 1893598009229332481, 1888976760510550018, 2, 9);
INSERT INTO `tb_paper_question` VALUES (1893602430038331397, 1893598009229332481, 1879096689383886850, 3, 10);
INSERT INTO `tb_paper_question` VALUES (1893602430038331398, 1893598009229332481, 1888866274851782658, 3, 11);
INSERT INTO `tb_paper_question` VALUES (1893602430038331399, 1893598009229332481, 1888976836628779009, 3, 12);
INSERT INTO `tb_paper_question` VALUES (1893602430038331400, 1893598009229332481, 1879096745101021186, 3, 13);
INSERT INTO `tb_paper_question` VALUES (1893602430038331401, 1893598009229332481, 1888976948063047681, 3, 14);
INSERT INTO `tb_paper_question` VALUES (1893602430046720002, 1893598009229332481, 1879096862541533186, 4, 15);
INSERT INTO `tb_paper_question` VALUES (1893602430046720003, 1893598009229332481, 1888977792670044161, 4, 16);
INSERT INTO `tb_paper_question` VALUES (1893602430046720004, 1893598009229332481, 1888866180559634433, 5, 17);
INSERT INTO `tb_paper_question` VALUES (1893602430046720005, 1893598009229332481, 1888978080407687169, 5, 18);

-- ----------------------------
-- Table structure for tb_paper_repo
-- ----------------------------
DROP TABLE IF EXISTS `tb_paper_repo`;
CREATE TABLE `tb_paper_repo`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `paper_id` bigint NOT NULL COMMENT '关联试卷ID',
  `repo_id` bigint NOT NULL COMMENT '关联题库ID',
  `single_choice_count` int NULL DEFAULT 0 COMMENT '单选题数量',
  `single_choice_score` int NULL DEFAULT 0 COMMENT '单选题分数',
  `multiple_choice_count` int NULL DEFAULT 0 COMMENT '多选题数量',
  `multiple_choice_score` int NULL DEFAULT 0 COMMENT '多选题分数',
  `judge_count` int NULL DEFAULT 0 COMMENT '判断题数量',
  `judge_score` int NULL DEFAULT 0 COMMENT '判断题分数',
  `blank_count` int NULL DEFAULT 0 COMMENT '填空题数量',
  `blank_score` int NULL DEFAULT 0 COMMENT '填空题分数',
  `short_answer_count` int NULL DEFAULT 0 COMMENT '简单题数量',
  `short_answer_score` int NULL DEFAULT 0 COMMENT '简答题分数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '试卷题库关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_paper_repo
-- ----------------------------
INSERT INTO `tb_paper_repo` VALUES (1921012031825793025, 1893598009229332481, 1888576625653796865, 5, 5, 5, 10, 5, 5, 2, 10, 2, 10);

-- ----------------------------
-- Table structure for tb_plan
-- ----------------------------
DROP TABLE IF EXISTS `tb_plan`;
CREATE TABLE `tb_plan`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `goal_id` bigint NOT NULL COMMENT '学习目标ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '计划标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '计划内容',
  `start_time` timestamp NOT NULL COMMENT '开始日期',
  `end_time` timestamp NOT NULL COMMENT '结束日期',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '计划状态(0-未开始, 1-进行中, 2-已完成)',
  `reminder_time` timestamp NULL DEFAULT NULL COMMENT '任务提醒时间',
  `adjust_count` int NOT NULL DEFAULT 0 COMMENT '计划被调整的次数',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学习计划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_plan
-- ----------------------------
INSERT INTO `tb_plan` VALUES (1899711358400368641, 104, 1899700088586534913, 'Java下载与安装', '学会Java的下载与安装', '2025-03-13 09:00:00', '2025-03-13 12:00:00', 2, NULL, 0, 'admin', '2025-03-12 14:37:37', NULL, '2025-03-28 17:49:39', 0);
INSERT INTO `tb_plan` VALUES (1900112770196234242, 104, 1899700088586534913, 'Java入门小程序', '练习Java入门小程序', '2025-03-13 13:00:00', '2025-03-13 15:00:00', 0, NULL, 0, 'admin', '2025-03-13 17:12:41', NULL, NULL, 0);
INSERT INTO `tb_plan` VALUES (1900112770615664642, 104, 1899700088586534913, 'Java入门小程序', '练习Java入门小程序', '2025-03-14 13:00:00', '2025-03-14 15:00:00', 0, NULL, 0, 'admin', '2025-03-13 17:12:41', NULL, '2025-03-28 14:30:55', 0);
INSERT INTO `tb_plan` VALUES (1900483836391342081, 104, 1899700088586534913, '学习Java基础数据类型', '学习Java基础数据类型', '2025-03-15 00:00:00', '2025-03-15 00:00:00', 0, NULL, 0, NULL, '2025-03-14 17:47:10', NULL, '2025-03-15 13:16:54', 0);
INSERT INTO `tb_plan` VALUES (1900587218833760257, 104, 1899700088586534914, '学会Python的安装', '学会Python的安装', '2025-03-20 09:00:00', '2025-03-20 12:00:00', 0, NULL, 0, NULL, '2025-03-15 00:37:58', NULL, '2025-03-15 13:18:51', 0);
INSERT INTO `tb_plan` VALUES (1905823408306450434, 104, 1899700088586534913, '1232', '123', '2025-03-01 00:00:00', '2025-03-01 03:00:00', 0, '2025-02-28 23:50:00', 0, 'admin', '2025-03-29 11:24:43', 'admin', '2025-03-29 19:58:19', 0);
INSERT INTO `tb_plan` VALUES (1905953508255506434, 104, 1899700088586534913, '1231', '12312', '2025-04-09 23:20:00', '2025-04-10 00:20:00', 0, '2025-04-09 23:10:00', 8, NULL, '2025-03-29 20:01:41', NULL, '2025-04-07 10:13:08', 0);

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question`  (
  `id` bigint NOT NULL COMMENT '题目ID',
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目内容',
  `type` tinyint NOT NULL COMMENT '题目类型（1-单选 2-多选 3-判断 4-填空 5-简答）',
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '选项（JSON格式，仅适用于选择题）',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '正确答案',
  `analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '答案解析',
  `difficulty` int NULL DEFAULT NULL COMMENT '难易程度（1-简单 2-中等 3-困难）',
  `repo_id` bigint NOT NULL COMMENT '关联题库ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES (1879082351088553986, '<p>以下哪种语言是面向对象的？</p>', 1, '[{\"key\":\"A\",\"value\":\"Python\"},{\"key\":\"B\",\"value\":\"C++\"},{\"key\":\"C\",\"value\":\"HTML\"}]', '[\"A\"]', 'Python 是一种面向对象的编程语言，支持多种编程范式。', 1, 1888589932884271105, 'admin', '2025-01-14 16:25:17', 'admin', '2025-04-09 22:58:45', 0);
INSERT INTO `tb_question` VALUES (1879096369215885314, '<p>HTTP 状态码 404 的含义是什么？</p>', 1, '[{\"key\":\"A\",\"value\":\"请求成功\"},{\"key\":\"B\",\"value\":\"未找到资源\"},{\"key\":\"C\",\"value\":\"服务器错误\"},{\"key\":\"D\",\"value\":\"无权限访问\"}]', '[\"B\"]', '404 状态码表示客户端请求的资源在服务器上不存在。', 1, 1888576625653796865, 'admin', '2025-01-14 17:21:01', 'admin', '2025-04-09 22:58:54', 0);
INSERT INTO `tb_question` VALUES (1879096505274912770, '<p>以下哪些是编程语言？</p>', 2, '[{\"key\":\"A\",\"value\":\"Python\"},{\"key\":\"B\",\"value\":\"HTML\"},{\"key\":\"C\",\"value\":\"C++\"},{\"key\":\"D\",\"value\":\"JSON\"}]', '[\"A\",\"C\"]', 'Python 和 C++ 是编程语言，而 HTML 是标记语言，JSON 是数据格式。', 1, 1888576625653796865, 'admin', '2025-01-14 17:21:33', 'admin', '2025-04-09 22:58:58', 0);
INSERT INTO `tb_question` VALUES (1879096608295407618, '<p>以下哪些是 HTTP 的请求方法？</p>', 2, '[{\"key\":\"A\",\"value\":\"GET\"},{\"key\":\"B\",\"value\":\"POST\"},{\"key\":\"C\",\"value\":\"DELETE\"},{\"key\":\"D\",\"value\":\"CONNECT\"}]', '[\"A\",\"B\",\"C\",\"D\"]', 'GET、POST、DELETE 和 CONNECT 都是 HTTP 请求方法，用于客户端与服务器之间的通信。', 1, 1888576625653796865, 'admin', '2025-01-14 17:21:58', 'admin', '2025-04-09 22:59:01', 0);
INSERT INTO `tb_question` VALUES (1879096689383886850, 'JavaScript 是一种静态类型语言。', 3, '[]', '[false]', 'JavaScript 是一种动态类型语言，不需要显式声明变量的类型。', 1, 1888576625653796865, 'admin', '2025-01-14 17:22:17', 'admin', '2025-01-14 17:45:47', 0);
INSERT INTO `tb_question` VALUES (1879096745101021186, '<p>TCP 协议是无连接的。</p>', 3, '[]', '[false]', 'TCP 是面向连接的协议，提供可靠的数据传输服务。', 1, 1888576625653796865, 'admin', '2025-01-14 17:22:31', 'admin', '2025-04-09 22:59:15', 0);
INSERT INTO `tb_question` VALUES (1879096862541533186, '请填写以下代码的输出：\nSystem.out.println(3 + 2 * 2);', 4, '[]', '[\"7\"]', '根据运算优先级，乘法优先于加法，计算顺序为 2 * 2 = 4，然后 3 + 4 = 7。', 2, 1888576625653796865, 'admin', '2025-01-14 17:22:59', 'admin', '2025-01-14 18:00:55', 0);
INSERT INTO `tb_question` VALUES (1879096950579974145, '编写一段 Python 代码，输出从 1 到 10 的所有偶数。', 5, '[]', '[\"for i in range(1, 11):\\n    if i % 2 == 0:\\n        print(i)\"]', '通过 for 循环遍历范围内的数值，用 if 判断是否为偶数，输出结果即可。', 2, 1888576625653796865, 'admin', '2025-01-14 17:23:20', 'admin', '2025-01-14 18:01:01', 0);
INSERT INTO `tb_question` VALUES (1888590586725933058, '<p>地球公转产生的现象有（）</p>', 2, '[{\"key\":\"A\",\"value\":\"根据太阳高度的差异,划分出五带：北寒、北温、热带、南温、南寒；\"},{\"key\":\"B\",\"value\":\"根据获得热量多少的时间差异,划分出四季：春、夏、秋、冬；\"},{\"key\":\"C\",\"value\":\"昼夜长短的变化现象；\"},{\"key\":\"D\",\"value\":\"正午太阳高度的变化；夏至日太阳直射北回归线，全球正午太阳高度从北回归线向南北两侧逐渐递减；二分日太阳直射赤道，全球正午太阳高度从赤道向两极递减，全球昼夜平分；冬至日太阳直射南回归线，全球正午高度从南回归线向南北两侧逐渐递减，南回归线及其以南的地区正午太阳高度达到最大值，北半球各纬度正午太阳高度达到最小值。\"}]', '[\"A\",\"B\",\"C\",\"D\"]', NULL, 1, 1888576625653796865, 'admin', '2025-02-09 22:07:39', 'admin', '2025-04-09 22:59:18', 0);
INSERT INTO `tb_question` VALUES (1888865386175234049, 'Java中，哪个关键字用于定义一个类？', 1, '[{\"key\":\"A\",\"value\":\"class\"},{\"key\":\"B\",\"value\":\"interface\"},{\"key\":\"C\",\"value\":\"extends\"},{\"key\":\"D\",\"value\":\"implements\"}]', '[\"A\"]', '“class”关键字用于定义类。', 1, 1888576625653796865, 'admin', '2025-02-10 16:19:36', NULL, '2025-02-10 16:19:36', 0);
INSERT INTO `tb_question` VALUES (1888865517591166978, '在Java中，int占用的字节数是多少？', 1, '[{\"key\":\"A\",\"value\":\"2字节\"},{\"key\":\"B\",\"value\":\"4字节\"},{\"key\":\"C\",\"value\":\"8字节\"},{\"key\":\"D\",\"value\":\"16字节\"}]', '[\"B\"]', 'Java中，int类型占用4个字节。', 1, 1888576625653796865, 'admin', '2025-02-10 16:20:07', NULL, '2025-02-10 16:20:07', 0);
INSERT INTO `tb_question` VALUES (1888865715377766401, '以下哪个是Java中的循环结构？', 1, '[{\"key\":\"A\",\"value\":\"for\"},{\"key\":\"B\",\"value\":\"while\"},{\"key\":\"C\",\"value\":\"do-while\"},{\"key\":\"D\",\"value\":\"以上都是\"}]', '[\"D\"]', 'Java中“for”、“while”和“do-while”都是循环结构。', 2, 1888576625653796865, 'admin', '2025-02-10 16:20:55', NULL, '2025-02-10 16:20:54', 0);
INSERT INTO `tb_question` VALUES (1888865901479034882, 'Java中，如何定义一个变量？', 1, '[{\"key\":\"A\",\"value\":\"int x = 10;\"},{\"key\":\"B\",\"value\":\"int x = 10.0;\"},{\"key\":\"C\",\"value\":\"String x = 10;\"},{\"key\":\"D\",\"value\":\"char x = 10;\"}]', '[\"A\"]', 'Java中变量声明需要指定类型，示例：int x = 10;', 3, 1888576625653796865, 'admin', '2025-02-10 16:21:39', NULL, '2025-02-10 16:21:39', 0);
INSERT INTO `tb_question` VALUES (1888866002205245442, 'Java中的String是基本数据类型吗？', 1, '[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}]', '[\"A\"]', 'String是引用数据类型，不是基本数据类型。', 3, 1888576625653796865, 'admin', '2025-02-10 16:22:03', NULL, '2025-02-10 16:22:03', 0);
INSERT INTO `tb_question` VALUES (1888866180559634433, 'Java中==和equals()方法的区别是什么？', 5, '[]', '[\"==比较地址，equals()比较内容\"]', '==用于比较内存地址，equals()用于比较字符串的内容是否相等。', 2, 1888576625653796865, 'admin', '2025-02-10 16:22:46', NULL, '2025-02-10 16:22:45', 0);
INSERT INTO `tb_question` VALUES (1888866274851782658, 'Java中的垃圾回收机制是手动释放内存的吗？', 3, '[]', '[false]', 'Java中的垃圾回收机制是自动的，不需要手动释放内存。', 1, 1888576625653796865, 'admin', '2025-02-10 16:23:08', NULL, '2025-02-10 16:23:08', 0);
INSERT INTO `tb_question` VALUES (1888975852141744130, 'Java中实现继承的关键字是？', 1, '[{\"key\":\"A\",\"value\":\"extends\"},{\"key\":\"B\",\"value\":\"implements\"},{\"key\":\"C\",\"value\":\"super\"},{\"key\":\"D\",\"value\":\"interface\"}]', '[\"A\"]', 'extends用于继承类，implements用于实现接口	', 1, 1888576625653796865, 'admin', '2025-02-10 23:38:33', NULL, '2025-02-10 23:38:33', 0);
INSERT INTO `tb_question` VALUES (1888975963009781762, '下列哪个不是基本数据类型？', 1, '[{\"key\":\"A\",\"value\":\"int\"},{\"key\":\"B\",\"value\":\"String\"},{\"key\":\"C\",\"value\":\"boolean\"},{\"key\":\"D\",\"value\":\"double\"}]', '[\"B\"]', 'String是引用类型', 1, 1888576625653796865, 'admin', '2025-02-10 23:39:00', NULL, '2025-02-10 23:38:59', 0);
INSERT INTO `tb_question` VALUES (1888976099630845953, 'Java中所有类的父类是？', 1, '[{\"key\":\"A\",\"value\":\"Object\"},{\"key\":\"B\",\"value\":\"Class\"},{\"key\":\"C\",\"value\":\"Root\"},{\"key\":\"D\",\"value\":\"Parent\"}]', '[\"A\"]', 'Object是Java所有类的根父类', 1, 1888576625653796865, 'admin', '2025-02-10 23:39:32', NULL, '2025-02-10 23:39:32', 0);
INSERT INTO `tb_question` VALUES (1888976483577434114, '以下代码输出结果：System.out.println(5 + 5 + \"5\");', 4, '[]', '[\"105\"]', '运算符从左到右执行，先计算5+5=10，再与\"5\"拼接', 2, 1888576625653796865, 'admin', '2025-02-10 23:41:04', NULL, '2025-02-10 23:41:03', 0);
INSERT INTO `tb_question` VALUES (1888976597863829506, '接口中方法的默认修饰符是？', 1, '[{\"key\":\"A\",\"value\":\"public\"},{\"key\":\"B\",\"value\":\"private\"},{\"key\":\"C\",\"value\":\"protected\"},{\"key\":\"D\",\"value\":\"default\"}]', '[\"A\"]', '接口方法默认public abstract', 2, 1888576625653796865, 'admin', '2025-02-10 23:41:31', NULL, '2025-02-10 23:41:31', 0);
INSERT INTO `tb_question` VALUES (1888976760510550018, 'ArrayList和LinkedList的区别包括？', 2, '[{\"key\":\"A\",\"value\":\"内存结构\"},{\"key\":\"B\",\"value\":\"线程安全\"},{\"key\":\"C\",\"value\":\"随机访问效率\"},{\"key\":\"D\",\"value\":\"插入删除效率\"}]', '[\"A\",\"C\",\"D\"]', 'ArrayList基于数组，LinkedList基于链表', 2, 1888576625653796865, 'admin', '2025-02-10 23:42:10', NULL, '2025-02-10 23:42:09', 0);
INSERT INTO `tb_question` VALUES (1888976836628779009, 'Java的单继承特性是指一个类只能继承一个类', 3, '[]', '[true]', 'Java不支持多类继承，但可以实现多个接口', 1, 1888576625653796865, 'admin', '2025-02-10 23:42:28', NULL, '2025-02-10 23:42:28', 0);
INSERT INTO `tb_question` VALUES (1888976888004808706, 'String是不可变对象', 3, '[]', '[true]', 'String被final修饰，修改时会创建新对象', 1, 1888576625653796865, 'admin', '2025-02-10 23:42:40', NULL, '2025-02-10 23:42:40', 0);
INSERT INTO `tb_question` VALUES (1888976948063047681, 'finally块是否一定会执行？', 3, '[]', '[true]', '除System.exit()和JVM崩溃外都会执行', 2, 1888576625653796865, 'admin', '2025-02-10 23:42:55', NULL, '2025-02-10 23:42:54', 0);
INSERT INTO `tb_question` VALUES (1888977097418018817, '实现多线程的方式包括？', 2, '[{\"key\":\"A\",\"value\":\"继承Thread类\"},{\"key\":\"B\",\"value\":\"实现Runnable接口\"},{\"key\":\"C\",\"value\":\"使用ExecutorService\"},{\"key\":\"D\",\"value\":\"使用Timer\"}]', '[\"A\",\"B\",\"C\"]', '三种标准创建方式', 3, 1888576625653796865, 'admin', '2025-02-10 23:43:30', 'admin', '2025-02-24 10:27:21', 0);
INSERT INTO `tb_question` VALUES (1888977213944172546, '下列哪个是运行时异常？', 2, '[{\"key\":\"A\",\"value\":\"NullPointerException\"},{\"key\":\"B\",\"value\":\"IOException\"},{\"key\":\"C\",\"value\":\"SQLException\"},{\"key\":\"D\",\"value\":\"ClassCastException\"}]', '[\"A\",\"D\"]', '运行时异常继承RuntimeException', 3, 1888576625653796865, 'admin', '2025-02-10 23:43:58', NULL, '2025-02-10 23:43:57', 0);
INSERT INTO `tb_question` VALUES (1888977315177893890, 'HashMap的底层数据结构是？', 4, '[]', '[\"数组+链表/红黑树\"]', 'JDK8后当链表长度>8时转为红黑树', 3, 1888576625653796865, 'admin', '2025-02-10 23:44:22', NULL, '2025-02-10 23:44:22', 0);
INSERT INTO `tb_question` VALUES (1888977379061338113, '双亲委派机制的作用是？', 5, '[]', '[\"保证类加载安全性和唯一性\"]', '防止重复加载，确保核心类不被篡改', 3, 1888576625653796865, 'admin', '2025-02-10 23:44:37', NULL, '2025-02-10 23:44:37', 0);
INSERT INTO `tb_question` VALUES (1888977540223275009, 'volatile关键字的作用是？', 2, '[{\"key\":\"A\",\"value\":\"原子性\"},{\"key\":\"B\",\"value\":\"可见性\"},{\"key\":\"C\",\"value\":\"有序性\"},{\"key\":\"D\",\"value\":\"线程安全\"}]', '[\"B\",\"C\"]', '保证可见性和禁止指令重排序，但不保证原子性	', 3, 1888576625653796865, 'admin', '2025-02-10 23:45:16', NULL, '2025-02-10 23:45:15', 0);
INSERT INTO `tb_question` VALUES (1888977725078835201, 'StringBuffer与StringBuilder的主要区别？', 1, '[{\"key\":\"A\",\"value\":\"线程安全\"},{\"key\":\"B\",\"value\":\"执行速度\"},{\"key\":\"C\",\"value\":\"存储结构\"},{\"key\":\"D\",\"value\":\"继承关系\"}]', '[\"A\"]', 'StringBuffer线程安全但速度慢', 2, 1888576625653796865, 'admin', '2025-02-10 23:46:00', 'admin', '2025-04-09 22:58:27', 0);
INSERT INTO `tb_question` VALUES (1888977792670044161, 'try-with-resources语句适用的资源类型要求？', 4, '[]', '[\"实现AutoCloseable接口\"]', '自动资源管理语法要求', 2, 1888576625653796865, 'admin', '2025-02-10 23:46:16', NULL, '2025-02-10 23:46:15', 0);
INSERT INTO `tb_question` VALUES (1888977867068608513, '描述Java垃圾回收机制的原理', 5, '[]', '[\"通过GC自动管理堆内存\"]', '引用计数、可达性分析、分代回收等机制', 3, 1888576625653796865, 'admin', '2025-02-10 23:46:34', NULL, '2025-02-10 23:46:33', 0);
INSERT INTO `tb_question` VALUES (1888978025948844033, '下列哪个是单例模式的实现方式？', 2, '[{\"key\":\"A\",\"value\":\"枚举\"},{\"key\":\"B\",\"value\":\"双重检查锁\"},{\"key\":\"C\",\"value\":\"静态内部类\"},{\"key\":\"D\",\"value\":\"工厂模式\"}]', '[\"A\",\"B\",\"C\"]', '三种都是经典单例实现方式', 3, 1888576625653796865, 'admin', '2025-02-10 23:47:12', NULL, '2025-02-10 23:47:11', 0);
INSERT INTO `tb_question` VALUES (1888978080407687169, 'Java内存模型中堆和栈的区别', 5, '[]', '[\"堆存对象，栈存局部变量\"]', '堆线程共享，栈线程私有；堆GC管理，栈自动分配', 3, 1888576625653796865, 'admin', '2025-02-10 23:47:25', NULL, '2025-02-10 23:47:24', 0);
INSERT INTO `tb_question` VALUES (1909983415008636930, '<p>以下哪种语言是面向对象的？<img src=\"/dev-api/common/preview/1909983360524627969\"></p>', 1, '[{\"key\":\"A\",\"value\":\"A\"}]', '[\"A\"]', '123', 1, 1888589932884271105, 'admin', '2025-04-09 22:55:07', NULL, '2025-04-09 22:55:25', 1);

-- ----------------------------
-- Table structure for tb_repo
-- ----------------------------
DROP TABLE IF EXISTS `tb_repo`;
CREATE TABLE `tb_repo`  (
  `id` bigint NOT NULL COMMENT '题库ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题库名称',
  `course_id` bigint NOT NULL COMMENT '关联课程ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_repo
-- ----------------------------
INSERT INTO `tb_repo` VALUES (1888576625653796865, 'Java题库', 1893505970768830465, 'admin', '2025-02-09 21:12:10', 'admin', '2025-02-09 21:20:05', 0);
INSERT INTO `tb_repo` VALUES (1888579022924959746, 'HTML题库', 1893330048954441729, 'admin', '2025-02-09 21:21:42', NULL, '2025-02-09 21:21:41', 0);
INSERT INTO `tb_repo` VALUES (1888589932884271105, 'Python题库', 1893597689472372737, 'admin', '2025-02-09 22:05:03', NULL, '2025-02-09 22:05:02', 0);

-- ----------------------------
-- Table structure for tb_search
-- ----------------------------
DROP TABLE IF EXISTS `tb_search`;
CREATE TABLE `tb_search`  (
  `id` bigint NOT NULL COMMENT '主键',
  `search_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '搜索关键词',
  `search_num` int NOT NULL DEFAULT 0 COMMENT '搜索次数',
  UNIQUE INDEX `tb_search_pk`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '搜索表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_search
-- ----------------------------
INSERT INTO `tb_search` VALUES (1891419457949519873, 'JAVA', 21);
INSERT INTO `tb_search` VALUES (1891421561179066370, '电商', 9);
INSERT INTO `tb_search` VALUES (1891423460720627713, 'Java多线程', 1);
INSERT INTO `tb_search` VALUES (1891661743583666177, '操作系统', 0);

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '学生ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '关联sys_user表的ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1911384187168563203 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES (1, 104, NULL, '2024-12-08 01:35:51', NULL, '2024-12-08 01:35:51', NULL, 0);
INSERT INTO `tb_student` VALUES (2, 105, NULL, '2024-12-08 01:35:51', 'admin', '2025-02-07 11:42:34', NULL, 0);
INSERT INTO `tb_student` VALUES (3, 107, NULL, '2024-12-08 13:49:32', 'admin', '2024-12-08 16:47:58', NULL, 0);
INSERT INTO `tb_student` VALUES (1865679792990621698, 110, NULL, '2024-12-08 16:48:19', 'admin', '2024-12-08 17:22:41', NULL, 0);
INSERT INTO `tb_student` VALUES (1887708597569638401, 111, NULL, '2025-02-07 11:42:56', NULL, '2025-02-07 11:42:56', NULL, 0);
INSERT INTO `tb_student` VALUES (1893573678138929154, 115, NULL, '2025-02-23 16:08:40', NULL, '2025-02-23 16:08:40', NULL, 0);
INSERT INTO `tb_student` VALUES (1911384184152858625, 139, NULL, '2025-04-13 19:41:15', NULL, NULL, NULL, 0);
INSERT INTO `tb_student` VALUES (1911384184542928897, 140, NULL, '2025-04-13 19:41:16', NULL, NULL, NULL, 0);
INSERT INTO `tb_student` VALUES (1911384184937193473, 141, NULL, '2025-04-13 19:41:16', NULL, NULL, NULL, 0);
INSERT INTO `tb_student` VALUES (1911384185402761217, 142, NULL, '2025-04-13 19:41:16', NULL, NULL, NULL, 0);
INSERT INTO `tb_student` VALUES (1911384185797025793, 143, NULL, '2025-04-13 19:41:16', NULL, NULL, NULL, 0);
INSERT INTO `tb_student` VALUES (1911384186191290369, 144, NULL, '2025-04-13 19:41:16', NULL, NULL, NULL, 0);
INSERT INTO `tb_student` VALUES (1911384186711384066, 145, NULL, '2025-04-13 19:41:16', NULL, NULL, NULL, 0);
INSERT INTO `tb_student` VALUES (1911384187168563202, 146, NULL, '2025-04-13 19:41:16', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for tb_student_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_student_course`;
CREATE TABLE `tb_student_course`  (
  `id` bigint NOT NULL COMMENT '记录ID',
  `user_id` bigint NOT NULL COMMENT '关联用户ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `progress` int NULL DEFAULT 0,
  `status` int NULL DEFAULT 0,
  `finish_time` timestamp NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT (now()) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生选课表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_student_course
-- ----------------------------
INSERT INTO `tb_student_course` VALUES (1905079816927490049, 104, 1893330048954441729, 2, 1, NULL, '202325350123', '2025-03-27 10:09:57', '202325350123', '2025-03-27 17:33:16', 0);
INSERT INTO `tb_student_course` VALUES (1905190335919353857, 104, 1893505970768830465, 0, 0, NULL, '202325350123', '2025-03-27 17:29:07', NULL, '2025-03-27 17:33:16', 0);

-- ----------------------------
-- Table structure for tb_study_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_study_record`;
CREATE TABLE `tb_study_record`  (
  `id` bigint NOT NULL COMMENT '学习记录ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `chapter_id` bigint NULL DEFAULT NULL COMMENT '课程章节ID',
  `material_id` bigint NULL DEFAULT NULL COMMENT '课程资料ID',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '学习状态（0-未开始 1-进行中 2-已完成）',
  `start_time` timestamp NULL DEFAULT (now()) COMMENT '学习开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '学习结束时间',
  `duration` int NULL DEFAULT 0 COMMENT '学习时长',
  `last_position` int NULL DEFAULT 0 COMMENT '音视频的上次播放进度(秒)',
  `progress` int NOT NULL DEFAULT 0 COMMENT '课程进度百分比（0-100）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学习记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_study_record
-- ----------------------------
INSERT INTO `tb_study_record` VALUES (1912842800740691969, 104, 1893330048954441729, 1893332503612112897, 1893340374244536321, 1, '2025-04-17 20:17:17', NULL, 0, 4, 20, '202325350123', '2025-04-17 20:17:17', '202325350123', '2025-04-17 20:17:18', 0);

-- ----------------------------
-- Table structure for tb_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '教师ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '关联sys_user表的id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1887734598366351363 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '教师表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_teacher
-- ----------------------------
INSERT INTO `tb_teacher` VALUES (1, 100, 'admin', '2025-02-07 13:12:56', NULL, '2024-12-08 01:36:53', NULL, 0);
INSERT INTO `tb_teacher` VALUES (4, 103, NULL, '2024-12-08 01:36:53', NULL, '2024-12-08 01:36:53', NULL, 0);
INSERT INTO `tb_teacher` VALUES (5, 106, NULL, '2024-12-08 01:36:53', NULL, '2024-12-08 01:36:53', NULL, 0);
INSERT INTO `tb_teacher` VALUES (1887734460310835202, 112, 'admin', '2025-02-07 13:25:42', NULL, '2025-02-07 13:25:42', NULL, 0);
INSERT INTO `tb_teacher` VALUES (1887734598366351362, 113, 'admin', '2025-02-07 13:26:15', NULL, '2025-02-07 13:26:15', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
