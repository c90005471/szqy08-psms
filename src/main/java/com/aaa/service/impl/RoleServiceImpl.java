package com.aaa.service.impl;

import com.aaa.dao.RoleDao;
import com.aaa.dao.RoleMenuDao;
import com.aaa.dao.UserRoleDao;
import com.aaa.entity.*;
import com.aaa.service.RoleService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
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
    @Autowired
    private RoleMenuDao roleMenuDao;
    @Autowired
    private UserRoleDao userRoleDao;
    @Override
    public List<Role> selectListByUserId(Integer userId) {

        return roleDao.selectListByUserId(userId);
    }

    @Override
    public boolean saveRoleAndMenus(RoleVo roleVo) {
        Role role = new Role();
        //使用spring自带工具类进行对象深度拷贝
        BeanUtils.copyProperties(roleVo,role);
        //操作tbl_role保存role
        Integer insert = roleDao.insert(role);
        if(insert>0){
            //操作tbl_role_menu中间表
            List<LayUiTree> layUiTreeList = roleVo.getMenus();
            //递归保存角色和菜单中间表
            recursionSaveRoleMenu( role , layUiTreeList);
            return true;
        }
        return false;
    }
    @Override
    public boolean updateRoleAndMenus(RoleVo roleVo) {
        Role role = new Role();
        //使用spring自带工具类进行对象深度拷贝
        BeanUtils.copyProperties(roleVo,role);
        //操作tbl_role保存role
        Integer update = roleDao.updateById(role);
        if(update>0){
            //删除tbl_role_menu中的数据
            Wrapper<RoleMenu> wrapperRoleMenu = new EntityWrapper<>();
            wrapperRoleMenu.eq("role_id",role.getRoleId());
            roleMenuDao.delete(wrapperRoleMenu);
            //操作tbl_role_menu中间表
            List<LayUiTree> layUiTreeList = roleVo.getMenus();
            //递归保存角色和菜单中间表
            recursionSaveRoleMenu( role , layUiTreeList);
            return true;
        }
        return false;
    }


    /**
     * @create by: Teacher陈
     * @description: 删除角色，并且把相关的用户中间表和菜单中间表也同时删除
     * @create time: 2020/7/19 21:10
     * @param role
     * @return boolean
     */
    @Override
    public boolean deleteRoleAndMenus(Role role) {
        int roleId=role.getRoleId();
        //删除role表中的记录
        Integer integer = roleDao.deleteById(roleId);
        //删除中间表中的记录
        if(integer>0){
            //删除tbl_role_menu中的数据
            Wrapper<RoleMenu> wrapperRoleMenu = new EntityWrapper<>();
            wrapperRoleMenu.eq("role_id",roleId);
            roleMenuDao.delete(wrapperRoleMenu);
            //删除tbl_user_role中的数据
            Wrapper<UserRole> wrapperUserRole = new EntityWrapper<>();
            wrapperUserRole.eq("role_id",roleId);
            userRoleDao.delete(wrapperUserRole);
            return true;
        }
        return false;
    }

    @Override
    public List<Integer> findMenuIdsByRoleId(Integer roleId) {

        return userRoleDao.findMenuIdsByRoleId(roleId);
    }


    /**
     * @create by: Teacher陈
     * @description: 递归保存角色和菜单中间表
     * @create time: 2020/7/19 18:09
     * @param role，layUiTreeList
     */
    public void recursionSaveRoleMenu(Role role ,List<LayUiTree> layUiTreeList){
        for (LayUiTree layUiTree : layUiTreeList) {
            //保存当前节点到数据库
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRoleId(role.getRoleId());
            roleMenu.setMenuId(layUiTree.getId());
            roleMenuDao.insert(roleMenu);
            if(layUiTree.getChildren().size()>0){
                //如果有孩子节点，递归保存角色和菜单中间表
                recursionSaveRoleMenu( role , layUiTree.getChildren());
            }
        }
    }


}
