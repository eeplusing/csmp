package com.moutum.csmp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.service.UserService;

/********************************************************************************
 * @Title        : UserServiceImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015-5-10 下午04:50:32
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ********************************************************************************/
@Service @Transactional
public class UserServiceImpl extends ServiceSupportImpl<User> implements UserService
{
	@Override
	public List<User> getNoGroupUsers()
    {
        return userDao.getNoGroupUsers();
    }

    @Override
    public List<User> findLeader(int gradeNum)
    {
        return userDao.findLeader(gradeNum);
    }

    @Override
    public List<User> getByGroup(int groupId)
    {
        return userDao.getByGroup(groupId);
    }
    
    @Override
	public PageBean getbyMap(int pageNum, int pageSize, Map<String,Object> map)
	{
		return userDao.getByMap(pageNum, pageSize, map);
	}

	@Override
	public void modifybyListFreeze(List<Integer> list)
	{
		for(Integer id : list)
		{
			User user = getById(id);
			user.setState(2);
			update(user);
		}
	}
	
	@Override
	public void modifybyListWarm(List<Integer> list)
	{
		for(Integer id : list)
		{
			User user = getById(id);
			user.setState(1);
			update(user);
		}
	}
	
	@Override
	public void modifybyListWithdraw(List<Integer> list)
	{
		for(Integer id : list)
		{
			User user = getById(id);
			user.setState(3);
			update(user);
		}
	}

	/**
	 * 根据登录账号（手机号码）查询用户对象
	 */
    @Override
    public User getByPhone(String userPhone)
    {
        return userDao.getByPhone(userPhone);
        
    }	
}