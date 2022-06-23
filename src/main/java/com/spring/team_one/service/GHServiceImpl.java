package com.spring.team_one.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.team_one.dao.GHDaoImpl;
import com.spring.team_one.dto.AssembleDTO;

// 테스트 Service
@Service
public class GHServiceImpl{

   @Autowired
   GHDaoImpl dao;
   
   @Autowired   
   BCryptPasswordEncoder passwordEncoder;   //비밀번호 암호화 클래스
   
   public void update_info(MultipartHttpServletRequest req, Model model) {
      System.out.println("service");
      AssembleDTO dto = new AssembleDTO();
      
      // 추가S
      MultipartFile file = req.getFile("photo");
      System.out.println("file : " + file);
      
      // 저장경로
      String saveDir = req.getSession().getServletContext().getRealPath("/resources/image/emp_photo/");
      System.out.println("saveDir : " + saveDir);
      
        // 저장경로(jsp의 IMG_UPLOAD_DIR) 
      String realDir = "D:\\Dev105\\workspace2\\team_one\\src\\main\\webapp\\resources\\image\\emp_photo\\";
      System.out.println("realDir : " + realDir);
       
      try {
         file.transferTo(new File(saveDir + file.getOriginalFilename()));
         
         FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
         FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
         
         int data = 0;
         
         while((data = fis.read()) != -1) {
            fos.write(data);
         }
         fis.close();
         fos.close();
      }catch(IOException e){
         e.printStackTrace();
      }
      
      // 추가E
      String p_img1 = "/team_one/resources/image/emp_photo/" + file.getOriginalFilename();  // 플젝명/경로
      System.out.println("dto.getPhoto() : " + p_img1);
      
      if(file.getOriginalFilename() != null) {
    	  dto.setPhoto(p_img1); // 사진
      }else {
    	  dto.setPhoto(req.getParameter("old_photo"));
      }
      
      
      
      dto.setEmployee_id((String)req.getSession().getAttribute("sessionID")); // 아이디
      
      dto.setEm_name(req.getParameter("name")); // 이름
      dto.setEm_phone(req.getParameter("hp")); // 연락처
      dto.setEm_email(req.getParameter("email")); // 이메일
      dto.setEm_zip_code(req.getParameter("zip_code"));// 우편번호
      dto.setEm_address(req.getParameter("address")); // 주소
      dto.setEm_detail_address(req.getParameter("detail_address")); // 상세주소
      
      int updateCnt = dao.update_info(dto);
      model.addAttribute("updateCnt", updateCnt);
      
      if(updateCnt == 1) {
         model.addAttribute("msg", "회원추가 성공!");
      }
      else {
         model.addAttribute("msg", "회원추가 실패!");
      }
   }
   
   // 내정보조회
   public void myInfo_detail(HttpServletRequest req, Model model) {
	   String employee_id = (String)req.getSession().getAttribute("sessionID");
	   
	   AssembleDTO dto = dao.myInfo_detail(employee_id);
//	   
//	   String account_number = dao.my_account(employee_id);
//	   System.out.println(account_number);
//	   model.addAttribute("account_number", account_number);
//	   
	   model.addAttribute("dto", dto);
   }
   
   // 비밀번호 체크
   public void pw_update_chk(HttpServletRequest req, Model model) {
	   String id = (String)req.getSession().getAttribute("sessionID");
	   String pw = req.getParameter("password");
	   
	   int cnt = dao.pw_update_chk(id,pw);
	   
	   model.addAttribute("cnt", cnt);
   }

   // 비밀번호 변경
   public void pw_update_action(HttpServletRequest req, Model model) {
	   String id = (String)req.getSession().getAttribute("sessionID");
	   String pw = req.getParameter("password");
	   System.out.println("암호화전의 비밀번호 : " + pw);
       String encryptPassword = passwordEncoder.encode(pw);
       System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
       
       Map<String,Object> map = new HashMap<String,Object>();
       
       map.put("id",id);
       map.put("pw",encryptPassword);
       
       int updateCnt = dao.pw_update_action(map);
       
       model.addAttribute("updateCnt", updateCnt);
	   
   }

   // 급여목록
   public void my_salary_list(HttpServletRequest req, Model model) {
		
	   String id = (String)req.getSession().getAttribute("sessionID");
	   
	   
	   List<AssembleDTO> list = dao.my_salary_list(id);
	   
	   model.addAttribute("list", list);	
   }

   // 급여상세
   public void my_salary_detail(HttpServletRequest req, Model model) {
	  int salary_id = Integer.parseInt(req.getParameter("salary_id"));
	  
	  AssembleDTO dto = dao.my_salary_detail(salary_id);
	  
	  model.addAttribute("dto", dto);
		
   }
   
   // 급여요청
   public void salary_request(HttpServletRequest req, Model model) {
	   String employee_id = (String)req.getSession().getAttribute("sessionID");
	   
	   String what_cost = req.getParameter("what_cost");
	   String how_much_cost = req.getParameter("how_much_cost");
	   String what_cost_detail = req.getParameter("what_cost_detail");
	   String cost_date = req.getParameter("cost_date");
	   
	   String memo = cost_date +" "+ what_cost + " " + how_much_cost + " 원 요청 <br>" + what_cost_detail;
	   
	   Map<String,Object> map = new HashMap<String,Object>();
	   map.put("employee_id", employee_id);
	   map.put("memo", memo);
	   
	   int insertCnt = dao.salary_request(map);
	   
	   model.addAttribute("insertCnt",insertCnt);
	   
   }
   
   // 비용 신청
   public void cost_request(HttpServletRequest req, Model model) {
	   String employee_id = (String)req.getSession().getAttribute("sessionID");
	   
	   String what_cost = req.getParameter("what_cost");
	   String how_much_cost = req.getParameter("how_much_cost");
	   String what_cost_detail = req.getParameter("what_cost_detail");
	   String cost_date = req.getParameter("cost_date");
	   
	   String account_number = dao.account_number(employee_id);
	   
	   Map<String,Object> map = new HashMap<String,Object>();
	   map.put("employee_id", employee_id);
	   map.put("what_cost_detail", what_cost_detail);
	   map.put("what_cost", what_cost);
	   map.put("how_much_cost", how_much_cost);
	   map.put("cost_date", cost_date);
	   map.put("account_number",account_number);
	   
	   int insertCnt = dao.cost_request(map);
	   insertCnt += dao.cost_slip();
	   insertCnt += dao.cost_oe(map);
	   
	   model.addAttribute("insertCnt",insertCnt);
	   
   }
   
   // 비용목록
   public void request_list(HttpServletRequest req, Model model) {
	   String id = (String)req.getSession().getAttribute("sessionID");
	   
	   List<AssembleDTO> list = dao.request_list(id);
	   
	   model.addAttribute("list",list);
	   
   }
   
   
}