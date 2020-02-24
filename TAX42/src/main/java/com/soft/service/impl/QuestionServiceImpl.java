package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.QuestionDao;
import com.soft.service.QuestionService;
@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	QuestionDao questionDao;
	
	@Override
	public int insert(List<Map<String, Object>> list) {
		return questionDao.insert(list);
	}

	@Override
	public List<Map<String, Object>> selectQuestionBySSID(Integer id) {
		return questionDao.selectQuestionBySSID(id);
	}

}
