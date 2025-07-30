package com.eduflex.system.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.annotation.DataScope;
import com.eduflex.common.constant.UserConstants;
import com.eduflex.common.core.domain.TreeSelect;
import com.eduflex.common.core.domain.entity.SysDept;
import com.eduflex.common.core.domain.entity.SysRole;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.core.text.Convert;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.SecurityUtils;
import com.eduflex.common.utils.StringUtils;
import com.eduflex.common.utils.spring.SpringUtils;
import com.eduflex.system.mapper.SysDeptMapper;
import com.eduflex.system.service.ISysDeptService;
import com.eduflex.system.service.ISysRoleService;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 部门管理 服务实现
 *
 * @author ruoyi
 */
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements ISysDeptService {

    @Autowired
    private ISysRoleService roleService;

    @Override
    @DataScope(deptAlias = "d")
    public List<SysDept> selectDeptList(SysDept dept) {
        return baseMapper.selectDeptList(dept);
    }

    @Override
    public List<TreeSelect> selectDeptTreeList(SysDept dept) {
        List<SysDept> depts = SpringUtils.getAopProxy(this).selectDeptList(dept);
        return buildDeptTreeSelect(depts);
    }

    @Override
    public List<SysDept> buildDeptTree(List<SysDept> depts) {
        List<SysDept> returnList = new ArrayList<>();
        List<Long> tempList = depts.stream().map(SysDept::getDeptId).toList();
        for (SysDept dept : depts) {
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(dept.getParentId())) {
                recursionFn(depts, dept);
                returnList.add(dept);
            }
        }
        if (returnList.isEmpty()) {
            returnList = depts;
        }
        return returnList;
    }

    @Override
    public List<TreeSelect> buildDeptTreeSelect(List<SysDept> depts) {
        List<SysDept> deptTrees = buildDeptTree(depts);
        return deptTrees.stream().map(TreeSelect::new).collect(Collectors.toList());
    }

    @Override
    public List<Long> selectDeptListByRoleId(Long roleId) {
        SysRole role = roleService.selectRoleById(roleId);
        return baseMapper.selectDeptListByRoleId(roleId, role.isDeptCheckStrictly());
    }

    @Override
    public SysDept selectDeptById(Long deptId) {
        SysDept dept = getById(deptId);
        SysDept parentDept = getById(dept.getParentId());

        if (parentDept != null) {
            dept.setParentName(parentDept.getParentName());
        }
        return dept;
    }

    @Override
    public int selectNormalChildrenDeptById(Long deptId) {
        return baseMapper.selectNormalChildrenDeptById(deptId);
    }

    @Override
    public boolean hasChildByDeptId(Long deptId) {
        LambdaQueryWrapper<SysDept> wrapper = Wrappers.<SysDept>lambdaQuery()
                .eq(SysDept::getParentId, deptId);
        return CollUtil.isNotEmpty(list(wrapper));
    }

    @Override
    public boolean checkDeptExistUser(Long deptId) {
        ISysUserService userService = SpringUtils.getBean(ISysUserService.class);
        return userService.checkDeptExistUser(deptId);
    }

    @Override
    public boolean checkDeptNameUnique(SysDept dept) {
        long deptId = StringUtils.isNull(dept.getDeptId()) ? -1L : dept.getDeptId();
        SysDept info = getOne(Wrappers.<SysDept>lambdaQuery()
                .eq(SysDept::getDeptName, dept.getDeptName())
                .eq(SysDept::getParentId, dept.getParentId())
                .last("limit 1"));
        if (StringUtils.isNotNull(info) && info.getDeptId() != deptId) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    @Override
    public void checkDeptDataScope(Long deptId) {
        if (!SysUser.isAdmin(SecurityUtils.getUserId()) && StringUtils.isNotNull(deptId)) {
            SysDept dept = new SysDept();
            dept.setDeptId(deptId);
            List<SysDept> depts = SpringUtils.getAopProxy(this).selectDeptList(dept);
            if (StringUtils.isEmpty(depts)) {
                throw new ServiceException("没有权限访问部门数据！");
            }
        }
    }

    @Override
    public int insertDept(SysDept dept) {
        SysDept info = selectDeptById(dept.getParentId());
        // 如果父节点不为正常状态,则不允许新增子节点
        if (!UserConstants.DEPT_NORMAL.equals(info.getStatus())) {
            throw new ServiceException("部门停用，不允许新增");
        }
        dept.setAncestors(info.getAncestors() + "," + dept.getParentId());
        return baseMapper.insert(dept);
    }

    @Override
    public int updateDept(SysDept dept) {
        SysDept newParentDept = selectDeptById(dept.getParentId());
        SysDept oldDept = selectDeptById(dept.getDeptId());
        if (StringUtils.isNotNull(newParentDept) && StringUtils.isNotNull(oldDept)) {
            String newAncestors = newParentDept.getAncestors() + "," + newParentDept.getDeptId();
            String oldAncestors = oldDept.getAncestors();
            dept.setAncestors(newAncestors);
            updateDeptChildren(dept.getDeptId(), newAncestors, oldAncestors);
        }
        int result = baseMapper.updateById(dept);
        if (UserConstants.DEPT_NORMAL.equals(dept.getStatus()) && StringUtils.isNotEmpty(dept.getAncestors())
                && !StringUtils.equals("0", dept.getAncestors())) {
            // 如果该部门是启用状态，则启用该部门的所有上级部门
            updateParentDeptStatusNormal(dept);
        }
        return result;
    }

    private void updateParentDeptStatusNormal(SysDept dept) {
        String ancestors = dept.getAncestors();
        List<Long> deptIds = CollUtil.toList(Convert.toLongArray(ancestors));
        LambdaUpdateWrapper<SysDept> wrapper = Wrappers.<SysDept>lambdaUpdate()
                .in(SysDept::getDeptId, deptIds)
                .set(SysDept::getStatus, UserConstants.DICT_NORMAL);
        update(wrapper);
    }

    public void updateDeptChildren(Long deptId, String newAncestors, String oldAncestors) {
        List<SysDept> children = baseMapper.selectChildrenDeptById(deptId);
        if (CollUtil.isNotEmpty(children)) {
            for (SysDept child : children) {
                if (child.getDeptId() == null || child.getAncestors() == null) {
                    continue;
                }

                LambdaUpdateWrapper<SysDept> wrapper = Wrappers.<SysDept>lambdaUpdate()
                        .eq(SysDept::getDeptId, child.getDeptId())
                        .set(SysDept::getAncestors, child.getAncestors().replaceFirst(oldAncestors, newAncestors));
                update(wrapper);
            }
        }
    }

    /**
     * 递归列表
     */
    private void recursionFn(List<SysDept> list, SysDept t) {
        // 得到子节点列表
        List<SysDept> childList = getChildList(list, t);
        t.setChildren(childList);
        for (SysDept tChild : childList) {
            if (hasChild(list, tChild)) {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<SysDept> getChildList(List<SysDept> list, SysDept t) {
        List<SysDept> tlist = new ArrayList<>();
        Iterator<SysDept> it = list.iterator();
        while (it.hasNext()) {
            SysDept n = it.next();
            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getDeptId().longValue()) {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<SysDept> list, SysDept t) {
        return CollUtil.isNotEmpty(getChildList(list, t));
    }
}
