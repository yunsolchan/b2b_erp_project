package com.spring.team_one.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.team_one.dao.MHDao;
import com.spring.team_one.dto.AssembleDTO;

// 회계관리 SERVICE
@Service
public class MHServiceImpl implements MHService{

	@Autowired
	MHDao mhDao;
	
	@Autowired	
	BCryptPasswordEncoder passwordEncoder;	//비밀번호 암호화 클래스
	
	// ==================거래처관리 탭======================
	// 거래처 목록
	@Override
	public void client_list(HttpServletRequest req, Model model) {
		List<AssembleDTO> client_list = mhDao.client_list();
		
		model.addAttribute("client_list", client_list);
	}

	// 거래처 거래내역
	@Override
	public void client_transaction(HttpServletRequest req, Model model) {
		int client_id = Integer.parseInt(req.getParameter("client_id"));
		
		List<AssembleDTO> client_transaction_list = mhDao.client_transaction(client_id);
		AssembleDTO client_detail = mhDao.client_detail(client_id);
		
		model.addAttribute("client_detail", client_detail);
		model.addAttribute("client_transaction_list", client_transaction_list);
	}

	// 거래처 상세
	@Override
	public void client_detail(HttpServletRequest req, Model model) {
		
	}

	// ==================매입/매출장관리 탭======================	
	// 전체 매입/매출장 목록
	@Override
	public void purchase_list(HttpServletRequest req, Model model) {
		List<AssembleDTO> purchase_list = mhDao.purchase_list();
		
		model.addAttribute("purchase_list", purchase_list);
	}

	// 매출장 목록
	@Override
	public void purchase_out_list(HttpServletRequest req, Model model) {
		List<AssembleDTO> purchase_list = mhDao.purchase_out_list();
		
		model.addAttribute("purchase_out_list", purchase_list);	
	}

	// 매입장 목록
	@Override
	public void purchase_in_list(HttpServletRequest req, Model model) {
		List<AssembleDTO> purchase_list = mhDao.purchase_in_list();
		
		model.addAttribute("purchase_in_list", purchase_list);	
	}

	// 매입/매출장 상세
	@Override
	public void purchase_detail(HttpServletRequest req, Model model) {
		int sale_id = Integer.parseInt(req.getParameter("sale_slip_id"));
		
		AssembleDTO purchase_detail = mhDao.purchase_detail(sale_id);
		
		AssembleDTO client_detail = mhDao.client_detail(purchase_detail.getClient_id());
		
		List<AssembleDTO> request_det_list = mhDao.purchase_det_list(purchase_detail.getRequest_id());
		
		model.addAttribute("purchase_detail", purchase_detail);
		model.addAttribute("client_detail", client_detail);
		model.addAttribute("request_det_list", request_det_list);
	}

