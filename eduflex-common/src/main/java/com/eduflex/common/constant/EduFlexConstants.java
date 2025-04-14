package com.eduflex.common.constant;

import java.util.List;

/**
 * 业务常量
 *
 * @author 林煜鋒
 * @date 2024-10-07
 */
public class EduFlexConstants {

    // 教师状态：启用
    public static final Integer TEACHER_STATUS_ENABLED = 0;

    // 教师状态：停用
    public static final Integer TEACHER_STATUS_DISABLED = 1;

    // 学生状态：启用
    public static final Integer STUDENT_STATUS_ENABLED = 0;

    // 学生状态：停用
    public static final Integer STUDENT_STATUS_DISABLED = 1;

    // 角色字典 - 教师
    public static final Long ROLE_TEACHER = 3L;

    // 角色字典 - 学生
    public static final Long ROLE_STUDENT = 4L;

    // 性别字典 - 男
    public static final Integer SEX_MALE = 0;

    // 性别字典 - 女
    public static final Integer SEX_FEMALE = 1;

    // 性别字典 - 未知
    public static final Integer SEX_UNKNOWN = 2;

    // 文件类型列表 - 音频
    public static final List<String> FILE_TYPE_AUDIO_LIST = List.of("audio/mp3", "audio/mpeg", "audio/ogg", "audio/wav");

    // 文件类型列表 - 视频
    public static final List<String> FILE_TYPE_VIDEO_LIST = List.of("video/mp4", "video/webm");

    // 文件类型列表 - 文本
    public static final List<String> FILE_TYPE_TEXT_LIST = List.of("text/plain", "text/html", "text/xml",
            "text/css", "text/javascript", "text/csv", "application/json",
            "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.ms-excel");

    // 文件类型列表 - 图片
    public static final List<String> FILE_TYPE_IMAGE_LIST = List.of("image/jpeg", "image/png", "image/gif", "image/bmp", "image/webp");

    // 文件类型列表 - PDF
    public static final List<String> FILE_tYPE_PDF_LIST = List.of("application/pdf");

    // 文件类型列表 - PPT
    public static final List<String> FILE_TYPE_PPT_LIST = List.of("application/vnd.ms-powerpoint", "application/vnd.openxmlformats-officedocument.presentationml.presentation");

    // 文件类型 - 文本
    public static final Integer FILE_TYPE_TEXT = 1;
    // 文件类型 - 图片
    public static final Integer FILE_TYPE_IMAGE = 2;
    // 文件类型 - 音视频
    public static final Integer FILE_TYPE_VIDEO_AUDIO = 3;
    // 文件类型 - PPT
    public static final Integer FILE_TYPE_PPT = 4;
    // 文件类型 - PDF
    public static final Integer FILE_TYPE_PDF = 5;
    // 文件类型 - 其他文件
    public static final Integer FILE_TYPE_OTHER = 6;

    // 单选题
    public static final Integer SINGLE_CHOICE = 1;
    // 多选题
    public static final Integer MULTIPLE_CHOICE = 2;
    // 判断题
    public static final Integer JUDGMENT = 3;
    // 填空题
    public static final Integer FILL_BLANK = 4;
    // 简答题
    public static final Integer SHORT_ANSWER = 5;

    // 难度 - 简单
    public static final Integer DIFFICULTY_EASY = 1;
    // 难度 - 中等
    public static final Integer DIFFICULTY_MEDIUM = 2;
    // 难度 - 困难
    public static final Integer DIFFICULTY_HARD = 3;

    // 状态 - 启用
    public static final Integer STATUS_ENABLED = 1;
    // 状态 - 禁用
    public static final Integer STATUS_DISABLED = 0;

    // 默认头像
    public static final Long DEFAULT_AVATAR = 1893339122660020225L;

    // 通用状态 - 未开始
    public static final Integer STATUS_UNSTARTED = 0;
    // 通用状态 - 进行中
    public static final Integer STATUS_IN_PROGRESS = 1;
    // 通用状态 - 已结束
    public static final Integer STATUS_ENDED = 2;

    // 作业状态 - 未做
    public static final Integer HOMEWORK_STATUS_UNDO = 0;
    // 作业状态 - 待批阅
    public static final Integer HOMEWORK_STATUS_PENDING = 1;
    // 作业状态 - 已批阅
    public static final Integer HOMEWORK_STATUS_REVIEWED = 2;

    // 考试发布状态 - 未发布
    public static final Integer EXAM_PUBLISH_STATUS_UNPUBLISHED = 0;
    // 考试发布状态 - 已发布
    public static final Integer EXAM_PUBLISH_STATUS_PUBLISHED = 1;

    // 考试状态 - 未开始
    public static final Integer EXAM_STATUS_UNSTARTED = 0;
    // 考试状态 - 进行中
    public static final Integer EXAM_STATUS_IN_PROGRESS = 1;
    // 考试状态 - 已完成
    public static final Integer EXAM_STATUS_ENDED = 2;

    // 考试记录状态 - 未开始
    public static final Integer EXAM_RECORD_STATUS_UNSTARTED = 0;
    // 考试记录状态 - 进行中
    public static final Integer EXAM_RECORD_STATUS_IN_PROGRESS = 1;
    // 考试记录状态 - 待批阅
    public static final Integer EXAM_RECORD_STATUS_PENDING = 2;
    // 考试记录状态 - 已完成
    public static final Integer EXAM_RECORD_STATUS_ENDED = 3;

    // 考试通过
    public static final Integer EXAM_PASSED = 1;
    // 考试不通过
    public static final Integer EXAM_FAILED = 0;

    // 目标完成状态 - 未完成
    public static final Integer GOAL_UNFINISHED = 0;
    // 目标完成状态 - 已完成
    public static final Integer GOAL_FINISHED = 1;
}
