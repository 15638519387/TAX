package com.soft.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.soft.service.RoleService;


/**
 * 角色管理
 * @author admin
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	RoleService roleService ;
	
	//进行角色的查询,模糊查询
	@ResponseBody
	@RequestMapping(value = "/listUI",method= {RequestMethod.GET,RequestMethod.POST})
	public Map<String , Object> listUI( Integer pageNum , String roleName,HttpServletRequest request,HttpServletResponse resp) throws Exception {
		//role的查询，进行分页
		int limit = 2 ;
		int offset = pageNum * limit - limit ; 
		PageHelper.offsetPage(offset, limit);
		//查询语句
	    Map<String , Object> map = new HashMap<>();
	    map.put("name",roleName );
		List<Map<String, Object>> roleList = roleService.roleList(map);
		PageInfo<Map<String , Object>> info = new PageInfo<Map<String , Object>>(roleList);
		List<Map<String, Object>> list = info.getList();
		
		Map<String , Object> maps = new HashMap<String ,Object>();
		//查询的数据
		maps.put("list",list);
		//总记录条数
        maps.put("total", info.getTotal());
        //当前页码
        maps.put("pageNum", info.getPageNum());
        //总页码
        maps.put("pages", info.getPages());
		return maps ;
	}
	

	//进行角色的添加
	@RequestMapping(value="/addUI",method = {RequestMethod.GET,RequestMethod.POST})
	public String addUI(@RequestParam Map<String ,Object> map , String privilegeIds) {
		//添加到role表
		Map<String , String> map2 = new HashMap<>();
		String name = (String)map.get("role.name");
		String state = (String)map.get("role.state");
		map2.put("name", name);
		map2.put("state", state);
		roleService.roleInsert(map2);
		
		
		//将privilegeIds进行分组
		String[] code = privilegeIds.split(",");
		//放入list
		List<String> list = new ArrayList<>();
		for(int i = 0 ; i<code.length ; i++) {
			list.add(code[i]);
		}
		//添加到role_privilege
		int id = roleService.roleIdquery(name);
		roleService.role_privilegeInsert(list, id);
		return "redirect:/tax/role/listUI.jsp";
	}
	
	
	//进行编辑角色前的传值
	@RequestMapping(value = "/edit/{key}",method = {RequestMethod.GET,RequestMethod.POST})
	public String edit(@PathVariable String key,HttpServletRequest request) {
		Integer id =Integer.valueOf(key);
		
		//查询用户，和用户的角色
		Map<String, Object> edit = roleService.edit(id);
		String obj = (String)edit.get("code");
	    String[] split = obj.split(",");
	    List<String> codeList = new ArrayList<>();
	    
	    for(int i = 0 ; i<split.length ; i++) {
	    	codeList.add(split[i]);
	    }
		request.getSession().setAttribute("edit", edit);
		request.getSession().setAttribute("codeList", codeList);
		return "redirect:/tax/role/editUI.jsp";
	}
	
	//保存编辑角色
	@RequestMapping(value = "/editUpdate" , method = {RequestMethod.GET , RequestMethod.POST})
	public String editUpdate(
			   @RequestParam(value="role.roleId")String roleId,
			   @RequestParam(value="role.name")String name ,
			   @RequestParam(value="role.state")String state ,
			   String privilegeIds ,HttpServletRequest request) {
		Integer id = Integer.valueOf(roleId);
		Map<String , String> map = new HashMap<>();
		map.put("name", name);
		map.put("state", state);
		roleService.roleUpDate(id, map);
		//传来的code
		String[] codearr = privilegeIds.split(",");
		List<String> list = new ArrayList<>();
		for(int i=0 ;i < codearr.length ; i++) {
			list.add(codearr[i]);
		}
		//原来的code
		List<String> codeList = (List<String>) request.getSession().getAttribute("codeList");
		
		//要删除的权限
		List<String> list1 = new ArrayList<>();
		//要添加的权限
		List<String> list2 = new ArrayList<>();
		
		//判断权限是否要删除
		if(codeList.containsAll(list)) {
			for(String code1 : codeList) {
					if(!list.contains(code1)) {
						if(!list1.contains(code1)) {
							list1.add(code1);
						}
					}
			   }
			if(list1.size()!=0) {
				roleService.role_privilegedel(id, list1);
			}
		}else if(list.containsAll(codeList)){
			for(String li : list) {
				if(!codeList.contains(li)) {
					if(!list2.contains(li)) {
						list2.add(li);
					}
				}
		   }
			roleService.role_privilegeInsert(list2, id);
		}
		return"redirect:/tax/role/listUI.jsp";
	}
	
	/**
	 * 删除单个
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/del/{role_id}" , method = {RequestMethod.GET,RequestMethod.POST})
	public String del(@PathVariable String role_id) {
		
		//单个删除
		Integer id = Integer.valueOf(role_id);
		roleService.role_pdel(id);
		roleService.del(id);
		return "redirect:/tax/role/listUI.jsp";
	}
	
	/**
	 * 删除多个
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delAll" , method = {RequestMethod.GET , RequestMethod.POST})
	public String delAll(String selectedRow) {
		
		//传来的id字符串，切割成数组
		String[] lists = selectedRow.split(",");
		List<Integer> list = new ArrayList<>();
		for(int i=0 ; i< lists.length ; i++) {
			list.add(Integer.valueOf(lists[i]));
		}
		roleService.role_pdels(list);
		roleService.dels(list);
		
		return "redirect:/tax/role/listUI.jsp";
	}
}
