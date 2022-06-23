package com.spring.team_one.dao;

import java.util.List;
import java.util.Map;

import com.spring.team_one.dto.AssembleDTO;

public interface JHDao {

	// 거래처 조회
	List<AssembleDTO> client_list(Map<String, Object> map);
	
	// 거래처명 중복확인
	int client_check(String keyword);

	// 계좌번호 중복확인
	int bank_check(String keyword);	
	
	// 거래처 등록 액션
	int client_insert_action(AssembleDTO dto);

	// 거래처 상세
	AssembleDTO client_detail(String client_id);
	
	// 거래처 내역보기
	List<AssembleDTO> request_list(String client_id);	
	
	// 거래처 수정
	int client_update(AssembleDTO dto);
	
	// 거래처 수정 액션
	int client_update_action(AssembleDTO dto);
	
	// 거래처 삭제
	int client_delete(String client_id);

	// 견적서 조회
	List<AssembleDTO> estimate_list(Map<String, Object> map);

	// 견적서 등록
	AssembleDTO estimate_insert(String employee_id);
	
	// 거래처 상품 목록
	List<AssembleDTO> client_product_list(String client_id);	
	
	// 상품 목록
	List<AssembleDTO> product_list(Map<String, Object> map);	
	
	// 견적서 등록 액션
	int estimate_insert_action(AssembleDTO dto);
	
	// 계좌 등록 액션
	int bank_insert_action(Map<String, Object> map);	
	
	// 견적서 디테일 등록 액션
	int request_detail_insert_action(Map<String, Object> map);
	
	// 상품 판매가 수정
	int product_update(Map<String, Object> map);
	
	// 주문서 등록 액션
	int order_insert_action(AssembleDTO dto);
	
	// 일반전표
	int slip_insert_action();

	// 매입/매출 전표
	int sales_slip_insert_action(Map<String, Object> map);	

	// 견적서 상세
	AssembleDTO request_detail(String employee_id);

	// 견적서 상세 상품
	List<AssembleDTO> request_product(String request_id);

	// 주문서 조회
	List<AssembleDTO> order_list(Map<String, Object> map);

	// 전표 승인
	int slip_update(String request_id);

	// 적요 추가
	int sales_slip_update(Map<String, Object> map);

	// 창고 목록
	AssembleDTO warehouse_list(int product_id);

	// 주문서 출고 요청
	int request_update(String request_id);

	// 출고 대기
	int outbound_insert(Map<String, Object> map);

}