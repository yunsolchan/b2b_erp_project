package com.spring.team_one.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.team_one.service.AttDanceService;

@Controller
public class ControllerKIM {

	@Autowired
	AttDanceService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ControllerKIM.class);
	
	// 근태신청화면
	@RequestMapping("attendance.is")
	public String attendance(HttpServletRequest req, Model model) throws ParseException {
		logger.info("[url : attendance.is]");
		return "ATTENDANCE/attendance";
	}
	
	//근태 정보 호출 -> 캘린더(fullCalendar)
	@ResponseBody
	@RequestMapping("calender_call_ajax.is")
	public JSONArray ajax(HttpServletRequest req, Model model) throws ParseException {
		logger.info("[url : calender_call_ajax.is]");
		return service.attdance_calen_lnfo(req, model);
	}
	
	//근태 정보 입력 -> 캘린더(fullCalendar)
	@ResponseBody
	@RequestMapping("calender_insert_ajax.is")
	public void ajax_insert(@RequestBody List<Map<String, Object>> param,HttpServletRequest req, Model model) throws ParseException {
	//public void ajax_insert(@RequestBody List<Object> param,HttpServletRequest req, Model model) throws ParseException {
		logger.info("[url : calender_insert_ajax.is]");
		service.attdance_calen_insert(param, req, model);
	}
	
	// 출/퇴근 등록 페이지
	@RequestMapping("commute_main.is")
	public String commute_main() {
		logger.info("[url : commute_main.is]");

		return "ATTENDANCE/commute";
	}
	
	//개인 출/퇴근 정보 호출 - 콜백
	@RequestMapping("per_attend_list_call.is")
	public String per_attend_list_call(HttpServletRequest req, Model model) {
		logger.info("[url : per_attend_list_call.is]");
		service.per_attend_list_call(req, model);
		return "ATTENDANCE/per_attendance_list";
	}
	
	//개인 별 출근 정보 입력
	@ResponseBody
	@RequestMapping("per_attend_insert_ajax.is")
	public void per_attend_insert_ajax(HttpServletRequest req, Model model){
		logger.info("[url : per_attend_insert_ajax.is]");
		service.per_attend_list_insert(req, model);
	}
	
	//개인 별 퇴근정보 입력
	@ResponseBody
	@RequestMapping("per_attend_update_ajax.is")
	public void per_attend_update_ajax(HttpServletRequest req, Model model){
		logger.info("[url : per_attend_update_ajax.is]");
		service.per_attend_list_update(req, model);
	}
	
	

	
	
}
