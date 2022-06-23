package com.spring.team_one.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.team_one.service.OneService;

// 테스트 컨트롤러
@Controller
public class OneController {
	private static final Logger logger = LoggerFactory.getLogger(OneController.class);
	
	// service 접근
	@Autowired
	OneService service;
	
	// 메인화면 접근
	@RequestMapping("main.one")
	public String main() {
		logger.info("[url : main.one]");
	
		return "MENU/main";
	}
	
	// 로그인 화면접근
	@RequestMapping("login.one")
	public String login() {
		logger.info("[url : login.one]");
		
		return "MENU/login";
	}
	// 로그아웃
	@RequestMapping("logout.one")
	public String logout(HttpServletRequest req) {
		logger.info("[url : logout.one]");
		
		// 세션해제
		req.getSession().invalidate();
		return "MENU/logout";
	}
	// 메인연결
	@RequestMapping("mainSub.one")
	public String mainSub(HttpServletRequest req) {
		logger.info("[url : mainSub.one]");
		
		return "MENU/mainSub";
	}
	// 회원추가 처리
	@RequestMapping("accountAdd.one")
	public String accountAdd(MultipartHttpServletRequest req, Model model) {
		logger.info("[url : accountAdd.one]");
		
		service.addAccount(req, model);
		
		return "MENU/main";
	}
}
