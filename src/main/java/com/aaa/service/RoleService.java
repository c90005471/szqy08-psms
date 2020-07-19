package com.aaa.service;

import com.aaa.entity.Role;
import com.aaa.entity.RoleVo;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 * 角色信息表 服务类
 * </p>
 *
 * @author AAATeacherChen
 * @since 2020-07-09
 */

public interface RoleService extends IService<Role> {

    List<Role> selectListByUserId(Integer userId);

    boolean saveRoleAndMenus(RoleVo roleVo);
}
