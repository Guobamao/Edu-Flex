package com.eduflex.manage.homework.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.homework.domain.Homework;
import com.eduflex.manage.homework.domain.vo.HomeworkVo;

import java.util.List;

/**
 * 作业管理Service接口
 *
 * @author 林煜鋒
 * @date 2024-11-23
 */
public interface IHomeworkService extends IService<Homework> {

    /**
     * 查询作业管理列表
     *
     * @param homework 作业管理
     * @return 作业管理集合
     */
    List<Homework> selectHomeworkList(Homework homework);

    /**
     * 构建Vo
     *
     * @param list 作业列表
     * @return Vo对象
     */
    List<HomeworkVo> buildVo(List<Homework> list);
}
