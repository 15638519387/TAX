package com.soft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.ComplainReplyDao;
import com.soft.service.ComplainReplyService;

@Service
public class ComplainReplyServiceImpl implements ComplainReplyService {
	@Autowired
	ComplainReplyDao complainreplydao;

	@Override
	public boolean insert(Map<String, Object> map) {
		return complainreplydao.insert(map) > 0;
	}

	@Override
	public boolean update(Map<String, Object> map) {
		return complainreplydao.update(map) > 0;
	}

	@Override
	public boolean delete(Integer id) {
		return complainreplydao.delete(id) > 0;
	}

	@Override
	public List<Map<String, Object>> selectAll() {
		return complainreplydao.selectAll();
	}

}
