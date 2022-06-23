package com.spring.team_one.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.team_one.dto.AssembleDTO;

@Repository
public class HJDaoImpl implements HJDao {
   
   @Autowired
   SqlSession sqlSession;

   // -------------------- 부서
   // 부서목록
   @Override
   public List<AssembleDTO> dept_list() {
      
      System.out.println("dao - 부서목록");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.dept_list();
   }

   // 부서명
   @Override
   public String dept_name(int department_id) {
      
      System.out.println("dao - 부서명");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.dept_name(department_id);
   }

   // 부서상세
   @Override
   public List<AssembleDTO> dept_detail(int department_id) {
      
      System.out.println("dao - 부서상세");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.dept_detail(department_id);
   }

   // 부서추가
   @Override
   public int dept_insert(AssembleDTO dto) {
      
      System.out.println("dao - 부서추가");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.dept_insert(dto);
   }

   // -------------------- 인사카드
   // 인사카드목록
   @Override
   public List<AssembleDTO> emp_list() {
      
      System.out.println("dao - 인사카드목록");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.emp_list();
   }

   // 인사카드추가
   @Override
   public int emp_insert(AssembleDTO dto) {
      
      System.out.println("dao - 인사카드추가");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.emp_insert(dto);
   }

   // 계좌추가
   @Override
   public int emp_account(AssembleDTO dto) {
      
      System.out.println("dao - 계좌추가");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.emp_account(dto);
   }

   // 인사카드상세
   @Override
   public AssembleDTO emp_detail(String employee_id) {
      
      System.out.println("dao - 인사카드상세");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.emp_detail(employee_id);
   }

   // 직급목록
   @Override
   public List<AssembleDTO> emp_position() {
      
      System.out.println("dao - 인사카드추가 직급");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.emp_position();
   }

   // 인사카드수정처리
   @Override
   public int emp_update_action(AssembleDTO dto) {

      System.out.println("dao - 인사카드수정처리");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.emp_update_action(dto);
   }

   // 사번 중복 체크
   @Override
   public int employee_id_check(String employee_id) {
      System.out.println("dao - 사번 중복 체크");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.employee_id_check(employee_id);
   }

   // 계좌 중복 체크 
   @Override
   public int account_submit_check(String account_number) {
      System.out.println("dao - 계좌 중복 체크");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.account_submit_check(account_number);
   }

   // -------------------- 근태관리
   // 근태조회
   @Override
   public List<AssembleDTO> attend_list(String date) {

      System.out.println("dao - 근태조회");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.attend_list(date);
   }

   // 근태조회2
   @Override
   public List<AssembleDTO> attend_list_today() {
      
      System.out.println("dao - 근태조회");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.attend_list_today();
   }

   // 근태승인(휴가)
   @Override
   public List<AssembleDTO> attend_update() {
      
      System.out.println("dao - 근태조회");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.attend_update();
   }

   // 근태승인처리
   @Override
   public int attend_update_action(int attendance_id) {
      
      System.out.println("dao - 근태승인처리");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.attend_update_action(attendance_id);
   }

   // 휴가일수차감
   @Override
   public int attend_update_count(int attendance_id) {

      System.out.println("dao - 휴가일수차감");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.attend_update_count(attendance_id);
   }

   // -------------------- 급여관리
   // 급여목록
   @Override
   public List<AssembleDTO> salary_list(String payday) {
      
      System.out.println("dao - 급여목록");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_list(payday);
   }

   // 급여목록2
   @Override
   public List<AssembleDTO> salary_list_today() {
      
      System.out.println("dao - 급여목록2");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_list_today();
   }

   // 급여지급일
   @Override
   public String salary_payday(String payday) {
      
      System.out.println("dao - 급여목록2");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_payday(payday);
   }

   // 급여 과세수정
   @Override
   public int salary_taxtion(AssembleDTO dto) {

      System.out.println("dao - 급여 과세수정");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_taxtion(dto);
   }

   // 급여 비과세수정
   @Override
   public int salary_nontaxtion(AssembleDTO dto) {

      System.out.println("dao - 급여 비과세수정");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_nontaxtion(dto);
   }

   // 급여 세금수정
   @Override
   public int salary_tax(AssembleDTO dto) {

      System.out.println("dao - 급여 세금수정");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_tax(dto);
   }
   
   // 요청 사원목록   
   @Override
   public List<AssembleDTO> req_emp(String payday) {
      
      System.out.println("dao - 요청 사원목록");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.req_emp(payday);
   }

   // 요청 사원목록2
   @Override
   public List<AssembleDTO> req_emp_today() {
      
      System.out.println("dao - 요청 사원목록");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.req_emp_today();
   }
   
   // 급여승인요청1   
   @Override
   public int salary_request1(String employee_id) {
      
      System.out.println("dao - 급여승인요청1");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_request1(employee_id);
   }

   // 급여승인요청2
   @Override
   public int salary_request2(Map<String, Object> map) {
      
      System.out.println("dao - 급여승인요청2");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_request2(map);
   }

   // 급여승인요청3
   @Override
   public int salary_request3() {
      
      System.out.println("dao - 급여승인요청3");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_request3();
   }
   
   // 급여관련비용 요청목록
   @Override
   public List<AssembleDTO> salary_request_list(String employee_id) {
      
      System.out.println("dao - 급여요청목록");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_request_list(employee_id);
   }

   // 급여요청 승인
   @Override
   public int salary_request_update(int request_id) {
      System.out.println("dao - 급여요청승인");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_request_update(request_id);
   }

   // 급여테이블 생성
   @Override
   public int salary_insert(String employee_id) {
      
      System.out.println("dao - 급여테이블 생성");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_insert(employee_id);
   }

   // 급여상태수정
   @Override
   public int salary_status(int salary) {
      
      System.out.println("dao - 급여상태수정");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_status(salary);
   }

   // 급여명세서
   @Override
   public AssembleDTO salary_detail(Map<String, Object> map) {
      
      System.out.println("dao - 급여명세서");
      
      HJDao dao = sqlSession.getMapper(HJDao.class);
      return dao.salary_detail(map);
   }

}