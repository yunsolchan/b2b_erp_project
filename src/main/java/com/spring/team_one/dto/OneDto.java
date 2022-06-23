package com.spring.team_one.dto;

import java.util.Date;

// 테스트 회원 DTO
public class OneDto {
	
//	EMPLOYEE_ID varchar2(100) PRIMARY KEY, -- 사번
//	   NAME varchar2(100) NOT NULL, -- 이름
//	   PHOTO varchar2(500) NOT NULL, -- 사진
//	   REGISTER_NUMBER VARCHAR2(14) NOT NULL, -- 주민등록번호
//	   PHONE varchar2(13) NOT NULL, -- 연락처
//	   EMAIL varchar2(100) NOT NULL, -- 이메일
//	   HIRE_DATE date NOT NULL, -- 입사일 (사원추가시 등록 SYSDATE X)
//	   ADDRESS varchar2(100) NOT NULL, -- 주소
//	   DETAIL_ADDRESS varchar2(100) NOT NULL, -- 상세주소
//	   ZIP_CODE varchar2(5) NOT NULL, -- 우편번호
//	   STATUS varchar2(100) DEFAULT '재직', -- 근무상태 (재직 퇴직 휴직)
//	   PASSWORD varchar2(100) NOT NULL, -- 로그인시 필요한 비밀번호
//	   SALARY number, -- 기본연봉
//	   authority varchar2(50) not null, -- 시큐리티
//	   POSITION_ID number NOT NULL, -- 직급코드
//	   DEPARTMENT_ID number NOT NULL, -- 부서코드
//	   ACCOUNT_ID number, -- 계좌코드

	private String employee_id;
	private String name;
	private String photo;
	private String register_number;
	private String phone;
	private String email;
	private String address;
	private String detail_address;
	private String zip_code;
	private String password;
	private String authority;
	private Date hire_date;
	private int salary;
	private int position_id;
	private int department_id;
	private int account_id;
	
	
	public OneDto() {	}
	
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getPosition_id() {
		return position_id;
	}
	public void setPosition_id(int position_id) {
		this.position_id = position_id;
	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	
	@Override
	public String toString() {
		return "OneDto [employee_id=" + employee_id + ", name=" + name + ", photo=" + photo + ", register_number="
				+ register_number + ", phone=" + phone + ", email=" + email + ", address=" + address
				+ ", detail_address=" + detail_address + ", zip_code=" + zip_code + ", password=" + password
				+ ", authority=" + authority + ", hire_date=" + hire_date + ", salary=" + salary + ", position_id="
				+ position_id + ", department_id=" + department_id + ", account_id=" + account_id + "]";
	}
	
	
	
}
