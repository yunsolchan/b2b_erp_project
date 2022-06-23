package com.spring.team_one.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.team_one.dao.HJDao;
import com.spring.team_one.dto.AssembleDTO;

@Service
public class HJServiceImpl implements HJService {

   @Autowired
   HJDao dao;
   
   @Autowired   
   BCryptPasswordEncoder passwordEncoder;   //비밀번호 암호화 클래스
   
   // -------------------- 부서
   // 부서목록
   @Override
   public void dept_list(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 부서목록");
      
      List<AssembleDTO> list = dao.dept_list();
      model.addAttribute("list", list);
      
   }

   // 부서상세
   @Override
   public void dept_detail(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 부서상세");
      
      int department_id = Integer.parseInt(req.getParameter("department_id"));
      String department_name = dao.dept_name(department_id);
      List<AssembleDTO> list = dao.dept_detail(department_id);
      model.addAttribute("list", list);
      model.addAttribute("department_name", department_name);
      
   }

   // 부서추가
   @Override
   public void dept_insert(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 부서추가");
      
      AssembleDTO dto = new AssembleDTO();
      
      dto.setDe_name(req.getParameter("name")); // 이름
      dto.setDepartment_id(Integer.parseInt(req.getParameter("department_id"))); // 부서코드
      
      // 연락처
      String strHp1 = req.getParameter("phone1");
      String strHp2 = req.getParameter("phone2");
      String strHp3 = req.getParameter("phone3");
      String tel = strHp1 + "-" + strHp2 + "-" + strHp3;
      dto.setTel(tel);

      dto.setDe_address(req.getParameter("address")); // 주소
      dto.setDe_detail_address(req.getParameter("detail_address")); // 상세주소
      dto.setDe_zip_code(req.getParameter("zip_code"));// 우편번호
      
      int insertCnt = dao.dept_insert(dto);
      model.addAttribute("insertCnt", insertCnt);
      
   }

   // -------------------- 인사카드
   // 인사카드목록
   @Override
   public void emp_list(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 인사카드목록");
      
      List<AssembleDTO> list = dao.emp_list();
      model.addAttribute("list", list);
      
   }

   // 인사카드등록
   @Override
   public void emp_insert(MultipartHttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 인사카드등록");
      
        AssembleDTO dto = new AssembleDTO();
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
         String realDir = "C:\\D\\Dev105\\workspace2\\team_one\\src\\main\\webapp\\resources\\image\\emp_photo\\";
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
         dto.setEm_name(req.getParameter("name")); // 이름
         dto.setDepartment_id(Integer.parseInt(req.getParameter("department_id"))); // 부서코드
         
         // 연락처
         String strHp1 = req.getParameter("phone1");
         String strHp2 = req.getParameter("phone2");
         String strHp3 = req.getParameter("phone3");
         String hp = strHp1 + "-" + strHp2 + "-" + strHp3;
         dto.setEm_phone(hp);
         
         // 주민등록번호
         String regi_num1 = req.getParameter("regi_num1");
         String regi_num2 = req.getParameter("regi_num2");
         String regi_num = regi_num1 + "-" + regi_num2;
         dto.setRegister_number(regi_num);
         
         dto.setEm_email(req.getParameter("email")); // 이메일
         dto.setPosition_id(Integer.parseInt(req.getParameter("position_id"))); // 직급코드
         dto.setEm_zip_code(req.getParameter("zip_code"));// 우편번호
         dto.setEm_address(req.getParameter("address")); // 주소
         dto.setEm_detail_address(req.getParameter("detail_address")); // 상세주소
         dto.setSalary(Integer.parseInt(req.getParameter("salary"))); // 급여
         dto.setAnnual_count(Integer.parseInt(req.getParameter("annual_count"))); // 휴가
         dto.setAuthority(req.getParameter("authority")); // 권한시큐리티
         
         AssembleDTO dto2 = new AssembleDTO();
         dto2.setAccount_number(req.getParameter("account_number"));  // 계좌번호
         dto2.setBank(req.getParameter("bank"));  // 은행명
         dto2.setAc_name(req.getParameter("name"));  // 예금주
         dto2.setEmployee_id(employee_id);  // 사원번호
         dto2.setDepartment_id(Integer.parseInt(req.getParameter("department_id"))); // 부서코드
         
            int insertCnt = dao.emp_insert(dto);
          int insertCnt2 = dao.emp_account(dto2);
         
         model.addAttribute("insertCnt", insertCnt);
         model.addAttribute("insertCnt2", insertCnt2);
      
   }
   
