package com.moutum.csmp.service;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.User;

/********************************************************************************
 * @Title        : UserService.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015-5-10 下午04:16:36
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ********************************************************************************/
public interface UserService extends ServiceSupport<User>
{
    
    List<User> getNoGroupUsers();

    List<User> findLeader(int gradeNum);

    List<User> getByGroup(int groupId);

    /**
     * 通过Map获得页面
     * @param pageNum
     * @param pageSize   
     * @param map   
     * @return PageBean   
     */ 
    PageBean getbyMap(int pageNum, int pageSize, Map<String,Object> map);
    
    /**
     * 
     * 账户冻结
     * @param list   
     * @return void  
     */
    void modifybyListFreeze(List<Integer> list);
   
    /**
     * 账户解冻
     * @param  list   
     * @return void  
     */
    void modifybyListWarm(List<Integer> list);
   
    /**
     * 账户注销
     * @param  list   
     * @return void  
     */
    void modifybyListWithdraw(List<Integer> list);
    
    /**
     * 根据登录账号（手机号码）查询用户对象
     * @param userPhone
     * @return
     */
    User getByPhone(String userPhone);
    
}