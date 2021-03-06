package com.aaa.controller;


import com.aaa.aop.SaveOrUpdateEntityAnn;
import com.aaa.entity.*;
import com.aaa.service.DeptService;
import com.aaa.service.RoleService;
import com.aaa.service.UserService;
import com.aaa.util.MyConstants;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户信息表 前端控制器
 * </p>
 *
 * @author AAATeacherChen
 * @since 2020-07-09
 */
@Controller
@RequestMapping("/user")
public class UserController  extends  BaseController{
    @Autowired
    UserService userService;
    @Autowired
    DeptService deptService;
    @Autowired
    RoleService roleService;
    @RequestMapping("/toShowUser")
    public String toShowUser(Model model){
        //查询所有的部门信息，填充到页面下拉框中
        List<Dept> deptList = deptService.selectList(null);
        //查询所有的角色信息，填充到页面下拉框中
        List<Role> roleList = roleService.selectList(null);

        model.addAttribute("deptList", deptList);
        model.addAttribute("roleList", roleList);
        return "user/showUser";
    }

    /**
     * create by: Teacher陈
     * description: 返回所有的用户信息，包含部门信息
     * create time: 2020/7/20 17:20
     *
     * @Param:
     * @return java.lang.String
     */
    @RequestMapping("/selectAllUser")
    @ResponseBody
    public LayUiTable selectAllUser(HttpSession session,Integer page, Integer limit, String searchLoginName, String searchUserName, String searchPhonenumber){
/*        int sessionTimeout = session.getServletContext().getSessionTimeout();
        System.out.println(sessionTimeout);
        long timeout = SecurityUtils.getSubject().getSession().getTimeout();
        System.out.println(timeout);*/
        LayUiTable table = new LayUiTable();
        //多条件查询所需要的集合
        Map<String ,Object> condition= new HashMap(16);
        Wrapper wrapper = new EntityWrapper();
        //添加模糊查询的条件
        if (null != searchLoginName && !"".equals(searchLoginName)) {
            wrapper.like("login_name", searchLoginName);
            condition.put("login_name", searchLoginName);
        }
        if (null != searchUserName && !"".equals(searchUserName)) {
            condition.put("user_name", searchUserName);
        }
        if (null != searchPhonenumber && !"".equals(searchPhonenumber)) {
            condition.put("phonenumber", searchPhonenumber);
        }
        wrapper.eq("del_flag", 0);
        condition.put("del_flag", 0);
        int userListCount = userService.selectCount(wrapper);
        //如果表中没有数据。则不进行分页查询
        if(userListCount>0){
            //获取当前的系统毫秒数
            long start = System.currentTimeMillis();
            Page<UserVo> pageInfo = new Page(page, limit);
            List<UserVo> userVoList = userService.selectUserVoList(pageInfo,condition);
            //从分页结果中提取list集合
            table.setCode(MyConstants.OPERATION_SUCCESS_CODE);
            table.setMsg(MyConstants.OPERATION_SUCCESS_MESSAGE);
            table.setData(userVoList);
            table.setCount(userListCount);
            long end = System.currentTimeMillis();
           /* System.out.println("============查询花费时间："+(end-start)+"============");*/
        }
        return table;

    }


    /**
     * create by: Teacher陈
     * description: 判断用户名是否存在，存在的话返回false，不存在返回true
     * create time: 2020/7/22 17:08
     *
     * @Param: username
     * @return boolean
     */
    @RequestMapping("/checkUserName")
    @ResponseBody
    public Result checkUserName(String username){
        Wrapper<User> wrapper = new EntityWrapper<>();
        User user = userService.selectOne(wrapper.eq("login_name", username));
        if (user != null) {
           return  super.error(MyConstants.OPERATION_FAIL_CODE, username+"已经被占用");
        }
        return super.success();
    }


    /**
     * create by: Teacher陈
     * description: 保存用户
     * create time: 2020/7/23 15:43
     *
     * @return a
     * @Param: null
    */
    @RequestMapping("/saveUser")
    @ResponseBody
    @SaveOrUpdateEntityAnn(entityClass = User.class)
    public Result saveUser(User user){
        boolean insert = userService.saveUserAndSalt(user);
        if(insert){
            return success();
        }
        return error();
    }
    @RequestMapping("/updateUser")
    @ResponseBody
    @SaveOrUpdateEntityAnn(entityClass = User.class)
    /**
     * @create by: Teacher陈
     * @description: 修改用户
     * @create time: 2020/7/18 19:32
     * @param user
     * @return com.aaa.entity.Result
     */
    public Result updateUser(User user){
        boolean update = userService.updateUserAndSalt(user);
        if(update){
            return success();
        }
        return error();
    }
    /**
     * @create by: Teacher陈
     * @description: 删除用户（逻辑删除）
     * @create time: 2020/7/19 13:44
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public Result deleteUser(User user){
        user.setDelFlag("1");
        boolean update = userService.updateById(user);
        if(update){
            return success();
        }
        return error();
    }
    /**
     * @create by: Teacher陈
     * @description: 根据用户id查询自己的角色
     * @create time: 2020/7/18 21:28
     */
    @RequestMapping("/getRoleCheckByUserId")
    @ResponseBody
    public Result getRoleCheckByUserId(Integer userId){
        List<Role> roleUserList = roleService.selectListByUserId(userId);
        List<Role> roleList = roleService.selectList(null);
        Map map = new HashMap();
        for (Role role : roleList) {
            //判断集合包含对象，必须重写equals和hashcode方法
            if(roleUserList.contains(role)){
                map.put(role.getRoleKey(), true);
            }else {
                map.put(role.getRoleKey(), false);
            }
        }
        System.out.println(map.toString());
        return success(map);
    }

    /**
     * @create by: Teacher陈
     * @description: 重置密码
     * @create time: 2020/7/19 15:16
     */
    @RequestMapping("/resetPassword")
    @ResponseBody
    public  Result resetPassword(User user){
        boolean update = userService.resetPassword(user);
        if(update){
            return success();
        }
        return error();
    }
    /**
     * @create by: Teacher陈
     * @description: 批量删除用户
     * @create time: 2020/7/19 15:20
     * @param userList
     * @return Result
     */
    @RequestMapping(value = "/deleteBatchUser")
    @ResponseBody
    public Result deleteBatchUser(@RequestBody List<User> userList) {
        List<User> userListNew = new ArrayList<>();
        //此处是逻辑删除，修改delflag
        for (User user : userList) {
            User userNew = new User();
            userNew.setDelFlag("1");
            userNew.setUserId(user.getUserId());
            userListNew.add(userNew);
        }
        boolean update = userService.updateBatchById(userListNew);
        if (update) {
            return super.success();
        } else {
            return super.error();
        }
    }

    @RequestMapping("/toBasicInformation")
    public String toBasicInformation(){
        return "basicInformation";
    }
}

