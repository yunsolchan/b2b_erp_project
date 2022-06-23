package com.spring.team_one.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.team_one.dao.DHDao;
import com.spring.team_one.dto.AssembleDTO;
import com.spring.team_one.dto.LackDTO;

import page.Paging;

@Service
public class DHServiceImpl implements DHService{

   @Autowired
   DHDao dao;

   //창고 목록
   @Override
   public void warehouseList(HttpServletRequest req, Model model) {
        System.out.println("service - 창고목록");

        // 3 화면으로부터 값 받아오기
		String pageNum = req.getParameter("pageNum");

		// 5-1 paging 클래스
		Paging paging = new Paging(pageNum);

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 5-2 warehouseList 가져오기
		List<AssembleDTO> list = dao.warehouseList(map);
		System.out.println("list : " + list);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}


   	// 창고 등록
	@Override
	public void warehouse_insert_action(HttpServletRequest req, Model model) {
		 System.out.println("service - 창고등록");
		 // 3단계. 화면으로부터 입력받은 값을 받아서 dto에 담는다.
		 AssembleDTO Adto = new AssembleDTO();
		 Adto.setWh_id(Integer.parseInt(req.getParameter("wh_id")));
		 Adto.setWa_name(req.getParameter("wa_name"));
		 Adto.setWa_zip_code(req.getParameter("wa_zip_code"));
		 Adto.setWa_address(req.getParameter("wa_address"));
		 Adto.setWa_detail_address(req.getParameter("wa_detail_address"));
		 Adto.setVolume(Integer.parseInt(req.getParameter("volume")));

		 int weight = Integer.parseInt(req.getParameter("weight"));
		 int length = Integer.parseInt(req.getParameter("length"));
		 int height = Integer.parseInt(req.getParameter("height"));
		 int insertLackCnt = 0;

		 int insertCnt = dao.warehouse_insert(Adto);
			System.out.println("insertCnt : " + insertCnt);

	      for(int w=1; w <= weight; w++) {

	         for(int l=1; l <= length; l++) {

	            for(int h=1; h <= height; h++) {
	               char a = (char)(w+64);

	               Map<String, Object> map = new HashMap<String, Object>();
		       		map.put("wh_id" , Adto.getWh_id());
		       		map.put("lack_code" , (a+"_"+l+"_"+h));
		       		insertLackCnt += dao.warehouse_lackInsert(map);
	            }
	         }
	      }
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("insertLackCnt", insertLackCnt);


	}

    // 창고 상세
	@Override
	public void warehouse_detail(HttpServletRequest req, Model model) {
      int wh_id = Integer.parseInt(req.getParameter("wh_id"));

      AssembleDTO dto = dao.getWarehouseDetail(wh_id);
      System.out.println("상세페이지 dto : " + dto);

      int all_lack = dao.all_lack_count(wh_id);
      int use_lack = dao.use_lack_count(wh_id);
      double rate = ((double)use_lack / (double)all_lack) * 100;
      
      model.addAttribute("dto", dto);
      model.addAttribute("rate", rate);
      model.addAttribute("all_lack", all_lack);
      model.addAttribute("use_lack", use_lack);
	}

// ----------------------------[재고관리]---------------------------------------------
	   // 재고 현황
	   @Override
	   public void stock_list(HttpServletRequest req, Model model) {
	      System.out.println("서비스 - stock_list");

	      int wh_id = Integer.parseInt(req.getParameter("wh_id"));

	       // 3 화면으로부터 값 받아오기
	      String pageNum = req.getParameter("pageNum");

	      // 5-1 paging 클래스
	      Paging paging = new Paging(pageNum);

	      int start = paging.getStartRow();
	      int end = paging.getEndRow();

	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("start", start);
	      map.put("end", end);
	      map.put("wh_id",wh_id);

	      // 5-2 stock_list 가져오기
	      List<AssembleDTO> list = dao.getStockList(map);
	      AssembleDTO dto = dao.getWarehouseDetail(wh_id);
	      System.out.println("list : " + list);


	      model.addAttribute("wh_name", dto.getWa_name());
	      model.addAttribute("list", list);
	      model.addAttribute("paging", paging);
	   }

	// 재고 상세
	@Override
	public void stock_update(HttpServletRequest req, Model model) {
		System.out.println("서비스 - stock_update");
	      int lack_code = Integer.parseInt(req.getParameter("lack_code"));
	      int wh_id = Integer.parseInt(req.getParameter("wh_id"));

	      List<AssembleDTO> list = dao.lack_list(wh_id);
	      AssembleDTO dto = dao.getStockDetail(lack_code);
	      System.out.println("상세페이지 dto : " + dto);

	      model.addAttribute("lack_list",list);
	      model.addAttribute("dto", dto);

	}

