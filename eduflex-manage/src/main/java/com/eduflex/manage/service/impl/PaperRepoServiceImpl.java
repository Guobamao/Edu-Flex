package com.eduflex.manage.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.manage.domain.PaperRepo;
import com.eduflex.manage.mapper.PaperRepoMapper;
import com.eduflex.manage.service.IPaperRepoService;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 试卷题库关联 Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-10
 */
@Service
public class PaperRepoServiceImpl extends ServiceImpl<PaperRepoMapper, PaperRepo> implements IPaperRepoService {

    @Override
    public List<PaperRepo> selectRepoByPaperId(Long id) {
        LambdaQueryWrapper<PaperRepo> wrapper = new LambdaQueryWrapper<PaperRepo>()
                .eq(PaperRepo::getPaperId, id);
        return baseMapper.selectList(wrapper);
    }
}
