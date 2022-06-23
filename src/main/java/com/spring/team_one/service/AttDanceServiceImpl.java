package com.spring.team_one.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.team_one.dao.AttDanceDao;
import com.spring.team_one.dto.AssembleDTO;


@Service
public class AttDanceServiceImpl implements AttDanceService{

	@Autowired
	AttDanceDao dao;
	
	//근태 캘린더 호출
	@Override
	public JSONArray attdance_calen_lnfo(HttpServletRequest req, Model model) throws ParseException {
		
		//DB에서 근태정보(로그인된 사원) 호출 
		String sessionID = (String)req.getSession().getAttribute("sessionID");
		List<AssembleDTO> list = dao.attdance_calen_list(sessionID);
		
		//Json parsing 
		JSONArray jsonArr = new JSONArray(); // json배열 
		Map<String, Object> map = new HashMap<String, Object>();
	
		for(AssembleDTO dto : list) {
			try {
				//시작시간호출 (parsing : timeStamp->localDateTime)
				// => (2022-04-20 00:00:00.0->2022-04-20T00:00)
				LocalDateTime ldt_start_time = dto.getAt_start_date().toLocalDateTime();
				//(localDateTime->String(JSON))
				String calren_start_time = ldt_start_time.toString();
				
				//종료시간호출 
				LocalDateTime ldt_end_time = dto.getAt_end_date().toLocalDateTime();
				String calren_end_time = ldt_end_time.toString();
				
				System.out.println("캘린더로 보내는 시간 String타입 - 시작시간 :" + calren_start_time);
				System.out.println("캘린더로 보내는 시간 String타입 - 종료시간 : " + calren_end_time);
				
				map.put("start", calren_start_time);
				map.put("end", calren_end_time);
				map.put("title", dto.getAttendance_status());
				map.put("employee", dto.getEmployee_id());
				map.put("color", dto.getColor());
				map.put("attendance_id", dto.getAttendance_id());
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			JSONObject jsonObject = new JSONObject(map);
			jsonArr.add(jsonObject);
		}
		
		
		return jsonArr;
		
	}

	//근태 정보 입력 -> 캘린더(fullCalendar)
	@Override
	
	//public void attdance_calen_insert(List<Object> param, HttpServletRequest req, Model model) {
	public void attdance_calen_insert(List<Map<String, Object>> param, HttpServletRequest req, Model model) {
		
		//현재로그인 정보 
		String sessionID = (String)req.getSession().getAttribute("sessionID");
		
		//
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		//SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		
		List<AssembleDTO> list = new ArrayList<AssembleDTO>();
		AssembleDTO dto = new AssembleDTO();
		
		System.out.println(param);
		for (int i = 0; i < param.size(); i++) {
			String employee_id = sessionID;
			String title = (String) param.get(i).get("title");
			String color = (String) param.get(i).get("color");
			
			//캘린더 시간정보 호출
			String calren_start_time = (String) param.get(i).get("start");
			String calren_end_time = (String) param.get(i).get("end");
			 
			System.out.println("캘린더에서 가져오는 시작시간 데이터(스트링) " + calren_start_time);
			System.out.println("캘린더에서 가져오는 종료시간 데이터 (스트링)" + calren_end_time);
			
			//(parsing : String -> LocalDateTime)
			LocalDateTime ldt_start_time = LocalDateTime.parse(calren_start_time, dateTimeFormatter);
			LocalDateTime ldt_end_time = LocalDateTime.parse(calren_end_time, dateTimeFormatter);
          
			//(parsing : LocalDateTime -> Timestamp)
			Timestamp tStamp_start_time = Timestamp.valueOf(ldt_start_time);
			Timestamp tSstamp_emd_time = Timestamp.valueOf(ldt_end_time);
	
			dto.setEmployee_id(employee_id);
			dto.setAttendance_status(title);
			dto.setAt_start_date(tStamp_start_time);
			dto.setAt_end_date(tSstamp_emd_time);
			dto.setColor(color);

			//mapper.xml 
			int insertCnt = dao.attdance_calen_insert(dto);
			System.out.println("insertCnt 근태 정보 입력 -> 캘린더(fullCalendar): " + insertCnt);
		}
		System.out.println(list);
		//System.out.println("insertCnt 근태 정보 입력 -> 캘린더(fullCalendar): " + insertCnt);
				
	    model.addAttribute(list);
	        //return "/full-calendar/calendar-admin-update";
		
	}

	//개인 출/퇴근 정보 호출
	@Override
	public void per_attend_list_call(HttpServletRequest req, Model model) {
		//현재로그인 정보 
		String sessionID = (String)req.getSession().getAttribute("sessionID");
		
		List<AssembleDTO> list = dao.per_attdance_list(sessionID);
		model.addAttribute("list", list);
	}

	//개인별 출근 정보 입력
	@Override
	public void per_attend_list_insert(HttpServletRequest req, Model model) {
		String EMPLOYEE_ID = req.getParameter("EMPLOYEE_ID");
		String ATTENDANCE_STATUS = req.getParameter("ATTENDANCE_STATUS");
		String START_DATE = req.getParameter("START_DATE");
		
		String str_START_DATE = START_DATE.substring(0, 19);
		System.out.println(str_START_DATE);
		
		System.out.println("출근정보 : " + EMPLOYEE_ID + ATTENDANCE_STATUS + str_START_DATE);
		
		 
		//데이트 타임 포맷터
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss", Locale.KOREA);
		
		//(parsing : String -> LocalDateTime)
		LocalDateTime ldt_start_time = LocalDateTime.parse(str_START_DATE, dateTimeFormatter);
      
		//(parsing : LocalDateTime -> Timestamp)
		Timestamp tStamp_start_time = Timestamp.valueOf(ldt_start_time);
		
		AssembleDTO dto = new AssembleDTO();
		dto.setEmployee_id(EMPLOYEE_ID);
		dto.setAt_start_date(tStamp_start_time);
		dto.setAttendance_status(ATTENDANCE_STATUS);
		
		dao.per_attdance_list_insert(dto);
		
	}

	//개인 별 퇴근정보 업데이트
	@Override
	public void per_attend_list_update(HttpServletRequest req, Model model) {
		String EMPLOYEE_ID = req.getParameter("EMPLOYEE_ID");
		System.out.println(EMPLOYEE_ID);
		String ATTENDANCE_STATUS = req.getParameter("ATTENDANCE_STATUS");
		String END_DATE = req.getParameter("END_DATE");
		
		String str_END_DATE = END_DATE.substring(0, 19);
		System.out.println(str_END_DATE);
		
		System.out.println("퇴근정보 : " + EMPLOYEE_ID + ATTENDANCE_STATUS + str_END_DATE);
		
		//데이트 타임 포맷터
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss", Locale.KOREA);
		//DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		
		//(parsing : String -> LocalDateTime)
		//LocalDateTime ldt_end_time = LocalDateTime.parse(END_DATE, dateTimeFormatter);
		LocalDateTime ldt_end_time = LocalDateTime.parse(str_END_DATE, dateTimeFormatter);
      
		//(parsing : LocalDateTime -> Timestamp)
		Timestamp tStamp_end_time = Timestamp.valueOf(ldt_end_time);
		
		AssembleDTO dto = new AssembleDTO();
		dto.setEmployee_id(EMPLOYEE_ID);
		dto.setAt_end_date(tStamp_end_time);
		dto.setAttendance_status(ATTENDANCE_STATUS);
		
		dao.per_attdance_list_update(dto);
	}
	
	

}