	// 재고 조정
	@Override
	public void stock_update_action(HttpServletRequest req, Model model) {
		System.out.println("서비스 - stock_update_action");
		AssembleDTO sdto = new AssembleDTO();
		int old_lack_code = Integer.parseInt(req.getParameter("old_lack_code"));
		sdto.setLa_qty(Integer.parseInt(req.getParameter("la_qty")));
		sdto.setProduct_id(Integer.parseInt(req.getParameter("product_id")));
		sdto.setLack_code(Integer.parseInt(req.getParameter("lack_code")));
		// 5단계. 상품정보 수정
		int updateCnt = dao.stock_Update_Action(old_lack_code);
		updateCnt += dao.stock_Update_Action2(sdto);

		System.out.println("updateCnt : " + updateCnt);
	    // 6단계. jsp로 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
		model.addAttribute("updateCnt", updateCnt);
	}

// -------------------------- [ 입하 ] ----------------------------------
	// 입하지시 현황
	@Override
	public void arrival_list(HttpServletRequest req, Model model) {
		System.out.println("서비스 - arrival_list");

        // 3 화면으로부터 값 받아오기
		String pageNum = req.getParameter("pageNum");

		// 5-1 paging 클래스
		Paging paging = new Paging(pageNum);

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 5-2 arrival_list 가져오기
		List<AssembleDTO> list = dao.getArrivalList(map);
		System.out.println("list : " + list);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}

	// 입하 지시 상세
	@Override
	public void arrival_indicate(HttpServletRequest req, Model model) {
		 System.out.println("서비스 - arrival_indicate");
		 int request_id = Integer.parseInt(req.getParameter("request_id"));

		 AssembleDTO dto = dao.arrival_Indicate(request_id);
		 List<AssembleDTO> list = dao.arrival_Indicate_product(request_id);
	     System.out.println("상세페이지 dto : " + dto);
	     System.out.println(list);

	     model.addAttribute("dto", dto);
	     model.addAttribute("list", list);

	}

	// 입하 지시 처리
	@Override
	public void arrival_indicate_action(HttpServletRequest req, Model model) {
		System.out.println("서비스 - arrival_indicate_action");
		int request_id = Integer.parseInt(req.getParameter("request_id"));
		int updateCnt = dao.arrival_indicate_action(request_id);

		model.addAttribute("updateCnt", updateCnt);

	}

	// 입하 내역
	@Override
	public void arrival_History_list(HttpServletRequest req, Model model) {
		System.out.println("서비스 - arrival_History_list");

        // 3 화면으로부터 값 받아오기
		String pageNum = req.getParameter("pageNum");

		// 5-1 paging 클래스
		Paging paging = new Paging(pageNum);

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 5-2 arrival_History_list 가져오기
		List<AssembleDTO> list = dao.arrival_history_list(map);
		System.out.println("list : " + list);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}

	// 입고지시목록
	@Override
	public void warehousing_Request_List(HttpServletRequest req, Model model) {
		System.out.println("서비스 - warehousing_Request_List");

		List<AssembleDTO> list = dao.warehousing_Request_List();

		model.addAttribute("list",list);
	}

	// 입고처리 상세
	@Override
	public void warehousing_indicate(HttpServletRequest req, Model model) {
		System.out.println("서비스 - warehousing_indicate");

		int request_id = Integer.parseInt(req.getParameter("request_id"));
		int wh_id = Integer.parseInt(req.getParameter("wh_id"));

		List<AssembleDTO> list = dao.warehousing_indicate(request_id);
		List<AssembleDTO> lack_list = dao.lack_list(wh_id);

		model.addAttribute("list",list);
		model.addAttribute("lack_list",lack_list);

	}

	// 입고처리
	@Override
	public void warehousing_indicate_action(HttpServletRequest req, Model model) {
		System.out.println("서비스 - warehousing_indicate_action");

		int request_id = Integer.parseInt(req.getParameter("request_id"));
		int inbound_id = Integer.parseInt(req.getParameter("inbound_id"));

		String[] lack_code = req.getParameterValues("lack_code");
		String[] qty = req.getParameterValues("qty");
		String[] product_id = req.getParameterValues("product_id");


		int updateCnt = dao.warehousing_indicate_action_request(request_id);
		updateCnt += dao.warehousing_indicate_action_inbound(inbound_id);
		int updateCnt_lack = 0;

		Map<String,Object> map = new HashMap<String, Object>();

		for(int i = 0; i < lack_code.length; i++) {
			System.out.println("dddddddddddd");
			map.put("lack_code", Integer.parseInt(lack_code[i]));
			map.put("qty",Integer.parseInt(qty[i]));
			map.put("product_id", Integer.parseInt(product_id[i]));
			System.out.println("map : " + map);
			updateCnt_lack += dao.warehousing_indicate_action_lack(map);
		}

		model.addAttribute("updateCnt",updateCnt);
		model.addAttribute("updateCnt_lack",updateCnt_lack);
	}