   // 사번중복체크
   @Override
   public int employee_id_check(HttpServletRequest req, Model model) {
      String employee_id = req.getParameter("employee_id");

      int num_employee_id_check = dao.employee_id_check(employee_id);
      model.addAttribute("num_employee_id_check", num_employee_id_check);

      return num_employee_id_check;
   }
   
   // 계좌중복체크
   @Override
   public int account_submit_check(HttpServletRequest req, Model model) {
      
      String account_number = req.getParameter("account_number");

      int num_account_submit_check = dao.account_submit_check(account_number);
      model.addAttribute("num_employee_id_check", num_account_submit_check);

      return num_account_submit_check;
   }
   
   // 인사카드부서
   @Override
   public void emp_dept(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 인사카드부서");
      
      List<AssembleDTO> list = dao.dept_list();
      model.addAttribute("list", list);
      
   }
   
   // 인사카드직급
   @Override
   public void emp_position(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 인사카드직급");
      
      List<AssembleDTO> list2 = dao.emp_position();
      model.addAttribute("list2", list2);
      
   }

   // 인사카드상세
   @Override
   public void emp_detail(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 인사카드상세");
      
      String employee_id = req.getParameter("employee_id");
      
      AssembleDTO dto = dao.emp_detail(employee_id);  // 사원상세
      List<AssembleDTO> list = dao.dept_list();  // 부서목록
      List<AssembleDTO> list2 = dao.emp_position();  // 직급목록
      
      model.addAttribute("dto", dto);
      model.addAttribute("list", list);
      model.addAttribute("list2", list2);
      
   }

   // 인사카드수정처리
   @Override
   public void emp_update(MultipartHttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 인사카드수정처리");
      
        AssembleDTO dto = new AssembleDTO();
        String employee_id = req.getParameter("employee_id");
         String pw = req.getParameter("regi_num1");
         System.out.println("암호화전의 비밀번호 : " + pw);
         String encryptPassword = passwordEncoder.encode(pw);
         System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
         
      // 화면으로부터 입력받은 값(상품 내용)을 받아서 dto에 담는다.
      String hiddenPhoto = req.getParameter("hiddenPhoto");  // 기존이미지
         
         // 추가S
         MultipartFile file = req.getFile("photo");
         System.out.println("file : " + file);
         
         // 저장경로
         String saveDir = req.getSession().getServletContext().getRealPath("/resources/image/emp_photo/");
         System.out.println("saveDir : " + saveDir);
      
      String readDir = "C:\\D\\Dev105\\workspace2\\team_one\\src\\main\\webapp\\resources\\image\\emp_photo\\";
      System.out.println("readDir : " + readDir);
      
      String p_img1 = "";
      // 이미지를 수정하고자 할 경우  p_img에 등록
      if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
         try {
            file.transferTo(new File(saveDir + file.getOriginalFilename()));
            
            FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
            FileOutputStream fos = new FileOutputStream(readDir + file.getOriginalFilename());
         
            int data = 0;
            
            while((data = fis.read()) != -1) {
               fos.write(data);
            }
            fis.close();
            fos.close();
            
         } catch(IOException e) {
            e.printStackTrace();
         }
         p_img1 = "/team_one/resources/image/emp_photo/" + file.getOriginalFilename();  // 플젝명/경로
      } else {
         // 기존 이미지 사용(이미지 수정 안할 경우)
         p_img1 = hiddenPhoto;
      }
         dto.setPhoto(p_img1); // 사진
         dto.setEmployee_id(employee_id); // 아이디
         dto.setPassword(encryptPassword); // 비밀번호(생년월일 6자리)
         
         dto.setEm_name(req.getParameter("name")); // 이름
         dto.setDepartment_id(Integer.parseInt(req.getParameter("department_id"))); // 부서코드
         
         // 연락처
         String strHp1 = req.getParameter("phone1");
         String strHp2 = req.getParameter("phone2");
         String strHp3 = req.getParameter("phone3");
         String hp = strHp1 + "-" + strHp2 + "-" + strHp3;
         dto.setEm_phone(hp);
         
         // 주민등록번호
         String regi_num1 = req.getParameter("regi_num1");
         String regi_num2 = req.getParameter("regi_num2");
         String regi_num = regi_num1 + "-" + regi_num2;
         dto.setRegister_number(regi_num);
         
