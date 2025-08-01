package com.eduflex.manage.paper.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.paper.domain.PaperRepo;
import com.eduflex.manage.paper.domain.vo.PaperRepoVo;

import java.util.List;

/**
 * 试卷题库关联 Service接口
 *
 * @author 林煜鋒
 * @date 2025-02-10
 */
public interface IPaperRepoService extends IService<PaperRepo> {

    /**
     * 获取试卷关联的题库
     *
     * @param id 试卷ID
     * @return 关联题库
     */
    List<PaperRepoVo> selectRepoListByPaperId(Long id);
}
