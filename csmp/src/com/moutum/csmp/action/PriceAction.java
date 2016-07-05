package com.moutum.csmp.action;

import java.io.IOException;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.domain.Good;
import com.moutum.csmp.domain.Grade;
import com.moutum.csmp.domain.Price;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : PriceAction.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年6月4日 下午4:48:48
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class PriceAction extends BaseAction<Price>
{

    /********************************************************************************
     * 
     ********************************************************************************/
    private static final long serialVersionUID = -6907646193514626362L;

    /********************************************************************************
     *根据价格ID查询价格信息 
     ********************************************************************************/
    public void find()
    {
        int operType = 0;
        int pid = 0;
        try
        {
            operType = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("operType"))[0]);
        }
        catch (Exception e){}
        try
        {
            pid = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pid"))[0]);
        }
        catch (Exception e){}
        
        StringBuffer json = new StringBuffer("");
        if(operType == 0)//更新操作
        {
            Price price = priceService.getById(pid);
            json.append("{pid: \"" + price.getInfoId() + "\",");
            json.append("goodId: \"" + price.getGood().getGoodId() + "\",");
            json.append("gid: \"" + price.getGrade().getGradeId() + "\",");
            json.append("priceName: \"" + price.getPriceName() + "\",");
            json.append("price: \"" + price.getPrice() + "\",");
            json.append("grades: " + getGradeJson() + "}");
        }
        else if(operType == 1)//增加操作
        {
            json.append(getGradeJson());
        }
        
        try
        {
            getResponse().getWriter().print(json.toString());
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    
    public void modify()
    {
        try
        {
            int operType = 0;
            int pid = 0;
            int goodId = 0;
            String name = "";
            int gid = 0;
            double pnum = 0.0;
            try
            {
                operType = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("operType"))[0]);
            }
            catch (Exception e){}
            
            try
            {
                pid = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pid"))[0]);
            }
            catch (Exception e){}
            
            try
            {
                pnum = Double.parseDouble(((String[])ActionContext.getContext().getParameters().get("pnum"))[0]);
            }
            catch (Exception e){}
            
            try
            {
                gid = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("gid"))[0]);
            }
            catch (Exception e){}
            
            try
            {
                name = ((String[])ActionContext.getContext().getParameters().get("name"))[0].trim();
            }
            catch (Exception e){}
            
            try
            {
                goodId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("goodId"))[0]);
            }
            catch (Exception e){}
            
            Price price = null;
            if(operType == 0)//更新操作
            {
                price = priceService.getById(pid);
            }
            else if(operType == 1)//新增操作
            {
                price = new Price();
            }
            Good good = goodService.getById(goodId);
            Grade grade = gradeService.getById(gid);
            price.setPriceName(name);
            price.setGrade(grade);
            price.setPrice(pnum);
            price.setGood(good);
            switch (priceService.modify(operType, price))
            {
            case 0:
                getResponse().getWriter().print("该商品已存在该价格名称，同一商品价格名称不能重复！");
                break;
            case 1:
                getResponse().getWriter().print("该商品已存在该级别价格，除默认级别外，其他级别只能有一个价格！");
                break;
            case 2:
                getResponse().getWriter().print("操作成功");
                break;
            case 3:
                getResponse().getWriter().print("操作失败");
                break;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    private String getGradeJson()
    {
        List<Grade> grades = gradeService.findAll();
        StringBuffer json = new StringBuffer("[");
        for(int i=0; i < grades.size(); i++)
        {
            if(i == grades.size() - 1)
            {
                json.append("{id:\"" + grades.get(i).getGradeId() + "\",");
                json.append("name:\"" + grades.get(i).getGradeName() + "\"}]");
            }
            else
            {
                json.append("{id:\"" + grades.get(i).getGradeId() + "\",");
                json.append("name:\"" + grades.get(i).getGradeName() + "\"},");
            }
        }
        return json.toString();
    }
    
    public void delete()
    {
        String pids = ((String[])ActionContext.getContext().getParameters().get("pids"))[0];
        String[] priceIds = pids.split(",");
        Integer[] ids = new Integer[priceIds.length];
        for(int i = 0; i < priceIds.length; i++)
        {
            ids[i] = Integer.parseInt(priceIds[i]);
        }
        try
        {
            priceService.delete(ids);
            getResponse().getWriter().print("操作成功");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}