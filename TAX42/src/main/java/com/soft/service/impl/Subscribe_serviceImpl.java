package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.Subscribe_Dao;
import com.soft.service.Subscribe_service;

@Service
public class Subscribe_serviceImpl implements Subscribe_service {

	@Autowired
	Subscribe_Dao serviceDao;

	@Override
	public List<Map<String, Object>> selectAll() {
		return serviceDao.selectAll();
	}

	@Override
	public List<Map<String, Object>> selectByCondition(Map<String, Object> map) {
		return serviceDao.selectByCondition(map);
	}

	@Override
	public boolean insert(Map<String, Object> map) {
		return serviceDao.insert(map) > 0;
	}

	public boolean updateState(Integer id, String state) {
		return serviceDao.updateState(id, state) > 0;
	}

	@Override
	public Map<String, Object> selectSingleById(Map<String, Object> map) {
		return serviceDao.selectSingleById(map);
	}

}
