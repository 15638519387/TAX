package com.soft.service;

import java.util.List;
import java.util.Map;

import com.soft.entity.ConSy;
import com.soft.entity.Consult2;
import com.soft.entity.Consult_r;
import com.soft.entity.Reply;

public interface ConsultService {
	/**
	 * 我要咨询(插入数据)
	 * @param map
	 * @return
	 */
	public int insertSonsult(Map<String,Object> map);
	
	/**
	 * 咨询管理(查询数据)
	 * @return
	 */
	public List<Map<String,Object>> queryConsult(Map<String,Object> map);
	
	/**
	 * 咨询管理咨询人信息查询
	 * @param id
	 * @return
	 */
	public Map<String,Object> queryConsultId(String id);
	
	/**
	 * 添加咨询回复信息
	 * @param list
	 * 乔洪涛
	 */
	public int insertReply(Reply reply);
	
	/**
	 * 修改咨询状态
	 * @param id
	 * 乔洪涛
	 */
	public int updateReply(String id);
	
	/**
	 * 查询咨询信息(首页)
	 * @param map
	 * 乔洪涛
	 */
	public List<ConSy> myconsult(Map<String,Object> map);
	
	/**
	 * 查看咨询信息(咨询人查看)
	 * 乔洪涛
	 */
	public Consult_r con_rep(String id);
}
