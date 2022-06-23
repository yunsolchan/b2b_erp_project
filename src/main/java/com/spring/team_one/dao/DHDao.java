package com.spring.team_one.dao;

import java.util.List;
import java.util.Map;

import com.spring.team_one.dto.AssembleDTO;
import com.spring.team_one.dto.LackDTO;

//동호 Dao 인터페이스
public interface DHDao {

	// ----------------------------  [ 창고관리 ] --------------------------------
	// 창고 목록
	public List<AssembleDTO> warehouseList(Map<String, Object> map);

	// 창고 등록
	public int warehouse_insert(AssembleDTO assembleDTO);

	// 전체 렉갯수
	public int all_lack_count(int wh_id);
	
	// 사용렉갯수
	public int use_lack_count(int wh_id);
	
	//창고 상세
	public AssembleDTO getWarehouseDetail(int wh_id);

//	// 가용용적
//	public int progresssBar(int wh_id);

	// 랙 생성 랙번호 , 창고번호
	public int warehouse_lackInsert(Map<String, Object> map);

// ----------------------------  [ 재고관리 ] --------------------------------
	// 재고 현황
	public List<AssembleDTO> getStockList(Map<String, Object> map);

	// 재고 상세
	public AssembleDTO getStockDetail(int product_id);

	// 재고조정_기존랙에서 물품제거
	public int stock_Update_Action(int old_lack_code);

	// 재고조정_새로운랙에 물품추가
	public int stock_Update_Action2(AssembleDTO assembleDTO);

	// ---------------------------- [ 입하 ] -------------------------------------
	// 입하지시  목록
	public List<AssembleDTO> getArrivalList(Map<String, Object> map);

	// 입하지시
	public AssembleDTO arrival_Indicate(int request_id);
	public List<AssembleDTO> arrival_Indicate_product(int request_id);

	// 입하지시 처리
	public int arrival_indicate_action(int request_id);

	// 입하 내역
	public List<AssembleDTO> arrival_history_list(Map<String, Object> map);

	// ---------------------------- [ 입고 ] -------------------------------------

	// 입고요청 목록
	public List<AssembleDTO> warehousing_Request_List();

	// 입고요청
	public List<AssembleDTO> warehousing_indicate(int request_id);

	// 랙리스트
	public List<AssembleDTO> lack_list(int wh_id);

	// 입고처리_요청테이블 end_date update
	public int warehousing_indicate_action_request(int request_id);
	// 입고처리_인바운드테이블 status update
	public int warehousing_indicate_action_inbound(int inbound_id);
	// 입고처리_랙테이블 물품입고
	public int warehousing_indicate_action_lack(Map<String,Object> map);

	// 입고내역
	public List<AssembleDTO> warehousing_list();


// ---------------------------- [ 출하 ] -----------------------------------------
	// 출하지시현황
	public List<AssembleDTO> getDeliver_indicate_list(Map<String, Object> map);

	// 출하 지시
	public AssembleDTO deliver_indicate(int request_id);
	public List<AssembleDTO> deliver_indicate_product(int request_id);

	// 출하지시 처리
	public int deliver_indicate_action(int request_id);

	// 출하 내역
	public List<AssembleDTO> getDeliver_history_list(Map<String, Object> map);

// ---------------------------- [ 출고 ] -----------------------------------------
	// 출고 요청현황
	public List<AssembleDTO> getRelease_Request_list(Map<String, Object> map);

	// 출고요청
	public List<AssembleDTO> release_indicate(int request_id);

	// 랙리스트
	public List<LackDTO> release_lack_list(Map<String, Object> map);

	// 출고처리_요청테이블 end_date update
	public int release_indicate_action_request(int request_id);

	// 출고처리_아웃바운드테이블 status update
	public int release_indicate_action_outbound(int inbound_id);

	// 출고처리_랙테이블 물품출고
	public int release_indicate_action_lack(Map<String,Object> map);

	// 출고 내역
	public List<AssembleDTO> release_history_list();

}
