package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.ConsultDao;
import com.soft.entity.ConSy;
import com.soft.entity.Consult2;
import com.soft.entity.Consult_r;
import com.soft.entity.Reply;
import com.soft.service.ConsultService;

@Service
public class ConsultServiceImpl implements ConsultService{

	@Autowired
	ConsultDao consultDao;
	
	/**
	 * 我要咨询(插入数据)
	 * 乔洪涛
	 */
	@Override
	public int insertSonsult(Map<String, Object> map) {
		int i = consultDao.insertSonsult(map);
		return i;
	}

	/**
	 * 咨询管理(查询数据)
	 * 乔洪涛
	 */
	@Override
	public List<Map<String, Object>> queryConsult(Map<String,Object> map) {
		List<Map<String, Object>> querylist = consultDao.queryConsult(map);
		return querylist;
	}

	/**
	 * 咨询管理咨询人信息查询
	 * 乔洪涛
	 */
	@Override
	public Map<String, Object> queryConsultId(String id) {
		Map<String,Object> queryConsultId = consultDao.queryConsultId(id);
		return queryConsultId;
	}

	/**
	 * 添加咨询回复信息
	 * 乔洪涛
	 */
	@Override
	public int insertReply(Reply reply) {
		int i = consultDao.insertReply(reply);
		return i;
	}

	/**
	 * 修改咨询状态
	 * 乔洪涛
	 */
	@Override
	public int updateReply(String id) {
		return consultDao.updateReply(id);
	}

	/**
	 * 查询咨询信息(首页)
	 * @param map
	 * 乔洪涛
	 */
	@Override
	public List<ConSy> myconsult(Map<String,Object> map) {
		return consultDao.myconsult(map);
	}

	/**
	 * 查看咨询信息(咨询人查看)
	 * 乔洪涛
	 */
	@Override
	public Consult_r con_rep(String id) {
		return consultDao.con_rep(id);
	}
	
}
