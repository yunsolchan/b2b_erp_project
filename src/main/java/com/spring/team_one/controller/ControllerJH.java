package com.spring.team_one.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.team_one.service.JHService;
import com.spring.team_one.service.OneService;

// 지호 컨트롤러
@Controller
public class ControllerJH {
	private static final Logger logger = LoggerFactory.getLogger(ControllerJH.class);

	// service 접근
	@Autowired
	OneService service;
	
	@Autowired
	JHService JHservice;

	// --------------- 거래처 ---------------
	
	// 거래처 조회
	@RequestMapping("client_list.jh")
	public String client_list(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : client_list.jh]");
		
		JHservice.client_list(req, model);
		
		return "/SALES/client/client_list";
	}

	// 거래처 등록
	@RequestMapping("client_insert.jh")
	public String client_insert(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : client_insert.jh]");

		return "/SALES/client/client_insert";
	}
	
	   // 거래처명 중복확인
	   @ResponseBody
	   @RequestMapping("client_check.jh")
	   public String client_check(HttpServletRequest req, Model model) {
		   
	      logger.info("[url : client_check.jh]");
	      
	      if(0 == JHservice.client_check(req, model)) {
	         return "a";
	         
	      } else {
	         return "b";
	      }
	   }
	   
	   // 계좌번호 중복확인
	   @ResponseBody
	   @RequestMapping("bank_check.jh")
	   public String bank_check(HttpServletRequest req, Model model) {
		   
	      logger.info("[url : bank_check.jh]");
	      
	      if(0 == JHservice.bank_check(req, model)) {  	  
	         return "a";
	         
	      } else {
	         return "b";
	      }
	   }
	   
	// 거래처 등록 액션
	@RequestMapping("client_insert_action.jh")
	   public String client_insert_action(HttpServletRequest req, HttpServletResponse res, Model model)
			   throws ServletException, IOException {
		
	      logger.info("[url : client_insert_action.jh]");
	      
		  JHservice.client_insert_action(req, res, model);
		  
		  return "SALES/client/client_insert";
	}

	// 거래처 상세
	@RequestMapping("client_detail.jh")
	public String client_detail(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : client_detail.jh]");

		JHservice.client_detail(req, model);
		
		return "/SALES/client/client_detail";
	}
	
	// 거래처 내역보기
	@RequestMapping("request_list.jh")
	public String request_list(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : request_list.jh]");
		
		JHservice.request_list(req, model);
		
		return "/SALES/client/request_list";
	}	
	
	// 거래처 수정
	@RequestMapping("client_update.jh")
	public String client_update(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : client_update.jh]");

		JHservice.client_detail(req, model);
		
		return "/SALES/client/client_update";		
	}
	
	// 거래처 수정 액션
	@RequestMapping("client_update_action.jh")
	   public String client_update_action(HttpServletRequest req, HttpServletResponse res, Model model)
			   throws ServletException, IOException {
		
	      logger.info("[url : client_update_action.jh]");
	      
		  JHservice.client_update_action(req, res, model);	
		
		  return "SALES/client/client_update";
	}	
	
	// 거래처 삭제
	@RequestMapping("client_delete.jh")
	public String client_delete(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		
		  logger.info("[url : client_delete.jh]");

		  JHservice.client_delete(req, res, model);
		
		  return "SALES/client/client_delete_action";		
	}
	
	// --------------- 견적서 ---------------	

	// 견적서 조회
	@RequestMapping("estimate_list.jh")
	public String estimate_list(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : estimate_list.jh]");
		
		JHservice.estimate_list(req, model);
		
		return "/SALES/estimate/estimate_list";
	}

	// 견적서 등록
	@RequestMapping("estimate_insert.jh")
	public String estimate_insert(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : estimate_insert.jh]");

		JHservice.estimate_insert(req, model);
		
		return "/SALES/estimate/estimate_insert";
	}
	
	  // 거래처 목록
	  @RequestMapping("client_list_select.jh")
	  public String client_list_select(HttpServletRequest req, Model model)
			  throws ServletException, IOException {
		  
		  logger.info("[url : client_list_select.jh]");
	  
		  JHservice.client_list(req, model);
		  
		  return "/SALES/estimate/client_list_select";
	  }
	  
	  // 거래처 상품 목록
	  @RequestMapping("client_product_list.jh")
	  public String client_product_list(HttpServletRequest req, Model model)
			  throws ServletException, IOException {
		  
		  logger.info("[url : client_product_list.jh]");
		  
		  JHservice.client_product_list(req, model);
	  
		  return "/SALES/estimate/client_product_list";
	  }	  
	
	  // 상품 목록
	  @RequestMapping("product_list.jh")
	  public String product_list(HttpServletRequest req, Model model)
			  throws ServletException, IOException {
		  
		  logger.info("[url : product_list.jh]");
		  
		  JHservice.product_list(req, model);
	  
		  return "/SALES/estimate/product_list";
	  }	
	
	// 견적서 등록 액션 + 주문서 등록 액션 + 전표 등록 액션
	@RequestMapping("estimate_insert_action.jh")
	   public String estimate_insert_action(HttpServletRequest req, HttpServletResponse res, Model model)
			   throws ServletException, IOException {
	      
	      logger.info("[url : estimate_insert_action.jh]");
	      
	      JHservice.estimate_insert_action(req, res, model);
	      
		  return "SALES/estimate/estimate_insert";	      
	}

	// 견적서 상세
	@RequestMapping("estimate_detail.jh")
	public String estimate_detail(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : estimate_detail.jh]");

		JHservice.estimate_detail(req, model);
		
		return "/SALES/estimate/estimate_detail";
	}
	
	// --------------- 주문서 ---------------
	
	// 주문서 조회
	@RequestMapping("order_list.jh")
	public String order_list(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : order_list.jh]");
		
		JHservice.order_list(req, model);
	
		return "/SALES/order/order_list";
	}
	
	// 전표 수정
	@RequestMapping("order_update.jh")
	public String order_update(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : order_update.jh]");
		
	    JHservice.order_update(req, res, model);
	      
		return "SALES/order/order_update_action";	
		  
	}
	
	// 출고 요청
	@RequestMapping("outbound_insert.jh")
	public String outbound_insert(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : outbound_insert.jh]");
		
		JHservice.outbound_insert(req, model);

		return "/SALES/order/outbound_insert";
	}
	
	// 출고 요청 액션
	@RequestMapping("outbound_insert_action.jh")
	public String outbound_insert_action(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		logger.info("[url : outbound_insert_action.jh]");
		
		JHservice.outbound_insert_action(req, model);

		return "/SALES/order/outbound_insert";
	}
	
	// 주문서 상세
	@RequestMapping("order_detail.jh")
	public String order_detail(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("[url : order_detail.jh]");
		
		JHservice.order_detail(req, model);

		return "/SALES/order/order_detail";
	}

}
