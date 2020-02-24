package com.soft.controller;


import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.soft.service.RegistService;

/**
 * 注册登陆
 * @author admin
 *
 */
@Controller
@RequestMapping(value="/deng")
public class RegistController {

	@Autowired
	RegistService registService ;
	
	/**
	 * 注册
	 * @param headImg
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/regist", method = {RequestMethod.GET,RequestMethod.POST})
	public String regist(MultipartFile headImg, @RequestParam Map<String, Object> user ,HttpServletRequest request) throws Exception {
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
		
		if("true".equals(user.get("user.gender"))) {
			user.put("gender",1);
		}else {
			user.put("gender",0);
		}
		user.put("headImg","../images/"+head);
		
		registService.userInsert(user);
		
	    return "redirect:/loginUI.jsp";
	}
	
	/**
	 * 登陆验证
	 * @return
	 */
	@RequestMapping(value="/login" , method= {RequestMethod.GET,RequestMethod.POST})
	public String login(@RequestParam(value="user.account") String acc
			, @RequestParam(value="user.password")String pass ,HttpServletRequest request) {
		//账号密码是否为空
		if(acc!=null&&!"".equals(acc)&&pass!=null&&!"".equals(pass)) {
			Map<String, Object> userPass = registService.userPass(acc, pass);
			//返回值是否为空
			if(userPass!=null) {
				String state = (String)userPass.get("state");
				if("1".equals(state)) {
						//设置全局Session，过滤器判断
						request.getSession().setAttribute("user_map",userPass );
						request.getSession().removeAttribute("logim_san");
						
						String user_id = userPass.get("id").toString();
						Integer id = Integer.valueOf(user_id);
						//进行设置权限
						if(id!=null) {
							List<Map<String , Object>> role =  registService.role_id(id);
							for(Map<String , Object> map :role) {
								String code = (String)map.get("code");
								if("纳税服务".equals(code)) {
									request.getSession().setAttribute("role_user_id", code);
								}
							}
						}
						return "redirect:/home/home.jsp";
					}else {
						int logim_san = 3 ;
						request.getSession().setAttribute("logim_san",logim_san);
						return "redirect:/loginUI.jsp";
					}
				//如果为空返回页面
			}else {
				int logim_san = 1 ;
				request.getSession().setAttribute("logim_san",logim_san);
				return "redirect:/loginUI.jsp";
			}
			//如果为空返回页面
		}else {
			int logim_san = 2 ;
			request.getSession().setAttribute("logim_san",logim_san);
			return "redirect:/loginUI.jsp";
		}
	}
	
	@RequestMapping(value="/lo" , method= {RequestMethod.GET,RequestMethod.POST})
	public String lo(HttpServletRequest request) {
		request.getSession().removeAttribute("logim_san");
	    return "redirect:/registUI.jsp";
	}
}
