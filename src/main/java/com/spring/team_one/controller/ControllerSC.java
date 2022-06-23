package com.spring.team_one.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.team_one.service.SCService;


@Controller
public class ControllerSC {
	
	@Autowired
	SCService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ControllerSC.class);
	
	// 거래처 상세조회
	@RequestMapping("client_detail.sc")
	public String client_detail(HttpServletRequest req, Model model) {
		logger.info("[url : client_detail.sc]");
		service.client_detail(req, model);
		return "PURCHASE/client_detail";
	}
	
	// 거래처 목록조회
	@RequestMapping("client_list.sc")
	public String client(HttpServletRequest req, Model model) {
		logger.info("[url : client_list.sc]");
		service.client_list(req, model);
		return "PURCHASE/client_list";
	}
	
	// 신규 거래처 등록창
	@RequestMapping("client_insert.sc")
	public String client_insert() {
		logger.info("[url : client_insert.sc]");
		
		return "PURCHASE/client_insert";
	}
	
	// 거래처 삭제창
	@RequestMapping("client_delete.sc")
	public String client_delete(HttpServletRequest req, Model model) throws IOException {
		logger.info("[url : client_delete.sc]");
		service.client_delete(req, model);

		return "PURCHASE/client_delete_action";
	}
	
	// 거래처 정보 수정창
	@RequestMapping("client_update.sc")
	public String client_update(HttpServletRequest req, Model model) {
		logger.info("[url : client_update.sc]");
		service.client_detail(req, model);
		return "PURCHASE/client_update";
	}
	
	// 거래처 정보 수정
	@RequestMapping("client_update_action.sc")
	public String client_update_action(HttpServletRequest req, Model model) {
		logger.info("[url : client_update_action.sc]");
		service.client_update(req, model);
		return "PURCHASE/client_update";
	}
	
	// 신규 거래처 등록
	@RequestMapping("client_insert_action.sc")
	public String client_insert_action(HttpServletRequest req, Model model) {
		logger.info("[url : client_insert.sc]");
		service.client_insert(req, model);
		return "PURCHASE/client_insert";
	}
	
	// 주문서 목록
	@RequestMapping("order_list.sc")
	public String order_list(HttpServletRequest req, Model model) {
		logger.info("[url : order_list.sc]");
		service.order_list(req, model);
		return "PURCHASE/order_list";
	}
	
	// 주문서 등록창
	@RequestMapping("order_insert.sc")
	public String order_insert(HttpServletRequest req, Model model) {
		logger.info("[url : order_insert.sc]");
		service.employeeInfo(req, model);
		return "PURCHASE/order_insert";
	}
	
	// 주문서 등록
	@RequestMapping("order_insert_action.sc")
	public String order_insert_action(HttpServletRequest req, Model model) {
		logger.info("[url : order_insert_action.sc]");	
		service.order_insert(req, model);
		return "PURCHASE/order_insert";
	}
	
	// 주문서 상세정보
	@RequestMapping("order_detail.sc")
	public String order_detail(HttpServletRequest req, Model model) {
		logger.info("[url : order_detail.sc]");
		service.estimate_detail(req, model);
		return "PURCHASE/order_detail";
	}
	
	// 견적서 목록
	@RequestMapping("estimate_list.sc")
	public String estimate_list(HttpServletRequest req, Model model) {
		logger.info("[url : estimate_list.sc]");
		service.estimate_list(req, model);
		return "PURCHASE/estimate_list";
	}
	
	// 견적서 상세정보
	@RequestMapping("estimate_detail.sc")
	public String estimate_detail(HttpServletRequest req, Model model) {
		logger.info("[url : estimate_detail.sc]");
		service.estimate_detail(req, model);
		return "PURCHASE/estimate_detail";
	}
	
	// 구매관리현황
	@RequestMapping("purchase_request.sc")
	public String purchase_request() {
		logger.info("[url : purchase_request.sc]");
		
		return "PURCHASE/purchase_request";
	}
	
	// 구매관리현황
	@RequestMapping("unclaimed.sc")
	public String unclaimed() {
		logger.info("[url : unclaimed.sc]");
		
		return "PURCHASE/unclaimed";
	}
	
	// 지급현황
	@RequestMapping("provision.sc")
	public String provision() {
		logger.info("[url : provision.sc]");
		
		return "PURCHASE/provision";
	}
	
	// 구매현황
	@RequestMapping("purchase_status.sc")
	public String purchase_status() {
		logger.info("[url : purchase_status.sc]");
		
		return "PURCHASE/purchase_status";
	}
	
	// 구매조회
	@RequestMapping("purchase_inquiry.sc")
	public String purchase_inquiry() {
		logger.info("[url : purchase_inquiry.sc]");
		
		return "PURCHASE/purchase_Inquiry";
	}
	
	// 견적서 요청서 등록창
	@RequestMapping("estimate_application_insert.sc")
	public String estimate_application_insert(HttpServletRequest req, Model model) {
		logger.info("[url : estimate_application_insert.sc]");
		service.employeeInfo(req, model);
		return "PURCHASE/estimate_application_insert";
	}
	
	// 견적서 요청서 상세정보
	@RequestMapping("estimate_application_detail.sc")
	public String estimate_application_detail(HttpServletRequest req, Model model) {
		logger.info("[url : estimate_application_detail.sc]");
		service.estimate_application_detail(req, model);
		return "PURCHASE/estimate_application_detail";
	}
	
	// 견적서 요청서 목록
	@RequestMapping("estimate_application_list.sc")
	public String estimate_application_list(HttpServletRequest req, Model model) {
		logger.info("[url : estimate_application_list.sc]");
		service.estimate_application_list(req, model);
		return "PURCHASE/estimate_application_list";
	}
	
	// 견적서 요청서 등록
	@RequestMapping("estimate_application_insert_action.sc")
	public String estimate_application_insert_action(HttpServletRequest req, Model model) {
		logger.info("[url : estimate_application_insert_action.sc]");
		service.estimate_application_insert(req, model);
		return "PURCHASE/estimate_application_insert";
	}
	
	// 거래처 목록 팝업
	@RequestMapping("client_list_select.sc")
	public String client_list_select(HttpServletRequest req, Model model) {
		logger.info("[url : client_list_select.sc]");
		service.client_list(req, model);
		return "PURCHASE/client_list_select";
	}
	
	// 상품 목록 팝업
	@RequestMapping("product_list_select.sc")
	public String product_list_select(HttpServletRequest req, Model model) {
		logger.info("[url : product_list_select.sc]");
		service.product_list(req, model);
		return "PURCHASE/product_list_select";
	}
	
	// 견적서 목록 팝업
	@RequestMapping("estimate_list_select.sc")
	public String estimate_list_select(HttpServletRequest req, Model model) {
		logger.info("[url : estimate_list_select.sc]");
		service.estimate_list_select(req, model);
		return "PURCHASE/estimate_list_select";
	}
	
	// 주문서 승인 신청
	@RequestMapping("order_update.sc")
	public String order_update(HttpServletRequest req, Model model) {
		logger.info("[url : order_update.sc]");
		service.order_update(req, model);
		return "PURCHASE/order_update_action";
	}
	
	// 입고 신청
	@RequestMapping("inbound_insert.sc")
	public String inbound_insert(HttpServletRequest req, Model model) {
		logger.info("[url : inbound_insert.sc]");
		service.inbound_insert(req, model);
		return "PURCHASE/inbound_insert";
	}
	
	// 주문서 승인 신청
	@RequestMapping("inbound_insert_action.sc")
	public String inbound_insert_action(HttpServletRequest req, Model model) {
		logger.info("[url : inbound_insert_action.sc]");
		service.inbound_insert_action(req, model);
		return "PURCHASE/inbound_update_action";
	}
	
	// 거래처명 중복확인
	@ResponseBody
	@RequestMapping("client_check.sc")
	public String client_check(HttpServletRequest req, Model model) {
		logger.info("[url : client_check.sc]");
		if(0 == service.client_check(req, model)) {
			return "a";
		}else {
			return "b";
		}
	}
	
	// 거래처명 중복확인
	@ResponseBody
	@RequestMapping("bank_check.sc")
	public String bank_check(HttpServletRequest req, Model model) {
		logger.info("[url : bank_check.sc]");
		if(0 == service.bank_check(req, model)) {
			return "a";
		}else {
			return "b";
		}
	}
	
   @RequestMapping("request_list.sc")
   public String request_list(HttpServletRequest req, Model model){
      
      logger.info("[url : request_list.sc]");
      
      service.request_list(req, model);
      
      return "PURCHASE/request_list";
   }
	
	
}
