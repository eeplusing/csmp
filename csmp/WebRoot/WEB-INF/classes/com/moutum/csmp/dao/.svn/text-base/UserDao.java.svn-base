package com.moutum.csmp.dao;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.base.DaoSupport;
import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.User;

/********************************************************************************
 * @Title        : UserDao.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015-5-10 下午04:48:21
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ********************************************************************************/
public interface UserDao extends DaoSupport<User>
{
    List<User> getNoGroupUsers();

    List<User> findLeader(int gradeNum);

    List<User> getByGroup(int groupId);
    
   /**
     * 获得Map页面
     * @param pageNum  
     * @param pageSize  
     * @param map  
     * @return PageBean 
     */
    PageBean getByMap(int pageNum, int pageSize, Map<String,Object> map);

    /**
     * 根据登录账号（手机号码）查询用户对象
     * @param userPhone
     * @return
     */
    User getByPhone(String userPhone);
    
}