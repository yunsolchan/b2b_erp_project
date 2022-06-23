package com.spring.team_one.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.team_one.dao.JHDao;
import com.spring.team_one.dto.AssembleDTO;

import page.Paging;

@Service
public class JHServiceImpl implements JHService {

	@Autowired
	JHDao dao;

	// --------------- 거래처 ---------------

	// 거래처 조회
	@Override
	public void client_list(HttpServletRequest req, Model model) throws ServletException, IOException {

		System.out.println("Service - client_list 거래처 조회");

		String pageNum = req.getParameter("pageNum");

		Paging paging = new Paging(pageNum);

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		List<AssembleDTO> list = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		list = dao.client_list(map);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	// 거래처명 중복확인
	@Override
	public int client_check(HttpServletRequest req, Model model) {
		
		System.out.println("Service - client_check 거래처명 중복확인");
		
        String keyword = req.getParameter("keyword");
        
        System.out.println(keyword);
        return dao.client_check(keyword);
	}

	// 계좌번호 중복확인
	@Override
	public int bank_check(HttpServletRequest req, Model model) {
		
		System.out.println("Service - bank_check 계좌번호 중복확인");
		
        String keyword = req.getParameter("keyword");
        
        System.out.println(keyword);
        return dao.bank_check(keyword);
	}	

	// 거래처 등록 액션 + 계좌 등록 액션
	@Override
	public void client_insert_action(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {

		System.out.println("Service - client_insert_action 거래처 등록 액션");

		// CLIENT 거래처 등록 액션
		AssembleDTO dto = new AssembleDTO();

		dto.setCl_name(req.getParameter("cl_name"));
		dto.setCeo_name(req.getParameter("ceo_name"));
		dto.setCl_email(req.getParameter("cl_email"));
		dto.setCl_zip_code(req.getParameter("cl_zip_code"));
		dto.setCl_address(req.getParameter("cl_address"));
		dto.setCl_detail_address(req.getParameter("cl_detail_address"));
		// 사업자 번호
		dto.setRegister_num(req.getParameter("num1") + req.getParameter("num2") + req.getParameter("num3"));
		// 거래처 연락처
		dto.setCl_phone(req.getParameter("phone1") + req.getParameter("phone2") + req.getParameter("phone3"));

		int insertCnt = dao.client_insert_action(dto);
		
		// ACCOUNT 계좌 등록 액션
		String employee_id = ((String)req.getSession().getAttribute("sessionID"));
		String account_number = req.getParameter("account_number");
		String bank = req.getParameter("bank");
		String ceo_name = req.getParameter("ceo_name");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employee_id", employee_id);
		map.put("account_number", account_number);
		map.put("bank", bank);
		map.put("ceo_name", ceo_name);
		
		int insertCnt2 = dao.bank_insert_action(map);

		System.out.println("Cnt : " + insertCnt + insertCnt2);

		model.addAttribute("insertCnt", insertCnt);
	}

	// 거래처 상세
	@Override
	public void client_detail(HttpServletRequest req, Model model) throws ServletException, IOException {

		System.out.println("Service - client_detail 거래처 상세");

		String client_id = req.getParameter("client_id");

		AssembleDTO dto = dao.client_detail(client_id);

		model.addAttribute("dto", dto);
	}
	
	// 거래처 내역보기
	@Override
	public void request_list(HttpServletRequest req, Model model) {
		
		System.out.println("Service - request_list 거래처 내역보기");

		String client_id = req.getParameter("client_id");
		
		List<AssembleDTO> list = dao.request_list(client_id);
		
		model.addAttribute("list", list);
	}	

	// 거래처 수정 액션
	@Override
	public void client_update_action(HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("Service - client_update_action 거래처 수정 액션");

		AssembleDTO dto = new AssembleDTO();
		
		dto.setClient_id(Integer.parseInt(req.getParameter("client_id")));
		dto.setCl_name(req.getParameter("cl_name"));
		dto.setCeo_name(req.getParameter("ceo_name"));
		dto.setCl_email(req.getParameter("cl_email"));
		dto.setCl_zip_code(req.getParameter("cl_zip_code"));
		dto.setCl_address(req.getParameter("cl_address"));
		dto.setCl_detail_address(req.getParameter("cl_detail_address"));
		// 사업자 번호
		dto.setRegister_num(req.getParameter("num1") + req.getParameter("num2") + req.getParameter("num3"));
		// 거래처 연락처
		dto.setCl_phone(req.getParameter("phone1") + req.getParameter("phone2") + req.getParameter("phone3"));

		int updateCnt = dao.client_update_action(dto);
		System.out.println("sdgdsgsdgsg - client_update_action 거래처 수정 액션");

		model.addAttribute("updateCnt", updateCnt);		
	}

	// 거래처 삭제
	@Override
	public void client_delete(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		
		System.out.println("Service - client_delete 거래처 삭제");

		String[] client_id = req.getParameterValues("client_id");

		int deleteCnt = 0;
		
		for(int i=0; i<client_id.length; i++) {
			deleteCnt = dao.client_delete(client_id[i]);
		}

		model.addAttribute("deleteCnt", deleteCnt);
	}

	// --------------- 견적서 ---------------
	
	// 견적서 조회
	@Override
	public void estimate_list(HttpServletRequest req, Model model) throws ServletException, IOException {
		
		System.out.println("Service - estimate_list 견적서 조회");

		String pageNum = req.getParameter("pageNum");

		Paging paging = new Paging(pageNum);

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		List<AssembleDTO> list = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		list = dao.estimate_list(map);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	// 견적서 등록
	@Override
	public void estimate_insert(HttpServletRequest req, Model model) {
		
		System.out.println("Service - estimate_insert 견적서 등록");

		String employee_id = ((String)req.getSession().getAttribute("sessionID"));

		AssembleDTO dto = dao.estimate_insert(employee_id);

		model.addAttribute("dto", dto);		
	}
	
	// 거래처 상품 목록
	@Override
	public void client_product_list(HttpServletRequest req, Model model) {
		
		System.out.println("Service - client_product_list 거래처 상품 목록");
		
		String client_id = req.getParameter("client_id");
		
		System.out.println("client_id : " + client_id);
		
		List<AssembleDTO> list = dao.client_product_list(client_id);

		model.addAttribute("list", list);
	}	
	
	// 상품 목록
	@Override
	public void product_list(HttpServletRequest req, Model model) {
		
		System.out.println("Service - product_list 상품 목록");

		String pageNum = req.getParameter("pageNum");

		Paging paging = new Paging(pageNum);

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		List<AssembleDTO> list = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		list = dao.product_list(map);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);		
	}

	// 견적서 등록 액션
	@Override
	public void estimate_insert_action(HttpServletRequest req, HttpServletResponse res, Model model) {
		
		System.out.println("Service - estimate_insert_action 견적서 등록 액션");

		// REQUEST 견적서 등록 액션
		AssembleDTO dto = new AssembleDTO();
		
		dto.setEmployee_id(req.getParameter("employee_id"));
		dto.setClient_id(Integer.parseInt(req.getParameter("client_id")));
		dto.setDepartment_id(Integer.parseInt(req.getParameter("department_id")));
		dto.setRe_memo(req.getParameter("re_memo"));
		
		int insertCnt = dao.estimate_insert_action(dto);
		
		// REQUEST_DETAIL 견적서 디테일 등록 액션 + PRODUCT 상품 판매가 수정
		String[] product_id = req.getParameterValues("product_id");
		String[] re_qty = req.getParameterValues("product_quantity");
		String[] price = req.getParameterValues("product_price");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int insertCnt2 = 0;
		int updateCnt = 0;
		int sum = 0;
        for(int i = 0; i<product_id.length; i++) {
        	map.put("product_id", product_id[i]);
            map.put("re_qty", re_qty[i]);
            map.put("price", price[i]);
            System.out.println(re_qty[i]);
            // 총 가격 (주문 수량 * 판매가격)
            sum += Integer.parseInt(re_qty[i]) * Integer.parseInt(price[i]);
			
			  insertCnt2 = dao.request_detail_insert_action(map); 
			  updateCnt = dao.product_update(map);
			 
            map.clear();
        }
        
        // REQUEST 주문서 등록 액션
        int insertCnt3 = dao.order_insert_action(dto);
        
        // REQUEST_DETAIL 주문서 디테일 등록 액션
        int insertCnt4 = 0;
        for(int i = 0; i<product_id.length; i++) {
        	map.put("product_id", product_id[i]);
            map.put("re_qty", re_qty[i]);
            map.put("price", price[i]);
            
			insertCnt4 = dao.request_detail_insert_action(map); 
            map.clear();
        }
        
		// SLIP 일반전표
		int insertCnt5 = dao.slip_insert_action(); 
		 
		// SALES_SLIP 매입/매출 전표
        
        double supply = (double)sum * 0.9;
        double tax = (double)sum * 0.1;
        
        
        map.put("supply", supply);
        map.put("tax", tax);
        
	    int insertCnt6 = dao.sales_slip_insert_action(map); 
		 
		
		System.out.println("Cnt : " + insertCnt + insertCnt2 + updateCnt + insertCnt3
		+ insertCnt4 + insertCnt5 + insertCnt6);
		
		model.addAttribute("insertCnt", insertCnt);
	}

	// 견적서 상세
	@Override
	public void estimate_detail(HttpServletRequest req, Model model) {
		
		System.out.println("Service - estimate_detail 견적서 상세");

		String request_id = req.getParameter("request_id");

		AssembleDTO dto = dao.request_detail(request_id);
		
		// 주문서 상품
		List<AssembleDTO> list = dao.request_product(request_id);

		model.addAttribute("dto", dto);
		model.addAttribute("list", list);	
	}
	
	// --------------- 주문서 ---------------
	
	// 주문서 조회
	@Override
	public void order_list(HttpServletRequest req, Model model) {
		
		System.out.println("Service - order_list 주문서 조회");

		String pageNum = req.getParameter("pageNum");

		Paging paging = new Paging(pageNum);

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		List<AssembleDTO> list = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		list = dao.order_list(map);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}

	// 전표 수정
	@Override
	public void order_update(HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("Service - order_update 전표 수정");

		// SLIP 전표 승인
		String request_id = req.getParameter("request_id");
		String abst = req.getParameter("abst");
		
		int updateCnt = dao.slip_update(request_id);
		
		// SALES_SLIP 적요 추가
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("request_id", request_id);
	    map.put("abst", abst);
	    
	    int updateCnt2 = dao.sales_slip_update(map);
	    
	    System.out.println("Cnt : " + updateCnt + updateCnt2);
	    model.addAttribute("updateCnt",updateCnt);
	}
	
	// 출고 요청
	@Override
	public void outbound_insert(HttpServletRequest req, Model model) {
		
		System.out.println("Service - outbound_insert 출고 요청");
		
		String request_id = req.getParameter("request_id");
		
		// 주문서 상품
		List<AssembleDTO> list = dao.request_product(request_id);
		
		// WAREHOUSE 창고 목록
        for(int i = 0; i<list.size(); i++) {
        	AssembleDTO dto = dao.warehouse_list(list.get(i).getProduct_id());
        	list.get(i).setWh_id(dto.getWh_id());
        	list.get(i).setWa_name(dto.getWa_name());
        	list.get(i).setPr_name(dto.getPr_name());
        	list.get(i).setLa_qty(dto.getLa_qty());
        }
        
		model.addAttribute("list", list);
	}
	
	// 출고 요청 액션
	@Override
	public void outbound_insert_action(HttpServletRequest req, Model model) {
		
		System.out.println("Service - outbound_insert_action 출고 요청 액션");
		
		String request_id = req.getParameter("request_id");
		
		// REQUEST 주문서 출고 요청
		int updateCnt = dao.request_update(request_id);
		
		// OUTBOUND 출고 대기
		String wh_id = req.getParameter("wh_id");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("request_id", request_id);
	    map.put("wh_id", wh_id);
		
		int insertCnt = dao.outbound_insert(map);
		
	    System.out.println("Cnt : " + updateCnt + insertCnt);
	    model.addAttribute("insertCnt",insertCnt);
	}	

	// 주문서 상세
	@Override
	public void order_detail(HttpServletRequest req, Model model) {

		System.out.println("Service - order_detail 주문서 조회");

		String request_id = req.getParameter("request_id");

		AssembleDTO dto = dao.request_detail(request_id);
		
		// 주문서 상품
		List<AssembleDTO> list = dao.request_product(request_id);

		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
	}

}
