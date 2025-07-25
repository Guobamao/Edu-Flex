package com.eduflex.user.course_chapter.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.manage.course_chapter.domain.CourseChapter;
import com.eduflex.manage.course_chapter.service.ICourseChapterService;
import com.eduflex.user.course_chapter.domain.CourseChapterVo;
import com.eduflex.user.course_chapter.domain.dto.CourseChapterDto;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 用户端 - 课程内容章节Controller
 *
 * @author 林煜鋒
 * @date 2025-02-16
 */
@RestController(value = "UserCourseChapterController")
@RequestMapping("/user/chapter")
public class CourseChapterController extends BaseController {

    @Autowired
    private ICourseChapterService courseChapterService;

    /**
     * 获取课程章节列表 - 带学习进度
     *
     * @param courseChapterDto 查询条件
     * @return 课程章节列表
     */
    @GetMapping("/list")
    public AjaxResult list(CourseChapterDto courseChapterDto) {
        try {
            // 用户已登录 - 显示进度
            courseChapterDto.setUserId(getUserId());
            List<CourseChapterVo> list = courseChapterService.selectCourseChapterListWithProgress(courseChapterDto);
            return success(list);
        } catch (Exception e) {
            CourseChapter courseChapter = new CourseChapter();
            BeanUtils.copyProperties(courseChapterDto, courseChapter);
            List<com.eduflex.manage.course_chapter.domain.vo.CourseChapterVo> list = courseChapterService.selectCourseChapterList(courseChapter);
            return success(list);
        }
    }
}
