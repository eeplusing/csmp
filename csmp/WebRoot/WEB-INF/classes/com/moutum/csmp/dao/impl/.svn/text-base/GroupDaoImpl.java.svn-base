package com.moutum.csmp.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.GroupDao;
import com.moutum.csmp.domain.Group;

/************************************************************************************
 * @Title        : GroupDaoImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月15日 下午5:59:07
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class GroupDaoImpl extends DaoSupportImpl<Group> implements GroupDao
{

    @SuppressWarnings("unchecked")
    @Override
    public List<Group> getByFid(int fid)
    {
        List<Group> groups = sessionFactory.getCurrentSession()
                                           .createQuery("FROM Group g WHERE g.fgroupId = ?")
                                           .setParameter(0, fid).list();
        return groups;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Group> getGroupParent(int groupId)
    {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Group g WHERE g.fgroupId = ? OR (g.fgroupId = 0 AND g.groupId != 1)")
                .setParameter(0, groupId).list();
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Group> getNoParentGroup()
    {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Group g WHERE g.fgroupId = 0 AND g.groupId != 1").list();
    }

    @Override
    public void modifyAddParentId(int cgroupId, Integer[] ids)
    {
        sessionFactory.getCurrentSession()
                      .createQuery("UPDATE Group g SET g.fgroupId = ? WHERE g.groupId IN (:ids)")
                      .setParameter(0, cgroupId).setParameterList("ids", ids).executeUpdate();
    }

    @Override
    public void modifyCancelParentId(int cgroupId)
    {
        sessionFactory.getCurrentSession()
                      .createQuery("UPDATE Group g SET g.fgroupId = 0 WHERE g.fgroupId = ?")
                      .setParameter(0, cgroupId).executeUpdate();
    }
}