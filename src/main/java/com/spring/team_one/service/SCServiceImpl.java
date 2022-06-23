package com.spring.team_one.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.team_one.dao.SCDao;
import com.spring.team_one.dto.AssembleDTO;

@Service
public class SCServiceImpl implements SCService {

	@Autowired
	SCDao dao;
	
	// 거래처 등록
	@Override
	public void client_insert(HttpServletRequest req, Model model) {
		AssembleDTO dto = new AssembleDTO();
		dto.setRegister_num(req.getParameter("num1") + req.getParameter("num2") + req.getParameter("num3"));
		dto.setCl_phone(req.getParameter("phone1") + req.getParameter("phone2") + req.getParameter("phone3"));
		dto.setCl_name(req.getParameter("client_name"));
        dto.setCeo_name(req.getParameter("ceo_name"));
        dto.setCl_email(req.getParameter("client_email"));
		/* dto.setCl_zip_code(req.getParameter("zip_code")); */
        dto.setCl_zip_code(req.getParameter("zip_code"));
        dto.setCl_type(req.getParameter("authority"));
        dto.setCl_address(req.getParameter("address"));
        dto.setCl_detail_address(req.getParameter("detail_address"));
        dto.setAccount_number(req.getParameter("ac_num"));
        dto.setBank(req.getParameter("bank"));
        dto.setEmployee_id((String)req.getSession().getAttribute("sessionID"));
        dao.client_insert_action(dto);
        int insertCnt = dao.bank_insert_action(dto);
        String[] product_name = req.getParameterValues("product_name");
        String[] product_category = req.getParameterValues("product_category");
        String[] product_price = req.getParameterValues("product_price");
        
        Map<String,Object> map = new HashMap<String,Object>();
        for(int i=0; i<product_name.length; i++) {
        	map.put("product_name", product_name[i]);
        	map.put("product_category", product_category[i]);
        	map.put("product_price", product_price[i]);
        	
        	dao.client_product_insert(map);
        	map.clear();
        }
        model.addAttribute("insertCnt",insertCnt);
		System.out.println("client_insert 서비스 종료");
	}

	// 거래처 목록
	@Override
	public void client_list(HttpServletRequest req, Model model) {
		System.out.println("client_list 서비스 시작");

		List<AssembleDTO> list = null;
		list = dao.client_list();
		model.addAttribute("list",list);
		System.out.println("client_list 서비스 종료");
		
	}

	// 거래처 상세
	@Override
	public void client_detail(HttpServletRequest req, Model model) {
		AssembleDTO dto = new AssembleDTO();
		int num = Integer.parseInt(req.getParameter("client_id"));
		dto = dao.client_detail(num);
		List<AssembleDTO> list = null;
		list = dao.client_product_list(num);
		model.addAttribute("list",list);
		model.addAttribute("dto",dto);
	}

	// 거래처 삭제
	@Override
	public void client_delete(HttpServletRequest req, Model model) {
		String nu = req.getParameter("client_id");
		String[] num = nu.split(",");
		int deleteCnt = 0;
		for(int i=0; i<num.length; i++) {
			  deleteCnt=dao.client_delete(Integer.parseInt(num[i]));
			}
		
		System.out.println(deleteCnt);
		model.addAttribute("deleteCnt",deleteCnt);
	}

	// 거래처 수정
	@Override
	public void client_update(HttpServletRequest req, Model model) {
		AssembleDTO dto = new AssembleDTO();
		dto.setRegister_num(req.getParameter("num1") + req.getParameter("num2") + req.getParameter("num3"));
		dto.setCl_phone(req.getParameter("phone1") + req.getParameter("phone2") + req.getParameter("phone3"));
		dto.setCl_name(req.getParameter("client_name"));
        dto.setCeo_name(req.getParameter("ceo_name"));
        dto.setCl_email(req.getParameter("client_email"));
		dto.setCl_zip_code(req.getParameter("zip_code"));
        dto.setClient_id(Integer.parseInt(req.getParameter("client_id")));
        dto.setCl_type(req.getParameter("authority"));
        dto.setCl_address(req.getParameter("address"));
        dto.setCl_detail_address(req.getParameter("detail_address"));
        int updateCnt = dao.client_update(dto);
        
        String[] product_name = req.getParameterValues("product_name");
        String[] product_category = req.getParameterValues("product_category");
        String[] product_price = req.getParameterValues("product_price");
        String[] product_id = req.getParameterValues("product_id");
        
        Map<String,Object> map = new HashMap<String,Object>();
        for(int i=0; i<product_name.length; i++) {
        	map.put("product_name", product_name[i]);
        	map.put("product_category", product_category[i]);
        	map.put("product_price", product_price[i]);
        	map.put("product_id", product_id[i]);
        	
        	dao.client_product_update(map);
        	map.clear();
        }
        model.addAttribute("updateCnt",updateCnt);
		
	}
	
	// 로그인한 사원 정보
	public void employeeInfo(HttpServletRequest req, Model model) {
		String sessionID = (String)req.getSession().getAttribute("sessionID");
		
		System.out.println(sessionID);
		AssembleDTO dto = dao.employeeInfo(sessionID);
		
		model.addAttribute("dto",dto);
	}

