package com.aaa.controller;


import com.aaa.entity.LayUiTable;
import com.aaa.entity.Result;
import com.aaa.entity.Role;
import com.aaa.entity.RoleVo;
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
        System.out.println("11111111111");
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
        List<Role> roleList = roleService.selectList(wrapper);
        int count = roleService.selectCount(wrapper);
        LayUiTable roleTable = new LayUiTable();
        roleTable.setCode(MyConstants.OPERATION_SUCCESS_CODE);
        roleTable.setMsg(MyConstants.OPERATION_SUCCESS_MESSAGE);
        roleTable.setData(roleList);
        roleTable.setCount(count);
        return roleTable;
    }

    @RequestMapping("/saveRole")
    @ResponseBody
    public Result saveRole(@RequestBody RoleVo roleVo){

        boolean save = roleService.saveRoleAndMenus(roleVo);
        if (save) {
            return super.success();
        } else {
            return super.error();
        }
    }
}

