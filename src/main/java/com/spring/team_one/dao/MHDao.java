package com.spring.team_one.dao;

import java.util.List;
import java.util.Map;

import com.spring.team_one.dto.AssembleDTO;

public interface MHDao {
	// ==================거래처관리 탭======================
	// 거래처 목록
	public List<AssembleDTO> client_list();
	
	// 거래처 거래내역
	public List<AssembleDTO> client_transaction(int client_id);
	
	// 거래처 상세처리
	public AssembleDTO client_detail(int client_id);
	
	// ==================매입/매출장관리 탭======================
	// 매입/매출장 전체 목록
	public List<AssembleDTO> purchase_list();
	
	// 매출장 목록
	public List<AssembleDTO> purchase_out_list();
	
	// 매입장 목록
	public List<AssembleDTO> purchase_in_list();
	
	// 매입/매출장 상세
	public AssembleDTO purchase_detail(int slip_code);
	
	// 매입/매출장 신청상세 목록
	public List<AssembleDTO> purchase_det_list(int request_id);
	
	// 매입/매출장 승인
	public int purchase_confirm(int slip_code);

	// ==================계좌관리 탭======================
	// 전체 계좌목록
	public List<AssembleDTO> bank_list();
	
	// 계좌정보 상세
	public AssembleDTO bank_detail(String account_number);
	
	// 계좌 출금 누적액 조회
	public int bank_withdraw_sum(String account_number);
	
	// 계좌 입금 누적액 조회
	public int bank_deposit_sum(String account_number);
	
	// 계좌거래내역 목록
	public List<AssembleDTO> bank_transfer_list(String account_number);
	
	// 신규계좌 중복확인
	public int bank_check(String keyword);
	
	// 신규계좌등록 처리
	public int bank_insert(AssembleDTO assembleDTO);
	
	// 계좌수정 처리
	public int bank_update(AssembleDTO assembleDTO);
	
	// 계좌 비밀번호 확인
	public String bank_pw_check(String account_number);
	
	// 출금거래내역 추가
	public int bank_transfer_insert(AssembleDTO assembleDTO);
	
	// 입금거래내역 추가
	public int bankin_transfer_insert(AssembleDTO assembleDTO);
	
	// 잔액 출금처리
	public int bank_withdraw(Map<String, Object> map);
		
	// 잔액 입금처리
	public int bank_deposit(Map<String, Object> map);
	
	// 거래처 송금계좌 검색처리
	public String client_account_lookup(int client_id);
	
	// 거래처계좌 검색
	public String bank_lookup(AssembleDTO assembleDTO);
	// ==================급여관리 탭======================
	// 급여명세서 목록
	public List<AssembleDTO> salary_specification_list();
	
	// 급여명세서 상세
	public AssembleDTO salary_specification_detail(int slip_code);
	
	// ==================지출관리 탭======================
	// 지출요청 목록
	public List<AssembleDTO> expenditure_request_list();
	
	// 지출요청 상세
	public AssembleDTO expenditure_request_detail(int slip_code);
	
	// 지출요청 내용목록
	public List<AssembleDTO> expenditure_detail(int request_code);

	// 지출요청 승인처리
	public int expenditure_request_confirm(int request_id);
	
	// 지출전표 승인처리
	public int expenditure_slip_confirm(int slip_id);
	
	// 지출요청 보류처리
	public int expenditure_request_reject(int request_id);
	
	// 지출전표 보류처리
	public int expenditure_slip_reject(int slip_id);
	
	// 지출결의서 목록
	public List<AssembleDTO> expenditure_resolution_list();
	
	// 부서별 지출결의서 목록
	public List<AssembleDTO> expenditure_dep_resolution_list();
	
	// 지출결의서 상세
	public AssembleDTO expenditure_resolution_detail(int slip_code);
	
	// 송금처리(요청)
	public int expenditure_transfer_req(AssembleDTO assembleDTO);
	
	// 송금처리(세부)
	public int expenditure_transfer_det(AssembleDTO assembleDTO);
		
	// 송금처리(전표)
	public int expenditure_transfer_slp(String type);
	
	// 송금처리(거래내역)
	public int expenditure_transfer_trn(AssembleDTO assembleDTO);
	
	// 계좌 저장여부 확인
	public String account_number_lookup(String account_number);
	
	// 새로운 계좌 생성
	public int transfer_account_insert(AssembleDTO assembleDTO);
	
	// 급여승인처리
	public int salary_confirm(String employee_id);
	
	// 거래처명 확인
	public String client_check(String client_name);
	
	// 거래처아이디 검색
	public int client_name_lookup(String client_name);
	
	// 급여테이블 생성
	public int salary_insert(String employee_id);
	// ==================결산관리 탭======================
	// 품목별 매출차트
	public List<AssembleDTO> financial_product_chart();
	
	// 거래처별 매출차트
	public List<AssembleDTO> financial_client_chart();
	
	// 월별 매출차트
	public List<AssembleDTO> financial_month_chart();
	
	// ==================재무상태표======================
	// 월별 재무상태표
	public AssembleDTO financial_statement(int month);
	
	// 보통예금
	public int bank_assets();
	
	// 매출채권
	public int trade_receivable();
	
	// 부가세대급금
	public int vat_payment();
	
	// 매입채무
	public int trade_payable();
	
	// 부가세예수금
	public int vat_deposit();
	
	// ==================손익계산서======================
	// 월별 손익계산서
	public AssembleDTO financial_income_statement(int month);
	
	// 매출총액
	public int take_sales();
	
	// 기초상품 재고 입력일 조회
	public int beg_inven_select();
	
	// 기초상품 재고 입력일 조회
	public int beg_inven_insert(int cost);
	
	// 기초상품 재고액
	public int beginning_inventory();
	
	// 당기상품 재고액
	public int current_inventory();
	
	// 기말상품 재고액
	public int ending_inventory();
	
	// 급여총액
	public int total_salary();
	
	// 비용 계정별 검색
	public int all_expense_lookup(String subject);
	
	// 비과세 소득 합계
	public int non_tax_sum();
}
