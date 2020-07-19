package com.aaa.controller;


import com.aaa.aop.SaveOrUpdateEntityAnn;
import com.aaa.entity.*;
import com.aaa.service.RoleService;
import com.aaa.util.MyConstants;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 * 角色信息表 前端控制器
 * </p>
 *
 * @author AAATeacherChen
 * @since 2020-07-09
 */
@Controller
@RequestMapping("/role")
public class RoleController  extends  BaseController{
    @Autowired
    private RoleService roleService;

    /**
     * create by: Teacher陈
     * description:请求ShowDept，跳转到显示权限树的页面
     * create time: 2020/7/17 16:28
     *
     * @Param:
     * @return java.lang.String
     */
    @RequestMapping("/toShowRole")
    public String toShowRole(){
        return "role/showRole";
    }

    /**
     * @create by: Teacher陈
     * @description: 查询所有的角色信息
     * @create time: 2020/7/19 15:52
     * @return LayUiTable
     */
    @RequestMapping("/findAllRoles")
    @ResponseBody
    public LayUiTable findAllRoles(){
        //返回所有条数
        Wrapper<Role> wrapper = new EntityWrapper<>();
        //逻辑删除
        wrapper.eq("del_flag", 0);
        //排序
        wrapper.orderBy("role_sort",true);
        List<Role> roleList = roleService.selectList(wrapper);
        int count = roleService.selectCount(wrapper);
        LayUiTable roleTable = new LayUiTable();
        roleTable.setCode(MyConstants.OPERATION_SUCCESS_CODE);
        roleTable.setMsg(MyConstants.OPERATION_SUCCESS_MESSAGE);
        roleTable.setData(roleList);
        roleTable.setCount(count);
        return roleTable;
    }

    /**
     * @create by: Teacher陈
     * @description: 添加角色，并指定角色对应的菜单
     * @create time: 2020/7/19 18:36
     * @param roleVo
     * @return Result
     */
    @RequestMapping("/saveRole")
    @ResponseBody
    @SaveOrUpdateEntityAnn(entityClass = RoleVo.class)
    public Result saveRole(@RequestBody RoleVo roleVo){

        boolean save = roleService.saveRoleAndMenus(roleVo);
        if (save) {
            return super.success();
        } else {
            return super.error();
        }
    }
    @RequestMapping("/updateRole")
    @ResponseBody
    @SaveOrUpdateEntityAnn(entityClass = RoleVo.class)
    public Result updateRole(@RequestBody RoleVo roleVo){

        boolean update = roleService.updateRoleAndMenus(roleVo);
        if (update) {
            return super.success();
        } else {
            return super.error();
        }
    }
    /**
     * @create by: Teacher陈
     * @description: 删除角色，并且把相关的用户中间表和菜单中间表也同时删除
     * @create time: 2020/7/19 21:10
     * @param role
     * @return Result
     */
    @RequestMapping("/deleteRole")
    @ResponseBody
    public  Result deleteRole(Role role){
        boolean delete = roleService.deleteRoleAndMenus(role);
        if (delete) {
            return super.success();
        } else {
            return super.error();
        }
    }
    /**
     * @create by: Teacher陈
     * @description: 返回角色对应的菜单列表
     * @create time: 2020/7/19 22:04
     * @param roleId
     * @return Result
     */
    @RequestMapping("/findMenuIdsByRoleId")
    @ResponseBody
    public Result findMenuIdsByRoleId(Integer roleId){
        List<Integer>  menuIds=roleService.findMenuIdsByRoleId(roleId);
        return success(menuIds);
    }
}

