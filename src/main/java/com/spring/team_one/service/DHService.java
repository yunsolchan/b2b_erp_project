package com.spring.team_one.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DHService {


// ------------------------------------[창고] ----------------------------------------
	// 창고 목록
	public void warehouseList(HttpServletRequest req, Model model);

	// 창고 등록 처리
	public void warehouse_insert_action(HttpServletRequest req, Model model);

	// 창고 정보
	public void warehouse_detail(HttpServletRequest req, Model model);


// ------------------------------------[재고] ----------------------------------------
	// 재고 현황
	public void stock_list(HttpServletRequest req, Model model);

	// 재고 상세
	public void stock_update(HttpServletRequest req, Model model);

	// 재고 조정 처리
	public void stock_update_action(HttpServletRequest req, Model model);

// ------------------------------------[입하] ----------------------------------------
	// 입하 지시 현황
	public void arrival_list(HttpServletRequest req, Model model);

	// 입하지시 상세
	public void arrival_indicate(HttpServletRequest req, Model model);

	// 입하지시 처리
	public void arrival_indicate_action(HttpServletRequest req, Model model);

	// 입하 내역
	public void arrival_History_list(HttpServletRequest req, Model model);

	// ------------------------------------[입고] ----------------------------------------
	// 입고 요청 현황
	public void warehousing_Request_List(HttpServletRequest req, Model model);

	// 입고 처리
	public void warehousing_indicate(HttpServletRequest req, Model model);

	// 입고 처리 액션
	public void warehousing_indicate_action(HttpServletRequest req, Model model);

	// 입고 내역
	public void warehousing_list(HttpServletRequest req, Model model);


// ------------------------------------ [출하] ------------------------------------------------
	// 출하 지시 현황
	public void deliver_indicate_list(HttpServletRequest req, Model model);

	// 출하지시
	public void deliver_indicate(HttpServletRequest req, Model model);

	// 출하 지시 처리
	public void deliver_indicate_action(HttpServletRequest req, Model model);

	// 출하 내역
	public void deliver_history_list(HttpServletRequest req, Model model);

// ------------------------------------[출고] ----------------------------------------
	// 출고 요청 현황
	public void release_Request_list(HttpServletRequest req, Model model);

	// 출고 처리
	public void release_indicate(HttpServletRequest req, Model model);

	// 출고 처리 액션
	public void release_indicate_action(HttpServletRequest req, Model model);

	// 출고 내역
	public void release_history_list(HttpServletRequest req, Model model);

}
