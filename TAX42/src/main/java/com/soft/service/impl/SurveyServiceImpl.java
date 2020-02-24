package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.SurveyDao;
import com.soft.service.SurveyService;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	SurveyDao surveyDao;
	@Override
	public List<Map<String, Object>> selectByCondition(Map<String, Object> map) {
		return surveyDao.selectByCondition(map);
	}
	@Override
	public boolean updateState(Integer id, String state) {
		return surveyDao.updateState(id, state)>0;
	}
	@Override
	public boolean delete(Integer id) {
		return surveyDao.delete(id)>0;
	}
	@Override
	public boolean insert(Map<String, Object> map) {
		return surveyDao.insert(map)>0;
	}
	@Override
	public Map<String, Object> selectSingleById(Integer id) {
		return surveyDao.selectSingleById(id);
	}

}
