package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.RegistDao;
import com.soft.service.RegistService;

/**
 * 登陆注册
 * @author admin
 *
 */
@Service
public class RegistServiceImpl implements RegistService {

	@Autowired
	RegistDao registDao;
	
	/**
	 * 登陆验证
	 * @return
	 */
	public Map<String , Object> userPass(String acc , String pass){
		return registDao.userPass(acc , pass);
	};
	
	/**
	 * 注册
	 * @param map
	 * @return
	 */
	public int userInsert(Map<String , Object> map ) {
		return registDao.userInsert(map);
	};
	
	/**
	 * 使用id查询角色
	 * @param id
	 * @return
	 */
	public List<Map<String , Object>> role_id( Integer id){
		return registDao.role_id(id);
	};
}