	// 입고 내역
	@Override
	public void warehousing_list(HttpServletRequest req, Model model) {
		System.out.println("서비스 - warehousing_list");

		List<AssembleDTO> list = dao.warehousing_list();

		model.addAttribute("list",list);

	}
// -------------------------- [ 출하 ] ----------------------------------
	// 출하지시현황
	@Override
	public void deliver_indicate_list(HttpServletRequest req, Model model) {
		System.out.println("service - 출하요청현황");

        // 3 화면으로부터 값 받아와버리기
		String pageNum = req.getParameter("pageNum");

		// 5-1 paging 클래스
		Paging paging = new Paging(pageNum);

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 5-2 deliver_history_list 가져오기
		List<AssembleDTO> list = dao.getDeliver_indicate_list(map);
		System.out.println("list : " + list);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}
	// 출하지시상세
	@Override
	public void deliver_indicate(HttpServletRequest req, Model model) {
		 System.out.println("서비스 - 출하지시상세");
		 int request_id = Integer.parseInt(req.getParameter("request_id"));

		 AssembleDTO dto = dao.deliver_indicate(request_id);
		 List<AssembleDTO> list = dao.deliver_indicate_product(request_id);
	     System.out.println("상세페이지 dto : " + dto);
	     System.out.println(list);

	     model.addAttribute("dto", dto);
	     model.addAttribute("list", list);

	}
	// 출하 지시 처리
	@Override
	public void deliver_indicate_action(HttpServletRequest req, Model model) {
		System.out.println("서비스 - 출하 지시 처리");
		int request_id = Integer.parseInt(req.getParameter("request_id"));
		int updateCnt = dao.deliver_indicate_action(request_id);

		model.addAttribute("updateCnt", updateCnt);

	}


	// 출하내역
	@Override
	public void deliver_history_list(HttpServletRequest req, Model model) {
		System.out.println("service - 출하내역");

        // 3 화면으로부터 값 받아오기
		String pageNum = req.getParameter("pageNum");

		// 5-1 paging 클래스
		Paging paging = new Paging(pageNum);

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 5-2 deliver_history_list  가져오기
		List<AssembleDTO> list = dao.getDeliver_history_list(map);
		System.out.println("list : " + list);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}


	// -------------------------- [ 출고 ] ----------------------------------
	// 출고 요청 현황
	@Override
	public void release_Request_list(HttpServletRequest req, Model model) {
		System.out.println("service - 출고요청현황");

        // 3 화면으로부터 값 받아오기
		String pageNum = req.getParameter("pageNum");

		// 5-1 paging 클래스
		Paging paging = new Paging(pageNum);

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 5-2 release_Request_list 가져오기
		List<AssembleDTO> list = dao.getRelease_Request_list(map);
		System.out.println("list : " + list);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

	}
	// 출고처리 상세
	@Override
	public void release_indicate(HttpServletRequest req, Model model) {
		System.out.println("서비스 - release_indicate");
		int request_id = Integer.parseInt(req.getParameter("request_id"));
		int wh_id = Integer.parseInt(req.getParameter("wh_id"));

		List<AssembleDTO> list = dao.release_indicate(request_id);

		for(int i=0; i<list.size();i++) {
			System.out.println("dddddddd");

			Map<String, Object> map = new HashMap<String, Object>();

			int product_id = list.get(i).getProduct_id();
			System.out.println("product_id" + product_id);

			map.put("wh_id", wh_id);
			map.put("product_id", product_id);

			List<LackDTO> lack_list = dao.release_lack_list(map);

			list.get(i).setLackList(lack_list);
		}

		System.out.println(list.get(0).getLackList());

		model.addAttribute("list",list);

	}

	// 출고 처리
	@Override
	public void release_indicate_action(HttpServletRequest req, Model model) {
		System.out.println("서비스 - release_indicate_action");

		int request_id = Integer.parseInt(req.getParameter("request_id"));
		int outbound_id = Integer.parseInt(req.getParameter("outbound_id"));

		String[] lack_code = req.getParameterValues("lack_code");
		String[] qty = req.getParameterValues("qty");

		int updateCnt = dao.release_indicate_action_request(request_id);
		updateCnt += dao.release_indicate_action_outbound(outbound_id);
		int updateCnt_lack = 0;

		Map<String,Object> map = new HashMap<String, Object>();

		for(int i = 0; i < lack_code.length; i++) {
			System.out.println("dddddddddddd");
			map.put("lack_code", Integer.parseInt(lack_code[i]));
			map.put("qty",Integer.parseInt(qty[i]));
			System.out.println("map : " + map);
			updateCnt_lack += dao.release_indicate_action_lack(map);
		}

		model.addAttribute("updateCnt",updateCnt);
		model.addAttribute("updateCnt_lack",updateCnt_lack);
	}


	// 출고내역
	@Override
	public void release_history_list(HttpServletRequest req, Model model) {
		System.out.println("서비스 - release_history_list");

		List<AssembleDTO> list = dao.release_history_list();

		model.addAttribute("list",list);

	}


}
