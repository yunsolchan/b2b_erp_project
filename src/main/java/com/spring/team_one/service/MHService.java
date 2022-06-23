package com.spring.team_one.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MHService {

	// ==================거래처관리 탭======================
	// 거래처 목록
	public void client_list(HttpServletRequest req, Model model);
	
	// 거래처 거래내역
	public void client_transaction(HttpServletRequest req, Model model);
	
	// 거래처 상세
	public void client_detail(HttpServletRequest req, Model model);
	
	// ==================매입/매출장관리 탭======================	
	// 전체 매입/매출장 목록
	public void purchase_list(HttpServletRequest req, Model model);
	
	// 매출장 목록
	public void purchase_out_list(HttpServletRequest req, Model model);
	
	// 매입장 목록
	public void purchase_in_list(HttpServletRequest req, Model model);
		
	// 매입/매출장 상세
	public void purchase_detail(HttpServletRequest req, Model model);
	
	// 매출장승인
	public void purchase_out_confirm(HttpServletRequest req, Model model);
	
	// 매입장승인
	public void purchase_in_confirm(HttpServletRequest req, Model model);
	// ==================계좌관리 탭======================	
	// 전체 계좌목록
	public void bank_list(HttpServletRequest req, Model model);
	
	// 계좌정보 상세
	public void bank_detail(HttpServletRequest req, Model model);
	
	// 계좌거래내역 목록
	public void bank_transfer_list(HttpServletRequest req, Model model);
	
	// 신규계좌중복 확인
	public int bank_check(HttpServletRequest req, Model model);
	
	// 신규계좌등록 처리
	public void bank_insert(HttpServletRequest req, Model model);
	
	// 계좌수정 처리
	public void bank_update(HttpServletRequest req, Model model);
	
	// 계좌 비밀번호 확인
	public int bank_pw_check(HttpServletRequest req, Model model);
	
	// ==================급여관리 탭======================
	// 급여명세 목록
	public void salary_specification_list(HttpServletRequest req, Model model);
	
	// 급여명세서 상세
	public void salary_specification_detail(HttpServletRequest req, Model model);
	
	// ==================지출관리 탭======================
	// 지출요청 목록
	public void expenditure_request_list(HttpServletRequest req, Model model);
	
	// 지출요청 상세
	public void expenditure_request_detail(HttpServletRequest req, Model model);
	
	// 지출요청 승인처리
	public void expenditure_request_confirm(HttpServletRequest req, Model model);
	
	// 지출요청 보류처리
	public void expenditure_request_reject(HttpServletRequest req, Model model);
	
	// 지출결의서 목록
	public void expenditure_resolution_list(HttpServletRequest req, Model model);
	
	// 부서별 지출결의서 목록
	public void expenditure_dep_resolution_list(HttpServletRequest req, Model model);
	
	// 지출결의서 상세
	public void expenditure_resolution_detail(HttpServletRequest req, Model model);
	
	// 송금추가
	public void expenditure_transfer(HttpServletRequest req, Model model);
	
	// 송금처리(지출결의서 작성처리)
	public void expenditure_transfer_action(HttpServletRequest req, Model model);

	// 거래처명 확인
	public int client_check(HttpServletRequest req, Model model);
	
	// ==================결산관리 탭======================
	// 결산 차트
	public void financial_closing(HttpServletRequest req, Model model);

	// 월별 재무상태표 접근
	public void financial_statement(HttpServletRequest req, Model model);

	// 월별 손익계산서메뉴 접근
	public void financial_income_statement(HttpServletRequest req, Model model);
	
	//월별 매출 차트
	public String financial_month_chart(HttpServletRequest req, Model model);
}
