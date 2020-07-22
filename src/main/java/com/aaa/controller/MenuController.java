package com.aaa.controller;


import com.aaa.aop.SaveOrUpdateEntityAnn;
import com.aaa.entity.*;
import com.aaa.service.MenuService;
import com.aaa.service.RoleMenuService;
import com.aaa.util.MyConstants;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 * 菜单权限表 前端控制器
 * </p>
 *
 * @author AAATeacherChen
 * @since 2020-07-09
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends  BaseController{
    @Autowired
    private MenuService menuService;
    @Autowired
    private RoleMenuService roleMenuService;

    // List<LayUiTree> layUiTreeList = menuService.findMenus(username);

    @RequestMapping("/findAllMenus")
    @ResponseBody
    /**
     * create by: Teacher陈
     * description: 查询所有的权限菜单
     * create time: 2020/7/17 16:54
     *
     * @Param:
     * @return java.util.List<com.aaa.entity.LayUiTree>
     */
    public List<LayUiTree> findAllMenus(){
        List<LayUiTree> layUiTreeList = menuService.findMenus(null);
        return layUiTreeList;
    }

    /**
     * create by: Teacher陈
     * description: 跳转到显示菜单管理页面
     * create time: 2020/7/24 15:50
     *
     * @return a
     * @Param: null
    */
    @RequestMapping("/toShowMenu")
    public String toShowMenu(){
        return "menu/showMenu";
    }

    @RequestMapping("/findAllMenusTreeTable")
    @ResponseBody
    public LayUiTable findAllMenusTreeTable(){
        List<Menu> menuList = menuService.selectList(null);
        LayUiTable table = new LayUiTable();
        table.setCode(MyConstants.OPERATION_SUCCESS_CODE);
        table.setMsg(MyConstants.OPERATION_SUCCESS_MESSAGE);
        table.setData(menuList);
        table.setCount(menuList.size());
        return table;
    }
    /**
     * @create by: Teacher陈
     * @description: 保存菜单
     * @create time: 2020/7/21 1:16
     * @param menu
     * @return Result
     */
    @RequestMapping("/saveMenu")
    @ResponseBody
    @SaveOrUpdateEntityAnn(entityClass = Menu.class)
    public Result saveMenu(Menu menu){
        boolean insert = menuService.insert(menu);
        if (insert) {
            return super.success();
        } else {
            return super.error();
        }
    }
    /**
     * @create by: Teacher陈
     * @description: 根据menuid删除menu
     * @create time: 2020/7/21 16:08
     * @param menuId
     * @return Result
     */
    @RequestMapping("/deleteMenu")
    @ResponseBody
    public  Result deleteMenu(Integer menuId){
        //删除menu表
        boolean deleteMenu = menuService.deleteById(menuId);
        //删除role_menu中间表
        Wrapper<RoleMenu> wrapper = new EntityWrapper<>();
        wrapper.eq("menu_id",menuId);
        boolean deleteRoleMenu = roleMenuService.delete(wrapper);
        if (deleteMenu && deleteRoleMenu) {
            return super.success();
        } else {
            return super.error();
        }
    }
    /**
     * @create by: Teacher陈
     * @description: 按照菜单id查询菜单名称
     * @create time: 2020/7/21 20:48
     * @param menuId
     * @return Result
     */
    @RequestMapping("/findParentNameId")
    @ResponseBody
    @RequiresPermissions("system:menu:list")
    public  Result  findParentNameId(Integer menuId){
        Menu menu = menuService.selectById(menuId);
        if(null!=menu){
            return  success(menu);
        }else {
            //menuId为0的时候，返回的对象是空，防止返回前台为空
            Menu menuName = new Menu();
            return  success(menuName);
        }
    }

    @RequestMapping("/updateMenu")
    @ResponseBody
    @SaveOrUpdateEntityAnn(entityClass = Menu.class)
    public  Result updateMenu(Menu menu){
        boolean update = menuService.updateById(menu);
        if (update) {
            return super.success();
        } else {
            return super.error();
        }
    }
}

