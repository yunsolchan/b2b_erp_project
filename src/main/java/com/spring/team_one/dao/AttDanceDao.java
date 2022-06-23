package com.spring.team_one.dao;

import java.util.List;

import com.spring.team_one.dto.AssembleDTO;

public interface AttDanceDao {
	
	//근태 캘린더 호출
	public List<AssembleDTO> attdance_calen_list(String sessionID);
	
	//근태 정보 입력 -> 캘린더(fullCalendar)
	//public int attdance_calen_insert(List<AssembleDTO> list);
	public int attdance_calen_insert(AssembleDTO dto);
	
	//개인 출/퇴근 정보 호출
	public List<AssembleDTO> per_attdance_list(String sessionID);
	
	//개인  별 출근 정보 입력
	public int per_attdance_list_insert(AssembleDTO dto);
	
	//개인 별 퇴근 정보 입력
	public int per_attdance_list_update(AssembleDTO dto);

}