         dto.setEm_email(req.getParameter("email")); // 이메일
         dto.setPosition_id(Integer.parseInt(req.getParameter("position_id"))); // 직급코드
         dto.setEm_zip_code(req.getParameter("zip_code"));// 우편번호
         dto.setEm_address(req.getParameter("address")); // 주소
         dto.setEm_detail_address(req.getParameter("detail_address")); // 상세주소
         dto.setSalary(Integer.parseInt(req.getParameter("salary"))); // 급여
         dto.setAnnual_count(Integer.parseInt(req.getParameter("annual_count"))); // 휴가
         dto.setAuthority(req.getParameter("authority")); // 권한시큐리티
         dto.setEm_status(req.getParameter("status"));	// 재직상태
         
         int updateCnt = dao.emp_update_action(dto);
         model.addAttribute("updateCnt", updateCnt);
      
   }

   // -------------------- 근태관리
   // 근태조회
   @Override
   public void attend_list(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 근태조회");
      
      String date = req.getParameter("date");
      System.out.println(date);
      
      if(date == null) {
         List<AssembleDTO> list = dao.attend_list_today();
         model.addAttribute("list", list);
      } else {
         List<AssembleDTO> list = dao.attend_list(date);
         model.addAttribute("list", list);
      }
      
   }

   // 근태승인(휴가)
   @Override
   public void attend_update(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 근태조회");
      
      List<AssembleDTO> list = dao.attend_update();
      model.addAttribute("list", list);
      
   }

   // 근태승인처리
   @Override
   public void attend_update_action(HttpServletRequest req, Model model) 
         throws ServletException, IOException {

      System.out.println("service - 근태승인처리");
      
      int updateCnt = 0;
      int updateCnt2 = 0;
      String[] arr = req.getParameterValues("attendance_id");
         for(int i=0; i<arr.length; i++){
            updateCnt = dao.attend_update_action(Integer.parseInt(arr[i]));
            updateCnt2 = dao.attend_update_count(Integer.parseInt(arr[i]));
         }
      
      model.addAttribute("updateCnt", updateCnt);
      model.addAttribute("updateCnt2", updateCnt2);
   
   }
   
   // -------------------- 급여관리
   // 급여목록
   @Override
   public void salary_list(HttpServletRequest req, Model model) 
         throws ServletException, IOException {

      System.out.println("service - 급여목록");
      
      String month = req.getParameter("month");
      System.out.println(month);
      
      if(month != null) {
         String month1 = month.replace("-", "");
         String payday = month1;
         System.out.println(month1);
         
         List<AssembleDTO> list = dao.salary_list(month1);
         model.addAttribute("list", list);
         model.addAttribute("payday", payday);
      } else {
         List<AssembleDTO> list = dao.salary_list_today();
         model.addAttribute("list", list);
      }
      
   }

   // 급여수정
   @Override
   public void salary_update(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 급여수정");
      
      AssembleDTO dto = new AssembleDTO();
      
      dto.setBasic_salary(Integer.parseInt(req.getParameter("basic_salary")));
      dto.setSalary_id(Integer.parseInt(req.getParameter("salary_id")));
      dto.setOvertime_pay(Integer.parseInt(req.getParameter("overtime_pay")));
      dto.setBonus_pay(Integer.parseInt(req.getParameter("bonus_pay")));
      dto.setTransportation_fee(Integer.parseInt(req.getParameter("transportation_fee")));
      dto.setHolyday_pay(Integer.parseInt(req.getParameter("holyday_pay")));
      dto.setPosition_pay(Integer.parseInt(req.getParameter("position_pay"))); // 과세
      int A = dto.getBasic_salary() + dto.getOvertime_pay() + dto.getBonus_pay() + dto.getTransportation_fee() + dto.getHolyday_pay()+ dto.getPosition_pay();
      
      
      int income_tax = (int) (A *(0.01));
      int local_income_tax = (int) (income_tax * 0.1);
      int national_pension = (int) (A * 0.045);
      int health_insurance = (int) (A * 0.0306);
      int employment_insurance = (int) (A * 0.0065);
      int long_term_care = (int) (health_insurance * 0.0655);
      
      dto.setMeel_fee(Integer.parseInt(req.getParameter("meel_fee")));
      dto.setDrive_fee(Integer.parseInt(req.getParameter("drive_fee")));
      dto.setChild_fee(Integer.parseInt(req.getParameter("child_fee")));
      dto.setIncome_tax(income_tax);
      dto.setLocal_income_tax(local_income_tax);
      dto.setNational_pension(national_pension);
      dto.setHealth_insurance(health_insurance);
      dto.setEmployment_insurance(employment_insurance);
      dto.setLong_term_care(long_term_care);
      
      dao.salary_taxtion(dto);
      dao.salary_nontaxtion(dto);
      dao.salary_tax(dto);
      
   }
   
   // 급여관련비용 요청목록
   @Override
   public void salary_request_list(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 급여요청목록");
      
      String employee_id = req.getParameter("employee_id");
      List<AssembleDTO> list = dao.salary_request_list(employee_id);
      
      model.addAttribute("list", list);
   }

   // 급여요청승인
   @Override
   public void salary_request_update(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 급여요청승인");
      
      int request_id = Integer.parseInt(req.getParameter("request_id"));
      int updateCnt = dao.salary_request_update(request_id);
      
      model.addAttribute("updateCnt", updateCnt);
      
   }

   // 급여승인 회계요청
   @Override
   public void salary_request(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 급여승인 회계요청");
      
      // 등록 사원명
      String employee_id = (String)req.getSession().getAttribute("sessionID");
      String month = req.getParameter("month");
      System.out.println(month);
      
      int insertCnt1 = 0;
      int insertCnt2 = 0;
      int insertCnt3 = 0;
      int updateCnt = 0;
      int insert_result = 0;
      
      // 날짜 선택이 된 상태
      if(month != null && month != "") {
         String month1 = month.replace("-", "");
         System.out.println(month1);
         
         // 요청할 사원정보
         List<AssembleDTO> req_dto = dao.req_emp(month1);

         if(req_dto.size() != 0) {
            // 급여승인요청1
            insertCnt1 = dao.salary_request1(employee_id);
            
            // 급여승인요청2
            for(int i=0; i < req_dto.size(); i++) {
               Map<String, Object> map = new HashMap<String, Object>();
               map.put("employee_id", req_dto.get(i).getEmployee_id());
               map.put("net_pay", req_dto.get(i).getNet_pay());
               
               insertCnt2 = dao.salary_request2(map);
               
               // 급여승인요청1,2 성공시 급여상태 R로변경
               if(insertCnt1 == 1) {
                  if(insertCnt2 == 1) {
                     updateCnt = dao.salary_status(req_dto.get(i).getSalary_id());
                     insert_result += updateCnt;
                  }
               } 
            }
            // 급여상태 R로 변경시 1 도출
            if(insert_result == (req_dto.size())) {
               insert_result = 1;
            }
            
               // 급여상태 R 변경 성공시 급여승인요청3
               if(insert_result == 1) {
                  insertCnt3 = dao.salary_request3();
               }
            
            // 승인요청 필요없을시
            }  else {
               insert_result = 10;
            }
      
      // 날짜 선택이 안될때(현재 월)
      } else {
         List<AssembleDTO> req_dto = dao.req_emp_today();
         
         System.out.println(req_dto.size());

         if(req_dto.size() != 0) {
            // 급여승인요청1
            insertCnt1 = dao.salary_request1(employee_id);
            
            // 급여승인요청2
            for(int i = 0; i < req_dto.size(); i++) {
               Map<String, Object> map = new HashMap<String, Object>();
               map.put("employee_id", req_dto.get(i).getEmployee_id());
               map.put("net_pay", req_dto.get(i).getNet_pay());
               
               insertCnt2 = dao.salary_request2(map);
               
               // 급여승인요청1,2 성공시 급여상태 R로변경
               if(insertCnt1 == 1) {
                  if(insertCnt2 == 1) {
                     updateCnt = dao.salary_status(req_dto.get(i).getSalary_id());
                     insert_result += updateCnt;
                  }
               } 
            }
            // 급여상태 R로 변경성공시 1 도출
            if(insert_result == (req_dto.size())) {
               insert_result = 1;
            }
               // 급여상태 R 변경 성공시 급여승인요청3
               if(insert_result == 1) {
                  insertCnt3 = dao.salary_request3();
               }
               
            // 승인요청 필요없을시
            } else {
               insert_result = 10;
            }
      }

      System.out.println(insert_result);
      System.out.println(insertCnt3);
      model.addAttribute("insert_result", insert_result);
      model.addAttribute("insertCnt3", insertCnt3);
   }
   
   // 급여명세서
   @Override
   public void salary_detail(HttpServletRequest req, Model model) 
         throws ServletException, IOException {
      
      System.out.println("service - 급여명세서");
      
      int salary_id = Integer.parseInt(req.getParameter("salary_id"));
      String payday = req.getParameter("payday");
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("salary_id", salary_id);
      map.put("payday", payday);
      
      AssembleDTO dto = dao.salary_detail(map);
      
      model.addAttribute("dto", dto);
      
   }

}