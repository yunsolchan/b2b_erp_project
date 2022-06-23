package com.spring.team_one.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.team_one.dto.AssembleDTO;

// 회계관리 DAO
@Repository
public class MHDaoImpl implements MHDao{
	
	@Autowired
	SqlSession sqlSession;
	
	// ==================거래처관리 탭======================
	// 거래처 목록
	@Override
	public List<AssembleDTO> client_list() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.client_list();
	}

	// 거래처 거래내역
	@Override
	public List<AssembleDTO> client_transaction(int client_id) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.client_transaction(client_id);
	}

	// 거래처 상세처리
	@Override
	public AssembleDTO client_detail(int client_id) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.client_detail(client_id);
	}
	// ==================매입/매출장관리 탭======================
	// 매입/매출장 전체 목록
	@Override
	public List<AssembleDTO> purchase_list() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.purchase_list();
	}

	// 매출장 목록
	@Override
	public List<AssembleDTO> purchase_out_list() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.purchase_out_list();
	}

	// 매입장 목록
	@Override
	public List<AssembleDTO> purchase_in_list() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.purchase_in_list();
	}

	// 매입/매출장 상세
	@Override
	public AssembleDTO purchase_detail(int slip_code) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.purchase_detail(slip_code);
	}

	// 매입/매출장 신청상세 목록
	@Override
	public List<AssembleDTO> purchase_det_list(int request_id){
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.purchase_det_list(request_id);
	}
	
	// 매입/매출장 승인
	@Override
	public int purchase_confirm(int slip_code) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.purchase_confirm(slip_code);
	}
	// ==================계좌관리 탭======================
	// 전체 계좌목록
	@Override
	public List<AssembleDTO> bank_list() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_list();
	}
	
	// 계좌정보 상세
	@Override
	public AssembleDTO bank_detail(String account_number) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_detail(account_number);
	}
	
	// 계좌 출금 누적액 조회
	public int bank_withdraw_sum(String account_number) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_withdraw_sum(account_number);
	}
	
	// 계좌 입금 누적액 조회
	public int bank_deposit_sum(String account_number) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_deposit_sum(account_number);
	}
	
	// 계좌거래내역 목록
	@Override
	public List<AssembleDTO> bank_transfer_list(String account_number) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_transfer_list(account_number);
	}
	
	// 신규계좌 중복확인
	@Override
	public int bank_check(String keyword) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_check(keyword);
	}
	
	// 신규계좌등록 처리
	@Override
	public int bank_insert(AssembleDTO assembleDTO) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_insert(assembleDTO);
	}

	// 계좌수정 처리
	@Override
	public int bank_update(AssembleDTO assembleDTO) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_update(assembleDTO);
	}
	
	// 계좌 비밀번호 확인
	@Override
	public String bank_pw_check(String account_number) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_pw_check(account_number);
	}
	
	// 출금 거래내역 추가
	@Override
	public int bank_transfer_insert(AssembleDTO assembleDTO) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_transfer_insert(assembleDTO);
	}
	
	// 입금거래내역 추가
	public int bankin_transfer_insert(AssembleDTO assembleDTO) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bankin_transfer_insert(assembleDTO);
	}
	
	// 잔액 출금처리
	@Override
	public int bank_withdraw(Map<String, Object> map) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_withdraw(map);
	}
	
	// 잔액 입금처리
	@Override
	public int bank_deposit(Map<String, Object> map) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_deposit(map);
	}
	
	// 송금계좌 검색처리
	@Override
	public String bank_lookup(AssembleDTO assembleDTO) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_lookup(assembleDTO);
	}
	
	// 송금계좌 검색처리
	public String client_account_lookup(int client_id) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.client_account_lookup(client_id);
	}
	// ==================급여관리 탭======================
	// 급여명세서 목록
	@Override
	public List<AssembleDTO> salary_specification_list() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.salary_specification_list();
	}
	
	// 급여명세서 상세
	@Override
	public AssembleDTO salary_specification_detail(int salary_id) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.salary_specification_detail(salary_id);
	}
	
	// ==================지출관리 탭======================
	// 지출요청 목록
	@Override
	public List<AssembleDTO> expenditure_request_list() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_request_list();
	}

	// 지출요청 상세
	@Override
	public AssembleDTO expenditure_request_detail(int request_id) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_request_detail(request_id);
	}

	// 지출요청 내용목록
	@Override
	public List<AssembleDTO> expenditure_detail(int request_id) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_detail(request_id);
	}
	
	// 지출요청 승인처리
	@Override
	public int expenditure_request_confirm(int request_id) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_request_confirm(request_id);
	}
	
	// 지출전표 승인처리
	@Override
	public int expenditure_slip_confirm(int slip_id) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_slip_confirm(slip_id);
	}
	
	// 지출요청 보류처리
	@Override
	public int expenditure_request_reject(int request_id) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_request_reject(request_id);
	}

	// 지출전표 승인처리
	@Override
	public int expenditure_slip_reject(int slip_id) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_slip_reject(slip_id);
	}
	
	// 지출결의서 목록
	@Override
	public List<AssembleDTO> expenditure_resolution_list() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_resolution_list();
	}

	// 부서별 지출결의서 목록
	@Override
	public List<AssembleDTO> expenditure_dep_resolution_list() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_dep_resolution_list();
	}

	// 지출결의서 상세
	@Override
	public AssembleDTO expenditure_resolution_detail(int slip_code) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_resolution_detail(slip_code);
	}

	// 송금처리(요청)
	public int expenditure_transfer_req(AssembleDTO assembleDTO) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_transfer_req(assembleDTO);
	}
	
	// 송금처리(세부)
	public int expenditure_transfer_det(AssembleDTO assembleDTO) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_transfer_det(assembleDTO);
	}
		
	// 송금처리(전표)
	public int expenditure_transfer_slp(String type) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_transfer_slp(type);
	}
	
	// 송금처리(거래내역)
	public int expenditure_transfer_trn(AssembleDTO assembleDTO) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.expenditure_transfer_trn(assembleDTO);
	}
	
	// 계좌 저장여부 확인
	public String account_number_lookup(String account_number) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.account_number_lookup(account_number);
	}
	
	// 새로운 계좌 생성
	public int transfer_account_insert(AssembleDTO assembleDTO) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.transfer_account_insert(assembleDTO);
	}
	
	// 급여승인처리
	@Override
	public int salary_confirm(String employee_id){
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.salary_confirm(employee_id);
	}
	
	// 거래처명 확인
	@Override
	public String client_check(String client_name) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.client_check(client_name);
	}
	
	// 거래처아이디 검색
	@Override
	public int client_name_lookup(String client_name) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.client_name_lookup(client_name);
	}
	
	// 급여테이블 생성
	public int salary_insert(String employee_id) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.salary_insert(employee_id);
	}
	// ==================결산관리 탭======================
	// 품목별 매출차트
	@Override
	public List<AssembleDTO> financial_product_chart() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.financial_product_chart();
	}

	// 거래처별 매출차트
	@Override
	public List<AssembleDTO> financial_client_chart() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.financial_client_chart();
	}

	// 월별 매출차트
	@Override
	public List<AssembleDTO> financial_month_chart() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.financial_month_chart();
	}

	// ==================재무상태표======================
	// 월별 재무상태표
	@Override
	public AssembleDTO financial_statement(int month) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.financial_statement(month);
	}

	// 보통예금
	public int bank_assets() {
		System.out.println("보통예금");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.bank_assets();
	}
	
	// 매출채권
	public int trade_receivable() {
		System.out.println("매출채권");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.trade_receivable();
	}
	
	// 매입채무
	public int trade_payable() {
		System.out.println("매입채무");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.trade_payable();
	}
	
	// 부가세대급금
	public int vat_payment() {
		System.out.println("부가세대급금");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.vat_payment();
	}
	
	// 부가세예수금
	public int vat_deposit() {
		System.out.println("부가세예수금");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.vat_deposit();
	}
	
	// ==================손익계산서======================
	// 월별 손익계산서
	@Override
	public AssembleDTO financial_income_statement(int month) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.financial_income_statement(month);
	}
	
	// 매출총액
	public int take_sales() {
		System.out.println("매출총액");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.take_sales();
	}
	
	// 기초상품 재고 입력일 조회
	public int beg_inven_select() {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.beg_inven_select();
	}
	
	// 기초상품 재고 입력일 조회
	public int beg_inven_insert(int cost) {
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.beg_inven_insert(cost);
	}
	
	// 기초상품 재고액
	public int beginning_inventory() {
		System.out.println("기초상품 재고액");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.beginning_inventory();
	}
	
	// 당기상품 재고액
	public int current_inventory() {
		System.out.println("당기상품 재고액");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.current_inventory();
	}
	
	// 기말상품 재고액
	public int ending_inventory() {
		System.out.println("기말상품 재고액");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.ending_inventory();
	}
	
	// 급여총액
	public int total_salary() {
		System.out.println("급여총액");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.total_salary();
	}
	
	// 비용 계정별 검색
	public int all_expense_lookup(String subject) {
		System.out.println("비용 계정별 검색");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.all_expense_lookup(subject);
	}
	
	// 비과세 소득 합계
	public int non_tax_sum() {
		System.out.println("비과세 소득합계");
		MHDao dao = sqlSession.getMapper(MHDao.class);
		return dao.non_tax_sum();
	}
}
