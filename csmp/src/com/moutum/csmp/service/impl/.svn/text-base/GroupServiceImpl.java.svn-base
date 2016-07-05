package com.moutum.csmp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.domain.Group;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.dto.GroupDto;
import com.moutum.csmp.service.GroupService;

/************************************************************************************
 * @Title        : GroupServiceImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月15日 下午6:00:27
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class GroupServiceImpl extends ServiceSupportImpl<Group> implements GroupService
{

    @Override
    public Map<Group, Map<GroupDto, Map<Group, List<User>>>> getGroupMap()
    {
        Map<Group,Map<GroupDto,Map<Group,List<User>>>> groupMap = new HashMap<Group,Map<GroupDto,Map<Group,List<User>>>>();
        Map<GroupDto,Map<Group,List<User>>> firstGroupMap = new HashMap<GroupDto,Map<Group,List<User>>>();
        Group rootGroup = groupDao.getById(1);
        if(null == rootGroup)
        {
            return null;
        }
        List<Group> gradeOneGroups = groupDao.getByFid(rootGroup.getGroupId());
        for(Group group : gradeOneGroups)
        {
            Map<Group,List<User>> secondGroupMap = new HashMap<Group,List<User>>();
            List<Group> gradeTwoGroups = groupDao.getByFid(group.getGroupId());
            for(Group tgroup : gradeTwoGroups)
            {
                List<User> users = new ArrayList<User>();
                users.addAll(tgroup.getUsers());//Set转List
                secondGroupMap.put(tgroup, users);
            }
            GroupDto groupDto = new GroupDto();
            groupDto.setGroup(group);
            groupDto.setLeader(userDao.getById(group.getGroupLeader()));
            firstGroupMap.put(groupDto, secondGroupMap);
        }
        groupMap.put(rootGroup, firstGroupMap);
        return groupMap;
    }

    @Override
    public List<Group> getGroupParent(int groupId)
    {
        return groupDao.getGroupParent(groupId);
    }

    @Override
    public List<Group> getNoParentGroup()
    {
        return groupDao.getNoParentGroup();
    }

    @Override
    public boolean modifySecondGroup(int cgroupId, Integer[] ids)
    {
        try
        {
            
            groupDao.modifyCancelParentId(cgroupId);//将父群组ID为指定参数的群组的父群组ID设置为0，即使之成为无父群组的群组
            groupDao.modifyAddParentId(cgroupId, ids);//更新新子群组的父ID为指定参数
            return true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }
}

