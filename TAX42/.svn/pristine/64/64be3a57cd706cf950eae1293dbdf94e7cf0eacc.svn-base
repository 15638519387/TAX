package com.soft.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * 用户管理
 * @author admin
 *
 */
public interface UserDao {

	/**
	 * 模糊查询用户 ，查询用户
	 * @return
	 */
	public List<Map<String , Object>> userList(@Param(value = "name") String name);
	
	/**
	 * 使用id进行查用户
	 * @param arr
	 * @return
	 */
	public List<Map<String , Object>> idList(@Param(value="arr")Integer[] arr);
	/**
	 * 查询单个用户全部数据
	 * @return
	 */
	public Map<String , Object> queryList(Integer id);
	
	/**
	 * 使用id 查询用户
	 * @param id
	 * @return
	 */
	public Map<String , Object> userUp(Integer id);
	
	/**
	 * 查询角色的名字
	 * @return
	 */
	public List<Map<String , Object>> roleName();
	
	/**
	 * 修改用户
	 * @param map
	 * @return
	 */
	public int editUser(@Param("map")Map<String , Object> map , @Param("id")Integer id);
	
	/**
	 * 修改用户角色
	 * @param map
	 * @return
	 */
	public int editRole(Integer role_id , 	Integer id);
	
	/**
	 * 添加用户
	 * @param map
	 * @return
	 */
	public int addUser(Map<String , Object> map);
	
	/**
	 * 导入添加用户
	 * @param map
	 * @return
	 */
	public int addUsers(List<Map<String , Object>> list);
	
	/**
	 * 添加用户角色
	 * @param map
	 * @return
	 */
	public int addRole(Integer id , Integer role_id);
	
	/**
	 * 使用账号查询用户id值
	 * @param id
	 * @return
	 */
	public int userId(String account);
	
	/**
	 * 删除用户
	 * @param id
	 * @param ids
	 * @return
	 */
	public int delUser(Integer id , Integer[] ids);
	
	/**
	 * 删除用户角色
	 * @param id
	 * @param ids
	 * @return
	 */
	public int delUserRole(Integer id , Integer[] ids);
}
