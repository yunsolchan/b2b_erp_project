package com.spring.team_one.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.team_one.service.MHService;

// 회계관리 CONTROLLER
@Controller
public class ControllerMH {

	private static final Logger logger = LoggerFactory.getLogger(OneController.class);
	
	@Autowired
	MHService mhService;
	
	// ==================거래처관리 탭======================
	// 거래처 메뉴
	// 거래처 목록
	@RequestMapping("client_list.mh")
	public String client_list(HttpServletRequest req, Model model) {
		logger.info("[url : client_list.mh]");
		
		mhService.client_list(req, model);
		
		return "FINANCE/client/client_list";
	}
	// 거래처 거래내역
	@RequestMapping("client_transaction.mh")
	public String client_transaction(HttpServletRequest req, Model model) {
		logger.info("[url : client_transaction.mh]");
	
		mhService.client_transaction(req, model);
		
		return "FINANCE/client/client_transaction";
	}
	// 거래처 상세
	@RequestMapping("client_detail.mh")
	public String client_detail() {
		logger.info("[url : client_detail.mh]");
	
		return "FINANCE/client/client_detail";
	}
	
	// ==================매입/매출장관리 탭======================
	// 매입/매출장 메뉴
	// 전체 매입/매출장 목록
	@RequestMapping("purchase_list.mh")
	public String purchase_list() {
		logger.info("[url : purchase_list.mh]");
	
		return "FINANCE/purchase/purchase_list";
	}
	// 매입/매출장 메뉴 진입
	@RequestMapping("purchase_all_list.mh")
	public String purchase_all_list(HttpServletRequest req, Model model) {
		logger.info("[url : purchase_all_list.mh]");
		
		mhService.purchase_list(req, model);
		
		return "FINANCE/purchase/purchase_all_list";
	}
	// 매출장 목록
	@RequestMapping("purchase_out_list.mh")
	public String purchase_out_list(HttpServletRequest req, Model model) {
		logger.info("[url : purchase_out_list.mh]");
	
		mhService.purchase_out_list(req, model);
		
		return "FINANCE/purchase/purchase_out_list";
	}
	// 매입장 목록
	@RequestMapping("purchase_in_list.mh")
	public String purchase_in_list(HttpServletRequest req, Model model) {
		logger.info("[url : purchase_in_list.mh]");
	
		mhService.purchase_in_list(req, model);
		
		return "FINANCE/purchase/purchase_in_list";
	}
	// 매입/매출장 상세
	@RequestMapping("purchase_detail.mh")
	public String purchase_detail(HttpServletRequest req, Model model) {
		logger.info("[url : purchase_detail.mh]");
	
		mhService.purchase_detail(req, model);
		
		return "FINANCE/purchase/purchase_detail";
	}
	// 매출장 승인
	@RequestMapping("purchase_out_confirm.mh")
	public String purchase_out_confirm(HttpServletRequest req, Model model) {
		logger.info("[url : purchase_out_confirm.mh]");
	
		mhService.purchase_out_confirm(req, model);
		
		return "FINANCE/purchase/purchase_out_confirm";
	}
	// 매입장 승인
	@RequestMapping("purchase_in_confirm.mh")
	public String purchase_in_confirm(HttpServletRequest req, Model model) {
		logger.info("[url : purchase_in_confirm.mh]");

		mhService.purchase_in_confirm(req, model);
		
		return "FINANCE/purchase/purchase_in_confirm";
	}
	// ==================계좌관리 탭======================
	// 계좌관리 메뉴
	// 계좌관리 메뉴 접근
	@RequestMapping("bank_list.mh")
	public String bank_list(HttpServletRequest req, Model model) {
		logger.info("[url : bank_list.mh]");
	
		mhService.bank_list(req, model);
		
		return "FINANCE/bank/bank_list";
	}
	// 계좌상세 접근
	@RequestMapping("bank_detail.mh")
	public String bank_detail(HttpServletRequest req, Model model) {
		logger.info("[url : bank_detail.mh]");
	
		mhService.bank_detail(req, model);
		
		return "FINANCE/bank/bank_detail";
	}
	// 계좌 거래내역 목록
	@RequestMapping("bank_transfer_list.mh")
	public String bank_transfer_list(HttpServletRequest req, Model model) {
		logger.info("[url : bank_transfer_list.mh]");
	
		mhService.bank_transfer_list(req, model);
		
		return "FINANCE/bank/bank_transfer_list";
	}
	// 신규 계좌 등록
	@RequestMapping("bank_insert.mh")
	public String bank_insert() {
		logger.info("[url : bank_insert.mh]");
	
		return "FINANCE/bank/bank_insert";
	}
	// 신규 계좌 중복확인
	@ResponseBody
	@RequestMapping("bank_check.mh")
	public int bank_check(HttpServletRequest req, Model model) {
		logger.info("[url : bank_ check.mh]");
		
		return mhService.bank_check(req,model);
	}
	// 신규 계좌 등록 처리
	@RequestMapping("bank_insert_action.mh")
	public String bank_insert_action(HttpServletRequest req, Model model) {
		logger.info("[url : bank_insert_action.mh]");
	
		mhService.bank_insert(req, model);
		
		return "FINANCE/bank/bank_insert_action";
	}
	// 계좌 사용보류/계좌 정보수정 화면
	@RequestMapping("bank_update.mh")
	public String bank_update(HttpServletRequest req, Model model) {
		logger.info("[url : bank_update.mh]");
		
		mhService.bank_detail(req, model);
		
		return "FINANCE/bank/bank_update";
	}
	// 계좌 사용보류/계좌 정보수정 처리
	@RequestMapping("bank_update_action.mh")
	public String bank_update_action(HttpServletRequest req, Model model) {
		logger.info("[url : bank_update_action.mh]");
	
		mhService.bank_update(req, model);
		
		return "FINANCE/bank/bank_update_action";
	}
	// 계좌 비밀번호 확인
	@ResponseBody
	@RequestMapping("bank_pw_check.mh")
	public int bank_pw_check(HttpServletRequest req, Model model) {
		logger.info("[url : bank_pw_check.mh]");
		
		return mhService.bank_pw_check(req, model);
	}
	// ==================급여관리 탭======================
	// 급여명세서
	// 급여 명세목록
	@RequestMapping("salary_specification_list.mh")
	public String salary_specification_list(HttpServletRequest req, Model model) {
		logger.info("[url : salary_specification_list.mh]");
		
		mhService.salary_specification_list(req, model);
		
		return "FINANCE/salary/salary_specification_list";
	}
	// 명세서 상세
	@RequestMapping("salary_specification_detail.mh")
	public String salary_specification_detail(HttpServletRequest req, Model model) {
		logger.info("[url : salary_specification_detail.mh]");
		
		mhService.salary_specification_detail(req, model);
		
		return "FINANCE/salary/salary_specification_detail";
	}
	
