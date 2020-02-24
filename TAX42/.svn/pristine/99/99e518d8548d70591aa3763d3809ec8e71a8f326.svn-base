package com.soft.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.soft.service.ComplainService;

/**
 * 投诉信息控制类
 * 
 * @author admin
 *
 */
@Controller
@RequestMapping("/complain")
public class ComplainController {
	@Autowired
	ComplainService complainService;

	@RequestMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map,HttpSession session) {
		// 获取当前时间
		Date date = new Date(System.currentTimeMillis());
		// 将当前时间按指定的格式转化并添加到数据库中
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		map.put("comp_time", time);
		Map<String, Object> user_map= (Map<String, Object>) session.getAttribute("user_map");
		//获取当前登录的用户信息，插入到投诉信息表 中
		map.put("comp_company",user_map.get("dept"));
		map.put("comp_name", user_map.get("name"));
		map.put("comp_mobile", user_map.get("mobile"));
		// 判断前台传递过来的参数---是否匿名
		if ("1".equals(map.get("is_NM"))) {
			map.put("is_NM", 1);
		} else if ("0".equals(map.get("is_NM"))) {
			map.put("is_NM", 0);
		}

		boolean b = complainService.insert(map);
		if (b) {
			return "redirect:/home/home.jsp";
		}
		return null;
	}

	@RequestMapping("/update")
	public String update(@RequestParam Map<String, Object> map) {
		boolean b = complainService.update(map);
		if (b) {
		}
		return null;
	}

	@RequestMapping("/delete")
	public String delete(Integer id) {
		boolean b = complainService.delete(id);
		if (b) {
		}
		return null;
	}

	/***
	 * 查询所有投诉记录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/selectAll")
	public String selectAll(HttpServletRequest request) {
		// 分页
		PageHelper.startPage(1, 10);
		// 注意这句话必须写在上面这句话下面//此时，list集合中就已经做过分页
		List<Map<String, Object>> list = complainService.selectAll();
		// 通过pageInfo类拿到分页的具体信息
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list);
		request.getSession().setAttribute("complain_list", pageInfo.getList());// 投诉信息列表
		request.getSession().setAttribute("complain_list_curPage", pageInfo.getPageNum());// 当前页码
		request.getSession().setAttribute("complain_list_prePage", pageInfo.getPrePage());// 上一页
		request.getSession().setAttribute("complain_list_nextPage", pageInfo.getNextPage());// 下一页
		request.getSession().setAttribute("complain_list_totalPage", pageInfo.getPages());// 总页数
		request.getSession().setAttribute("complain_list_totalRecord", pageInfo.getTotal());// 总记录条数
		return "redirect:/tax/complain/listUI.jsp";
	}

	/**
	 * 根据id查询单条投诉信息，以及投诉回复信息
	 * 
	 * @param comp_id
	 * @param request
	 * @return
	 */
	@RequestMapping("/selectSingle")
	public String selectSingle(Integer comp_id,String isDeal, HttpServletRequest request) {
		// 连接查询
		List<Map<String, Object>> list = complainService.selectSingle(comp_id);
		Map<String, Object> map = list.get(0);
		request.getSession().setAttribute("singleComplain_list", list.get(0));
		request.getSession().setAttribute("singleComplain_isDeal", isDeal);
		return "redirect:/tax/complain/dealUI.jsp";
	}
	
	@RequestMapping("/selectSingleForJson")
	public @ResponseBody Map<String, Object> selectSingleForJson(Integer comp_id){
		List<Map<String, Object>> list = complainService.selectSingle(comp_id);
		return list.get(0);
	}

	/**
	 * 根据条件查询投诉信息
	 * 
	 * @param map 查询条件
	 * @return 
	 * @return
	 */
	@RequestMapping("/selectByCondition")
	public @ResponseBody List<Map<String, Object>> selectByContion(@RequestParam Map<String, Object> map, HttpServletRequest request) {
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
		// 分页
		PageHelper.startPage(pageIndex, pageSize);
		List<Map<String, Object>> list = complainService.selectByCondition(map);
		
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list);
		
		//用于向前台传递分页相关数据
		Map<String, Object> mapPage=new HashMap<>();
		mapPage.put("currentPage", pageInfo.getPageNum());//当前页
		mapPage.put("totalPage", pageInfo.getPages());//总页数
		mapPage.put("totalRecord", pageInfo.getTotal());//总记录条数
		//将分页相关数据加入到list集合的第一条
		list.add(0,mapPage);
		return list;
	}
	
	@RequestMapping("/loadPerson")
	public @ResponseBody List<Map<String, Object>> loadPerson(@Param(value="dept") String dept){
		List<Map<String, Object>> list = complainService.loadPerson(dept);
		return list;
	} 
	
	@RequestMapping("/calc")
	public @ResponseBody List<Map<String, Object>> calc(){
		List<Map<String, Object>> list = complainService.calc();
		return list;
	}

}
