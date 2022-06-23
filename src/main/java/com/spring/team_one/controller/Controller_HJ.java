package com.spring.team_one.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.team_one.service.HJService;

// 인사 컨트롤러
@Controller
public class Controller_HJ {
	private static final Logger logger = LoggerFactory.getLogger(Controller_HJ.class);
	
	// service 접근	
	@Autowired
	HJService service;
	
	// -------------------- 부서
	// 부서목록
	@RequestMapping("dept_list.hj")
	public String dept_list(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : dept_list.hj]");
		
		service.dept_list(req, model);
		
		return "HR/department/dept_list";
	}
	
	// 부서상세
	@RequestMapping("dept_detail.hj")
	public String dept_detail(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : dept_detail.hj]");
		
		service.dept_detail(req, model);
		
		return "HR/department/dept_detail";
	}
	
	// 부서추가
	@RequestMapping("dept_insert.hj")
	public String dept_insert() {
		logger.info("[url : dept_insert.hj]");
		
		return "HR/department/dept_insert";
	}
	
	// 부서추가처리
	@RequestMapping("dept_insert_action.hj")
	public String dept_insert_action(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : dept_insert_action.hj]");
		
		service.dept_insert(req, model);
		
		return "HR/department/dept_insert_action";
	}
	
	
	// -------------------- 인사카드
	// 인사카드 목록
	@RequestMapping("emp_list.hj")
	public String emp_list(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : emp_list.hj]");
		
		service.emp_list(req, model);
		
		return "HR/employee/emp_list";
	}
	
	// 인사카드 등록
	@RequestMapping("emp_insert.hj")
	public String emp_insert(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : emp_insert.hj]");
		
		service.emp_dept(req, model);
		service.emp_position(req, model);
		
		return "HR/employee/emp_insert";
	}
	
	// 인사카드 - 사번정보 중복체크 ajax
	@ResponseBody
	@RequestMapping("employee_id_check.hj")
	public int employee_id_check(HttpServletRequest req, Model model) {
		logger.info("[url : bank_ employee_id_check.mh]");
		
		return service.employee_id_check(req,model);
	}
	
	// 인사카드 - 계좌정보 중복체크 ajax
	@ResponseBody
	@RequestMapping("account_submit_check.hj")
	public int account_submit_check(HttpServletRequest req, Model model) {
		logger.info("[url : bank_ account_submit_check.mh]");
		
		return service.account_submit_check(req,model);
	}
	
	// 인사카드 등록처리
	@RequestMapping("emp_insert_action.hj")
	public String emp_insert_action(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : emp_insert_action.hj]");
		
		service.emp_insert(req, model);
		
		return "HR/employee/emp_insert_action";
	}
	
	// 인사카드 상세
	@RequestMapping("emp_detail.hj")
	public String emp_detail(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : emp_detail.hj]");
		
		service.emp_detail(req, model);
		
		return "HR/employee/emp_detail";
	}
	
	// 인사카드 수정
	@RequestMapping("emp_update.hj")
	public String emp_update(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : emp_update.hj]");
		
		service.emp_detail(req, model);
		
		return "HR/employee/emp_update";
	}
	
	// 인사카드 수정처리
	@RequestMapping("emp_update_action.hj")
	public String emp_update_action(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : emp_update_action.hj]");
		
		service.emp_update(req, model);
		
		return "HR/employee/emp_update_action";
	}
	
	// 인사카드 pdf
	@RequestMapping("emp_pdf.hj")
	public String emp_pdf(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : emp_pdf.hj]");
		
		service.emp_detail(req, model);
		
		return "HR/employee/emp_pdf";
	}
	
	// -------------------- 근태관리
	// 근태관리
	@RequestMapping("attend.hj")
	public String attend(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : attend.hj]");
		
		return "HR/attend/attend";
	}
	
	// 근태조회리스트1
	@RequestMapping("attend_list.hj")
	public String attend_list(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : attend_list.hj]");
		
		service.attend_list(req, model);
		
		return "HR/attend/attend_list";
	}
	
	// 근태조회리스트2
	@RequestMapping("attend_list_today.hj")
	public String attend_list_today(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : attend_list_today.hj]");
		
		service.attend_list(req, model);
		
		return "HR/attend/attend_list";
	}
	
	// 근태승인(휴가)
	@RequestMapping("attend_update.hj")
	public String attend_update(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : attend_update.hj]");
		
		service.attend_update(req, model);
		
		return "HR/attend/attend_update";
	}
	
	// 근태승인 처리
	@RequestMapping("attend_update_action.hj")
	public String attend_update_action(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : attend_update_action.hj]");
		
		service.attend_update_action(req, model);
		
		return "HR/attend/attend_update_action";
	}

	// -------------------- 급여관리	
	// 급여관리
	@RequestMapping("salary.hj")
	public String salary(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : salary.hj]");
		
		return "HR/salary/salary";
	}
	
	// 급여목록
	@RequestMapping("salary_list.hj")
	public String salary_list(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : salary_list.hj]");
		
		service.salary_list(req, model);
		
		return "HR/salary/salary_list";
	}
	
	// 급여목록2
	@RequestMapping("salary_list_today.hj")
	public String salary_list_today(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : salary_list_today.hj]");
		
		service.salary_list(req, model);
		
		return "HR/salary/salary_list";
	}
	
	// 급여수정
	@RequestMapping("salary_update.hj")
	public String salary_update(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : salary_update.hj]");
		
		service.salary_update(req, model);
		
		return "HR/salary/salary_list";
	}
	
	// 급여승인 회계요청
	@RequestMapping("salary_request_insert.hj")
	public String salary_request_insert(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : salary_request_insert.hj]");
		
		service.salary_request(req, model);
		
		return "HR/salary/salary_request_insert";
	}
	
	// 급여요청목록
   @RequestMapping("salary_request_list.hj")
   public String salary_request_list(HttpServletRequest req, Model model)  
         throws ServletException, IOException {
      logger.info("[url : salary_request_list.hj]");
      
      service.salary_request_list(req, model);
      
      return "HR/salary/salary_request_list";
   }
   
   // 급여요청승인
   @RequestMapping("salary_request_update.hj")
   public String salary_request_update(HttpServletRequest req, Model model)  
         throws ServletException, IOException {
      logger.info("[url : salary_request_update.hj]");
      
      service.salary_request_update(req, model);
      
      return "HR/salary/salary_request_update";
   }
	   
	// 급여명세서
	@RequestMapping("salary_detail.hj")
	public String salary_detail(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url : salary_detail.hj]");
		
		service.salary_detail(req, model);
		
		return "HR/salary/salary_detail";
	}
	
	// 급여통계
	@RequestMapping("salary_chart.hj")
	public String salary_chart() {
		logger.info("[url : salary_chart.hj]");
		
		return "HR/salary/salary_chart";
	}

}