	// ==================지출관리 탭======================
	// 지출관리
	// 지출요청 목록
	@RequestMapping("expenditure_request_list.mh")
	public String expenditure_request_list(HttpServletRequest req, Model model) {
		logger.info("[url : expenditure_request_list.mh]");
	
		mhService.expenditure_request_list(req, model);
		
		return "FINANCE/expenditure/expenditure_request_list";
	}
	// 지출요청 상세
	@RequestMapping("expenditure_request_detail.mh")
	public String expenditure_request_detail(HttpServletRequest req, Model model) {
		logger.info("[url : expenditure_request_detail.mh]");
	
		mhService.expenditure_request_detail(req, model);
		
		return "FINANCE/expenditure/expenditure_request_detail";
	}
	
	// 지출요청 승인처리
	@RequestMapping("expenditure_request_confirm.mh")
	public String expenditure_request_confirm(HttpServletRequest req, Model model) {
		logger.info("[url : expenditure_request_confirm.mh]");
	
		mhService.expenditure_request_confirm(req, model);
		
		return "FINANCE/expenditure/expenditure_request_confirm";
	}
	// 지출요청 보류처리
	@RequestMapping("expenditure_request_reject.mh")
	public String expenditure_request_reject(HttpServletRequest req, Model model) {
		logger.info("[url : expenditure_request_reject.mh]");
	
		mhService.expenditure_request_reject(req, model);
		
		return "FINANCE/expenditure/expenditure_request_reject";
	}
	// 지출결의서 목록
	@RequestMapping("expenditure_resolution_list.mh")
	public String expenditure_resolution_list(HttpServletRequest req, Model model) {
		logger.info("[url : expenditure_resolution_list.mh]");
	
		mhService.expenditure_resolution_list(req, model);
		
		return "FINANCE/expenditure/expenditure_resolution_list";
	}
	// 부서별 지출결의서 목록
	@RequestMapping("expenditure_dep_resolution_list.mh")
	public String expenditure_dep_resolution_list() {
		logger.info("[url : expenditure_dep_resolution_list.mh]");
		
		return "FINANCE/expenditure/expenditure_dep_resolution_list";
	}
	// 지출결의서 상세
	@RequestMapping("expenditure_resolution_detail.mh")
	public String expenditure_resolution_detail(HttpServletRequest req, Model model) {
		logger.info("[url : expenditure_resolution_detail.mh]");
	
		mhService.expenditure_resolution_detail(req, model);
		
		return "FINANCE/expenditure/expenditure_resolution_detail";
	}
	// 거래처명 확인
	@ResponseBody
	@RequestMapping("client_check.mh")
	public int client_check(HttpServletRequest req, Model model) {
		logger.info("[url : client_check.mh]");
	
		return mhService.client_check(req,model);
	}
	// 직접 송금추가(지출결의서 작성)
	@RequestMapping("expenditure_transfer.mh")
	public String expenditure_transfer(HttpServletRequest req, Model model) {
		logger.info("[url : expenditure_transfer.mh]");
	
		mhService.expenditure_transfer(req, model);
		
		return "FINANCE/expenditure/expenditure_transfer";
	}
	// 송금처리(지출결의서 작성처리)
	@RequestMapping("expenditure_transfer_action.mh")
	public String expenditure_transfer_action(HttpServletRequest req, Model model) {
		logger.info("[url : expenditure_transfer_action.mh]");
	
		mhService.expenditure_transfer_action(req, model);
	
		return "FINANCE/expenditure/expenditure_transfer_action";
	}
	// ==================결산관리 탭======================
	// 결산메뉴
	// 결산 차트 전체확인
	@RequestMapping("financial_closing.mh")
	public String financial_closing(HttpServletRequest req, Model model) {
		logger.info("[url : financial_closing.mh]");
	
		mhService.financial_month_chart(req, model);
		
		return "FINANCE/financial/financial_closing";
	}

