package com.eduflex.manage.dashboard.service.impl;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.dashboard.domain.vo.StatVo;
import com.eduflex.manage.dashboard.domain.vo.TopCourseVo;
import com.eduflex.manage.dashboard.domain.vo.TrendVo;
import com.eduflex.manage.dashboard.service.IDashBoardService;
import com.eduflex.manage.file.service.IOssFileService;
import com.eduflex.manage.student.domain.StudentCourse;
import com.eduflex.manage.student.service.IStudentCourseService;
import com.eduflex.manage.student.service.IStudentService;
import com.eduflex.manage.teacher.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class DashBoardServiceImpl implements IDashBoardService {

    @Autowired
    private IStudentService studentService;

    @Autowired
    private ITeacherService teacherService;

    @Autowired
    private ICourseService courseService;

    @Autowired
    private IOssFileService ossFileService;

    @Autowired
    private IStudentCourseService studentCourseService;

    @Override
    public StatVo getStats() {
        int studentCount = (int) studentService.count();
        int teacherCount = (int) teacherService.count();
        int courseCount = (int) courseService.count();
        int resourceCount = (int) ossFileService.count();
        StatVo statVo = new StatVo();
        statVo.setStudentCount(studentCount);
        statVo.setTeacherCount(teacherCount);
        statVo.setCourseCount(courseCount);
        statVo.setResourceCount(resourceCount);
        return statVo;
    }

    @Override
    public List<TopCourseVo> getTopCourses() {

        List<TopCourseVo> topCourses = new ArrayList<>();

        // 按选课人数最多排序，选择选课人数最多的5个课程
        QueryWrapper<StudentCourse> wrapper = new QueryWrapper<StudentCourse>()
                .select("course_id, count(1) as count")
                .groupBy("course_id")
                .orderByDesc("count")
                .last("limit 5");
        List<Map<String, Object>> mapList = studentCourseService.listMaps(wrapper);

        for (Map<String, Object> objectMap : mapList) {
            TopCourseVo topCourseVo = new TopCourseVo();
            Long courseId = Long.valueOf(objectMap.get("course_id").toString());
            topCourseVo.setCourseId(courseId);

            Course course = courseService.getById(courseId);
            topCourseVo.setCourseName(course.getName());
            topCourseVo.setCount(Integer.parseInt(objectMap.get("count").toString()));
            topCourses.add(topCourseVo);
        }
        return topCourses;
    }

    @Override
    public List<TrendVo> getTrend() {
        List<Date> lastSevenDate = new ArrayList<>();
        DateTime today = DateUtil.date();
        for (int i = 7; i >= 0; i--) {
            DateTime date = DateUtil.offset(today, DateField.DAY_OF_MONTH, -i);
            lastSevenDate.add(date);
        }

        List<TrendVo> trendVos = new ArrayList<>();
        for (Date date : lastSevenDate) {
            TrendVo trendVo = new TrendVo();
            trendVo.setDate(date);

            DateTime start = DateUtil.beginOfDay(date);
            DateTime end = DateUtil.endOfDay(date);
            LambdaQueryWrapper<StudentCourse> wrapper = new LambdaQueryWrapper<StudentCourse>()
                    .between(StudentCourse::getCreateTime, start, end);
            int count = (int) studentCourseService.count(wrapper);
            trendVo.setCount(count);
            trendVos.add(trendVo);
        }

        return trendVos;
    }
}
