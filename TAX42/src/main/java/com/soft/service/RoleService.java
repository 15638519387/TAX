package com.soft.service;

import java.util.List;
import java.util.Map;

/**
 * 角色管理
 * @author admin
 *
 */
public interface RoleService {

	/**
	 * 角色的全查询，角色模糊查询
	 */
	public List<Map<String, Object>> roleList(Map<String , Object>map);
	
	/**
	 * role表的增加
	 */
	public int roleInsert(Map<String ,String> map);

	
	/**
	 * role_privilege表的增加
	 */
	public int role_privilegeInsert(List<String> list,int id);
	
	/**
	 * role表的查询id
	 */
	public int roleIdquery(String name);
	
	/**
	 *角色单个查询 
	 */
	public Map<String , Object> edit(int id );
	
	/**
	 * role修改
	 * @param id
	 * @return
	 */
	public int roleUpDate(Integer id,Map<String , String> map);
	
	/**
	 * 删除role_privilege中的部分权限
	 */
	public int role_privilegedel(Integer id ,List<String> list);
	
	/**
	 * 删除role_privilege中的单的角色的权限
	 * @param id
	 * @return
	 */
	public int role_pdel(Integer id);
	
	/**
	 * 删除role_privilege中的多个角色权限
	 * @param list
	 * @return
	 */
	public int role_pdels(List<Integer> list);
	
	/**
	 * 删除单个role
	 * @param id
	 * @return
	 */
	public int del(Integer id);
	
	/**
	 * 删除多个role
	 * @param list
	 * @return
	 */
	public int dels(List<Integer> list);

}