	// 매출장승인
	@Override
	public void purchase_out_confirm(HttpServletRequest req, Model model) {
		int slip_id = Integer.parseInt(req.getParameter("slip_id"));
		int money = Integer.parseInt(req.getParameter("money"));
		int client_id = Integer.parseInt(req.getParameter("client_id"));
		String memo = req.getParameter("memo");
		
		// 전표승인
		int purchase_confirm = mhDao.purchase_confirm(slip_id);
		System.out.println("전표승인 " + purchase_confirm);
		
		// 거래처계좌 찾기
		String account = mhDao.client_account_lookup(client_id);
		System.out.println("거래처계좌 찾기 " + account);
		
		// 결과 값 도출
		int result = 0;
		if(purchase_confirm == 1) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("account_number", account);
			map.put("cost", money);
			
			// 입금처리
			int deposit = mhDao.bank_deposit(map);
			System.out.println("입금처리 " + deposit);
			
			AssembleDTO transfer = new AssembleDTO();
			transfer.setMoney(money);
			transfer.setTr_memo(memo);
			// 매입/매출계좌
			transfer.setIn_account_number("1052908238");
			transfer.setOut_account_number(account);
			
			// 거래내역처리
			int transfer_in_insert = mhDao.bankin_transfer_insert(transfer);
			System.out.println("거래내역처리 " + transfer_in_insert);
			if((deposit + transfer_in_insert) == 2) {
				result = 1;
			}
		}
		System.out.println("result " + result);
		model.addAttribute("result", result);
	}
	
	// 매입장승인
	@Override
	public void purchase_in_confirm(HttpServletRequest req, Model model) {
		int slip_id = Integer.parseInt(req.getParameter("slip_id"));
		int money = Integer.parseInt(req.getParameter("money"));
		int client_id = Integer.parseInt(req.getParameter("client_id"));
		String memo = req.getParameter("memo");
		
		// 전표승인
		int purchase_confirm = mhDao.purchase_confirm(slip_id);
		
		// 거래처계좌 찾기
		String account = mhDao.client_account_lookup(client_id);
		
		// 결과 값 도출
		int result = 0;
		if(purchase_confirm == 1) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("account_number", account);
			map.put("cost", money);
			
			// 출금처리
			int withdraw = mhDao.bank_withdraw(map);
			
			AssembleDTO transfer = new AssembleDTO();
			transfer.setMoney(money);
			transfer.setTr_memo(memo);
			transfer.setIn_account_number("1052908238");
			transfer.setOut_account_number(account);
			
			// 거래내역처리
			int transfer_insert = mhDao.bank_transfer_insert(transfer);
			
			if((withdraw + transfer_insert) == 2) {
				result = 1;
			}
		}
		model.addAttribute("result", result);
	}
	// ==================계좌관리 탭======================	
	// 전체 계좌목록
	@Override
	public void bank_list(HttpServletRequest req, Model model) {
		List<AssembleDTO> bank_list = mhDao.bank_list();
		
		model.addAttribute("bank_list", bank_list);	
	}

	// 계좌정보 상세
	@Override
	public void bank_detail(HttpServletRequest req, Model model) {
		String account_number = req.getParameter("account_number");
		
		AssembleDTO bank_detail = mhDao.bank_detail(account_number);
		int bank_withdraw = mhDao.bank_withdraw_sum(account_number);
		int bank_deposit = mhDao.bank_deposit_sum(account_number);
		
		model.addAttribute("bank_detail", bank_detail);
		model.addAttribute("bank_withdraw", bank_withdraw);
		model.addAttribute("bank_deposit", bank_deposit);
		
	}

	// 계좌거래내역 목록
	@Override
	public void bank_transfer_list(HttpServletRequest req, Model model) {
		String account_number = req.getParameter("account_number");
		System.out.println(account_number);
		List<AssembleDTO> bank_transfer_list = mhDao.bank_transfer_list(account_number);
	
		model.addAttribute("bank_transfer_list", bank_transfer_list);
	}
	
	// 신규계좌중복 확인
	@Override
	public int bank_check(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");
		
		int bank_check = mhDao.bank_check(keyword);
		model.addAttribute("bank_check", bank_check);
		
		return bank_check;
	}
	
	// 신규계좌등록 처리
	@Override
	public void bank_insert(HttpServletRequest req, Model model) {
		// 등록사원 아이디
		String employee_id = (String)req.getSession().getAttribute("sessionID");
		
		// 비밀번호 암호화 - 시큐리티
		String bank_password = req.getParameter("bank_password");
		System.out.println("암호화전의 비밀번호 : " + bank_password);
		
		String encryptPassword = passwordEncoder.encode(bank_password);
		// 암호화 전의 비밀번호를 받아 암호화시키겟다는 뜻
		// BCryptPasswordEncoder.encode() : 암호화메서드 이를 암호화라고 한다 
		System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
		
		// 계좌번호
		String account_number = req.getParameter("account_number");
		// 은행명
		String bank = req.getParameter("bank");
		// 예금주명
		String name = req.getParameter("name");
		// 계좌메모
		String purpose = req.getParameter("purpose");
		// 초기잔액
		int balance = Integer.parseInt(req.getParameter("balance"));
		// 계좌명
		String account_name = req.getParameter("account_name");
		
		AssembleDTO dto = new AssembleDTO();
		dto.setEmployee_id(employee_id);
		dto.setBank_password(encryptPassword);
		dto.setAccount_number(account_number);
		dto.setBank(bank);
		dto.setAc_name(name);
		dto.setPurpose(purpose);
		dto.setBalance(balance);
		dto.setAccount_name(account_name);
		
		int bank_insert = mhDao.bank_insert(dto);
		model.addAttribute("bank_insert", bank_insert);
	}

	// 계좌수정 처리
	@Override
	public void bank_update(HttpServletRequest req, Model model) {
		// 수정사원 아이디
		String employee_id = (String)req.getSession().getAttribute("sessionID");
		
		// 비밀번호 암호화 - 시큐리티
		String bank_password = req.getParameter("bank_password");
		System.out.println("암호화전의 비밀번호 : " + bank_password);
		
		String encryptPassword = passwordEncoder.encode(bank_password);
		// 암호화 전의 비밀번호를 받아 암호화시키겟다는 뜻
		// BCryptPasswordEncoder.encode() : 암호화메서드 이를 암호화라고 한다 
		System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
		
		// 계좌번호
		String account_number = req.getParameter("account_number");
		// 은행명
		String bank = req.getParameter("bank");
		// 예금주명
		String name = req.getParameter("name");
		// 계좌메모
		String purpose = req.getParameter("purpose");
		// 초기잔액
		int balance = Integer.parseInt(req.getParameter("balance"));
		// 계좌명
		String account_name = req.getParameter("account_name");
		// 사용여부
		char account_enable = req.getParameter("account_enable").charAt(0);
		
		AssembleDTO dto = new AssembleDTO();
		dto.setEmployee_id(employee_id);
		dto.setBank_password(encryptPassword);
		dto.setAccount_number(account_number);
		dto.setBank(bank);
		dto.setAc_name(name);
		dto.setPurpose(purpose);
		dto.setBalance(balance);
		dto.setAccount_name(account_name);
		dto.setAc_enable(account_enable);
		
		int bank_update = mhDao.bank_update(dto);
		model.addAttribute("bank_update", bank_update);
	}
	// 계좌 비밀번호 확인
	@Override
	public int bank_pw_check(HttpServletRequest req, Model model) {
		String account_number = req.getParameter("account_number");
		String password = req.getParameter("password");
		
		int password_check = 0;
		
		String bank_password = mhDao.bank_pw_check(account_number);
		
		if(bank_password != null && bank_password != "") {
			if(passwordEncoder.matches(password, bank_password)) { // 패스워드가 일치하면
				password_check = 1;
			}
		}
		
		model.addAttribute("password_check", password_check);
		return password_check;
	}
	// ==================급여관리 탭======================
	// 급여명세 목록
	@Override
	public void salary_specification_list(HttpServletRequest req, Model model) {
		List<AssembleDTO> specification_list = mhDao.salary_specification_list();
		
		model.addAttribute("specification_list", specification_list);
	}
	
	// 급여명세서 상세
	@Override
	public void salary_specification_detail(HttpServletRequest req, Model model) {
		int salary_id = Integer.parseInt(req.getParameter("salary_id"));
		
		AssembleDTO dto = mhDao.salary_specification_detail(salary_id);
		
		model.addAttribute("dto", dto);
	}
	
	// ==================지출관리 탭======================
	// 지출요청 목록
	@Override
	public void expenditure_request_list(HttpServletRequest req, Model model) {
		List<AssembleDTO> expenditure_request_list = mhDao.expenditure_request_list();
		
		model.addAttribute("expenditure_request_list", expenditure_request_list);	
	}

	// 지출요청 상세
	@Override
	public void expenditure_request_detail(HttpServletRequest req, Model model) {
		int request_code = Integer.parseInt(req.getParameter("request_code"));
		
		AssembleDTO request_detail = mhDao.expenditure_request_detail(request_code);
		List<AssembleDTO> request_detail_list = mhDao.expenditure_detail(request_code);
		List<AssembleDTO> bank_list = mhDao.bank_list();
		
		String account = mhDao.bank_lookup(request_detail_list.get(0));
		
		model.addAttribute("bank_list", bank_list);
		model.addAttribute("request_detail", request_detail);
		model.addAttribute("request_detail_list", request_detail_list);
		model.addAttribute("account", account);
	}

	// 지출요청 승인처리
	@Override
	public void expenditure_request_confirm(HttpServletRequest req, Model model) {
		int slip_id = Integer.parseInt(req.getParameter("slip_id"));
		int request_id = Integer.parseInt(req.getParameter("request_id"));
		int cost = Integer.parseInt(req.getParameter("cost"));
		String type = req.getParameter("re_type");
		String account_number = req.getParameter("account_number");
		
		// 요청승인처리
		int req_result = mhDao.expenditure_request_confirm(request_id);
		
		// 전표승인처리
		int slip_result = mhDao.expenditure_slip_confirm(slip_id);
		
		// 지출내용목록 불러오기
		List<AssembleDTO> request_detail_list = mhDao.expenditure_detail(request_id);
		
		// 거래내역 결과체크
		int bank_transfer_insert_result = 0;
		int transfer_result = 0;
		int salary_result = 0;
		for(int i = 0; i < request_detail_list.size(); i++) {
			AssembleDTO dto = new AssembleDTO();
			
			System.out.println("type : " + type);
			if(type.equals("급여")) {
				int salary_confirm = mhDao.salary_confirm(request_detail_list.get(i).getEmployee_id());
				System.out.println("salary : " + salary_confirm);
				salary_result += salary_confirm;
				
				int salary_insert = mhDao.salary_insert(request_detail_list.get(i).getEmployee_id());
				salary_result += salary_insert;
			}
			
			dto.setMoney(request_detail_list.get(i).getExpenses());
			dto.setTr_memo(request_detail_list.get(i).getOp_abstract());
			dto.setIn_account_number(account_number);
			dto.setOut_account_number(request_detail_list.get(i).getAccount_number());
			
			// 거래내역 입력처리
			int bank_transfer_insert = mhDao.bank_transfer_insert(dto);
			
			// 결과체크변수에 합산
			bank_transfer_insert_result += bank_transfer_insert;
		}
		// 결과 값 완료 = 1 / 실패 = 0
		if(bank_transfer_insert_result == (request_detail_list.size())) {
			transfer_result = 1;
		}
		if(salary_result != 0) {
			if(salary_result == (request_detail_list.size() * 2)) {
				salary_result = 1;
			}
			else {
				salary_result = -1;
			}
		}
		
		// 총비용 및 계좌번호 map에 담기
		Map<String, Object> withdraw_map = new HashMap<String, Object>();
		withdraw_map.put("cost", cost);
		withdraw_map.put("account_number", account_number);
		
		// map을 출금메서드에 전달
		int withdraw_result = mhDao.bank_withdraw(withdraw_map);
		
		// 전체 인서트 결과 파악
		int confirm_result = 0;
		if((req_result + slip_result + transfer_result + withdraw_result) == 4){
			if(salary_result != -1) {
				confirm_result = 1;
			}
		}
		
		// 속성 값 confirm페이지로 전달
		model.addAttribute("confirm_result", confirm_result);
	}

	// 지출요청 보류처리
	@Override
	public void expenditure_request_reject(HttpServletRequest req, Model model) {
		int slip_id = Integer.parseInt(req.getParameter("slip_id"));
		int request_id = Integer.parseInt(req.getParameter("request_id"));
		
		// 요청보류처리
		int req_result = mhDao.expenditure_request_reject(request_id);
		
		// 전표보류처리
		int slip_result = mhDao.expenditure_slip_reject(slip_id);
		
		// 전체 인서트 결과 파악
		int reject_result = 0;
		if((req_result + slip_result) == 2){
			reject_result = 1;
		}
		
		// 속성 값 reject페이지로 전달
		model.addAttribute("reject_result", reject_result);
	}

	// 지출결의서 목록
	@Override
	public void expenditure_resolution_list(HttpServletRequest req, Model model) {
		List<AssembleDTO> expenditure_resolution_list = mhDao.expenditure_resolution_list();
		
		model.addAttribute("expenditure_resolution_list", expenditure_resolution_list);
	}

	// 부서별 지출결의서 목록
	@Override
	public void expenditure_dep_resolution_list(HttpServletRequest req, Model model) {
		
	}

	// 지출결의서 상세
	@Override
	public void expenditure_resolution_detail(HttpServletRequest req, Model model) {
		int request_code = Integer.parseInt(req.getParameter("request_code"));
		
		AssembleDTO resolution_detail = mhDao.expenditure_resolution_detail(request_code);
		List<AssembleDTO> resolution_detail_list = mhDao.expenditure_detail(request_code);
		
		String account = mhDao.bank_lookup(resolution_detail_list.get(0));
		
		model.addAttribute("resolution_detail", resolution_detail);
		model.addAttribute("resolution_detail_list", resolution_detail_list);
		model.addAttribute("account", account);
	}

	// 송금추가
	@Override
	public void expenditure_transfer(HttpServletRequest req, Model model) {
		List<AssembleDTO> bank_list = mhDao.bank_list();
		model.addAttribute("bank_list", bank_list);
	}
	
	// 송금처리(지출결의서 작성처리)
	@Override
	public void expenditure_transfer_action(HttpServletRequest req, Model model) {
		// 세션아이디 받기
		String employee_id = (String)req.getSession().getAttribute("sessionID");
		// 거래처명 받기
		String client_name = req.getParameter("client_name");
		// 계정과목 받기
		String subject = req.getParameter("account_title");
		// 지출내용 받기
		String memo = req.getParameter("memo");
		// 예금주명 받기
		String[] ac_name = req.getParameterValues("ac_name");
		// 계좌번호 받기
		String[] ac_number = req.getParameterValues("ac_number");
		// 은행명 받기
		String[] ac_bank = req.getParameterValues("ac_bank");
		// 송금금액 받기
		String[] ac_money = req.getParameterValues("ac_money");
		// 선택계좌 받기
		String account_number = req.getParameter("account_number");
		
		// 클라이언트 ID받아오기
		int client_id = mhDao.client_name_lookup(client_name);
		
		// 요청 insert처리
		AssembleDTO req_insert_dto = new AssembleDTO();
		req_insert_dto.setEmployee_id(employee_id);
		req_insert_dto.setClient_id(client_id);
		req_insert_dto.setRe_type(subject);
		req_insert_dto.setRe_memo(memo);
		
		int req_insert = mhDao.expenditure_transfer_req(req_insert_dto);
		
		int cost = 0;
		int result = 0;
		int slp_insert = 0;
		if(req_insert == 1) {
			// 요청세부 insert처리		
			for(int i = 0; i < ac_name.length; i++) {
				cost += Integer.parseInt(ac_money[i]);
				AssembleDTO det_insert_dto = new AssembleDTO();
				
				det_insert_dto.setExpenses(Integer.parseInt(ac_money[i]));
				det_insert_dto.setOp_abstract(memo);
				det_insert_dto.setAc_name(ac_name[i]);
				det_insert_dto.setBank(ac_bank[i]);
				det_insert_dto.setAccount_number(ac_number[i]);
				det_insert_dto.setIn_account_number(account_number);
				det_insert_dto.setOp_account_title(subject);
				det_insert_dto.setEmployee_id(employee_id);
				det_insert_dto.setClient_id(client_id);
				
				// 계좌정보 저장여부 확인
				String saved_account = mhDao.account_number_lookup(ac_number[i]);
				
				int det_insert = 0;
				if(saved_account != null && saved_account != "") {
					det_insert = mhDao.expenditure_transfer_det(det_insert_dto);
				}else {
					// 계좌정보 저장 후 
					int bank_insert = mhDao.transfer_account_insert(det_insert_dto);
							
					if(bank_insert == 1) {
						// insert진행
						det_insert = mhDao.expenditure_transfer_det(det_insert_dto);
					}
				}
				
				// 거래내역 insert처리
				if(det_insert == 1) {
					int bank_insert = mhDao.expenditure_transfer_trn(det_insert_dto);
					result += bank_insert;
				}
			}
			// 일반전표 insert처리
			slp_insert = mhDao.expenditure_transfer_slp(subject);
		}
		
		int withdraw_result = 0;
		if(result == ac_name.length) {
			// 총비용 및 계좌번호 map에 담기
			Map<String, Object> withdraw_map = new HashMap<String, Object>();
			withdraw_map.put("cost", cost);
			withdraw_map.put("account_number", account_number);
			
			// map을 출금메서드에 전달
			withdraw_result = mhDao.bank_withdraw(withdraw_map);
			if((slp_insert + withdraw_result) == 2) {
				result = 1;
			}
			// 속성 값 action페이지로 전달
			model.addAttribute("result", result);
		}
	}
	
	// 거래처명 확인
	@Override
	public int client_check(HttpServletRequest req, Model model) {
		String client_name = req.getParameter("client");
		
		int name_check = 0;
		String client = mhDao.client_check(client_name);
		
		if(client != null && client != "") {
			if(client_name.equals(client_name)) {
				name_check = 1;
			}
		}
		model.addAttribute("name_check", name_check);
		
		return name_check;
	}
	// ==================결산관리 탭======================
	// 결산 차트
	@Override
	public void financial_closing(HttpServletRequest req, Model model) {
		
	}

	// 월별 재무상태표 접근
	@Override
	public void financial_statement(HttpServletRequest req, Model model) {
		AssembleDTO financial_statement = new AssembleDTO();
		
		// ===========================================
		// 자산정보
		// 보통예금
		financial_statement.setBank_assets(mhDao.bank_assets());
		
		// 매출채권
		financial_statement.setTrade_receivable(mhDao.trade_receivable());
		
		// 부가세대급금
		financial_statement.setVat_payment(mhDao.vat_payment());
		
		// 재고자산
		financial_statement.setCurrent_inventory(mhDao.ending_inventory());
		// ===========================================
		// 부채정보
		// 매입채무Liabilities
		financial_statement.setTrade_payable(mhDao.trade_payable());
		
		// 부가세예수금
		financial_statement.setVat_deposit(mhDao.vat_deposit());
		
		model.addAttribute("financial_statement", financial_statement);
	}

	// 월별 손익계산서메뉴 접근
	@Override
	public void financial_income_statement(HttpServletRequest req, Model model) {
		AssembleDTO financial_income = new AssembleDTO();
		
		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
		LocalDate now = LocalDate.now();
		// 포맷 정의
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMM");
		// 포맷 적용
		int time = Integer.parseInt(now.format(format));
		
		// 현재재고액 조회
		int now_inven = mhDao.ending_inventory();
		// 기초상품재고 입력일 조회
		int beg_time = mhDao.beg_inven_select();
		
		// 기초상품재고 입력일 비교
		if((time - 1) > beg_time) {
			int beg_result = mhDao.beg_inven_insert(now_inven);
			System.out.println("기초상품재고 입력일 비교 : " + beg_result);
		}
		
		// 매출총액
		financial_income.setTake_sales(mhDao.take_sales());
		
		// 기초상품 재고액
		financial_income.setBeginning_inventory(mhDao.beginning_inventory());
		
		// 당기상품 재고액
		financial_income.setCurrent_inventory(mhDao.current_inventory());
		
		// 기말상품 재고액
		financial_income.setEnding_inventory(mhDao.ending_inventory());
		
		// ===========================================
		// 각 계정별 비용저장
		// 급여총액
		financial_income.setTotal_salary(mhDao.total_salary());
		
		// 여비교통비
		financial_income.setTravel_expense(mhDao.all_expense_lookup("여비교통비"));
		
		// 소모품비
		financial_income.setConsumable_expense(mhDao.all_expense_lookup("소모품비"));
		
		// 통신비
		financial_income.setCommunication_expense(mhDao.all_expense_lookup("통신비"));
		
		// 접대비
		financial_income.setEntertainment_expense(mhDao.all_expense_lookup("접대비"));
		
		// 수도광열비
		financial_income.setAdministrative_expense(mhDao.all_expense_lookup("수도광열비"));
		
		// 창고관리비
		financial_income.setWarehouse_expense(mhDao.all_expense_lookup("창고관리비"));
		
		// 비과세소득 합계
		financial_income.setNon_tax_sum(mhDao.non_tax_sum());
		
		model.addAttribute("financial_income", financial_income);
	}
	//월별 매출 차트
	@Override
	public String financial_month_chart(HttpServletRequest req, Model model) {
		System.out.println("재정 - 월별 매출 차트 진입");
		
		//String labels = "[\"얄루\", \"욜루\",\"윌리\"]";
		String labels = "['1월', '2월', '3월', '4월','5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']";
		String data = "[";
		
		//
		List<AssembleDTO> list = mhDao.financial_month_chart();
		
		for(int i = 0; i < list.size(); i++) {
			String expenses = Integer.toString(list.get(i).getExpenses());
			
			data += expenses + ",";
		}
		 	data = data.substring(0, data.length()-1) + "]";
		
		System.out.println(data);
		model.addAttribute("areaData_labels", labels);
		model.addAttribute("areaData_data", data);
		
		return data;
	}
}
