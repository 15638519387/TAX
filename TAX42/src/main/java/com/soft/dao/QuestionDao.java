package com.soft.dao;

import java.util.List;
import java.util.Map;

public interface QuestionDao {
	public int insert(List<Map<String, Object>> list);
	
	public List<Map<String, Object>> selectQuestionBySSID(Integer id);
}
