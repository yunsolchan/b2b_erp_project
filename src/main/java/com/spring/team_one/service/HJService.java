package com.spring.team_one.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface HJService {
	
	// 부서목록
	public void dept_list(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 부서상세
	public void dept_detail(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 부서추가
	public void dept_insert(HttpServletRequest req, Model model) 
			throws ServletException, IOException;

	// 인사카드목록
	public void emp_list(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 인사카드등록
	public void emp_insert(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 인사카드 - 사번정보 중복 체크
	public int employee_id_check(HttpServletRequest req, Model model);
	
	// 인사카드 - 계좌정보 중복 체크
	public int account_submit_check(HttpServletRequest req, Model model);
	
	// 인사카드부서
	public void emp_dept(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 인사카드직급
	public void emp_position(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 인사카드상세
	public void emp_detail(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 인사카드수정처리
	public void emp_update(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 근태조회
	public void attend_list(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 근태승인(휴가)
	public void attend_update(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 근태승인처리
	public void attend_update_action(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 급여목록
	public void salary_list(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 급여수정
	public void salary_update(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
   // 급여관련비용 요청목록 
   public void salary_request_list(HttpServletRequest req, Model model) 
         throws ServletException, IOException;

   // 급여요청승인
   public void salary_request_update(HttpServletRequest req, Model model)
         throws ServletException, IOException;
	
	// 급여승인요청
	public void salary_request(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 급여명세서
	public void salary_detail(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
}
