package com.moutum.csmp.action;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.domain.Grade;
import com.moutum.csmp.domain.Group;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.dto.GroupDto;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : GroupAction.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月28日 下午5:20:18
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class GroupAction extends BaseAction<Group>
{

    /********************************************************************************
     * 
     ********************************************************************************/
    private static final long serialVersionUID = -7609524493547354140L;

	public String list()
    {
//        Map<Group,Map<Group,Map<Group,List<User>>>> groupMap = new HashMap<Group,Map<Group,Map<Group,List<User>>>>();
        Map<Group,Map<GroupDto,Map<Group,List<User>>>> groupMap = groupService.getGroupMap();
        List<User> noGroupUsers = userService.getNoGroupUsers();
        List<Group> noPraentGroup = groupService.getNoParentGroup();
        ActionContext.getContext().put("groupMap", groupMap);
        ActionContext.getContext().put("noGroupUsers", noGroupUsers);
        ActionContext.getContext().put("noPraentGroup", noPraentGroup);
        return "list";
    }
    
    public void getAllGrade()
    {
        List<Grade> grades = gradeService.findAll();
        String result = "";
        for(Grade grade : grades)
        {
            result += grade.getGradeId() + "," + grade.getGradeName() + ";";
        }
        try
        {
            getResponse().getWriter().write(result);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void updateUser()
    {
        try
        {
            int userId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("userId"))[0]);
            int gradeId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("gradeId"))[0]);
            User user = userService.getById(userId);
            Grade grade = gradeService.getById(gradeId);
            user.setGrade(grade);
            userService.update(user);
            getResponse().getWriter().write("操作成功");
        }
        catch(Exception e)
        {
            e.printStackTrace();
            try
            {
                getResponse().getWriter().write("操作失败");
            }
            catch (IOException e1)
            {
                e1.printStackTrace();
            }
        }
    }
    
    public void getGroupGrade()
    {
        List<Grade> grades = gradeService.findGroupGrade();
        String result = "";
        for(Grade grade : grades)
        {
            result += grade.getGradeId() + "," + grade.getGradeName() + ";";
        }
        try
        {
            getResponse().getWriter().write(result);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void getLeader()
    {
        try
        {
            int gradeId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("gradeId"))[0]);
            Grade grade = gradeService.getById(gradeId);
            List<User> users = userService.findLeader(grade.getGradeNum() - 1);
            String result = "";
            for(User user : users)
            {
                result += user.getUserId() + "," + user.getUserName() + ";";
            }
            getResponse().getWriter().write(result);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void save()
    {
        try
        {
            int gradeId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("gradeId"))[0]);
            int groupLeader = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("groupLeader"))[0]);
            String groupName = ((String[])ActionContext.getContext().getParameters().get("groupName"))[0];
            Group group = new Group();
            Grade grade = gradeService.getById(gradeId);
            if(grade.getGradeNum() == 2)//如果新增二类群组，则将自动将其加入“系统平台”群组下
            {
                group.setFgroupId(1);//ID为1的群组为系统唯一的一类群组即“系统平台”群组
            }
            group.setGroupGrade(gradeId);
            group.setGroupLeader(groupLeader);
            group.setGroupName(groupName);
            groupService.save(group);
            User user = userService.getById(groupLeader);
            user.setGroup(group);
            userService.update(user);
            getResponse().getWriter().write("操作成功");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            try
            {
                getResponse().getWriter().write("操作失败");
            }
            catch (IOException e1)
            {
                e1.printStackTrace();
            }
        }
    }
    
    public void getGroupMem()
    {
        try
        {
            int groupId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("groupId"))[0]);
            List<User> users = userService.getByGroup(groupId);
            String result = "";
            for(User user : users)
            {
                if(null == user.getGroup())
                {
                    result += user.getUserId() + "," + user.getUserName() + "," + "0;";
                }
                else
                {
                    result += user.getUserId() + "," + user.getUserName() + "," + "1;";
                }
            }
            getResponse().getWriter().write(result);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public void modifyGroupMem()
    {
        try
        {
            int groupId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("groupId"))[0]);
            String userIds = ((String[])ActionContext.getContext().getParameters().get("userIds"))[0];
            String[] uids = null;
            Integer[] ids = null;
            if(!userIds.isEmpty())
            {
                uids = userIds.split(",");
                ids = new Integer[uids.length];
                for(int i = 0; i < uids.length; i++)
                {
                    ids[i] = Integer.parseInt(uids[i]);
                }
            }
            List<User> users = userService.getByIds(ids);
            Group group = groupService.getById(groupId);
            User user = userService.getById(group.getGroupLeader());
            Set<User> set = new HashSet(users);
            set.add(user);
            group.setUsers(set);
            groupService.update(group);
            getResponse().getWriter().write("操作成功");
        }
        catch (Exception e)
        {
            try
            {
                getResponse().getWriter().write("操作失败");
            }
            catch (IOException e1)
            {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }
    }
    
    public void getSecondGroupMem()
    {
        try
        {
            int groupId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("cgroupId"))[0]);
            List<Group> groups = groupService.getGroupParent(groupId);
            String result = "";
            for(Group group : groups)
            {
                if(group.getFgroupId() == groupId)
                {
                    result += group.getGroupId() + "," + group.getGroupName() + "," + "1;";
                }
                else
                {
                    result += group.getGroupId() + "," + group.getGroupName() + "," + "0;";
                }
            }
            getResponse().getWriter().write(result);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void modifySecondGroupMem()
    {
        try
        {
            int cgroupId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("cgroupId"))[0]);
            String gids = ((String[])ActionContext.getContext().getParameters().get("groupIds"))[0];
            String[] groupIds = null;
            Integer[] ids = null;
            if(!gids.isEmpty())
            {
                groupIds = gids.split(",");
                ids = new Integer[groupIds.length];
                for(int i = 0; i < groupIds.length; i++)
                {
                    ids[i] = Integer.parseInt(groupIds[i]);
                }
            }
            if(groupService.modifySecondGroup(cgroupId, ids))
            {
                getResponse().getWriter().write("操作成功");
            }
            else
            {
                getResponse().getWriter().write("操作失败");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}