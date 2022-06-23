package com.spring.team_one.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface SCService {
	
	// 거래처 등록
	void client_insert(HttpServletRequest req, Model model);
	
	// 거래처 목록
	void client_list(HttpServletRequest req, Model model);
	
	// 거래처 상세
	void client_detail(HttpServletRequest req, Model model);
	
	// 거래처 삭제
	void client_delete(HttpServletRequest req, Model model);
	
	// 거래처 수정
	void client_update(HttpServletRequest req, Model model);
	
	// 로그인한 사원 정보
	void employeeInfo(HttpServletRequest req, Model model);

	// 상품 목록 팝업
	void product_list(HttpServletRequest req, Model model);
	
	// 견적서 요청서 등록
	void estimate_application_insert(HttpServletRequest req, Model model);
	
	// 견적서 요청서 목록
	void estimate_application_list(HttpServletRequest req, Model model);
	
	// 견적서 요청서 상세정보
	void estimate_application_detail(HttpServletRequest req, Model model);
	
	// 견적서 목록
	void estimate_list(HttpServletRequest req, Model model);
	
	// 견적서 상세정보
	void estimate_detail(HttpServletRequest req, Model model);
	
	// 견적서 목록 팝업
	void estimate_list_select(HttpServletRequest req, Model model);
	
	// 주문서 등록
	void order_insert(HttpServletRequest req, Model model);
	
	// 주문서 목록
	void order_list(HttpServletRequest req, Model model);
	
	// 주문서 목록
	void order_update(HttpServletRequest req, Model model);
	
	// 주문서 목록
	void inbound_insert(HttpServletRequest req, Model model);

	// 입하 요청
	void inbound_insert_action(HttpServletRequest req, Model model);

	// 중복확인
	int client_check(HttpServletRequest req, Model model);

	int bank_check(HttpServletRequest req, Model model);

	void request_list(HttpServletRequest req, Model model);
	
}
