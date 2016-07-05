package com.moutum.csmp.service.impl;


import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.domain.Type;
import com.moutum.csmp.service.TypeService;

/************************************************************************************
 * @Title        : TypeServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:08:42
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class TypeServiceImpl extends ServiceSupportImpl<Type> implements TypeService
{

    @SuppressWarnings("unchecked")
    @Override
    public List<Type> getParentTypes(Map<String, Object> map) throws Exception
    {
        if(null != map.get("grade") && (Integer)map.get("grade") == 0)
        {
            return Collections.EMPTY_LIST;
        }
        
        return typeDao.getType(map);
    }

    @Override
    public int updateType(Type type) throws Exception
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", type.getTypeName());
        map.put("id", type.getTypeId());
        List<Type> types = typeDao.getType(map);
        if(types.size() > 0)
        {
            return 0;
        }
        else
        {
            try
            {
                typeDao.update(type);
                return 1;
            }
            catch (Exception e)
            {
                throw new Exception(e);
            }
        }
    }

    @Override
    public int saveType(Type type) throws Exception
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", type.getTypeName());
        List<Type> types = typeDao.getType(map);
        if(types.size() > 0)
        {
            return 0;
        }
        else
        {
            try
            {
                typeDao.save(type);
                return 1;
            }
            catch (Exception e)
            {
                throw new Exception(e);
            }
        }
    }

    /**
     * 查询一类
     */
	@Override
	public List<Type> getTypeOne() {
		return typeDao.getTypeOne();
	}

	/**
	 * 查询二类
	 */
	@Override
	public List<Type> getTypeTwo(int typeId) {
		return typeDao.getTypeTwo(typeId);
	}
}