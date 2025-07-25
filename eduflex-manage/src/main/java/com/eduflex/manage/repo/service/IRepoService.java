package com.eduflex.manage.repo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.repo.domain.Repo;
import com.eduflex.manage.repo.domain.dto.RepoDto;
import com.eduflex.manage.repo.domain.vo.RepoVo;

import java.util.List;

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
    List<Repo> selectRepoList(RepoDto repo);

    /**
     * 构建题库集合Vo对象
     *
     * @param repoList 题库集合
     * @return 题库集合Vo对象
     */
    List<RepoVo> buildVo(List<Repo> repoList);
}
