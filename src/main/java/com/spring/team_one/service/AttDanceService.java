package com.spring.team_one.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.springframework.ui.Model;

public interface AttDanceService {

	
	//근태 캘린더 호출
	public JSONArray attdance_calen_lnfo(HttpServletRequest req, Model model) throws ParseException;	
	
	//근태 캘린더 입력
	
	//public void attdance_calen_insert(List<Object> param , HttpServletRequest req, Model model);
	public void attdance_calen_insert(List<Map<String, Object>> param , HttpServletRequest req, Model model);

	//개인 출/퇴근 정보 호출
	public void per_attend_list_call(HttpServletRequest req, Model model);
	
	//개인 별 출근 정보 입력
	public void per_attend_list_insert(HttpServletRequest req, Model model);
	
	//개인 별 퇴근 정보 입력
	public void per_attend_list_update(HttpServletRequest req, Model model);
}
