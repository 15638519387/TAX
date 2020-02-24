package com.soft.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.soft.service.QuestionService;
import com.soft.service.SurveyService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/survey")
public class SurvyController {
	@Autowired
	SurveyService surveyService;
	@Autowired
	QuestionService questionService;
	
	
	@RequestMapping("/selectByCondition")
	public @ResponseBody List<Map<String, Object>> selectByCondition(@RequestParam Map<String, Object> map){
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
		List<Map<String, Object>> list = surveyService.selectByCondition(map);
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
	@RequestMapping("/updateState")
	public String UpdateState(Integer id,String state) {
		//state代表的是当前状态，需要取反
		if ("0".equals(state)) {
			state="1";
		}else {
			state="0";
		}
		boolean b = surveyService.updateState(id, state);
		if (b) {			
			return "redirect:/tax/qsurvey/listUI.jsp";
		}
		return null;
	}
	@RequestMapping("/delete")
	public String delete(Integer id) {
		boolean b = surveyService.delete(id);
		if (b) {			
			return "redirect:/tax/qsurvey/listUI.jsp";
		}
		return null;
	}
	
	@RequestMapping("/insert")
	public String insert(@RequestParam Map<String, Object> jsonData) {
		//把前台传递过来的json数据变为一个数组
		JSONArray array = JSONArray.fromObject(jsonData.get("txtJsonData"));
		
		//数组中的最后一个元素是调查表中的内容
		JSONObject survey = JSONObject.fromObject(array.get(array.size()-1));
		Map<String, Object> mapSurvey=new HashMap<>();
		mapSurvey.put("ss_title", survey.get("survey_title"));
		mapSurvey.put("ss_starttime", survey.get("survey_starttime"));
		mapSurvey.put("ss_endtime", survey.get("survey_endtime"));
		mapSurvey.put("ss_state", survey.get("survey_state"));
		mapSurvey.put("ss_dept", survey.get("survey_dept"));
		mapSurvey.put("ss_applyer", survey.get("survey_person"));
		mapSurvey.put("ss_applytime", survey.get("survey_time"));
		boolean b=surveyService.insert(mapSurvey);
		if (b) {		
			//获取到插入的调查信息id
			Integer ss_id =Integer.valueOf(mapSurvey.get("ss_id").toString());
			//用于存储该调查所对应的所有问题信息
			List<Map<String, Object>> list=new ArrayList<>();
			//获取所有的题目和答案
			for (int i = 0; i < array.size()-1; i++) {
				//用于存储单个问题信息
				Map<String, Object> mapQuestion=new HashMap<>();
				//数组中除最后一个元素外  都是问题信息
				JSONObject question = JSONObject.fromObject(array.get(i));
				mapQuestion.put("ss_id", ss_id);
				mapQuestion.put("ss_no", question.get("question_no"));
				mapQuestion.put("sq_title", question.get("question_title"));
				mapQuestion.put("ss_type", question.get("question_type"));
				mapQuestion.put("ss_choice", question.get("qustion_answer").toString());
				list.add(mapQuestion);
			}
			int result = questionService.insert(list);
			if (result>0) {
				return "redirect:/tax/qsurvey/listUI.jsp";
			}
			return null;
		}else {
			return null;			
		}
	}
	
	@RequestMapping("/edit")
	public String edit(Integer id,HttpSession session) {
		//查出来该id对应的服务调查信息
		Map<String, Object> singleSurvey = surveyService.selectSingleById(id);
		
		session.setAttribute("singleSurvey", singleSurvey);
		return "redirect:/tax/qsurvey/editUI.jsp";
	}
	
	@RequestMapping("/update")
	public String update(@RequestParam Map<String, Object> jsonData) {
		//把前台传递过来的json数据变为一个数组
		JSONArray array = JSONArray.fromObject(jsonData.get("txtJsonData"));
		
		//数组中的最后一个元素是调查表中的内容
		JSONObject survey = JSONObject.fromObject(array.get(array.size()-1));
		/*
		*一个取巧的方法。
		*首先获取到这个服务调查的id，删掉它，再重新添加一个服务调查
		**/
		Integer id = Integer.valueOf(survey.get("survey_id").toString());
		//删除该服务调查
		surveyService.delete(id);
		//然后流程就和添加一样了
		Map<String, Object> mapSurvey=new HashMap<>();
		mapSurvey.put("ss_title", survey.get("survey_title"));
		mapSurvey.put("ss_starttime", survey.get("survey_starttime"));
		mapSurvey.put("ss_endtime", survey.get("survey_endtime"));
		mapSurvey.put("ss_state", survey.get("survey_state"));
		mapSurvey.put("ss_dept", survey.get("survey_dept"));
		mapSurvey.put("ss_applyer", survey.get("survey_person"));
		mapSurvey.put("ss_applytime", survey.get("survey_time"));
		boolean b=surveyService.insert(mapSurvey);
		if (b) {		
			//获取到插入的调查信息id
			Integer ss_id =Integer.valueOf(mapSurvey.get("ss_id").toString());
			//用于存储该调查所对应的所有问题信息
			List<Map<String, Object>> list=new ArrayList<>();
			//获取所有的题目和答案
			for (int i = 0; i < array.size()-1; i++) {
				//用于存储单个问题信息
				Map<String, Object> mapQuestion=new HashMap<>();
				//数组中除最后一个元素外  都是问题信息
				JSONObject question = JSONObject.fromObject(array.get(i));
				mapQuestion.put("ss_id", ss_id);
				mapQuestion.put("ss_no", question.get("question_no"));
				mapQuestion.put("sq_title", question.get("question_title"));
				mapQuestion.put("ss_type", question.get("question_type"));
				mapQuestion.put("ss_choice", question.get("qustion_answer").toString());
				list.add(mapQuestion);
			}
			int result = questionService.insert(list);
			if (result>0) {
				return "redirect:/tax/qsurvey/listUI.jsp";
			}
			return null;
		}else {
			return null;			
		}
	}
	
	
	@RequestMapping("/selectQuestion")
	public @ResponseBody List<Map<String, Object>> selectQuestion(Integer id) {
		//该问卷调查中的所有的问题
		List<Map<String, Object>> list = questionService.selectQuestionBySSID(id);
	
		return list;
	}
}
