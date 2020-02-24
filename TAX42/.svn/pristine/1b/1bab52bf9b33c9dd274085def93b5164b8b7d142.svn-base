package com.soft.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.soft.dao.Subscribe_serviceDao;
import com.soft.entity.Sub_Dept;
import com.soft.service.Subscribe_AllService;

import net.sf.json.JSONArray;

/**
 * 预约服务相关的控制类
 * 
 * @author admin
 *
 */
@Controller
@RequestMapping("/Sub")
public class Sub_ServiceController {

	//注入对象
	@Autowired
	Subscribe_serviceDao subscribe_serviceDao;

	@Autowired
	Subscribe_AllService subscribe_allservice;
	
	/**
	 * 预约服务查询
	 * 
	 * @param request
	 * @param a
	 * @return
	 */
	@RequestMapping("/query")
	public ModelAndView query(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		ModelAndView modelAndView = new ModelAndView();
		int a=1;
		if(map.get("pag")!=null) {
			String s = String.valueOf(map.get("pag"));
			a=Integer.parseInt(s);
		}
		PageHelper.startPage(a,2);
		 
		
		List<Map<String, Object>> queryLike = subscribe_serviceDao.queryLike(map);
		
		PageInfo<Map<String, Object>> info = new PageInfo<>(queryLike);
		request.getSession().removeAttribute("sub_service");
		modelAndView.setViewName("redirect:/tax/reserve/listUI.jsp");
		
		
		
		request.getSession().setAttribute("sub_service", info.getList());//查询的数据
		request.getSession().setAttribute("sub_service_num", info.getPageNum());//当前页码
		request.getSession().setAttribute("sub_service_for", info.getPrePage());//上一页
		request.getSession().setAttribute("sub_service_nex", info.getNextPage());//下一页
		request.getSession().setAttribute("sub_service_nums", info.getPages());//总页数
		request.getSession().setAttribute("sub_service_reds", info.getTotal());//总记录数
		
		return modelAndView;
	}
	
