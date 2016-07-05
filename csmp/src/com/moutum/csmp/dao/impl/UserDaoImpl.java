package com.moutum.csmp.dao.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.moutum.csmp.dao.UserDao;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.util.QueryHelper;
import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.base.PageBean;

/********************************************************************************
 * @Title        : UserDaoImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015-5-10 下午04:49:24
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ********************************************************************************/
@Repository
public class UserDaoImpl extends DaoSupportImpl<User> implements UserDao
{

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getNoGroupUsers()
    {
        List<User> list = sessionFactory.getCurrentSession().createQuery("FROM User u WHERE u.group IS NULL").list();
        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> findLeader(int gradeNum)
    {
        return sessionFactory.getCurrentSession().createQuery("FROM User u WHERE u.grade.gradeNum = ? AND u.group IS NULL").setParameter(0, gradeNum).list();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getByGroup(int groupId)
    {
        return sessionFactory.getCurrentSession().createQuery("FROM User u WHERE u.group.groupId = ? OR u.group IS NULL").setParameter(0, groupId).list();
    }
	
	@Override
	public PageBean getByMap(int pageNum, int pageSize, Map<String,Object> map)
	 {
		QueryHelper queryHelper = new QueryHelper(User.class, "u");
		
		if(null != map.get("userStat"))
		{
		    queryHelper.addCondition("state = ?", map.get("userStat"));
		}
		if(null !=map.get("userAccount"))
		{
			queryHelper.addCondition("loginAccount like ?", "%" + map.get("userAccount") + "%");
		} 
		if(null !=map.get("userName"))
		{
			queryHelper.addCondition("userName like ?", "%" + map.get("userName") + "%");
		} 
		if(null !=map.get("userRole"))
		{
			queryHelper.addCondition("role.roleId = ?", map.get("userRole"));
		} 
		if(null !=map.get("userGrade"))
		{
			queryHelper.addCondition("grade.gradeId = ?", map.get("userGrade"));
		} 
		if(null !=map.get("userGroup"))
		{
			queryHelper.addCondition("group.groupId = ?", map.get("userGroup"));
		}
		
		queryHelper.addOrderProperty("userId", true);
		
		return getPageBean(pageNum, pageSize, queryHelper);
	}

	/**
	 * 根据登录账号（手机号码）查询用户对象
	 */
    @SuppressWarnings("unchecked")
    @Override
    public User getByPhone(String userPhone)
    {
        User user = null;
        List<User> list = sessionFactory.getCurrentSession().createQuery("FROM User u WHERE u.userPhone = ?").setParameter(0, userPhone).list();
        
        if(list.size() > 0)
        {
            user = list.get(0);
        }
        
        return user;
        
    }

}