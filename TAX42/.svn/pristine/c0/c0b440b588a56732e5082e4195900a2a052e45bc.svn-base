package com.soft.service;

import java.util.List;
import java.util.Map;

import com.soft.entity.SurvyYm;


public interface SurvyService {

	/**
	 * 添加问卷调查
	 * 乔洪涛
	 */
	public int insertSurvy(Map<String,Object> map);
	
	/**
	 * 添加问卷调查(题目)
	 * @param list
	 * 乔洪涛
	 */
	public int insertSurvy2(List<Map<String,Object>> list);
	
	/**
	 * 查询问卷调查信息
	 * @return
	 */
	public List<Map<String,Object>> querySurvy(Map<String,Object> map);
	
	
	/**
	 * 修改是否有效
	 * @param state
	 * @return
	 */
	public int updateState(Map<String,Object> map);
	
	/**
	 * 删除子表数据
	 * @param id
	 * @return
	 */
	public int deleteSurvy(String id);
	
	/**
	 * 删除主表数据
	 * @param id
	 * @return
	 */
	public int deleteSurvy2(String id);
	
	/**
	 * 查询数据(工作主页)
	 * @return
	 */
	public List<SurvyYm> querySy();
	
	/**
	 * 问卷调查
	 * @param id
	 * @return
	 */
	public List<Map<String,Object>> querydc(String id);
	
	/**
	 * 添加调查信息(用户添加)
	 * @param map
	 * @return
	 */
	public int insertRecord(Map<String,Object> map);
}
