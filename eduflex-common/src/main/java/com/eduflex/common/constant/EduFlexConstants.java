package com.eduflex.common.constant;

import java.util.List;

// 业务常量
public class EduFlexConstants {

    // 教师状态：启用
    public static final String TEACHER_STATUS_ENABLED = "0";

    // 教师状态：停用
    public static final String TEACHER_STATUS_DISABLED = "0";

    // 学生状态：启用
    public static final String STUDENT_STATUS_ENABLED = "0";

    // 学生状态：停用
    public static final String STUDENT_STATUS_DISABLED = "0";

    // 角色字典 - 教师
    public static final Long ROLE_TEACHER = 3L;

    // 角色字典 - 学生
    public static final Long ROLE_STUDENT = 4L;

    // 文件类型列表 - 音频
    public static final List<String> FILE_TYPE_AUDIO_LIST = List.of("audio/mp3", "audio/mpeg", "audio/ogg", "audio/wav");

    // 文件类型列表 - 视频
    public static final List<String> FILE_TYPE_VIDEO_LIST = List.of("video/mp4", "video/webm");

    // 文件类型列表 - 文本
    public static final List<String> FILE_TYPE_TEXT_LIST = List.of("text/plain", "text/html", "text/xml", "text/css", "text/javascript", "text/csv", "application/json", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document");

    // 文件类型列表 - 图片
    public static final List<String> FILE_TYPE_IMAGE_LIST = List.of("image/jpeg", "image/png", "image/gif", "image/bmp", "image/webp");

    // 文件类型列表 - PDF
    public static final List<String> FILE_tYPE_PDF_LIST = List.of("application/pdf");

    // 文件类型列表 - PPT
    public static final List<String> FILE_TYPE_PPT_LIST = List.of("application/vnd.ms-powerpoint", "application/vnd.openxmlformats-officedocument.presentationml.presentation");

    public static final Integer FILE_TYPE_TEXT = 1;
    public static final Integer FILE_TYPE_IMAGE = 2;
    public static final Integer FILE_TYPE_VIDEO_AUDIO = 3;
    public static final Integer FILE_TYPE_PPT = 4;
    public static final Integer FILE_TYPE_PDF = 5;
    public static final Integer FILE_TYPE_OTHER = 6;
}
