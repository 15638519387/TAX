package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.InformationDao;
import com.soft.service.InformationService;

@Service
public class InformationServiceImpl implements InformationService {
	@Autowired
	InformationDao informationDao;

	@Override
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return informationDao.selectAll(map);
	}

	@Override
	public boolean insert(Map<String, Object> map) {
		return informationDao.insert(map) > 0;
	}

	@Override
	public boolean update(Map<String, Object> map) {
		return informationDao.update(map) > 0;
	}
	@Override
	public boolean deleteAll(String[] id) {
		int deleteResult = informationDao.deleteAll(id);
		if (deleteResult==id.length) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean delete(Integer id) {
		return informationDao.delete(id) > 0;
	}

	@Override
	public Map<String, Object> selectSingleById(Integer id) {
		return informationDao.selectSingleById(id);
	}

	@Override
	public boolean updateState(Integer id, String state) {
		return informationDao.updateState(id, state) > 0;
	}

}
