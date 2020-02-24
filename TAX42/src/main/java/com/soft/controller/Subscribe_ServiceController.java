package com.soft.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.soft.service.Subscribe_service;

@Controller
@RequestMapping("/service")
public class Subscribe_ServiceController {
	@Autowired
	Subscribe_service serviceService;
	
	@RequestMapping("/selectByCondition")
	public @ResponseBody List<Map<String, Object>> selectAll(@RequestParam Map<String, Object> map){
		// 页码和页面显示条数
		int pageIndex, pageSize;
		if (map.get("pageIndex") == null || "".equals(map.get("pageIndex"))) {
			pageIndex = 1;
		} else {
			pageIndex = Integer.valueOf(map.get("pageIndex").toString());
		}
		if (map.get("pageSize") == null || "".equals(map.get("pageSize"))) {
			pageSize = 10;
		} else {
			pageSize = Integer.valueOf(map.get("pageSize").toString());
		}
		//查询Info,并进行分页
		PageHelper.startPage(pageIndex,pageSize);
		List<Map<String, Object>> list = serviceService.selectByCondition(map);
		PageInfo<Map<String, Object>> pageInfo=new PageInfo<>(list);
		//用于向前台传递分页相关数据
		Map<String, Object> mapPage = new HashMap<>();
		mapPage.put("currentPage", pageInfo.getPageNum());// 当前页码
		mapPage.put("totalPage", pageInfo.getPages());// 总页数
		mapPage.put("totalRecord", pageInfo.getTotal());// 总记录条数
		// 将分页相关数据加入到list集合的第一条
		list.add(0, mapPage);
		return list;
	}
	@RequestMapping("/deal")
	public String selectSingleById(@RequestParam Map<String, Object> map,HttpSession session) {
		//处理预约事项，连接查询
		Map<String, Object> map1 = serviceService.selectSingleById(map);
		session.setAttribute("singleService", map1);
		return "redirect:/tax/reserve/dealUI.jsp";
	}
	
	@RequestMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map){
		if (serviceService.insert(map)) {
			return "redirect:/tax/reserve/listUI.html";
		}
		return null;
	}
}
