package com.soft.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.soft.service.InformationService;


@Controller
@RequestMapping("/info")
public class InformationController {
	@Autowired
	InformationService service;
	@RequestMapping("/select")
	public @ResponseBody List<Map<String, Object>> select(@RequestParam Map<String, Object> map) {
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
		List<Map<String, Object>> list = service.selectAll(map);
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
	@RequestMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map,HttpServletResponse response) throws Exception {
		//添加Info信息
		boolean b = service.insert(map);
		if (b) {
			//添加成功，转发到list页面
			return "redirect:/tax/info/listUI.html";
		}else {
			//添加失败
			response.getWriter().write("添加失败");
		}
		return null;
	}
	@RequestMapping("/selectSingleById")
	public String selectSingleById(Integer id,HttpSession session) {
		Map<String, Object> info = service.selectSingleById(id);
		session.setAttribute("singleInfo", info);
		return "redirect:/tax/info/editUI.jsp";
	}
	@RequestMapping("/selectSingleForJson")
	public @ResponseBody Map<String, Object> selectSingleForJson(Integer info_id){
		Map<String, Object> info = service.selectSingleById(info_id);
		return info;
	}
	
	@RequestMapping("/update")
	public String update(@RequestParam Map<String, Object> map) {
		if (service.update(map)) {			
			return "redirect:/tax/info/listUI.html";
		}else {
			return null;
		}
	}
	@RequestMapping("/updateState")
	public void updateState(Integer id,String state,HttpServletResponse response) throws IOException {
		if ("0".equals(state)) {
			state="1";
		}else {
			state="0";
		}
		if (service.updateState(id, state)) {
			//修改状态成功
			response.getWriter().write("1");
		}else {
			//修改状态失败
			response.getWriter().write("0");
		}
	}
	@RequestMapping("/delete")
	public String delete(Integer id) {
		if (service.delete(id)) {
			return "redirect:/tax/info/listUI.html";
		}else {
			return null;
		}
	}

	/**
	 * 批量删除
	 */
	@RequestMapping("/deleteAll")
	public String deleteAll(String ids) {
		String[] id = ids.split(",");
		boolean b = service.deleteAll(id);
		if (b) {
			return "redirect:/tax/info/listUI.html";
		}else {
			return null;
		}
	}
}
