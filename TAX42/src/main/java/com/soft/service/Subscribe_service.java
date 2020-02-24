package com.soft.service;

import java.util.List;
import java.util.Map;

public interface Subscribe_service {

	public List<Map<String, Object>> selectAll();

	public List<Map<String, Object>> selectByCondition(Map<String, Object> map);

	public boolean insert(Map<String, Object> map);
	
	public boolean updateState(Integer id, String state);
	
	public Map<String,Object> selectSingleById(Map<String, Object> map);
}
