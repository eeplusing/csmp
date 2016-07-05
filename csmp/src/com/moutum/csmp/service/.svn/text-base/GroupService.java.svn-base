package com.moutum.csmp.service;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.domain.Group;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.dto.GroupDto;

/************************************************************************************
 * @Title        : GroupService.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月15日 下午6:00:16
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface GroupService extends ServiceSupport<Group>
{

    /********************************************************************************
     * 获取系统所有群组树形集合
     * @return
     ********************************************************************************/
    Map<Group, Map<GroupDto, Map<Group, List<User>>>> getGroupMap();

    /********************************************************************************
     * 查询父群组ID为指定参数或为0(父群组ID为0表示该群组无父群组)的群组即和
     * @param groupId
     * @return
     ********************************************************************************/
    List<Group> getGroupParent(int groupId);
    
    /********************************************************************************
     * 查询无父群组的所有群组(除系统群组外)的集合
     * @return
     ********************************************************************************/
    List<Group> getNoParentGroup();

    /********************************************************************************
     * 根据群组ID及下属群组ID集合更新该群组
     * @param cgroupId
     * @param ids
     * @return
     ********************************************************************************/
    boolean modifySecondGroup(int cgroupId, Integer[] ids);

}

