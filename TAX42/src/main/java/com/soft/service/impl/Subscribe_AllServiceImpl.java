package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.Subscribe_AllDao;
import com.soft.entity.Sub_Dept;
import com.soft.entity.Sub_matter;
import com.soft.service.Subscribe_AllService;

@Service
public class Subscribe_AllServiceImpl implements Subscribe_AllService {

	@Autowired
	Subscribe_AllDao subscribe_alldao;
	
	@Override
	public Map<String, Object> query(Map<String, Object> map) {
		return subscribe_alldao.query(map);
	}

	@Override
	public int add(Map<String, Object> map) {
		
		return subscribe_alldao.add(map);
	}

	@Override
	public int update(Map<String, Object> map) {
		return subscribe_alldao.update(map);
	}


	@Override
	public List<Sub_Dept> queryDept() {
		
		return subscribe_alldao.queryDept();
	}

	@Override
	public int addMatter(Map<String, Object> map) {
		
		return subscribe_alldao.addMatter(map);
	}

	@Override
	public int delAll(String id) {
		
		return subscribe_alldao.delAll(id);
	}

	@Override
	public int tq(Map<String, Object> map) {
		
		return subscribe_alldao.tq(map);
	}

	@Override
	public int updateMatter(Map<String, Object> map) {
		
		return subscribe_alldao.updateMatter(map);
	}

	@Override
	public List<Map<String, Object>> queryMatterByLike(Map<String, Object> map) {
		
		return subscribe_alldao.queryMatterByLike(map);
	}

	@Override
	public List<Map<String, Object>> queryMatterNo() {
		return subscribe_alldao.queryMatterNo();
	}

	@Override
	public int addSub_Service(Map<String, Object> map) {
		
		return subscribe_alldao.addSub_Service(map);
	}

	@Override
	public List<Map<String, Object>> queryShowMySub(Map<String, Object> map) {
		return subscribe_alldao.queryShowMySub(map);
	}

	@Override
	public Map<String, Object> queryMySubInfo(Map<String, Object> map) {
		
		return subscribe_alldao.queryMySubInfo(map);
	}

	@Override
	public List<Map<String, Object>> selectMatter_no() {
		
		return subscribe_alldao.selectMatter_no();
	}






}
