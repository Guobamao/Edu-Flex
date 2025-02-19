package com.eduflex.manage.homework.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.homework.domain.HomeworkStudent;
import com.eduflex.user.homework.domain.dto.HomeworkDto;
import com.eduflex.user.homework.domain.vo.HomeworkVo;

import java.util.List;


/**
 * 作业学生关联 - Service接口
 *
 * @author 林煜鋒
 * @date 2025-02-18
 */
public interface IHomeworkStudentService extends IService<HomeworkStudent> {

    /**
     * 获取学生作业列表
     * @param homework 查询条件
     * @return 作业列表
     */
    List<HomeworkVo> selectHomeworkList(HomeworkDto homework);

    /**
     * 获取学生作业详情
     * @param homeworkDto 查询条件
     * @return 作业详情
     */
    HomeworkVo selectHomework(HomeworkDto homeworkDto);

    /**
     * 更新学生作业 （提交作业、批阅作业）
     * @param homeworkDto 更新条件
     * @return 修改结果
     */
    boolean submitHomework(HomeworkDto homeworkDto);
}
