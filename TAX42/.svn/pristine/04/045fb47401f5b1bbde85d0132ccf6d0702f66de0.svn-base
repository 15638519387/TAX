package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.RoleDao;
import com.soft.service.RoleService;

/**
 * 角色管理
 * @author admin
 *
 */
@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	RoleDao roleDao ;

	/**
	 * role表的全查询，角色模糊查询
	 */
	@Override
	public List<Map<String, Object>> roleList(Map<String , Object> map) {
		return roleDao.roleList(map);
	}

	/**
	 * role表的全添加
	 */
	@Override
	public int roleInsert(Map<String, String> map) {
		try {
			return roleDao.roleInsert(map);
		} catch (Exception e) {
			System.err.println("添加失败");
			return 0;
		}
	}

	/**
	 * role_privilege表的全添加
	 */
	@Override
	public int role_privilegeInsert(List<String> list,int  id) {
		try {
			return roleDao.role_privilegeInsert(list,id);
		} catch (Exception e) {
			System.err.println("添加失败");
			return 0;
		}
	}

	/**
	 * role表使用name查询id
	 */
	@Override
	public int roleIdquery(String name) {
		return roleDao.roleIdquery(name);
	}

	/**
	 *角色单个查询 
	 */
	@Override
	public Map<String, Object> edit(int id) {
		return roleDao.edit(id);
	}

	/**
	 * 修改role的数据
	 */
	@Override
	public int roleUpDate(Integer id, Map<String, String> map) {
		return roleDao.roleUpDate(id, map);
	}

	/**
	 * 删除role_privilege中的部分权限
	 */
	@Override
	public int role_privilegedel(Integer id, List<String> list) {
		return roleDao.role_privilegedel(id, list);
	}

	
	/**
	 * 删除role_privilege中的单的角色的权限
	 * @param id
	 * @return
	 */
	public int role_pdel(Integer id) {
		return roleDao.role_pdel(id);
	};
	
	/**
	 * 删除role_privilege中的多个角色权限
	 * @param list
	 * @return
	 */
	public int role_pdels(List<Integer> list) {
		return roleDao.role_pdels(list);
	};
	
	/**
	 * 删除单个role
	 * @param id
	 * @return
	 */
	public int del(Integer id) {
		return roleDao.del(id);
	};
	
	/**
	 * 删除多个role
	 * @param list
	 * @return
	 */
	public int dels(List<Integer> list) {
		return roleDao.dels(list);
	};
	
}
