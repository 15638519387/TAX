package com.soft.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登陆拦截
 * @author admin
 *
 */
public class LoginFileter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)arg0;
		HttpServletResponse resp =(HttpServletResponse)arg1;
		
		//登陆的用户信息
		Object attribute = req.getSession().getAttribute("user_map");
		//已登陆放行
		if(attribute != null) {
			arg2.doFilter(arg0, arg1);
			
			//没登录拦截，不放行
		}else {
			resp.sendRedirect("/TAX4/loginUI.jsp");
		}
	}
}
