package com.spring.team_one.dao;

import java.util.List;
import java.util.Map;

import com.spring.team_one.dto.AssembleDTO;

public interface HJDao {
   
   // 부서목록
   public List<AssembleDTO> dept_list();
   
   // 부서명
   public String dept_name(int department_id);
   
   // 부서상세
   public List<AssembleDTO> dept_detail(int department_id);
   
   // 부서추가
   public int dept_insert(AssembleDTO dto);
   
   // 인사카드목록
   public List<AssembleDTO> emp_list();
   
   // 인사카드추가
   public int emp_insert(AssembleDTO dto);
   
   // 계좌추가
   public int emp_account(AssembleDTO dto);
   
   // 직급목록
   public List<AssembleDTO> emp_position();
   
   // 인사카드상세
   public AssembleDTO emp_detail(String employee_id);
   
   // 인사카드수정처리
   public int emp_update_action(AssembleDTO dto);   
   
   // 사번중복체크 - ajax
   public int employee_id_check(String employee_id);
   
   // 계좌중복체크 - ajax
   public int account_submit_check(String account_number);
   
   // -------------------- 근태관리
   // 근태조회
   public List<AssembleDTO> attend_list(String date);
   
   // 근태조회2
   public List<AssembleDTO> attend_list_today();
   
   // 근태승인(휴가)
   public List<AssembleDTO> attend_update();
   
   // 근태승인처리
   public int attend_update_action(int attendance_id);
   
   // 휴가일수차감
   public int attend_update_count(int attendance_id);
   
   // 급여목록
   public List<AssembleDTO> salary_list(String payday);
   
   // 급여목록2
   public List<AssembleDTO> salary_list_today();
   
   // 급여지급일
   public String salary_payday(String payday);
   
   // 급여 과세수정
   public int salary_taxtion(AssembleDTO dto);
   
   // 급여 비과세수정
   public int salary_nontaxtion(AssembleDTO dto);
   
   // 급여 세금수정
   public int salary_tax(AssembleDTO dto);
   
   // 요청 사원목록   
   public List<AssembleDTO> req_emp(String payday);
   
   // 요청 사원목록2   
   public List<AssembleDTO> req_emp_today();
   
   // 급여승인요청1
   public int salary_request1(String employee_id);
   
   // 급여승인요청2
   public int salary_request2(Map<String, Object> map);
   
   // 급여승인요청3
   public int salary_request3();
   
    // 급여관련비용 요청목록
    public List<AssembleDTO> salary_request_list(String employee_id);

    // 급여 요청 승인
    public int salary_request_update(int request_id);
   
   // 급여테이블 생성
   public int salary_insert(String employee_id);
   
   // 급여상태수정
   public int salary_status(int salary);
   
   // 급여명세서
   public AssembleDTO salary_detail(Map<String, Object> map);
   
}