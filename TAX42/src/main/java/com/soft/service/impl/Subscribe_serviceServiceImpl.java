package com.soft.service.impl;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft.dao.Subscribe_serviceDao;
import com.soft.entity.Sub_service;
import com.soft.service.Subscribe_serviceService;

@Service
public class Subscribe_serviceServiceImpl implements Subscribe_serviceService {

	@Autowired
	Subscribe_serviceDao ssd;
	


	@Override
	public int add() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> queryLike(Map<String, Object> map) {
		
		return ssd.queryLike(map);
	}

	@Override
	public List<Sub_service> queryShi(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}



}
