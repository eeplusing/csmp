package com.moutum.csmp.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.domain.Type;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : GoodTypeAction.java
 * @Description : 
 * @Author       : CaoPengpeng
 * @DateTime     : 2015年5月25日 下午8:19:49
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 * @param <T>
 ************************************************************************************/
@Controller @Scope("prototype")
public class GoodTypeAction extends BaseAction<Type>
{
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    HttpServletRequest request = ServletActionContext.getRequest();
 
    /**
     * 查询所有商品分类信息
     * @return
     */
	public String showList()
    {
    	
        List<Type>  typeList =  typeService.findAll();
       
        ActionContext.getContext().put("typeList", typeList);
        return "get_list"; 
    }
    
    /**
     * 添加商品分类
     */
    public void addType()
    {
        try
        {
            String typeName = request.getParameter("typeName");// 种类名称
            String remark = request.getParameter("remark");//描述
            String unit = request.getParameter("unit");//单位
            int parentId = Integer.parseInt(request.getParameter("parentId"));//父类ID
            int typeGrade = Integer.parseInt(request.getParameter("typeGrade"));//种类级别
            
            Type type = new Type();
            type.setTypeName(typeName);
            type.setRemark(remark);
            type.setParentId(parentId);
            type.setTypeGrade(typeGrade);
            type.setTypeUnit(unit);
        
            switch (typeService.saveType(type))
            {
                case 0:
                    getResponse().getWriter().write("种类名不可用");
                    break;

                case 1:
                    getResponse().getWriter().write("添加成功");
                    break;
            }
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
            try
            {
                getResponse().getWriter().write("添加失败");
            }
            catch (Exception e1)
            {
                e1.printStackTrace();
            }
        }
      
    }

    /********************************************************************************
     * 加载要修改的商品分类的信息
     * @return
     ********************************************************************************/
    public void upType()
    {
        try
        {
            Map<String, Object> map = new HashMap<String, Object>();
            int typeId = Integer.parseInt(request.getParameter("pid"));//种类ID
            Type type = typeService.getById(typeId);
            map.put("id", type.getTypeId());
            map.put("grade", type.getTypeGrade() - 1);
            List<Type> pts = typeService.getParentTypes(map);//获取父类集合
            StringBuffer json = new StringBuffer("{");
            json.append("typeId:\"" + type.getTypeId() + "\",");
            json.append("typeName:\"" + type.getTypeName() + "\",");
            json.append("remark:\"" + type.getRemark() + "\",");
            json.append("typeGrade:\"" + type.getTypeGrade() + "\",");
            json.append("parentId:\"" + type.getParentId() + "\",");
            json.append("typeUnit:\"" + type.getTypeUnit() + "\",");
            json.append("pts:[");
            for(int i = 0; i < pts.size(); i++)
            {
                Type pt = pts.get(i);
                json.append("{pid:\"" + pt.getTypeId() + "\",pname:\"" + pt.getTypeName() + "\"}");
                if(i < pts.size() - 1)
                {
                    json.append(",");
                }
            }
            json.append("]}");
            
            getResponse().getWriter().write(json.toString());
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /********************************************************************************
     *根据商品种类级别加载其上一级别种类列表
     ********************************************************************************/
    public void loadParent()
    {
        try
        {
            Map<String, Object> map = new HashMap<String, Object>();
            if(null != request.getParameter("tid"))
            {
                int typeId = Integer.parseInt(request.getParameter("tid"));//种类ID
                map.put("id", typeId);
            }
            int typeGrade = Integer.parseInt(request.getParameter("tg"));//种类级别
            
            map.put("grade", typeGrade - 1);
            List<Type> pts = typeService.getParentTypes(map);
            StringBuffer json = new StringBuffer("[");
            for(int i = 0; i < pts.size(); i++)
            {
                Type pt = pts.get(i);
                json.append("{pid:\"" + pt.getTypeId() + "\",pname:\"" + pt.getTypeName() + "\"}");
                if(i < pts.size() - 1)
                {
                    json.append(",");
                }
            }
            json.append("]");
            getResponse().getWriter().write(json.toString());
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
    }
    
    /********************************************************************************
     * 保存编辑后的商品分类信息
     ********************************************************************************/
    public void updateType()
    {
        try
        {
            int typeId = Integer.parseInt(request.getParameter("typeId"));//种类ID
            String typeName = request.getParameter("typeName");// 种类名称
            String remark = request.getParameter("remark");//描述
            String unit = request.getParameter("unit");//单位
            int parentId = Integer.parseInt(request.getParameter("parentId"));//父类ID
            int typeGrade = Integer.parseInt(request.getParameter("typeGrade"));//种类级别
            
            Type type = typeService.getById(typeId);
            type.setTypeName(typeName);
            type.setRemark(remark);
            type.setParentId(parentId);
            type.setTypeGrade(typeGrade);
            type.setTypeUnit(unit);
        
            switch (typeService.updateType(type))
            {
                case 0:
                    getResponse().getWriter().write("种类名不可用");
                    break;
                case 1:
                    getResponse().getWriter().write("保存成功");
                    break;
            }
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
            try
            {
                getResponse().getWriter().write("保存出错");
            }
            catch (Exception e2)
            {
                e2.printStackTrace();
            }
        }
    }
    
    /**
     * 删除商品分类
     */
    public void delType()
    {
        try
        {
            String[] typeIds = request.getParameter("typeIds").split(",");//种类ID数组
            Integer[] tids = new Integer[typeIds.length];
            for(int i = 0; i < typeIds.length; i++) 
            {
                tids[i] = Integer.parseInt(typeIds[i]);
            }
            typeService.delete(tids);
            getResponse().getWriter().write("删除成功");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /**
     * 根据父类加载子类
     */
    public void loadChildren()
    {
        try
        {
            Map<String, Object> map = new HashMap<String, Object>();
            int typeId = Integer.parseInt(request.getParameter("pid"));//种类ID
            map.put("pid", typeId);
            List<Type> cts = typeService.getParentTypes(map);
            StringBuffer json = new StringBuffer("[");
            for(int i = 0; i < cts.size(); i++)
            {
                Type ct = cts.get(i);
                json.append("{cid:\"" + ct.getTypeId() + "\",cname:\"" + ct.getTypeName() + "\"}");
                if(i < cts.size() - 1)
                {
                    json.append(",");
                }
            }
            json.append("]");
            getResponse().getWriter().write(json.toString());
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
 
}

