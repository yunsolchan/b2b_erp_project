package com.spring.team_one.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

// 로그인 실패시 작동 
public class UserLoginFailureHandler implements AuthenticationFailureHandler {

	   @Autowired
	   SqlSessionTemplate sqlSession;
	   
	   @Autowired
	   BCryptPasswordEncoder passwordEncoder;   // 비밀번호 암호화 클래스
	   
	   public UserLoginFailureHandler(SqlSessionTemplate sqlSession, BCryptPasswordEncoder passwordEncoder) {
	      this.sqlSession = sqlSession;
	      this.passwordEncoder = passwordEncoder;
	   }
	   
	   // 로그인이 실패할 경우 자동으로 실행하는 코드
	   @Override
	   public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
	         AuthenticationException exception) throws IOException, ServletException {

	      System.out.println("<<< UserLoginFailureHandler - onAuthenticationFailure 진입 >>>");
	      
	      String strId = request.getParameter("id");
	      String strPwd = request.getParameter("pw");
	      
	      int cnt = sqlSession.selectOne("com.spring.team_one.dao.OneDao.idCheck", strId);
	      if(cnt != 0) {
	         // 암호화된 비밀번호 가져오기
	         String encryptPassword = sqlSession.selectOne("com.spring.team_one.dao.OneDao.pwdCheck", strId);
	         System.out.println("암호화된 비밀번호 : " + encryptPassword);
	         System.out.println("화면에서 입력받은 비밀번호 : " + strPwd);
            request.setAttribute("msg", "일치하지 않는 비밀번호네요!");
	      } else {
	         System.out.println("<<< 아이디 불일치 >>>");
	         request.setAttribute("msg", "일치하지 않는 아이디네요!");
	      }
	      RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/MENU/login.jsp");
	      dispatcher.forward(request, response);
	   }
}
