package com.spring.team_one.dto;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;


// DTOassemble - 모든 테이블의 컬럼을 이곳에
public class AssembleDTO {

	// 재무결산
	private int bank_assets;	// 보통예금(유동자산)
	private int trade_receivable;	// 매출채권(유동자산)
	private int inventory;	// 재고자산(유동자산) 
	private int vat_payment;	// 부가세대급금
	
	private int trade_payable;	// 매입채무(유동부채)
	private int vat_deposit;	// 부가세예수금
	
	private int capital;	// 자본금
	
	// 손익결산
	private int take_sales;	// 매출액
	private int beginning_inventory;	// 기초상품 재고액
	private int current_inventory;	// 당기상품 재고액
	private int ending_inventory;	// 기말상품 재고액
	
	private int total_salary;	// 급여총액
	
	private int travel_expense;	// 여비교통비
	private int consumable_expense;	// 소모품비
	private int communication_expense;	// 통신비
	private int entertainment_expense;	// 접대비
	private int administrative_expense;	// 수도광열비
	private int warehouse_expense;	// 창고관리비
	
	private int non_tax_sum;	// 비과세소득 합계
	
	// ACCOUNT 테이블
	private String account_number;       // 계좌번호
	private String bank;              // 은행명
	private String ac_name;           // 예금주
	private String account_name;      // 계좌 이름
	private int balance; // 잔액
	private String purpose; // 용도
	private char ac_enable; // 사용 여부
	private String bank_password; // 송금비밀번호

	// ATTENDANCE 테이블
	private int attendance_id;        // 근태 코드
	
	private Timestamp at_start_date;    // 등록일
	private String at_reason;         // 사유
	private Timestamp at_end_date;		// 종료
	private String color;	// 캘린더 승인여부 색

	// ATTENDANCE_LIST 테이블
	private String attendance_status; // 근태 상태(출큰, 퇴근, 휴가시작, 휴가종료)

	// CLIENT 테이블
	private int client_id; // 거래처 코드
	private String cl_type; // 거래유형
	private String cl_name; // 거래처명
	private String ceo_name; // 대표자명
	private String cl_email; // 이메일
	private String cl_address; // 주소
	private String cl_detail_address; // 상세주소
	private String cl_zip_code; // 우편번호
	private String register_num; // 사업자번호
	private String cl_phone; // 연락처
	private Date cl_register_date; // 등록일
	private String cl_status; // 상태
	private int account_id; // 계좌코드

	// DEPARTMENT 테이블
	private int department_id; // 부서코드
	private String de_name; // 부서명
	private String tel; // 부서 번호
	private String de_address; // 주소
	private String de_detail_address; // 상세주소
	private String de_zip_code; // 우편번호

	// EMPLOYEE 테이블
	private String employee_id; // 사번
	private String em_name; // 이름
	private String photo; // 사진
	private String register_number; // 주민등록번호
	private String em_phone; // 연락처
	private String em_email; // 이메일
	private Date hire_date; // 입사일
	private String em_address; // 주소
	private String em_detail_address; // 상세주소
	private String em_zip_code; // 우편번호
	private String em_status; // 근무 상태(재직,퇴직,휴직)
	private String password; // 로그인시 필요한 비밀번호
	private int salary; // 기본연봉
	private String authority; // 연차 수량
	private int annual_count; // 시큐리티

	// INBOUND 테이블
	private int inbound_id; // 입고 코드
	private Date inbound_date; // 입고일자
	private String inbound_status;


	// SLIP 테이블
	private int slip_id; // 전표코드
	private String sl_type; // 유형(구매,판매...)
	private Date sl_register_date; // 등록일자
	private Date update_date; // 승인일자
	private String state; // 상태 (승인, 거절, 보류)

	// POSITION 테이블
	private int position_id; // 직급코드
	private String po_name; // 직급명
	private int years; // 호봉

