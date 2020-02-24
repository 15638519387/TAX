package com.soft.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.soft.service.UserService;
import com.soft.util.ExcelUtil;

/**
 * 用户管理控制层
 * @author admin
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService ;
	
	/**
	 * 进行查询用户并传到页面
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/listUI",method= {RequestMethod.GET,RequestMethod.POST})
	public Map<String , Object> listUI(Integer pageNum , String userName ,HttpServletRequest request) {
		//查询所有角色
		List<Map<String, Object>> roleName = userService.roleName();
		request.getSession().setAttribute("roleName",roleName);
		//进行分页
		int limit = 10;
		int offset = pageNum * limit - limit ;
		PageHelper.offsetPage(offset, limit);
		//查询用户信息
		List<Map<String, Object>> userList = null;
		if(userName != null && !"".equals(userName)) {
			userList=userService.userList(userName);
		}else {
			userList=userService.userList(null);
		}
		PageInfo<Map<String, Object>> info = new PageInfo<Map<String , Object>>(userList);
		
		
		Map<String , Object> maps  = new HashMap<String , Object>();
		maps.put("list", info.getList());
		//总记录条数
		maps.put("total", info.getTotal());
		//当前页码
		maps.put("pageNum",info.getPageNum());
		//总页码
		maps.put("pages", info.getPages());
		return maps;
	}
	
	/**
	 * 编辑用户前的传值
	 * @param k
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/editUI/{k}",method = {RequestMethod.GET,RequestMethod.POST})
	public String editUI(@PathVariable String k , HttpServletRequest request) {
		Integer id = Integer.valueOf(k);
		//有传来的id查询用户加角色信息
		Map<String, Object> queryList = userService.queryList(id);
		if(queryList!=null) {
			request.getSession().setAttribute("user_queryList", queryList);
			
			//如果为空则查询用户
		}else if(queryList==null){
			request.getSession().setAttribute("user_queryList",userService.userUp(id) );
		}
		//跳转编辑页面
		return "redirect:/tax/user/editUI.jsp";
	}
	/**
	 * 更新用户信息
	 * @param file
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/editInsert" , method = {RequestMethod.GET,RequestMethod.POST})
	public String editInsert(MultipartFile headImg, @RequestParam Map<String, Object> user  ,HttpServletRequest request) throws Exception{
		// 上传到服务器
		//	 获得项目和路径
		String filePath = request.getServletContext().getRealPath("/images/");
		// 创建文件对象
	    File fi = new File(filePath);
		if (!fi.exists() && !fi.isDirectory()) {
			fi.mkdirs();
			}
		Map<String , Object> map = new HashMap<>();
		String heads = headImg.getOriginalFilename();
		
		//判断图片是否修改
		if(heads==null||"".equals(heads)) {
			map.put("headImg",null);
		}else {
			String head = UUID.randomUUID()+headImg.getOriginalFilename();
			headImg.transferTo(new File(filePath + head));
			map.put("headImg","../images/"+head);
		}
		map.put("account",user.get("user.account"));
		map.put("birthday",user.get("user.birthday"));
		map.put("name",user.get("user.name"));
		map.put("dept",user.get("user.dept"));
		map.put("password",user.get("user.password"));
		map.put("email",user.get("user.email"));
		map.put("mobile",user.get("user.mobile"));
		map.put("memo",user.get("user.memo"));
		map.put("state",user.get("user.state"));
		
		//将男女改为1，0
		if("true".equals(user.get("user.gender"))) {
			map.put("gender",1);
		}else {
			map.put("gender",0);
		}
		//修改用户
		Integer id = Integer.valueOf((String)user.get("user.id"));
		userService.editUser(map,id);
		
		//修改用户角色
		Integer role_id = Integer.valueOf((String)user.get("userRoleIds"));
		
		int i = userService.editRole(role_id, id);
		if(i==0) {
			userService.addRole(id , role_id);
		}
		//添加完成跳转用户管理页面
		return "redirect:/tax/user/listUI.jsp";
	}
	
	/**
	 * home更新用户
	 * @param headImg
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edithome" , method = {RequestMethod.GET,RequestMethod.POST})
	public String edit(MultipartFile headImg, @RequestParam Map<String, Object> user  ,HttpServletRequest request) throws Exception{
		// 上传到服务器
		//	 获得项目和路径
		String filePath = request.getServletContext().getRealPath("/images/");
		// 创建文件对象
	    File fi = new File(filePath);
		if (!fi.exists() && !fi.isDirectory()) {
			fi.mkdirs();
			}
		Map<String , Object> map = new HashMap<>();
		
		String heads = headImg.getOriginalFilename();
		if(heads==null||"".equals(heads)) {
			map.put("headImg",null);
		}else {
			String head = UUID.randomUUID()+headImg.getOriginalFilename();
			headImg.transferTo(new File(filePath + head));
			map.put("headImg","../images/"+head);
		}
		map.put("account",user.get("user.account"));
		map.put("birthday",user.get("user.birthday"));
		map.put("name",user.get("user.name"));
		map.put("dept",user.get("user.dept"));
		map.put("password",user.get("user.password"));
		map.put("email",user.get("user.email"));
		map.put("mobile",user.get("user.mobile"));
		map.put("memo",user.get("user.memo"));
		
		if("true".equals(user.get("user.gender"))) {
			map.put("gender",1);
		}else {
			map.put("gender",0);
		}
		//修改用户
		Integer id = Integer.valueOf((String)user.get("user.id"));
		userService.editUser(map,id);
		
		//更新页面上的数据
		request.getSession().setAttribute("user_map",userService.userUp(id) );
		//添加完成跳转用户管理页面
		return "redirect:/home/home.jsp";
	}
	/**
	 * 添加用户
	 * @param file
	 * @param user
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/addUI" , method = {RequestMethod.GET,RequestMethod.POST})
	public String addUI(MultipartFile headImg ,@RequestParam Map<String , Object> user ,HttpServletRequest request) throws Exception {
		// 上传到服务器
		//	 获得项目和路径
		String filePath = request.getServletContext().getRealPath("/images/");
		// 创建文件对象
	    File fi = new File(filePath);
		if (!fi.exists() && !fi.isDirectory()) {
			fi.mkdirs();
			}
	    String head = UUID.randomUUID()+headImg.getOriginalFilename();
		headImg.transferTo(new File(filePath + head));
	    Map<String , Object> map = new HashMap<>();
		map.put("account",user.get("user.account"));
		map.put("birthday",user.get("user.birthday"));
		map.put("name",user.get("user.name"));
		map.put("dept",user.get("user.dept"));
		map.put("password",user.get("user.password"));
		map.put("email",user.get("user.email"));
		map.put("mobile",user.get("user.mobile"));
		map.put("memo",user.get("user.memo"));
		map.put("state",user.get("user.state"));
		map.put("headImg","../images/"+head);
		
		if("true".equals(user.get("user.gender"))) {
			map.put("gender",1);
		}else {
			map.put("gender",0);
		}
		userService.addUser(map);
		//角色id
		
		Integer role_id = Integer.valueOf((String)user.get("userRoleIds"));
		String account = (String)map.get("account") ;
		int id = userService.userId(account);
		userService.addRole(id , role_id);
		
		return "redirect:/tax/user/listUI.jsp";
	}
	
	
	/**
	 *删除单个用户 
	 * @param key
	 * @return
	 */
	@RequestMapping(value="/del/{id}" , method = {RequestMethod.GET,RequestMethod.POST})
	public String del(@PathVariable Integer id) {
		userService.delUserRole(id, null);
		userService.delUser(id, null);
		return "redirect:/tax/user/listUI.jsp";
	}
	
	/**
	 *删除多个用户 
	 * @param key
	 * @return
	 */
	@RequestMapping(value="/dels" , method = {RequestMethod.GET,RequestMethod.POST})
	public String dels(Integer[] selectedRow) {
		userService.delUserRole(null, selectedRow);
		userService.delUser(null,selectedRow );
		return "redirect:/tax/user/listUI.jsp";
	}
	/**
	 * 导出
	 * @param selectedRow
	 */
	@RequestMapping(value="/export", method = {RequestMethod.GET,RequestMethod.POST})
	public void export(Integer[] selectedRow ,HttpServletResponse reponse) {
		try {
			List<Map<String , Object>> dataList =null ;
			
			//是否选择一部分导出，如果不选择全部导出
			if(selectedRow!=null) {
				dataList = userService.idList(selectedRow);
			}else {
				dataList = userService.idList(null);
			}
			//规定格式，文件名
			String suffix = ".xlsx" ;
			String sheetname = "user" ; 
			Workbook book = ExcelUtil.createExcel(suffix, sheetname, dataList);
			ServletOutputStream out = reponse.getOutputStream();
			reponse.setHeader("content-disposition","attachment;filename=user"+suffix);
			book.write(out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导入
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/import",method = {RequestMethod.GET,RequestMethod.POST})
	public  boolean imports(@RequestParam(value="userExcel")MultipartFile file) throws Exception {
		String fileName = file.getOriginalFilename();
		String suffix = fileName.substring(fileName.lastIndexOf("."));
		
		//传入IO流
		List<Map<String, Object>> list = ExcelUtil.redExcel(suffix, file.getInputStream());
		
		//将String 转为Integer
		for(Map<String , Object> map : list )  {
			if ("1".equals(map.get("gender"))) {
				map.put("gender", 1);
			}else {
				map.put("gender", 0);
			}
		}
		//判断是否成功
		if(list != null) {
			int users = userService.addUsers(list);
			if(users != 0) {
				return true ;
			}
		}
		return false ;
	}
	
	/**
	 * 验证账号是否存在
	 * @param acc
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/acc",method = {RequestMethod.GET,RequestMethod.POST})
	public boolean acc(String acc) {
		if(acc!=null && !"".equals(acc)) {
			int id = userService.userId(acc);
			if(id==0) {
				return true ;
			}
		}
		return false ;
	}
}
