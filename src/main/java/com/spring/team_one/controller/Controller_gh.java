package com.spring.team_one.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.team_one.service.GHServiceImpl;

@Controller
public class Controller_gh {
	private static final Logger logger = LoggerFactory.getLogger(Controller_gh.class);
	
	@Autowired
	GHServiceImpl service;
	
	// 마이페이지
	@RequestMapping("myPage.gh")
	public String myPage() {
		logger.info("[url : myPage.gh]");

		return "MYPAGE/myPage";
	}
	
	// 내 정보 조회
	@RequestMapping("my_info.gh")
	public String my_info(HttpServletRequest req, Model model) {
		logger.info("[url : my_info.gh]");
		
		service.myInfo_detail(req, model);

		return "MYPAGE/my_info";
	}
	
	// 내 정보 수정화면
	@RequestMapping("update_info.gh")
	public String update_info(HttpServletRequest req, Model model) {
		logger.info("[url : update_info.gh]");
		
		service.myInfo_detail(req, model);

		return "MYPAGE/my_info_update";
	}
	
	// 내 정보 수정처리
	@RequestMapping("update_info_action.gh")
	public String update_info_action(MultipartHttpServletRequest req, Model model) {
		logger.info("[url : update_info_action.gh]");
		
		service.update_info(req, model);

		return "MYPAGE/update_info_action";
	}
	
	// 비밀번호 변경페이지 - 비밀번호확인
	@RequestMapping("pw_update.gh")
	public String pw_update(HttpServletRequest req, Model model) {
		logger.info("[url : pw_update.gh]");

		return "MYPAGE/pw_update";
	}
	
	// 비밀번호 변경페이지 - 비밀번호확인요청
	@RequestMapping("pw_update_chk.gh")
	public String pw_update_chk(HttpServletRequest req, Model model) {
		logger.info("[url : pw_update_chk.gh]");
		
		service.pw_update_chk(req, model);

		return "MYPAGE/pw_update_chk";
	}
	
	// 비밀번호 변경페이지
	@RequestMapping("pw_update2.gh")
	public String pw_update2(HttpServletRequest req, Model model) {
		logger.info("[url : pw_update2.gh]");

		return "MYPAGE/pw_update2";
	}
	
	// 비밀번호 변경페이지 - 비밀번호확인요청
	@RequestMapping("pw_update_action.gh")
	public String pw_update_action(HttpServletRequest req, Model model) {
		logger.info("[url : pw_update_action.gh]");
		
		service.pw_update_action(req, model);

		return "MYPAGE/pw_update_action";
	}
	
	// 급여목록
	@RequestMapping("my_salary_list.gh")
	public String my_salary_list(HttpServletRequest req, Model model) {
		logger.info("[url : my_salary_list.gh]");
		
		service.my_salary_list(req,model);

		return "MYPAGE/my_salary_list";
	}
	
	// 급여상세
	@RequestMapping("my_salary_detail.gh")
	public String my_salary_detail(HttpServletRequest req, Model model) {
		logger.info("[url : my_salary_detail.gh]");
		
		service.my_salary_detail(req,model);

		return "MYPAGE/my_salary_detail";
	}
	
	// 비용요청
	@RequestMapping("cost_request.gh")
	public String cost_request(HttpServletRequest req, Model model) {
		logger.info("[url : cost_request.gh]");

		return "MYPAGE/cost_request";
	}
	
	// 급여관련비용요청
	@RequestMapping("salary_cost_request.gh")
	public String salary_cost_request(HttpServletRequest req, Model model) {
		logger.info("[url : salary_cost_request.gh]");

		return "MYPAGE/salary_cost_request";
	}
		
	// 회계관련비용요청
	@RequestMapping("account_cost_request.gh")
	public String account_cost_request(HttpServletRequest req, Model model) {
		logger.info("[url : account_cost_request.gh]");

		return "MYPAGE/account_cost_request";
	}

	// 급여관련비용요청
	@RequestMapping("salary_cost_request_action.gh")
	public String salary_cost_request_action(HttpServletRequest req, Model model) {
		logger.info("[url : salary_cost_request_action.gh]");

		service.salary_request(req, model);
		
		return "MYPAGE/salary_cost_request_action";
	}

	// 회계관련비용요청
	@RequestMapping("account_cost_request_action.gh")
	public String account_cost_request_action(HttpServletRequest req, Model model) {
		logger.info("[url : account_cost_request_action.gh]");

		service.cost_request(req, model);
		return "MYPAGE/account_cost_request_action";
	}
	
	// 요청목록
	@RequestMapping("my_request_list.gh")
	public String my_request_list(HttpServletRequest req, Model model) {
		logger.info("[url : my_request_list.gh]");

		service.request_list(req, model);
		
		return "MYPAGE/my_request_list";
	}

}
