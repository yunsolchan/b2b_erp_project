package com.spring.team_one.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

// 접근 권한이 없는 경우 작동
// 로그인 제한시,
public class UserDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
				AccessDeniedException accessDeniedException) throws IOException, ServletException {
		System.out.println("denied 접근");
		request.setAttribute("errMsg", "security 제한~~~ deniedHandler");
	   
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/MENU/accessDenied.jsp");
		dispatcher.forward(request, response);
	}
}