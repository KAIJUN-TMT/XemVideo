package com.j4.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.j4.entity.User;
@WebFilter({"/admin/*","/yeu-thich/*","/doi-mat-khau","/cap-nhat-thong-tin"})
public class AuthFilter implements HttpFilter{

	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		//kiểm tra
		String uriString =request.getRequestURI();
		
		//B1 kiem tra xác thực(đăng nhâp)
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/dang-nhap");
			return;
		}
		//kiem tra vai trò
		
		if (uriString.contains("admin") && !user.getAdmin()) {
			response.sendRedirect(request.getContextPath() + "/error?code=404");
			return;
		}
		chain.doFilter(request, response);
	}

}
