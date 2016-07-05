package com.moutum.csmp.domain;

import java.util.Set;

/************************************************************************************
 * @Title        : Role.java
 * @Description  : 角色信息
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 上午10:53:07
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class Role
{
    
    /**
     * 角色ID
     */
    private int roleId;
    
    /**
     * 角色名称
     */
    private String roleName;
    
    /**
     * 角色等级(0:管理员, 1:客户)
     */
    private int roleRank;
    
    /**
     * 模块信息
     */
    private Set<Modle> modles;
    
    /**
     * 权限信息
     */
    private Set<Right> rights;
    

    public int getRoleId()
    {
        return roleId;
    }

    public void setRoleId(int roleId)
    {
        this.roleId = roleId;
    }

    public String getRoleName()
    {
        return roleName;
    }

    public void setRoleName(String roleName)
    {
        this.roleName = roleName;
    }

    public Set<Modle> getModles()
    {
        return modles;
    }

    public void setModles(Set<Modle> modles)
    {
        this.modles = modles;
    }

    public Set<Right> getRights()
    {
        return rights;
    }

    public void setRights(Set<Right> rights)
    {
        this.rights = rights;
    }

    public int getRoleRank()
    {
        return roleRank;
    }

    public void setRoleRank(int roleRank)
    {
        this.roleRank = roleRank;
    }
      
}