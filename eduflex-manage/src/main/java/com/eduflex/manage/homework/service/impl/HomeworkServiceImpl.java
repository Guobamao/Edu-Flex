package com.eduflex.manage.homework.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.homework.domain.Homework;
import com.eduflex.manage.homework.domain.HomeworkStudent;
import com.eduflex.manage.homework.domain.vo.HomeworkVo;
import com.eduflex.manage.homework.mapper.HomeworkMapper;
import com.eduflex.manage.homework.service.IHomeworkService;
import com.eduflex.manage.homework.service.IHomeworkStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 作业管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2024-11-23
 */
@Service
public class HomeworkServiceImpl extends ServiceImpl<HomeworkMapper, Homework> implements IHomeworkService
{

    @Autowired
    private ICourseService courseService;

    @Autowired
    private IHomeworkStudentService homeworkStudentService;

    @Override
    public List<Homework> selectHomeworkList(Homework homework)
    {
        LambdaQueryWrapper<Homework> wrapper = new LambdaQueryWrapper<Homework>()
                .eq(homework.getCourseId() != null, Homework::getCourseId, homework.getCourseId())
                .like(homework.getTitle() != null && !homework.getTitle().isEmpty(), Homework::getTitle, homework.getTitle());
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<HomeworkVo> buildVo(List<Homework> list) {
        List<HomeworkVo> homeworkVoList = BeanUtil.copyToList(list, HomeworkVo.class);
        for (HomeworkVo homeworkVo : homeworkVoList) {
            homeworkVo.setCourseName(courseService.getById(homeworkVo.getCourseId()).getName());

            LambdaQueryWrapper<HomeworkStudent> wrapper = new LambdaQueryWrapper<HomeworkStudent>()
                    .eq(HomeworkStudent::getHomeworkId, homeworkVo.getId());
            homeworkVo.setSubmitCount((int) homeworkStudentService.count(wrapper));
        }
        return homeworkVoList;
    }
}
