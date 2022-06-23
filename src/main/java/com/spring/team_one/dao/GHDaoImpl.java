package com.spring.team_one.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.spring.team_one.dto.AssembleDTO;

//테스트 Dao
@Repository
public class GHDaoImpl{

	@Autowired
	SqlSession sqlSession;
	
	@Autowired   
	BCryptPasswordEncoder passwordEncoder;

	// 내정보조회
	public AssembleDTO myInfo_detail(String emp_id) {
		return sqlSession.selectOne("com.spring.team_one.dao.GHDaoImpl.my_info", emp_id);
	}
	
	// 내정보조회
	public String my_account(String ID) {
		return sqlSession.selectOne("com.spring.team_one.dao.GHDaoImpl.my_account", ID);
	}
	
	// 비밀번호확인
	public int pw_update_chk(String id,String pw) {
		
		String PW = sqlSession.selectOne("com.spring.team_one.dao.GHDaoImpl.pw_chk",id);
		
		int i = 0;
		
		if(passwordEncoder.matches(pw, PW)) {
			i = 1;
		}
		
		return i;
	}

	// 비밀번호 변경
	public int pw_update_action(Map<String,Object> map) {
		
		return sqlSession.update("com.spring.team_one.dao.GHDaoImpl.pw_update_action", map);
	}
	
	// 내정보 수정
	public int update_info(AssembleDTO dto) {
		return sqlSession.update("com.spring.team_one.dao.GHDaoImpl.info_update_action",dto);
	}

	
	// 급여 목록
	public List<AssembleDTO> my_salary_list(String id) {
		
		
		return sqlSession.selectList("com.spring.team_one.dao.GHDaoImpl.my_salary_list",id);
	}

	// 급여 상세
	public AssembleDTO my_salary_detail(int salary_id) {
		
		return sqlSession.selectOne("com.spring.team_one.dao.GHDaoImpl.my_salary_detail", salary_id);
	}
	
	// 급여요청
	public int salary_request(Map<String, Object> map) {
		
		return sqlSession.insert("com.spring.team_one.dao.GHDaoImpl.salary_request",map);
	}
	
	// 비용요청
	public int cost_request(Map<String, Object> map) {
		
		return sqlSession.insert("com.spring.team_one.dao.GHDaoImpl.cost_request",map);
	}
		
	// 비용요청2
	public int cost_slip() {
		
		return sqlSession.insert("com.spring.team_one.dao.GHDaoImpl.cost_slip");
	}
		
	// 비용요청3
	public int cost_oe(Map<String, Object> map) {
		
		return sqlSession.insert("com.spring.team_one.dao.GHDaoImpl.cost_oe",map);
	}
	
	// 계좌번호
	public String account_number(String employee_id) {
		return sqlSession.selectOne("com.spring.team_one.dao.GHDaoImpl.account_number",employee_id);
	}
	
	// 요청 목록
	public List<AssembleDTO> request_list(String id) {
		
		return sqlSession.selectList("com.spring.team_one.dao.GHDaoImpl.request_list",id);
	}
	
	
}
