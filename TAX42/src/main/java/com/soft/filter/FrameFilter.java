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
 * 后台权限管理
 * @author admin
 *
 */
public class FrameFilter implements Filter{

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)arg0;
		HttpServletResponse resp =(HttpServletResponse)arg1; 
		//是否有纳税服务
		String role_user_id = (String)req.getSession().getAttribute("role_user_id");
		//登陆的用户信息
		Object attribute = req.getSession().getAttribute("user_map");
		
		//判断是否登陆
		if(attribute != null) {
			//判断是否有权限
			if("纳税服务".equals(role_user_id)) {
				arg2.doFilter(arg0, arg1);
			}else {
				System.out.println("无权限");
				resp.sendRedirect("/TAX4/home/home.jsp");
			}
		}else {
			resp.sendRedirect("/TAX4/loginUI.jsp");
		}
		
		
	}

}
