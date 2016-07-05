package com.moutum.csmp.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.domain.Grade;
import com.moutum.csmp.service.GradeService;

/************************************************************************************
 * @Title        : GradeServiceImpl.java
 * @Description  : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月17日 下午4:04:24
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class GradeServiceImpl extends ServiceSupportImpl<Grade> implements GradeService
{

    @Override
    public List<Grade> findGroupGrade()
    {
        return gradeDao.findGroupGrade();
    }
}