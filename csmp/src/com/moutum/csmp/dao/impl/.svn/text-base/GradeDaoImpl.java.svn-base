package com.moutum.csmp.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.GradeDao;
import com.moutum.csmp.domain.Grade;

/************************************************************************************
 * @Title        : GradeDaoImpl.java
 * @Description  : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月17日 下午4:02:22
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository 
public class GradeDaoImpl extends DaoSupportImpl<Grade> implements GradeDao
{

    @SuppressWarnings("unchecked")
    @Override
    public List<Grade> findGroupGrade()
    {
        return sessionFactory.getCurrentSession().createQuery("FROM Grade g WHERE g.gradeNum != 1").list();
    }

}

