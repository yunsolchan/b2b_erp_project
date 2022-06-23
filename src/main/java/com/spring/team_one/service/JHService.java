package com.spring.team_one.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;


public interface JHService {
	
	// 거래처 조회
	void client_list(HttpServletRequest req, Model model) throws ServletException, IOException;	
	
	// 거래처명 중복확인
	int client_check(HttpServletRequest req, Model model);

	// 계좌번호 중복확인
	int bank_check(HttpServletRequest req, Model model);
	
	// 거래처 등록 액션
	void client_insert_action(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException;
	
	// 거래처 상세
	void client_detail(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 거래처 내역보기
	void request_list(HttpServletRequest req, Model model);
	
	// 거래처 수정 액션
	void client_update_action(HttpServletRequest req, HttpServletResponse res, Model model);

	// 거래처 삭제
	void client_delete(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException;

	// 견적서 조회
	void estimate_list(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 견적서 등록
	void estimate_insert(HttpServletRequest req, Model model);
	
	// 거래처 상품 목록
	void client_product_list(HttpServletRequest req, Model model);	
	
	// 상품 목록
	void product_list(HttpServletRequest req, Model model);
	
	// 견적서 등록 액션
	void estimate_insert_action(HttpServletRequest req, HttpServletResponse res, Model model);

	// 견적서 상세
	void estimate_detail(HttpServletRequest req, Model model);

	// 주문서 조회
	void order_list(HttpServletRequest req, Model model);

	// 전표 수정
	void order_update(HttpServletRequest req, HttpServletResponse res, Model model);

	// 출고 요청
	void outbound_insert(HttpServletRequest req, Model model);
	
	// 출고 요청 액션
	void outbound_insert_action(HttpServletRequest req, Model model);	
	
	// 주문서 상세
	void order_detail(HttpServletRequest req, Model model);

}
