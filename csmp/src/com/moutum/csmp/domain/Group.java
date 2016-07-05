package com.moutum.csmp.domain;

import java.util.Set;

/************************************************************************************
 * @Title        : Group.java
 * @Description  : 群组信息
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 下午3:06:07
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class Group
{

    /**
     * 群组编号
     */
    private int groupId;
    
    /**
     * 群组名称
     */
    private String groupName;
    
    /**
     * 所属群组
     */
    private int fgroupId;
    
    /**
     * 群组级别
     */
    private int groupGrade;
    
    /**
     * 组长
     */
    private int groupLeader;
    
    /**
     * 群组成员
     */
    private Set<User> users;

    public int getGroupId()
    {
        return groupId;
    }

    public void setGroupId(int groupId)
    {
        this.groupId = groupId;
    }

    public String getGroupName()
    {
        return groupName;
    }

    public void setGroupName(String groupName)
    {
        this.groupName = groupName;
    }

    public int getFgroupId()
    {
        return fgroupId;
    }

    public void setFgroupId(int fgroupId)
    {
        this.fgroupId = fgroupId;
    }

    public int getGroupGrade()
    {
        return groupGrade;
    }

    public void setGroupGrade(int groupGrade)
    {
        this.groupGrade = groupGrade;
    }

    public int getGroupLeader()
    {
        return groupLeader;
    }

    public void setGroupLeader(int groupLeader)
    {
        this.groupLeader = groupLeader;
    }

    public Set<User> getUsers()
    {
        return users;
    }

    public void setUsers(Set<User> users)
    {
        this.users = users;
    }
}