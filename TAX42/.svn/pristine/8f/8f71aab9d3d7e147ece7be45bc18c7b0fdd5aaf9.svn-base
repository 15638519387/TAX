package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.UserDao;
import com.soft.service.UserService;

/**
 * 用户管理
 * @author admin
 *
 */
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;

	/**
	 * 模糊查询用户，查询用户
	 * @return
	 */
	public List<Map<String , Object>> userList(String name){
		return userDao.userList(name);
	};
	
	/**
	 * 使用id进行查用户
	 * @param arr
	 * @return
	 */
	public List<Map<String , Object>> idList(Integer[] arr){
		return userDao.idList(arr);
	};
	/**
	 * 查询单用户全部数据
	 */
	@Override
	public Map<String , Object> queryList(Integer id){
		return userDao.queryList(id);
	}
	
	/**
	 * 使用id 查询用户
	 * @param id
	 * @return
	 */
	public Map<String , Object> userUp(Integer id){
		return userDao.userUp(id);
	};

	/**
	 * 查询全部角色名字
	 */
	@Override
	public List<Map<String, Object>> roleName() {
		return userDao.roleName();
	}
	
	/**
	 * 修改用户
	 * @param map
	 * @return
	 */
	public int editUser(Map<String , Object> map , Integer id) {
		return userDao.editUser(map , id);
	};
	
	/**
	 * 修改用户角色
	 * @param map
	 * @return
	 */
	public int editRole(Integer role_id , Integer id) {
		return userDao.editRole(role_id , id);
	};
	
	/**
	 * 添加用户
	 * @param map
	 * @return
	 */
	public int addUser(Map<String , Object> map) {
		try {
			return userDao.addUser(map);
		} catch (Exception e) {
			System.err.println("添加失败");
			return 0;
		}
	};
	
	/**
	 * 导入添加用户
	 * @param map
	 * @return
	 */
	public int addUsers(List<Map<String , Object>> list) {
		try {
			return userDao.addUsers(list);
		} catch (Exception e) {
			System.err.println("添加失败");
			return 0;
		}
	};
	
	/**
	 * 添加用户角色
	 * @param map
	 * @return
	 */
	public int addRole(Integer id , Integer role_id) {
		try {
			return userDao.addRole(id , role_id);
		} catch (Exception e) {
			System.err.println("添加失败");
			return 0;
		}
	};
	
	/**
	 * 使用账号查询用户id值
	 * @param id
	 * @return
	 */
	public int userId(String account){
		try {
			return userDao.userId(account);
		} catch (Exception e) {
			return 0;
		}
	};
	
	/**
	 * 删除用户
	 * @param id
	 * @param ids
	 * @return
	 */
	public int delUser(Integer id , Integer[] ids) {
		return userDao.delUser(id, ids);
	};
	
	/**
	 * 删除用户角色
	 * @param id
	 * @param ids
	 * @return
	 */
	public int delUserRole(Integer id , Integer[] ids) {
		return userDao.delUserRole(id, ids);
	};

}