	// 상품 목록 팝업
	@Override
	public void product_list(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("client_id"));
		List<AssembleDTO> list = null;
		list = dao.client_product_list(num);
		model.addAttribute("list",list);
	}

	// 견적서 요청서 등록
	@Override
	public void estimate_application_insert(HttpServletRequest req, Model model) {
		AssembleDTO dto = new AssembleDTO();
		String client_id = req.getParameter("client_id");
		String employee_id = req.getParameter("employee_id");
		String department_id = req.getParameter("department_id");
		dto.setClient_id(Integer.parseInt(client_id));
		dto.setEmployee_id(employee_id);
		dto.setDepartment_id(Integer.parseInt(department_id));
		int insertCnt = dao.estimate_application_insert(dto);
		String[] product_id = req.getParameterValues("product_id");
		String[] qty = req.getParameterValues("product_quantity");
		Map<String,Object> map = new HashMap<String,Object>();
		for(int i=0; i<qty.length; i++) {
			map.put("qty", qty[i]);
			map.put("product_id", product_id[i]);
			dao.estimate_application_detail_insert(map);
			map.clear();
		}
		dao.estimate_insert(dto);
		for(int i=0; i<qty.length; i++) {
			map.put("qty", qty[i]);
			map.put("product_id", product_id[i]);
			dao.estimate_detail_insert(map);
			map.clear();
		}
		model.addAttribute("insertCnt",insertCnt);
	}

	// 견적서 요청서 목록
	@Override
	public void estimate_application_list(HttpServletRequest req, Model model) {
		List<AssembleDTO> list = dao.estimate_application_list();
		model.addAttribute("list",list);
	}

	// 견적서 요청서 상세정보
	@Override
	public void estimate_application_detail(HttpServletRequest req, Model model) {
		String request_id = req.getParameter("request_id");
		AssembleDTO dto = dao.estimate_application_detail(request_id);
		List<AssembleDTO> list = dao.estimate_application_detail_list(request_id);
		
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
	}

	// 견적서 목록
	@Override
	public void estimate_list(HttpServletRequest req, Model model) {
		List<AssembleDTO> list = dao.estimate_list();
		model.addAttribute("list",list);		
	}

	// 견적서 상세정보
	@Override
	public void estimate_detail(HttpServletRequest req, Model model) {
		String request_id = req.getParameter("request_id");
		AssembleDTO dto = dao.estimate_detail(request_id);
		List<AssembleDTO> list = dao.estimate_detail_list(request_id);
		
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);		
	}

	// 견적서 목록 팝업
	@Override
	public void estimate_list_select(HttpServletRequest req, Model model) {
		String client_id = req.getParameter("client_id");
		List<AssembleDTO> list = dao.estimate_list_select(client_id);
		List<AssembleDTO> listp = dao.estimate_product_list_select();
	
		model.addAttribute("listp",listp);
		model.addAttribute("list",list);
	}

	// 주문서 입력
	@Override
	public void order_insert(HttpServletRequest req, Model model) {
		AssembleDTO dto = new AssembleDTO();
		String client_id = req.getParameter("client_id");
		String employee_id = req.getParameter("employee_id");
		String department_id = req.getParameter("department_id");
		String memo = req.getParameter("re_memo");
		dto.setClient_id(Integer.parseInt(client_id));
		dto.setEmployee_id(employee_id);
		dto.setDepartment_id(Integer.parseInt(department_id));
		dto.setRe_memo(memo);
		dao.order_insert(dto);
		String[] product_id = req.getParameterValues("product_id");
		String[] qty = req.getParameterValues("product_quantity");
		String[] cost = req.getParameterValues("cost");
		int sum = 0;
		Map<String,Object> map = new HashMap<String,Object>();
		for(int i=0; i<qty.length; i++) {
			map.put("qty", qty[i]);
			map.put("product_id", product_id[i]);
			dao.estimate_application_detail_insert(map);
			map.clear();
			sum += Integer.parseInt(cost[i])*Integer.parseInt(qty[i]);
		}
		
		dao.slip_insert();
		double supply = (double)sum*0.9;
		double tax = (double)sum*0.1;
		map.put("supply", supply);
		map.put("tax", tax);
		int insertCnt = dao.sales_slip_insert(map);
		model.addAttribute("insertCnt",insertCnt);
	}

	// 주문서 목록
	@Override
	public void order_list(HttpServletRequest req, Model model) {
		List<AssembleDTO> list = dao.order_list();
		model.addAttribute("list",list);
	}

	@Override
	public void order_update(HttpServletRequest req, Model model) {
		String request_id = req.getParameter("request_id");
		String good = req.getParameter("good");
		dao.slip_update(request_id);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("request_id", request_id);
		map.put("good", good);
		int updateCnt = dao.sales_slip_update(map);
		model.addAttribute("updateCnt",updateCnt);
	}

	// 입하 요청창
	@Override
	public void inbound_insert(HttpServletRequest req, Model model) {
		String request_id = req.getParameter("request_id");
		List<AssembleDTO> list = dao.estimate_application_detail_list(request_id);
		List<AssembleDTO> listw = dao.warehouse_list();
		
		model.addAttribute("listw",listw);
		model.addAttribute("list",list);
	}

	// 입하 요청
	@Override
	public void inbound_insert_action(HttpServletRequest req, Model model) {
		String request_id = req.getParameter("request_id");
		String wh_id = req.getParameter("wh_id");
		System.out.println(request_id);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("request_id", request_id);
		map.put("wh_id", wh_id);
		dao.request_update(request_id);
		int updateCnt = dao.inbound_insert(map);
		model.addAttribute("updateCnt",updateCnt);
	}

	@Override
	public int client_check(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");
		System.out.println(keyword);
		return dao.client_check(keyword);
	}

	@Override
	public int bank_check(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");
		System.out.println(keyword);
		return dao.bank_check(keyword);
	}
	
	@Override
	   public void request_list(HttpServletRequest req, Model model) {
	      
	      System.out.println("Service - request_list 거래처 내역보기");

	      String client_id = req.getParameter("client_id");
	      
	      List<AssembleDTO> list = dao.request_list(client_id);
	      System.out.println(list);
	      model.addAttribute("list", list);
	   }
	

}
