package com.moutum.csmp.service.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.domain.Modle;
import com.moutum.csmp.domain.Right;
import com.moutum.csmp.domain.Role;
import com.moutum.csmp.service.RightService;

/************************************************************************************
 * @Title        : RightServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:40:06
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
@Controller @Scope("prototype")
public class RightServiceImpl extends ServiceSupportImpl<Right> implements RightService
{

	@Override
	public Map<String, Map<String, Map<Integer,Right>>> rightMap() 
	{
		List<Modle> firstModles = modleDao.selectModle(0);
		Map<String, Map<String, Map<Integer,Right>>> fmap = new HashMap<String, Map<String, Map<Integer,Right>>>();
		for(Modle fm : firstModles)
	    {
	           List<Modle> secondModles = modleDao.selectModle(fm.getModleId());
	           Map<String, Map<Integer,Right>> smap = new HashMap<String, Map<Integer,Right>>();
	           for(Modle sm : secondModles)
	           {
	               smap.put(sm.getModleName(), rightDao.selectRight(sm.getModleId()));
	           }
	           fmap.put(fm.getModleName(), smap);
	    }
		return fmap;
	}

	@Override
	public String getRightIdByRole(int roleId) 
	{
		List<Right> rights = rightDao.getRightsByRole(roleId);
        StringBuffer stringBuffer = null;
        if(null != rights)
        {
            stringBuffer = new StringBuffer();
            for(Right right : rights)
            {
                stringBuffer.append(right.getRightId() + "[]");
            }
        }
        if(null != stringBuffer)
        {
            return stringBuffer.toString();
        }
        else
        {
            return "";
        }
	}

	@Override
	public List<Right> getRightFunctionByRole(int roleId) 
	{
        return rightDao.getRightsByRole(roleId);
	}
	
	
	@Override
	public Role BackRoleWithRights(Map<String, Object> map)
	{
		String ids = map.get("rightIds").toString();
		Role role = (Role)map.get("role");
		if(ids.equals(""))
		{
			role.setRights(null);
		}
		else
		{
			String[] rightIds = ids.split(";");
			Set<Right> rights = new HashSet<Right>();
			for(String rightId : rightIds)
			{
				Right right = getById(Integer.parseInt(rightId));
				rights.add(right);
			}
			role.setRights(rights);
		}
		return role;
	}

}

