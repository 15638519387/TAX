package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.SurvyDao;
import com.soft.entity.SurvyYm;
import com.soft.service.SurvyService;

@Service
public class SurvyServiceImpl implements SurvyService{

	@Autowired
	SurvyDao Survydao;
	
	/**
	 * 添加问卷调查
	 * 乔洪涛
	 */
	@Override
	public int insertSurvy(Map<String,Object> map) {
		return Survydao.insertSurvy(map);
	}

	/**
	 * 添加问卷调查(题目)
	 * 乔洪涛
	 */
	@Override
	public int insertSurvy2(List<Map<String,Object>> list) {
		return Survydao.insertSurvy2(list);
	}

	/**
	 * 查询问卷调查信息
	 */
	@Override
	public List<Map<String, Object>> querySurvy(Map<String,Object> map) {
		return Survydao.querySurvy(map);
	}

	/**
	 * 修改是否有效
	 */
	@Override
	public int updateState(Map<String,Object> map) {
		return Survydao.updateState(map);
	}

	/**
	 * 删除子表数据
	 */
	@Override
	public int deleteSurvy(String id) {
		return Survydao.deleteSurvy(id);
	}

	@Override
	public int deleteSurvy2(String id) {
		return Survydao.deleteSurvy2(id);
	}

	@Override
	public List<SurvyYm> querySy() {
		return Survydao.querySy();
	}

	@Override
	public List<Map<String, Object>> querydc(String id) {
		return Survydao.querydc(id);
	}

	/**
	 * 添加调查信息(用户添加)
	 */
	@Override
	public int insertRecord(Map<String, Object> map) {
		return Survydao.insertRecord(map);
	}

}
