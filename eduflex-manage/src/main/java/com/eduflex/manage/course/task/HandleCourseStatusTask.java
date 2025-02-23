package com.eduflex.manage.course.task;

import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.service.ICourseService;
import lombok.extern.slf4j.Slf4j;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 设置课程状态定时任务
 * @author 林煜鋒
 */
@Component("handleCourseStatusTask")
@Slf4j
public class HandleCourseStatusTask {

    @Autowired
    private ICourseService courseService;

    public void start(Long courseId) throws SchedulerException {
        log.info("++++++++++定时任务：处理开始的课程");
        log.info("++++++++++记录参数：{}", courseId);

        Course course = courseService.getById(courseId);
        course.setStatus(EduFlexConstants.STATUS_IN_PROGRESS);
        courseService.updateById(course);
    }

    public void end(Long courseId) throws SchedulerException {
        log.info("++++++++++定时任务：处理结束的课程");
        log.info("++++++++++记录参数：{}", courseId);

        Course course = courseService.getById(courseId);
        course.setStatus(EduFlexConstants.STATUS_ENDED);
        courseService.updateById(course);
    }
}
