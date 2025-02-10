package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.Repo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.dto.RepoDto;
import com.eduflex.manage.domain.vo.RepoVo;

/**
 * 题库管理 Service接口
 *
 * @author 林煜鋒
 * @date 2025-02-09
 */
public interface IRepoService extends IService<Repo> {
    /**
     * 查询题库管理列表
     *
     * @param repo 题库管理
     * @return 题库管理集合
     */
    List<RepoVo> selectRepoList(RepoDto repo);
}
