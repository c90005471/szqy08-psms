package com.aaa.dao;

import com.aaa.entity.Menu;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 菜单权限表 Mapper 接口
 * </p>
 *
 * @author AAATeacherChen
 * @since 2020-07-09
 */
@Mapper
@Repository
public interface MenuDao extends BaseMapper<Menu> {

    /**
     * @create by: Teacher陈
     * @description: 
     * @create time: 2020/7/5 13:26
    * @Param null: 
     * @return * @return: null
     */
    List<Menu> findMenusByLoginName(@Param("loginName") String loginName);

}
