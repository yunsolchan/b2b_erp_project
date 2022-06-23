package com.spring.team_one.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.team_one.dto.AssembleDTO;

public interface SCDao {
	
	// 거래처 등록
	int client_insert_action(AssembleDTO dto);
	
	// 은행 등록
	int bank_insert_action(AssembleDTO dto);
	
	// 거래처 상품 등록
	void client_product_insert(Map<String,Object> map);
	
	// 거래처 목록
	List<AssembleDTO> client_list();
	
	// 거래처 상세
	AssembleDTO client_detail(int num);
	
	// 거래처 상품 목록
	List<AssembleDTO> client_product_list(int num);
	
	// 거래처 삭제
	int client_delete(int num);
	
	// 거래처 수정
	int client_update(AssembleDTO dto);

	// 거래처 상품 수정
	int client_product_update(Map<String,Object> map);
	
	// 사원 정보
	AssembleDTO employeeInfo(String id);

	// 견적 신청서 등록
	int estimate_application_insert(AssembleDTO dto);

	// 견적 신청서 상품 등록
	int estimate_application_detail_insert(Map<String,Object> map);
	
	// 견적 신청서 목록 불러오기
	List<AssembleDTO> estimate_application_list();
	
	// 견적 신청서 상세정보
	AssembleDTO estimate_application_detail(String id);
	
	// 견적 신청서 상세정보의 상품 리스트
	List<AssembleDTO> estimate_application_detail_list(String id);
	
	// 견적서 등록
	int estimate_insert(AssembleDTO dto);
	
	// 견적서 상세 등록
	int estimate_detail_insert(Map<String,Object> map);
	
	// 견적서 목록 불러오기
	List<AssembleDTO> estimate_list();
	
	// 견적서 상세정보
	AssembleDTO estimate_detail(String id);
	
	// 견적서 상세정보의 상품 리스트
	List<AssembleDTO> estimate_detail_list(String id);
	
	// 견적서 목록 리스트
	List<AssembleDTO> estimate_list_select(String client_id);
	
	// 견적서 목록 리스트
	List<AssembleDTO> estimate_product_list_select();
	
	// 주문서 등록
	int order_insert (AssembleDTO dto);
	
	// 전표 등록
	int slip_insert();
	
	// 매입 매출 전표
	int sales_slip_insert(Map<String,Object> map);
	
	// 입하 요청
	int inbound_insert(Map<String, Object> map);

	// 주문서 목록
	List<AssembleDTO> order_list();
	
	// 전표 승인요청
	int slip_update(String id);
	
	// 매입매출전표 승인요청
	int sales_slip_update(Map<String,Object> map);
	
	// 창고 목록 
	List<AssembleDTO> warehouse_list();

	int request_update(String request_id);

	int client_check(String keyword);

	int bank_check(String keyword);

	List<AssembleDTO> request_list(String client_id);
}
