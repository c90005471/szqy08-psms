package com.aaa.service.impl;

import com.aaa.entity.Role;
import com.aaa.dao.RoleDao;
import com.aaa.service.RoleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 角色信息表 服务实现类
 * </p>
 *
 * @author AAATeacherChen
 * @since 2020-07-09
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleDao, Role> implements RoleService {
    @Autowired
    private  RoleDao roleDao;
    @Override
    public List<Role> selectListByUserId(Integer userId) {

        return roleDao.selectListByUserId(userId);
    }
}
