package com.spring.team_one.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.team_one.service.DHService;

// 테스트 컨트롤러
@Controller
public class Controller_dh {
	private static final Logger logger = LoggerFactory.getLogger(Controller_dh.class);

	// service 접근
	@Autowired
	DHService dhservice;
// --------------------------- [창고] ---------------------------------
	// 창고 관리  ajax
	@RequestMapping("warehouse_info.dh")
	public String warehouse_info() {
		logger.info("[url : warehouse_info.dh]");

		return "LOGISTICS/warehouse_info";
	}

	// 창고 목록
	@RequestMapping("warehouse_list.dh")
	public String warehouse_list(HttpServletRequest req, Model model) {
		logger.info("[url : warehouse_list.dh]");
		dhservice.warehouseList(req, model);
		return "LOGISTICS/warehouse_list";
	}

	// 창고 등록
	@RequestMapping("warehouse_insert.dh")
	public String warehouse_insert(HttpServletRequest req, Model model) {
		logger.info("[url : warehouse_insert.dh]");

		return "LOGISTICS/warehouse_insert";
	}

	// 창고 등록 처리
	@RequestMapping("warehouse_insert_action.dh")
	public String warehouse_insert_action(HttpServletRequest req, Model model) {
		logger.info("[url : warehouse_insert_action.dh]");
		dhservice.warehouse_insert_action(req, model);
		return "LOGISTICS/warehouse_insert_action";
	}

	// 창고 정보
	@RequestMapping("warehouse_detail.dh")
	public String warehouse_detail(HttpServletRequest req, Model model) {
		logger.info("[url : warehouse_detail.dh]");
		dhservice.warehouse_detail(req, model);
		return "LOGISTICS/warehouse_detail";
	}

// --------------------------- [재고] ---------------------------------
	// 재고 현황
	@RequestMapping("stock_list.dh")
	public String stock_list(HttpServletRequest req, Model model) {
		logger.info("[url : stock_list.dh]");
		dhservice.stock_list(req, model);
		return "LOGISTICS/stock_list";
	}

	// 재고 현황 창고 선택
    @RequestMapping("stock_list_wh.dh")
    public String stock_list_wh(HttpServletRequest req, Model model) {
       logger.info("[url : stock_list_wh.dh]");
       dhservice.warehouseList(req, model);
       return "LOGISTICS/stock_list_wh";
   }

	// 재고 조정 상세
	@RequestMapping("stock_update.dh")
	public String stock_update(HttpServletRequest req, Model model) {
		logger.info("[url : stock_update.dh]");
		dhservice.stock_update(req, model);
		return "LOGISTICS/stock_update";
	}

	// 재고 조정 처리
	@RequestMapping("stock_update_action.dh")
	public String stock_update_action(HttpServletRequest req, Model model) {
		logger.info("[url : stock_update_action.dh]");
		dhservice.stock_update_action(req, model);
		return "LOGISTICS/stock_update_action";
	}

// --------------------------- [입하] ---------------------------------
	// 입하/입고 관리 ajax
	@RequestMapping("warehousing_arrival_info.dh")
	public String warehousing_arrival_info() {
		logger.info("[url : warehousing_arrival_info.dh]");

		return "LOGISTICS/warehousing_arrival_info";
	}

	// 입하 지시 현황
	@RequestMapping("arrival_list.dh")
	public String arrival_list(HttpServletRequest req, Model model) {
		logger.info("[url : arrival_list.dh]");
		dhservice.arrival_list(req, model);
		return "LOGISTICS/arrival_list";
	}

	// 입하 지시
	@RequestMapping("arrival_indicate.dh")
	public String arrival_indicate(HttpServletRequest req, Model model) {
		logger.info("[url : arrival_indicate.dh]");
		dhservice.arrival_indicate(req, model);
		return "LOGISTICS/arrival_indicate";
	}

	// 입하 지시 처리
	@RequestMapping("arrival_indicate_action.dh")
	public String arrival_indicate_action(HttpServletRequest req, Model model) {
		logger.info("[url : arrival_indicate_action.dh]");
		dhservice.arrival_indicate_action(req,model);

		return "LOGISTICS/arrival_indicate_action";
	}


	// 입하  내역
	@RequestMapping("arrival_history_list.dh")
	public String arrival_History_list(HttpServletRequest req, Model model) {
		logger.info("[url : arrival_history_list.dh]");
		dhservice.arrival_History_list(req, model);
		return "LOGISTICS/arrival_history_list";
	}