	// TAXTION 테이블
	private int taxtion_id; // 과세코드
	private int overtime_pay; // 초과근무수당 / 근태에서 초과시간을 가져와서 기본급을 시급으로 환산한뒤 시급*1.5*초과근무시간으로 계산
	private int bonus_pay; // 상여금
	private int transportation_fee; // 여비교통비
	private int holyday_pay; // 주휴수당
	private int position_pay; // 직급수당 / 회가내규

	// NON_TAXTION 테이블
	private int non_taxtion_id; // 비과세코드
	private int meel_fee; // 식대, 최대 10만원
	private int drive_fee; // 자가운전보조금, 자차사용 근무시 최대 20만원
	private int child_fee; // 육아수당, 만 6세 이하의 자녀가 있는 근로차 최대 10만원

	// TAX 테이블
	private int tax_id; // 세금코드
	private int income_tax; // 소득세
	private int local_income_tax; // 지방소득세
	private int national_pension; // 국민연금
	private int health_insurance; // 건강보험
	private int employment_insurance; // 고용보험
	private int long_term_care; // 장기요양보험

	// SALARY 테이블
	private int salary_id; // 급여코드
	private int basic_salary; // 기본급
	private String payday; // 급여일자
	private char payment_status; // 지급여부

	// REQUEST 테이블
	private int request_id; // 요청코드
	private Date begin_date; // 요청일자
	private Date end_date; // 요청완료일자
	private String re_type; // 주문/견적
	private String re_status; // 요청상태(요청,승인,보류)
	private String re_memo; // 요청내용

	// REQUEST_DETAIL 테이블
	private int rd_id; // 요청상세코드
	private int re_qty; // 수량

	// PD_CATEGOTY 테이블
	private String category; // 카테고리

	// PRODUCT 테이블
	private int product_id; // 상품코드
	private String pr_name; // 상품명
	private int cost; // 원가
	private int price; // 판매가
	private Date pr_register_date; // 등록일
	private char pr_enable; // 사용여부

	// OUTBOUND 테이블
	private int outbound_id; // 출고 코드
	private Date outbound_date; // 출고일자
	private String outbound_status;

	// WAREHOUSE 테이블
	private int wh_id; // 창고 코드
	private String wa_name; // 창고명
	private String wa_address; // 창고주소
	private String wa_detail_address; // 창고 상세주소
	private String wa_zip_code; // 창고 우편번호
	private int volume; // 용적
	private String wa_status; // 상태
	private Date wa_reg_date;	// 창고등록일

	// LACK 테이블
	private int lack_code; // 랙코드
	private String location; // 랙위치
	private int la_qty; // 수량

	// SALES_SLIP 테이블
	private int sale_slip_id; // 매매전표 코드
	private String sa_account_title; // 전표계정
	private int supply_amount; // 공급가액
	private int tax_amount; // 세액
	private String sa_type; // 유형
	private String sa_abstract; // 적요

	// TRANSACTION 테이블
	private String transaction; // 이체코드
	private int money; // 금액
	private Timestamp regi_date; // 이체일
	private String tr_memo; // 메모
	private String subject; // 출/입금 구분
	private String in_account_number; // 입금계좌번호
	private String out_account_number; // 출금계좌번호

	// OPERATING_EXPENSE 테이블
	private String oe_id; // 판매관리비 코드
	private String op_account_title; // ??
	private int expenses; // 비용
	private String op_abstract; // 적요

	// view
	private int amount_pay;  // 지급총액
	private int tax;  // 공제총액
	private int net_pay;  // 실수령액

	private List<LackDTO> lackList;

	public List<LackDTO> getLackList() {
		return lackList;
	}

	public void setLackList(List<LackDTO> lackList) {
		this.lackList = lackList;
	}

	public AssembleDTO() {}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAc_name() {
		return ac_name;
	}

