package com.aaa.entity;

import lombok.*;

import java.io.Serializable;

/**
 * <p>
 * 角色信息表
 * </p>
 *
 * @author AAATeacherChen
 * @since 2020-07-09
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class RoleVo implements  Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 角色ID
     */
    @NonNull
    private Integer roleId;
    /**
     * 角色名称
     */
    @NonNull
    private String roleKey;

    /**
     * 是否选中，选中的话checked="checked",不选中为空
     */
    private String checked;




}
