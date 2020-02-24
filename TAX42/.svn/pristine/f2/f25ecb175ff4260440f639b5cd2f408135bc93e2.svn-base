package com.soft.controller;

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
import com.soft.entity.ConSy;
import com.soft.entity.Consult_r;
import com.soft.entity.Reply;
import com.soft.service.ConsultService;

@Controller
@RequestMapping("/consult")
public class Consult {

	@Autowired
	ConsultService consult;

	/**
	 * 添加咨询信息
	 * @param map
	 * 乔洪涛
	 */
	@RequestMapping(value = "/insert", method = { RequestMethod.GET, RequestMethod.POST })
	public String consult(@RequestParam Map<String, Object> map) {
		//添加数据返回一个记录数
		int i = consult.insertSonsult(map);
		if (i != 0) {
			//添加成功,跳转到工作主页
			return "redirect:/home/home.jsp";
		} else {
			//添加失败,跳转到当前页面
			return "redirect:/home/advisoryHome.jsp";
		}
	}

	/**
	 * 咨询信息查询 乔洪涛
	 */
	@ResponseBody
	@RequestMapping(value = "/query", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> query(@RequestParam Map<String, Object> map) {
		// 查询Info,并进行分页
		int pageIndex, pageSize;
		pageSize=4;
		pageIndex = Integer.valueOf(map.get("pageIndex").toString());
		PageHelper.startPage(pageIndex, pageSize);
		
		List<Map<String, Object>> qc = consult.queryConsult(map);
		PageInfo<Map<String , Object>> info = new PageInfo<Map<String , Object>>(qc);
		List<Map<String, Object>> list = info.getList();
		Map<String , Object> maps = new HashMap<String ,Object>();
		//查询的数据
		maps.put("list",list);
		//总记录条数
        maps.put("total", info.getTotal());
        
        //当前页码
        maps.put("pageNum", info.getPageNum());
        //总页码
        maps.put("pages", info.getPages());
		return maps;
	}

	/**
	 * 查询咨询人信息(回复页面) 乔洪涛
	 */
	@RequestMapping(value = "/queryid/{consult_id}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView query2(@PathVariable String consult_id) {
		//查询咨询信息
		Map<String, Object> queryConsultId = consult.queryConsultId(consult_id);
		ModelAndView Idquery = new ModelAndView("/tax/advisory/dealUI.jsp");
		//将查询结果放进ModelAndView中
		Idquery.addObject("con", queryConsultId);
		return Idquery;
	}

	/**
	 * 添加回复信息 修改咨询状态 乔洪涛
	 */
	@RequestMapping(value = "/iandu", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertHf(String reply_dept, String replyer, String reply_Content, String consult_id) {
		/* 添加回复信息 */
		Reply reply = new Reply();
		reply.setReply_dept(reply_dept);
		reply.setReplyer(replyer);
		reply.setReply_Content(reply_Content);
		reply.setConsult_id(consult_id);
		int iReply = consult.insertReply(reply);

		/* 修改咨询状态 */
		int uReply = consult.updateReply(consult_id);
		// 判断是否添加成功以及修改成功
		if (iReply != 0 && uReply != 0) {
			return "redirect:/tax/advisory/listUI.jsp";
		}
		return "redirect:/tax/advisory/dealUI.jsp";
	}

	/**
	 * 咨询信息(工作主页) 乔洪涛
	 */
	@ResponseBody
	@RequestMapping(value = "/myconsult", method = { RequestMethod.GET, RequestMethod.POST })
	public List<ConSy> glquery(@RequestParam Map<String,Object> map) {
		//查询所有咨询信息
		List<ConSy> list = consult.myconsult(map);
		return list;
	}

	/**
	 * 查询咨询信息(用户查看)
	 * 
	 * @param conid
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/querycr/{conid}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView query_cr(@PathVariable String conid, HttpServletRequest request) {
		//查询用户点击的咨询信息
		Consult_r conrep = consult.con_rep(conid);
		ModelAndView cr = new ModelAndView("redirect:/home/advisoryDetail.jsp");
		request.getSession().setAttribute("qht_cr", conrep);
		return cr;
	}
}
