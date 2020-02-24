package com.soft.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 开始时进入页面
 * 退出页面
 * @author admin
 *
 */
@Controller
public class Tax {

	//开始进入登陆
	@RequestMapping(value="/",method = {RequestMethod.GET,RequestMethod.POST})
	public String deng() {
		return "redirect:/loginUI.jsp";
	}
	
	//结束进入登陆,删除session
	@RequestMapping(value="/tui",method = {RequestMethod.GET,RequestMethod.POST})
	public String tui(HttpServletRequest request) {
		request.getSession().removeAttribute("logim_san");
		request.getSession().removeAttribute("role_user_id");
		request.getSession().removeAttribute("user_map");
		return "redirect:/loginUI.jsp";
	}
}
