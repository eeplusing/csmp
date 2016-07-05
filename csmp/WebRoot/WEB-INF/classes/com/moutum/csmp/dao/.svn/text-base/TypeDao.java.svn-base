package com.moutum.csmp.dao;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.base.DaoSupport;
import com.moutum.csmp.domain.Type;

/************************************************************************************
 * @Title        : TypeDao.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:06:16
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface TypeDao extends DaoSupport<Type>
{

    /********************************************************************************
     * 根据条件查询种类信息列表
     * @param map
     * @return
     ********************************************************************************/
    List<Type> getType(Map<String, Object> map) throws Exception;
    
    /**
     * 查询一类
     */
    List<Type> getTypeOne();
    
    /**
     * 查询二类
     */
    List<Type> getTypeTwo(int typeId);
}

