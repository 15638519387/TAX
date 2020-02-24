package com.soft.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.soft.entity.SurvyYm;
import com.soft.service.SurvyService;

@Controller
@RequestMapping("/survy")
public class Survy {
	
	@Autowired
	SurvyService survyService;
	
	
	@RequestMapping("/qhtcs")
	public String ss() {
		return "redirect:/tax/frame.jsp";
	}
	/**
	 * 添加调查
	 * @param map
	 * 乔洪涛
	 */
	@RequestMapping(value="/insert",method={RequestMethod.GET,RequestMethod.POST})
	public String tjSurvy(@RequestParam Map<String,Object> map) {
		//添加数据并返回id
		survyService.insertSurvy(map);
		map.get("ss_id");
		if("单选".equals(map.get("ss_type"))) {
			map.put("ss_type", "0");
		}else {
			map.put("ss_type", "0");
		}
		
		
		List<Map<String,Object>> list= new ArrayList<Map<String,Object>>();
		list.add(map);
		survyService.insertSurvy2(list);
			return "redirect:/survy/qs";
	}
	
	/**
	 * 查询调查信息(纳税服务)
	 * @param map
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/qs",method= {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> querySurvy(@RequestParam Map<String,Object> map) {
		
		int pageIndex,PageSize;
		//每页数据
		PageSize=2;
		//规定当前页数
		pageIndex= Integer.valueOf(map.get("pageIndex").toString());
		//进行分页
		PageHelper.startPage(pageIndex,PageSize);
		//查询
		List<Map<String, Object>> querySurvy = survyService.querySurvy(map);
		System.out.println(querySurvy);
		//将查询结果分页
		PageInfo<Map<String,Object>> info= new PageInfo<Map<String,Object>>(querySurvy);
		List<Map<String, Object>> list = info.getList();
		
		Map<String,Object> map2 =new HashMap<String,Object>();
		
		//查询的数据
		map2.put("list", list);
		//分页的信息
		map2.put("total", info.getTotal());
		map2.put("pageNum", info.getPageNum());
		map2.put("pages", info.getPages());
		return map2;
	}
	
	/**
	 * 修改调查是否生效
	 * @param ss_state
	 * @param ss_id
	 * @return
	 */
	@RequestMapping(value="/us",method={RequestMethod.GET,RequestMethod.POST})
	public String updateState( String ss_state,String ss_id) {
		System.out.println(ss_state);
		System.out.println(ss_id);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("ss_id", ss_id);
		map.put("ss_state", ss_state);
		int i = survyService.updateState(map);
		System.out.println(i);
		
		if(i!=0) {
			//修改成功跳查询方法
			return "redirect:/survy/qs";
		}else {
			//修改不成功跳原页面
			return "redirect:/tax/qsurvey/listUI.jsp";
		}
	}
	
	/**
	 * 删除数据
	 * @param ss_id
	 * 乔洪涛
	 */
	@RequestMapping(value="ds/{ss_id}",method= {RequestMethod.GET,RequestMethod.POST})
	public String deleteSurvy(@PathVariable String ss_id) {
		System.out.println(ss_id);
		int a = survyService.deleteSurvy(ss_id);
		int b = survyService.deleteSurvy2(ss_id);
		if(a!=0 && b!=0) {
			return "redirect:/survy/qs";
		}
		return "redirect:/tax/qsurvey/listUI.jsp";
	}
	
	/**
	 * 查询数据(工作主页)
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="sy",method= {RequestMethod.GET,RequestMethod.POST})
	public List<SurvyYm> querySy(){
		List<SurvyYm> sy = survyService.querySy();
		return sy;
	}
	
	/**
	 * 查询数据(用户填表)
	 * @param ss_id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="xx/{ss_id}",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView queryl(@PathVariable String ss_id,HttpServletRequest request) {
		//调用查询方法
		List<Map<String, Object>> querydc = survyService.querydc(ss_id);
		//获取querydc中key为ss_choice的值
		for(int i=0;i<querydc.size();i++) {
			String sc = (String) querydc.get(i).get("ss_choice");
			//切割字符串
			String[] ss_choices = sc.split(",");
			//将切割后的数组放进querydc集合中
			querydc.get(i).put("ss_choices", ss_choices);
		}
		ModelAndView mm=new ModelAndView("redirect:/home/questionSurvey.jsp");
		request.getSession().setAttribute("wjdc", querydc);
		return mm;
	}
	
	
	@RequestMapping(value="recore",method= {RequestMethod.GET,RequestMethod.POST})
	public String recore(@RequestParam Map<String,Object> map) {
		int record = survyService.insertRecord(map);
		if(record !=0 ) {
			return "redirect:/home/home.jsp";
		}
		return null;
	}
}
