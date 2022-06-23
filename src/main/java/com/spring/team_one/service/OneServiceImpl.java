package com.spring.team_one.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.team_one.dao.OneDao;
import com.spring.team_one.dto.OneDto;

// 테스트 Service
@Service
public class OneServiceImpl implements OneService{

   @Autowired
   OneDao dao;
   
   @Autowired   
   BCryptPasswordEncoder passwordEncoder;   //비밀번호 암호화 클래스
   
   @Override
   public void addAccount(MultipartHttpServletRequest req, Model model) {
      System.out.println("service");
      OneDto dto = new OneDto();
      String employee_id = req.getParameter("employee_id");
      String pw = req.getParameter("regi_num1");
      System.out.println("암호화전의 비밀번호 : " + pw);
      String encryptPassword = passwordEncoder.encode(pw);
      System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
      
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
        
        dto.setPhoto(p_img1); // 사진
      dto.setEmployee_id(employee_id); // 아이디
      dto.setPassword(encryptPassword); // 비밀번호(생년월일 6자리)
      
      String strDate = req.getParameter("hire_date");
      Date date = Date.valueOf(strDate);
      dto.setHire_date(date); // 입사일
      dto.setName(req.getParameter("name")); // 이름
      dto.setDepartment_id(Integer.parseInt(req.getParameter("department_id"))); // 부서코드
      
      // 연락처
      String strHp1 = req.getParameter("phone1");
      String strHp2 = req.getParameter("phone2");
      String strHp3 = req.getParameter("phone3");
      String hp = strHp1 + "-" + strHp2 + "-" + strHp3;
      dto.setPhone(hp);
      
      // 주민등록번호
      String regi_num1 = req.getParameter("regi_num1");
      String regi_num2 = req.getParameter("regi_num2");
      String regi_num = regi_num1 + regi_num2;
      dto.setRegister_number(regi_num);
      
      dto.setEmail(req.getParameter("email")); // 이메일
      dto.setPosition_id(Integer.parseInt(req.getParameter("position_id"))); // 직급코드
      dto.setZip_code(req.getParameter("zip_code"));// 우편번호
      dto.setAddress(req.getParameter("address")); // 주소
      dto.setDetail_address(req.getParameter("detail_address")); // 상세주소
      dto.setSalary(Integer.parseInt(req.getParameter("salary"))); // 급여
      dto.setAuthority(req.getParameter("authority")); // 권한시큐리티
      
      if(dao.addAccount(dto) == 1) {
         model.addAttribute("msg", "회원추가 성공!");
      }
      else {
         model.addAttribute("msg", "회원추가 실패!");
      }
   }
   
   // 로그인시 header 사진표출
   //public void test(HttpServletRequest req, httpser)
}