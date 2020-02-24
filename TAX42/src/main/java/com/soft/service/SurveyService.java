package com.soft.service;

import java.util.List;
import java.util.Map;

public interface SurveyService {
	public List<Map<String, Object>> selectByCondition(Map<String, Object> map);
	
	public boolean updateState(Integer id,String state);

	public boolean delete(Integer id);
	
	public boolean insert(Map<String, Object> map);
	
	public Map<String, Object> selectSingleById(Integer id);
}