	//***************************************************************************************************************************
	/**
	 * 模糊查询预约事项
	 * 
	 * @param map
	 * @return 
	 * @return
	 */
	@RequestMapping(value = "/queryMatterByLike", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<Map<String, Object>> queryMatterByLike(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		// 页码和页面显示条数
		int pageIndex, pageSize;
		if (map.get("pageIndex") == null || "".equals(map.get("pageIndex"))) {
			pageIndex = 1;
		} else {
			pageIndex = Integer.valueOf(map.get("pageIndex").toString());
		}
		if (map.get("pageSize") == null || "".equals(map.get("pageSize"))) {
			pageSize = 2;
		} else {
			pageSize = Integer.valueOf(map.get("pageSize").toString());
		}
		
		PageHelper.startPage(pageIndex,pageSize);
		List<Map<String, Object>> list = subscribe_allservice.queryMatterByLike(map);
		PageInfo<Map<String, Object>> info = new PageInfo<>(list); 
		
		Map<String,Object> mapPage=new HashMap<>();
		mapPage.put("currentPage", info.getPageNum());
		mapPage.put("totalPage", info.getPages());
		mapPage.put("totalRecord", info.getTotal());
		
		
		list.add(0,mapPage);
		return list;
	}
	

	/**
	 * 处理预约查询
	 * 
	 * @param request
	 * @param map
	 * @return
	 */

	@RequestMapping("/queryAll")
	public ModelAndView queryAll(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		ModelAndView modelAndView = new ModelAndView();
		Map<String, Object> query = subscribe_allservice.query(map);
		
		query.put("bian", map.get("no"));
		modelAndView.setViewName("redirect:/tax/reserve/dealUI.jsp");
		request.getSession().setAttribute("sub_all", query);
	

	return modelAndView;
	}

	/**
	 * 保存处理预约
	 * 
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/save")
	public ModelAndView save(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		ModelAndView modelAndView = new ModelAndView();
		subscribe_allservice.add(map);
		 subscribe_allservice.update(map);
		List<Map<String, Object>> queryLike = subscribe_serviceDao.queryLike(map);

		modelAndView.setViewName("redirect:/tax/reserve/listUI.jsp");
		request.getSession().setAttribute("sub_service", queryLike);
		return modelAndView;
	}

	/**
	 * 查询用户部门和姓名
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryDept/{a}")
	public ModelAndView queryDept(HttpServletRequest request, @PathVariable String a, @RequestParam String id) {
		ModelAndView modelAndView = new ModelAndView();
		List<Sub_Dept> dept = subscribe_allservice.queryDept();
		request.getSession().setAttribute("sub_user", dept);
		if ("1".equals(a)) {// 1是新增
			modelAndView.setViewName("redirect:/tax/reserveItem/addUI.jsp");
		} else if ("0".equals(a)) {// 0是编辑
			request.getSession().setAttribute("sub_needId", id);
			modelAndView.setViewName("redirect:/tax/reserveItem/editUI.jsp");
		}
		return modelAndView;

	}

	/**
	 * 用户部门改变，刷新用户姓名
	 * 
	 * @param request
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping("/changeDept")
	public void changeDept(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		@SuppressWarnings("unchecked")
		List<Sub_Dept> list = (List<Sub_Dept>) request.getSession().getAttribute("sub_user");
		List<Sub_Dept> list1 = new ArrayList<>();
		String val = request.getParameter("val");
		if (val.equals("部门A")) {
			for (Sub_Dept s : list) {
				if (s.getDept().equals("部门A")) {
					list1.add(s);
				}
			}
		} else {
			for (Sub_Dept s : list) {
				if (s.getDept().equals("部门B")) {
					list1.add(s);
				}
			}
		}
		JSONArray jsonArray1 = JSONArray.fromObject(list1);
		resp.setCharacterEncoding("gbk");
		resp.setContentType("text/json");
		resp.getWriter().write(jsonArray1.toString());

	}

	/**
	 * 添加预约事项
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/addMatter", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addMatter(@RequestParam Map<String, Object> map) {
		ModelAndView modelAndView = new ModelAndView();
		subscribe_allservice.addMatter(map);
		modelAndView.setViewName("redirect:/tax/reserveItem/listUI.jsp");
		return modelAndView;

	}

	/**
	 * 修改预约事项
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/updateMatter", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateMatter(@RequestParam Map<String, Object> map) {
		ModelAndView modelAndView = new ModelAndView();
		 subscribe_allservice.updateMatter(map);

		modelAndView.setViewName("redirect:/tax/reserveItem/listUI.jsp");
		return modelAndView;

	}

	/**
	 * 删除预约事项
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/delAll", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView delAll(@RequestParam String quan) {
		ModelAndView modelAndView = new ModelAndView();

		String[] split = quan.split(";");
		for (int i = 0; i < split.length; i++) {
			subscribe_allservice.delAll(split[i]);
		}

		modelAndView.setViewName("redirect:/tax/reserveItem/listUI.jsp");
		return modelAndView;

	}

	/**
	 * 停用/启用预约事项
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/tq", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView tq(@RequestParam Map<String, Object> map) {
		ModelAndView modelAndView = new ModelAndView();

		subscribe_allservice.tq(map);
		modelAndView.setViewName("redirect:/tax/reserveItem/listUI.jsp");
		return modelAndView;

	}



	/**
	 * 查询预约事项编号
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("/queryNumber/{a}")
	public void queryNumber(HttpServletRequest request, HttpServletResponse resp, @PathVariable String a)
			throws Exception {

		List<Map<String, Object>> no = subscribe_allservice.queryMatterNo();
		request.getSession().setAttribute("sub_matterno", no);
		List<String> list1 = new ArrayList<>();
		if ("0".equals(a)) {
			JSONArray jsonArray1 = JSONArray.fromObject(no);
			resp.setCharacterEncoding("gbk");
			resp.setContentType("text/json");
			resp.getWriter().write(jsonArray1.toString());
		}
		for (int i = 0; i < no.size(); i++) {
			if ((no.get(i).get("matter_no")).equals(a)) {
				list1.add((String) (no.get(i).get("matter_name")));
				JSONArray jsonArray1 = JSONArray.fromObject(list1);
				resp.setCharacterEncoding("gbk");
				resp.setContentType("text/json");
				resp.getWriter().write(jsonArray1.toString());
			}
		}

	}

	/**
	 * 添加用户预约
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/addSub_Service", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addSub_Service(@RequestParam Map<String, Object> map) {
		ModelAndView modelAndView = new ModelAndView();
	 subscribe_allservice.addSub_Service(map);
		modelAndView.setViewName("redirect:/home/home.jsp");

		return modelAndView;

	}

	/**
	 * 用户主页展示自己的预约
	 * 
	 * @param request
	 * @param resp
	 * @param map
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/queryShowMySub", method = { RequestMethod.GET, RequestMethod.POST })
	public void queryShowMySub(HttpServletRequest request, HttpServletResponse resp,
			@RequestParam Map<String, Object> map) throws Exception {
		List<Map<String, Object>> mySub = subscribe_allservice.queryShowMySub(map);
		for (int i = 0; i < mySub.size(); i++) {
			String string= String.valueOf(mySub.get(i).get("sub_time"));
			mySub.get(i).put("sub_time", string.replace(".0", ""));
		}
		request.getSession().setAttribute("My_Sub", mySub);
		
		JSONArray jsonArray1 = JSONArray.fromObject(mySub);
		resp.setCharacterEncoding("gbk");
		resp.setContentType("text/json");
		resp.getWriter().write(jsonArray1.toString());
		
		
		
	}
//******************************************
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
		List<Map<String, Object>> list  = subscribe_serviceDao.queryLike(map);
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
	
/**
 * 	查询主页我的预约的信息
 * @param request
 * @param map
 * @return
 */
	@RequestMapping(value = "/queryMySubInfo", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView queryMySubInfo(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		Map<String, Object> mySubInfo = subscribe_allservice.queryMySubInfo(map);
		request.getSession().setAttribute("fuzhu", map.get("bh"));
		request.getSession().setAttribute("mySubInfo", mySubInfo);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/home/reserveDetail.jsp");
		return modelAndView;
	}
	
	@RequestMapping("/selectMatter_no")
public @ResponseBody List<Map<String, Object>> selectMatter_no(){
	List<Map<String, Object>> list = subscribe_allservice.selectMatter_no();
	return list;

}
	


}