	// 입하 상세
	@RequestMapping("arrival_indicate_detail.dh")
	public String arrival_indicate_detail(HttpServletRequest req, Model model) {
		logger.info("[url : arrival_indicate_detail.dh]");
		dhservice.arrival_indicate(req, model);
		return "LOGISTICS/arrival_indicate_detail";
	}

// --------------------------- [입고] ---------------------------------
	// 입고 요청 현황
	@RequestMapping("warehousing_Request_list.dh")
	public String warehousing_Request_list(HttpServletRequest req, Model model) {
		logger.info("[url : warehousing_Request_list.dh]");
		dhservice.warehousing_Request_List(req, model);
		return "LOGISTICS/warehousing_Request_list";
	}

	// 입고 처리
	@RequestMapping("warehousing_indicate.dh")
	public String warehousing_indicate(HttpServletRequest req, Model model) {
		logger.info("[url : warehousing_indicate.dh]");
		dhservice.warehousing_indicate(req, model);

		return "LOGISTICS/warehousing_indicate";
	}

	// 입고 처리 액션
	@RequestMapping("warehousing_indicate_action.dh")
	public String warehousing_indicate_action(HttpServletRequest req, Model model) {
		logger.info("[url : warehousing_indicate_action.dh]");

		dhservice.warehousing_indicate_action(req, model);

		return "LOGISTICS/warehousing_indicate_action";
	}

	// 입고 내역
	@RequestMapping("warehousing_list.dh")
	public String warehousing_list(HttpServletRequest req, Model model) {
		logger.info("[url : warehousing_list.dh]");
		dhservice.arrival_History_list(req, model);
		return "LOGISTICS/warehousing_list";
	}

// --------------------------- [출하] ---------------------------------
	// 출하지시목록
	@RequestMapping("deliver_indicate_list.dh")
	public String deliver_indicate_list(HttpServletRequest req, Model model) {
		logger.info("[url : deliver_indicate_list.dh]");
		dhservice.deliver_indicate_list(req, model);
		return "LOGISTICS/deliver_indicate_list";
	}

	// 출하지시
	@RequestMapping("deliver_indicate.dh")
	public String deliver_indicate(HttpServletRequest req, Model model) {
		logger.info("[url : deliver_indicate.dh]");
		dhservice.deliver_indicate(req, model);
		return "LOGISTICS/deliver_indicate";
	}

	// 출하지시 처리
	@RequestMapping("deliver_indicate_action.dh")
	public String deliver_indicate_action(HttpServletRequest req, Model model) {
		logger.info("[url : deliver_indicate_action.dh]");
		dhservice.deliver_indicate_action(req, model);
		return "LOGISTICS/deliver_indicate_action";
	}

	// 출하 내역
	@RequestMapping("deliver_history_list.dh")
	public String deliver_list(HttpServletRequest req, Model model) {
		logger.info("[url : deliver_history_list.dh]");
		dhservice.deliver_history_list(req, model);
		return "LOGISTICS/deliver_history_list";
	}

	// 출하 상세
	@RequestMapping("deliver_indicate_detail.dh")
	public String deliver_indicate_detail(HttpServletRequest req, Model model) {
		logger.info("[url : deliver_indicate_detail.dh]");
		dhservice.deliver_indicate(req, model);
		return "LOGISTICS/deliver_indicate_detail";
	}

// --------------------------- [출고] ------------------------------------------
	// 출고/출하 관리 ajax
	@RequestMapping("release_deliver_info.dh")
	public String release_deliver_info() {
		logger.info("[url : release_deliver_info.dh]");

		return "LOGISTICS/release_deliver_info";
	}

	// 출고 요청 현황
	@RequestMapping("release_Request_list.dh")
	public String release_Request_list(HttpServletRequest req, Model model) {
		logger.info("[url : release_Request_list.dh]");
		dhservice.release_Request_list(req, model);
		return "LOGISTICS/release_Request_list";
	}

	// 출고 처리
	@RequestMapping("release_indicate.dh")
	public String release_indicate(HttpServletRequest req, Model model) {
		logger.info("[url : release_indicate.dh]");
		dhservice.release_indicate(req, model);
		return "LOGISTICS/release_indicate";
	}

	// 출고 처리 액션
	@RequestMapping("release_indicate_action.dh")
	public String release_indicate_action(HttpServletRequest req, Model model) {
		logger.info("[url : relezase_indicate_action.dh]");
		dhservice.release_indicate_action(req, model);
		return "LOGISTICS/release_indicate_action";
	}

	// 출고 내역
	@RequestMapping("release_history_list.dh")
	public String release_history_list(HttpServletRequest req, Model model) {
		logger.info("[url : release_history_list.dh]");
		dhservice.release_history_list(req, model);
		return "LOGISTICS/release_history_list";
	}

}
