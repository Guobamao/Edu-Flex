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
}
