package com.moutum.csmp.service;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.domain.Type;

/************************************************************************************
 * @Title        : TypeService.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:08:17
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface TypeService extends ServiceSupport<Type>
{

    /********************************************************************************
     * 查询父类
     * @param map
     * @return
     ********************************************************************************/
    List<Type> getParentTypes(Map<String, Object> map) throws Exception;

    /********************************************************************************
     * 保存编辑后的种类信息
     * @param type
     * @return
     *          0：种类名已存在
     *          1：成功
     ********************************************************************************/
    int updateType(Type type) throws Exception;


    /********************************************************************************
     * 保存编辑后的种类信息
     * @param type
     * @return
     *          0：种类名已存在
     *          1：成功
     ********************************************************************************/
    int saveType(Type type) throws Exception;
    
    /**
     * 查询一类
     */
    List<Type> getTypeOne();
    
    /**
     * 查询二类
     */
    List<Type> getTypeTwo(int typeId);
}

