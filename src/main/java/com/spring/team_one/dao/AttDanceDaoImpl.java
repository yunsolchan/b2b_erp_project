package com.spring.team_one.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.team_one.dto.AssembleDTO;

@Repository
public class AttDanceDaoImpl implements AttDanceDao {

	@Autowired
	SqlSession sqlSession;
	
	//근테테이블 정보 호출 -> 캘린더
	@Override
	public List<AssembleDTO> attdance_calen_list(String sessionID) {
		
 		AttDanceDao dao = sqlSession.getMapper(AttDanceDao.class);
 		List<AssembleDTO> calen = dao.attdance_calen_list(sessionID);
 		System.out.println("dao-chart : " + calen );
	
 		return calen; 
	}
	
	//근태 정보 입력 -> 캘린더(fullCalendar)
	@Override
	/*
	 * public int attdance_calen_insert(List<AssembleDTO> list) {
	 * System.out.println("DAO:attdance_calen_lnsert 진입");
	 * System.out.println("매퍼 진입전 list " + list); int insertCnt = 0; //AttDanceDao
	 * dao = sqlSession.getMapper(AttDanceDao.class); for(int i= 0; i < list.size();
	 * i++) {
	 * 
	 * AssembleDTO dto = list.get(i); System.out.println("매퍼보내는 list " + list);
	 * insertCnt +=
	 * sqlSession.insert("com.spring.team_one.dao.attdance_calen_insert", dto); }
	 * 
	 * return insertCnt; }
	 */
	//휴가정보 입력
	public int attdance_calen_insert(AssembleDTO dto) {
		System.out.println("DAO:attdance_calen_lnsert 진입");
		System.out.println("매퍼 진입전 dto " + dto);
		//int insertCnt = 0;
		AttDanceDao dao = sqlSession.getMapper(AttDanceDao.class);
		int insertCnt = dao.attdance_calen_insert(dto);
		//insertCnt = sqlSession.insert("com.spring.team_one.dao.attdance_calen_insert", dto);
		
		
		return insertCnt;
	}
	
	//개인 출/퇴근 정보 호출
	@Override
	public List<AssembleDTO> per_attdance_list(String sessionID) {
		
 		AttDanceDao dao = sqlSession.getMapper(AttDanceDao.class);
 		List<AssembleDTO> list = dao.per_attdance_list(sessionID);
	
 		System.out.println("개인 출/퇴근 정보 호출 : " + list );
 		return list; 
	}
	
	//개인 별 출근 정보 입력
	@Override
	public int per_attdance_list_insert(AssembleDTO dto) {
		
 		AttDanceDao dao = sqlSession.getMapper(AttDanceDao.class);
 		int insertCnt= dao.per_attdance_list_insert(dto);
	
 		System.out.println("개인 출/퇴근 정보 입력 성공 여부 : " + insertCnt );
 		return insertCnt; 
	}

	//개인 별 퇴근 정보 업데이트 
	@Override
	public int per_attdance_list_update(AssembleDTO dto) {
		System.out.println("dao : 개인 별 퇴근 정보 업데이트  ");
 		AttDanceDao dao = sqlSession.getMapper(AttDanceDao.class);
 		int updateCnt= dao.per_attdance_list_update(dto);
	
 		System.out.println("개인 별 퇴근 정보 업데이트 " + updateCnt );
 		return updateCnt; 
	}
	
	
	
	
}
