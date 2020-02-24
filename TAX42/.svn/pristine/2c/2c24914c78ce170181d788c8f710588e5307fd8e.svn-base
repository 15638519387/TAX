package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.ComplainDao;
import com.soft.service.ComplainService;
@Service
public class CompalinServiceImpl implements ComplainService{
	@Autowired
	ComplainDao complainDao;
	@Override
	public boolean insert(Map<String, Object> map) {
		return complainDao.insert(map)>0;
	}
	@Override
	public boolean update(Map<String, Object> map) {
		return complainDao.update(map)>0;
	}
	
	@Override
	public boolean updateState(Integer comp_id, String state) {
		return complainDao.updateState(comp_id,state)>0;
	}
	@Override
	public boolean delete(Integer id) {
		return complainDao.delete(id)>0;
	}
	@Override
	public List<Map<String, Object>> selectAll() {
		return complainDao.selectAll();
	}
	
	@Override
	public List<Map<String, Object>> selectSingle(Integer comp_id) {
		return complainDao.selectSingle(comp_id);
	}
	
	public List<Map<String, Object>> selectByCondition(Map<String, Object> map){
		return complainDao.selectByCondition(map);
	}
	@Override
	public List<Map<String, Object>> loadPerson(String dept) {
		return complainDao.loadPerson(dept);
	}
	@Override
	public List<Map<String, Object>> calc() {
		return complainDao.calc();
	}
	
	
}