	public void setAc_name(String ac_name) {
		this.ac_name = ac_name;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getPurpose() {
		return purpose;
	}

	public int getNon_tax_sum() {
		return non_tax_sum;
	}

	public void setNon_tax_sum(int non_tax_sum) {
		this.non_tax_sum = non_tax_sum;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public char getAc_enable() {
		return ac_enable;
	}

	public int getBank_assets() {
		return bank_assets;
	}

	public void setBank_assets(int bank_assets) {
		this.bank_assets = bank_assets;
	}

	public int getTrade_receivable() {
		return trade_receivable;
	}

	public void setTrade_receivable(int trade_receivable) {
		this.trade_receivable = trade_receivable;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public int getVat_payment() {
		return vat_payment;
	}

	public void setVat_payment(int vat_payment) {
		this.vat_payment = vat_payment;
	}

	public int getTrade_payable() {
		return trade_payable;
	}

	public void setTrade_payable(int trade_payable) {
		this.trade_payable = trade_payable;
	}

	public int getVat_deposit() {
		return vat_deposit;
	}

	public void setVat_deposit(int vat_deposit) {
		this.vat_deposit = vat_deposit;
	}

	public int getCapital() {
		return capital;
	}

	public void setCapital(int capital) {
		this.capital = capital;
	}

	public int getTake_sales() {
		return take_sales;
	}

	public void setTake_sales(int take_sales) {
		this.take_sales = take_sales;
	}

	public int getBeginning_inventory() {
		return beginning_inventory;
	}

	public void setBeginning_inventory(int beginning_inventory) {
		this.beginning_inventory = beginning_inventory;
	}

	public int getCurrent_inventory() {
		return current_inventory;
	}

	public void setCurrent_inventory(int current_inventory) {
		this.current_inventory = current_inventory;
	}

	public int getEnding_inventory() {
		return ending_inventory;
	}

	public void setEnding_inventory(int ending_inventory) {
		this.ending_inventory = ending_inventory;
	}

	public int getTotal_salary() {
		return total_salary;
	}

	public void setTotal_salary(int total_salary) {
		this.total_salary = total_salary;
	}

	public int getTravel_expense() {
		return travel_expense;
	}

	public void setTravel_expense(int travel_expense) {
		this.travel_expense = travel_expense;
	}

	public Timestamp getAt_start_date() {
		return at_start_date;
	}

	public void setAt_start_date(Timestamp at_start_date) {
		this.at_start_date = at_start_date;
	}
	
	public int getWarehouse_expense() {
		return warehouse_expense;
	}

	public void setWarehouse_expense(int warehouse_expense) {
		this.warehouse_expense = warehouse_expense;
	}

	public Timestamp getAt_end_date() {
		return at_end_date;
	}

	public void setAt_end_date(Timestamp at_end_date) {
		this.at_end_date = at_end_date;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	public void setAc_enable(char ac_enable) {
		this.ac_enable = ac_enable;
	}

	public int getAttendance_id() {
		return attendance_id;
	}

	public void setAttendance_id(int attendance_id) {
		this.attendance_id = attendance_id;
	}

	public String getAt_reason() {
		return at_reason;
	}

	public void setAt_reason(String at_reason) {
		this.at_reason = at_reason;
	}

	public String getAttendance_status() {
		return attendance_status;
	}

	public void setAttendance_status(String attendance_status) {
		this.attendance_status = attendance_status;
	}

	public int getClient_id() {
		return client_id;
	}

	public void setClient_id(int client_id) {
		this.client_id = client_id;
	}

	public String getCl_type() {
		return cl_type;
	}

	public void setCl_type(String cl_type) {
		this.cl_type = cl_type;
	}

	public String getCl_name() {
		return cl_name;
	}

	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}

	public String getCeo_name() {
		return ceo_name;
	}

	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}

	public String getCl_email() {
		return cl_email;
	}

	public void setCl_email(String cl_email) {
		this.cl_email = cl_email;
	}

	public String getCl_address() {
		return cl_address;
	}

	public void setCl_address(String cl_address) {
		this.cl_address = cl_address;
	}

	public String getCl_detail_address() {
		return cl_detail_address;
	}

	public void setCl_detail_address(String cl_detail_address) {
		this.cl_detail_address = cl_detail_address;
	}

	public String getCl_zip_code() {
		return cl_zip_code;
	}

	public void setCl_zip_code(String cl_zip_code) {
		this.cl_zip_code = cl_zip_code;
	}

	public String getCl_phone() {
		return cl_phone;
	}

	public void setCl_phone(String cl_phone) {
		this.cl_phone = cl_phone;
	}
	
	public int getConsumable_expense() {
		return consumable_expense;
	}

	public void setConsumable_expense(int consumable_expense) {
		this.consumable_expense = consumable_expense;
	}

	public int getCommunication_expense() {
		return communication_expense;
	}

	public void setCommunication_expense(int communication_expense) {
		this.communication_expense = communication_expense;
	}

	public int getEntertainment_expense() {
		return entertainment_expense;
	}

	public void setEntertainment_expense(int entertainment_expense) {
		this.entertainment_expense = entertainment_expense;
	}

	public int getAdministrative_expense() {
		return administrative_expense;
	}

	public void setAdministrative_expense(int administrative_expense) {
		this.administrative_expense = administrative_expense;
	}


	public String getCl_status() {
		return cl_status;
	}

	public void setCl_status(String cl_status) {
		this.cl_status = cl_status;
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public String getDe_name() {
		return de_name;
	}

	public void setDe_name(String de_name) {
		this.de_name = de_name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getDe_address() {
		return de_address;
	}

	public void setDe_address(String de_address) {
		this.de_address = de_address;
	}

	public String getDe_detail_address() {
		return de_detail_address;
	}

	public void setDe_detail_address(String de_detail_address) {
		this.de_detail_address = de_detail_address;
	}

	public String getDe_zip_code() {
		return de_zip_code;
	}

	public void setDe_zip_code(String de_zip_code) {
		this.de_zip_code = de_zip_code;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getRegister_num() {
		return register_num;
	}

	public void setRegister_num(String register_num) {
		this.register_num = register_num;
	}

	public Date getCl_register_date() {
		return cl_register_date;
	}

	public void setCl_register_date(Date cl_register_date) {
		this.cl_register_date = cl_register_date;
	}

	public String getEm_name() {
		return em_name;
	}

	public void setEm_name(String em_name) {
		this.em_name = em_name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getRegister_number() {
		return register_number;
	}

	public void setRegister_number(String register_number) {
		this.register_number = register_number;
	}

	public String getEm_phone() {
		return em_phone;
	}

	public void setEm_phone(String em_phone) {
		this.em_phone = em_phone;
	}

	public String getEm_email() {
		return em_email;
	}

	public void setEm_email(String em_email) {
		this.em_email = em_email;
	}

	public Date getHire_date() {
		return hire_date;
	}

	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}

	public String getEm_address() {
		return em_address;
	}

	public void setEm_address(String em_address) {
		this.em_address = em_address;
	}

	public String getEm_detail_address() {
		return em_detail_address;
	}

	public void setEm_detail_address(String em_detail_address) {
		this.em_detail_address = em_detail_address;
	}

	public String getEm_zip_code() {
		return em_zip_code;
	}

	public void setEm_zip_code(String em_zip_code) {
		this.em_zip_code = em_zip_code;
	}

	public String getEm_status() {
		return em_status;
	}

	public void setEm_status(String em_status) {
		this.em_status = em_status;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public int getAnnual_count() {
		return annual_count;
	}

	public void setAnnual_count(int annual_count) {
		this.annual_count = annual_count;
	}

	public int getInbound_id() {
		return inbound_id;
	}

	public void setInbound_id(int inbound_id) {
		this.inbound_id = inbound_id;
	}

	public Date getInbound_date() {
		return inbound_date;
	}

	public void setInbound_date(Date inbound_date) {
		this.inbound_date = inbound_date;
	}

	public int getSlip_id() {
		return slip_id;
	}

	public void setSlip_id(int slip_id) {
		this.slip_id = slip_id;
	}

	public String getSl_type() {
		return sl_type;
	}

	public void setSl_type(String sl_type) {
		this.sl_type = sl_type;
	}

	public Date getSl_register_date() {
		return sl_register_date;
	}

	public void setSl_register_date(Date sl_register_date) {
		this.sl_register_date = sl_register_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getPosition_id() {
		return position_id;
	}

	public void setPosition_id(int position_id) {
		this.position_id = position_id;
	}

	public String getPo_name() {
		return po_name;
	}

	public void setPo_name(String po_name) {
		this.po_name = po_name;
	}

	public int getYears() {
		return years;
	}

	public void setYears(int years) {
		this.years = years;
	}

	public int getTaxtion_id() {
		return taxtion_id;
	}

	public void setTaxtion_id(int taxtion_id) {
		this.taxtion_id = taxtion_id;
	}

	public int getOvertime_pay() {
		return overtime_pay;
	}

	public void setOvertime_pay(int overtime_pay) {
		this.overtime_pay = overtime_pay;
	}

	public int getBonus_pay() {
		return bonus_pay;
	}

	public void setBonus_pay(int bonus_pay) {
		this.bonus_pay = bonus_pay;
	}

	public int getHolyday_pay() {
		return holyday_pay;
	}

	public void setHolyday_pay(int holyday_pay) {
		this.holyday_pay = holyday_pay;
	}

	public int getPosition_pay() {
		return position_pay;
	}

	public void setPosition_pay(int position_pay) {
		this.position_pay = position_pay;
	}

	public int getNon_taxtion_id() {
		return non_taxtion_id;
	}

	public void setNon_taxtion_id(int non_taxtion_id) {
		this.non_taxtion_id = non_taxtion_id;
	}

	public int getMeel_fee() {
		return meel_fee;
	}

	public void setMeel_fee(int meel_fee) {
		this.meel_fee = meel_fee;
	}

	public int getDrive_fee() {
		return drive_fee;
	}

	public void setDrive_fee(int drive_fee) {
		this.drive_fee = drive_fee;
	}

	public int getChild_fee() {
		return child_fee;
	}

	public void setChild_fee(int child_fee) {
		this.child_fee = child_fee;
	}

	public int getTax_id() {
		return tax_id;
	}

	public void setTax_id(int tax_id) {
		this.tax_id = tax_id;
	}

	public int getIncome_tax() {
		return income_tax;
	}

	public void setIncome_tax(int income_tax) {
		this.income_tax = income_tax;
	}

	public int getLocal_income_tax() {
		return local_income_tax;
	}

	public void setLocal_income_tax(int local_income_tax) {
		this.local_income_tax = local_income_tax;
	}

	public int getNational_pension() {
		return national_pension;
	}

	public void setNational_pension(int national_pension) {
		this.national_pension = national_pension;
	}

	public int getHealth_insurance() {
		return health_insurance;
	}

	public void setHealth_insurance(int health_insurance) {
		this.health_insurance = health_insurance;
	}

	public int getEmployment_insurance() {
		return employment_insurance;
	}

	public void setEmployment_insurance(int employment_insurance) {
		this.employment_insurance = employment_insurance;
	}

	public int getLong_term_care() {
		return long_term_care;
	}

	public void setLong_term_care(int long_term_care) {
		this.long_term_care = long_term_care;
	}

	public int getSalary_id() {
		return salary_id;
	}

	public void setSalary_id(int salary_id) {
		this.salary_id = salary_id;
	}

	public int getBasic_salary() {
		return basic_salary;
	}

	public void setBasic_salary(int basic_salary) {
		this.basic_salary = basic_salary;
	}

	public String getPayday() {
		return payday;
	}

	public void setPayday(String payday) {
		this.payday = payday;
	}

	public char getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(char payment_status) {
		this.payment_status = payment_status;
	}

	public int getRequest_id() {
		return request_id;
	}

	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}

	public Date getBegin_date() {
		return begin_date;
	}

	public void setBegin_date(Date begin_date) {
		this.begin_date = begin_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getRe_type() {
		return re_type;
	}

	public void setRe_type(String re_type) {
		this.re_type = re_type;
	}

	public String getRe_status() {
		return re_status;
	}

	public void setRe_status(String re_status) {
		this.re_status = re_status;
	}

	public String getRe_memo() {
		return re_memo;
	}

	public void setRe_memo(String re_memo) {
		this.re_memo = re_memo;
	}

	public int getRd_id() {
		return rd_id;
	}

	public void setRd_id(int rd_id) {
		this.rd_id = rd_id;
	}

	public int getRe_qty() {
		return re_qty;
	}

	public void setRe_qty(int re_qty) {
		this.re_qty = re_qty;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPr_register_date() {
		return pr_register_date;
	}

	public void setPr_register_date(Date pr_register_date) {
		this.pr_register_date = pr_register_date;
	}

	public char getPr_enable() {
		return pr_enable;
	}

	public void setPr_enable(char pr_enable) {
		this.pr_enable = pr_enable;
	}

	public int getOutbound_id() {
		return outbound_id;
	}

	public void setOutbound_id(int outbound_id) {
		this.outbound_id = outbound_id;
	}

	public Date getOutbound_date() {
		return outbound_date;
	}

	public void setOutbound_date(Date outbound_date) {
		this.outbound_date = outbound_date;
	}

	public int getWh_id() {
		return wh_id;
	}

	public void setWh_id(int wh_id) {
		this.wh_id = wh_id;
	}

	public String getWa_name() {
		return wa_name;
	}

	public void setWa_name(String wa_name) {
		this.wa_name = wa_name;
	}

	public String getWa_address() {
		return wa_address;
	}

	public void setWa_address(String wa_address) {
		this.wa_address = wa_address;
	}

	public String getWa_detail_address() {
		return wa_detail_address;
	}

	public void setWa_detail_address(String wa_detail_address) {
		this.wa_detail_address = wa_detail_address;
	}

	public String getWa_zip_code() {
		return wa_zip_code;
	}

	public void setWa_zip_code(String wa_zip_code) {
		this.wa_zip_code = wa_zip_code;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public String getWa_status() {
		return wa_status;
	}

	public void setWa_status(String wa_status) {
		this.wa_status = wa_status;
	}

	public int getLack_code() {
		return lack_code;
	}

	public void setLack_code(int lack_code) {
		this.lack_code = lack_code;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getLa_qty() {
		return la_qty;
	}

	public void setLa_qty(int la_qty) {
		this.la_qty = la_qty;
	}

	public int getSale_slip_id() {
		return sale_slip_id;
	}

	public void setSale_slip_id(int sale_slip_id) {
		this.sale_slip_id = sale_slip_id;
	}

	public String getSa_account_title() {
		return sa_account_title;
	}

	public void setSa_account_title(String sa_account_title) {
		this.sa_account_title = sa_account_title;
	}

	public int getSupply_amount() {
		return supply_amount;
	}

	public void setSupply_amount(int supply_amount) {
		this.supply_amount = supply_amount;
	}

	public int getTax_amount() {
		return tax_amount;
	}

	public void setTax_amount(int tax_amount) {
		this.tax_amount = tax_amount;
	}

	public String getSa_type() {
		return sa_type;
	}

	public void setSa_type(String sa_type) {
		this.sa_type = sa_type;
	}

	public String getSa_abstract() {
		return sa_abstract;
	}

	public void setSa_abstract(String sa_abstract) {
		this.sa_abstract = sa_abstract;
	}

	public String getTransaction() {
		return transaction;
	}

	public void setTransaction(String transaction) {
		this.transaction = transaction;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public Timestamp getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Timestamp regi_date) {
		this.regi_date = regi_date;
	}

	public String getTr_memo() {
		return tr_memo;
	}

	public void setTr_memo(String tr_memo) {
		this.tr_memo = tr_memo;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getIn_account_number() {
		return in_account_number;
	}

	public void setIn_account_number(String in_account_number) {
		this.in_account_number = in_account_number;
	}

	public String getOut_account_number() {
		return out_account_number;
	}

	public void setOut_account_number(String out_account_number) {
		this.out_account_number = out_account_number;
	}

	public String getOe_id() {
		return oe_id;
	}

	public void setOe_id(String oe_id) {
		this.oe_id = oe_id;
	}

	public String getOp_account_title() {
		return op_account_title;
	}

	public void setOp_account_title(String op_account_title) {
		this.op_account_title = op_account_title;
	}

	public int getExpenses() {
		return expenses;
	}

	public void setExpenses(int expenses) {
		this.expenses = expenses;
	}

	public String getOp_abstract() {
		return op_abstract;
	}

	public void setOp_abstract(String op_abstract) {
		this.op_abstract = op_abstract;
	}


	public Date getWa_reg_date() {
		return wa_reg_date;
	}

	public void setWa_reg_date(Date wa_reg_date) {
		this.wa_reg_date = wa_reg_date;
	}

	public String getBank_password() {
		return bank_password;
	}

	public void setBank_password(String bank_password) {
		this.bank_password = bank_password;
	}

	public int getTransportation_fee() {
		return transportation_fee;
	}

	public void setTransportation_fee(int transportation_fee) {
		this.transportation_fee = transportation_fee;
	}

	public int getAmount_pay() {
		return amount_pay;
	}

	public void setAmount_pay(int amount_pay) {
		this.amount_pay = amount_pay;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}

	public int getNet_pay() {
		return net_pay;
	}

	public void setNet_pay(int net_pay) {
		this.net_pay = net_pay;
	}

	public String getInbound_status() {
		return inbound_status;
	}

	public void setInbound_status(String inbound_status) {
		this.inbound_status = inbound_status;
	}

	public String getOutbound_status() {
		return outbound_status;
	}

	public void setOutbound_status(String outbound_status) {
		this.outbound_status = outbound_status;
	}

	@Override
	public String toString() {
		return "AssembleDTO [bank_assets=" + bank_assets + ", trade_receivable=" + trade_receivable + ", inventory="
				+ inventory + ", vat_payment=" + vat_payment + ", trade_payable=" + trade_payable + ", vat_deposit="
				+ vat_deposit + ", capital=" + capital + ", take_sales=" + take_sales + ", beginning_inventory="
				+ beginning_inventory + ", current_inventory=" + current_inventory + ", ending_inventory="
				+ ending_inventory + ", total_salary=" + total_salary + ", travel_expense=" + travel_expense
				+ ", consumable_expense=" + consumable_expense + ", communication_expense=" + communication_expense
				+ ", entertainment_expense=" + entertainment_expense + ", administrative_expense="
				+ administrative_expense + ", account_number=" + account_number + ", bank=" + bank + ", ac_name="
				+ ac_name + ", account_name=" + account_name + ", balance=" + balance + ", purpose=" + purpose
				+ ", ac_enable=" + ac_enable + ", bank_password=" + bank_password + ", attendance_id=" + attendance_id
				+ ", at_start_date=" + at_start_date + ", at_reason=" + at_reason + ", at_end_date=" + at_end_date
				+ ", color=" + color + ", attendance_status=" + attendance_status + ", client_id=" + client_id
				+ ", cl_type=" + cl_type + ", cl_name=" + cl_name + ", ceo_name=" + ceo_name + ", cl_email=" + cl_email
				+ ", cl_address=" + cl_address + ", cl_detail_address=" + cl_detail_address + ", cl_zip_code="
				+ cl_zip_code + ", register_num=" + register_num + ", cl_phone=" + cl_phone + ", cl_register_date="
				+ cl_register_date + ", cl_status=" + cl_status + ", account_id=" + account_id + ", department_id="
				+ department_id + ", de_name=" + de_name + ", tel=" + tel + ", de_address=" + de_address
				+ ", de_detail_address=" + de_detail_address + ", de_zip_code=" + de_zip_code + ", employee_id="
				+ employee_id + ", em_name=" + em_name + ", photo=" + photo + ", register_number=" + register_number
				+ ", em_phone=" + em_phone + ", em_email=" + em_email + ", hire_date=" + hire_date + ", em_address="
				+ em_address + ", em_detail_address=" + em_detail_address + ", em_zip_code=" + em_zip_code
				+ ", em_status=" + em_status + ", password=" + password + ", salary=" + salary + ", authority="
				+ authority + ", annual_count=" + annual_count + ", inbound_id=" + inbound_id + ", inbound_date="
				+ inbound_date + ", inbound_status=" + inbound_status + ", slip_id=" + slip_id + ", sl_type=" + sl_type
				+ ", sl_register_date=" + sl_register_date + ", update_date=" + update_date + ", state=" + state
				+ ", position_id=" + position_id + ", po_name=" + po_name + ", years=" + years + ", taxtion_id="
				+ taxtion_id + ", overtime_pay=" + overtime_pay + ", bonus_pay=" + bonus_pay + ", transportation_fee="
				+ transportation_fee + ", holyday_pay=" + holyday_pay + ", position_pay=" + position_pay
				+ ", non_taxtion_id=" + non_taxtion_id + ", meel_fee=" + meel_fee + ", drive_fee=" + drive_fee
				+ ", child_fee=" + child_fee + ", tax_id=" + tax_id + ", income_tax=" + income_tax
				+ ", local_income_tax=" + local_income_tax + ", national_pension=" + national_pension
				+ ", health_insurance=" + health_insurance + ", employment_insurance=" + employment_insurance
				+ ", long_term_care=" + long_term_care + ", salary_id=" + salary_id + ", basic_salary=" + basic_salary
				+ ", payday=" + payday + ", payment_status=" + payment_status + ", request_id=" + request_id
				+ ", begin_date=" + begin_date + ", end_date=" + end_date + ", re_type=" + re_type + ", re_status="
				+ re_status + ", re_memo=" + re_memo + ", rd_id=" + rd_id + ", re_qty=" + re_qty + ", category="
				+ category + ", product_id=" + product_id + ", pr_name=" + pr_name + ", cost=" + cost + ", price="
				+ price + ", pr_register_date=" + pr_register_date + ", pr_enable=" + pr_enable + ", outbound_id="
				+ outbound_id + ", outbound_date=" + outbound_date + ", outbound_status=" + outbound_status + ", wh_id="
				+ wh_id + ", wa_name=" + wa_name + ", wa_address=" + wa_address + ", wa_detail_address="
				+ wa_detail_address + ", wa_zip_code=" + wa_zip_code + ", volume=" + volume + ", wa_status=" + wa_status
				+ ", wa_reg_date=" + wa_reg_date + ", lack_code=" + lack_code + ", location=" + location + ", la_qty="
				+ la_qty + ", sale_slip_id=" + sale_slip_id + ", sa_account_title=" + sa_account_title
				+ ", supply_amount=" + supply_amount + ", tax_amount=" + tax_amount + ", sa_type=" + sa_type
				+ ", sa_abstract=" + sa_abstract + ", transaction=" + transaction + ", money=" + money + ", regi_date="
				+ regi_date + ", tr_memo=" + tr_memo + ", subject=" + subject + ", in_account_number="
				+ in_account_number + ", out_account_number=" + out_account_number + ", oe_id=" + oe_id
				+ ", op_account_title=" + op_account_title + ", expenses=" + expenses + ", op_abstract=" + op_abstract
				+ ", amount_pay=" + amount_pay + ", tax=" + tax + ", net_pay=" + net_pay + ", lackList=" + lackList
				+ "]";
	}
}