	/*
	 * // 월별 매출차트
	 * 
	 * @RequestMapping("financial_month_chart.mh") public String
	 * financial_month_chart(HttpServletRequest req, Model model) {
	 * logger.info("[url : financial_month_chart.mh]");
	 * 
	 * mhService.financial_month_chart(req, model);
	 * 
	 * return "FINANCE/financial/financial_closing"; //return
	 * "/team_one/resources/css/js/chart.js"; }
	 */
	// 결산관리 접근
	@RequestMapping("financial_document.mh")
	public String financial_document(HttpServletRequest req, Model model) {
		logger.info("[url : financial_document.mh]");
		
		return "FINANCE/financial/financial_document";
	}
	// 재무상태표 접근
	@RequestMapping("financial_statement.mh")
	public String financial_statement(HttpServletRequest req, Model model) {
		logger.info("[url : financial_statement.mh]");
	
		mhService.financial_statement(req, model);
		
		return "FINANCE/financial/financial_statement";
	}
	// 손익계산서메뉴 접근
	@RequestMapping("financial_income_statement.mh")
	public String financial_income_statement(HttpServletRequest req, Model model) {
		logger.info("[url : financial_income_statement.mh]");
	
		mhService.financial_income_statement(req, model);
		
		return "FINANCE/financial/financial_income_statement";
	}
	// =============== 재정출력 =================
	// 매입매출장 출력
	@RequestMapping("purchase_detail_print.mh")
	public String purchase_detail_print(HttpServletRequest req, Model model) {
		logger.info("[url : purchase_detail_print.mh]");
	
		mhService.purchase_detail(req, model);
		
		return "FINANCE/purchase/purchase_detail_print";
	}
	// 지출결의서 출력
	@RequestMapping("expenditure_resolution_detail_print.mh")
	public String expenditure_resolution_detail_print(HttpServletRequest req, Model model) {
		logger.info("[url : expenditure_resolution_detail_print.mh]");
	
		mhService.expenditure_resolution_detail(req, model);
		
		return "FINANCE/expenditure/expenditure_resolution_detail_print";
	}
	// 재무상태표 출력
	@RequestMapping("financial_statement_print.mh")
	public String financial_statement_print(HttpServletRequest req, Model model) {
		logger.info("[url : financial_statement_print.mh]");
		
		mhService.financial_statement(req, model);
	
		return "FINANCE/financial/financial_statement_print";
	}
	
	// 손익계산서 출력
	@RequestMapping("financial_income_statement_print.mh")
	public String financial_income_statement_print(HttpServletRequest req, Model model) {
		logger.info("[url : financial_income_statement_print.mh]");
	
		mhService.financial_income_statement(req, model);
		
		return "FINANCE/financial/financial_income_statement_print";
	}
}
