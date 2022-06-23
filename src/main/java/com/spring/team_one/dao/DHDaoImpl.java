package com.spring.team_one.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.team_one.dto.AssembleDTO;
import com.spring.team_one.dto.LackDTO;

//동호 Dao
@Repository
public class DHDaoImpl implements DHDao{

	@Autowired
	SqlSession sqlSession;

// ----------------------------------------- [창고] ---------------------------------------
	// 창고 목록
	@Override
	public List<AssembleDTO> warehouseList(Map<String, Object> map) {
	  System.out.println("DAO - warehouseList()");

	   DHDao dao = sqlSession.getMapper(DHDao.class);
       return dao.warehouseList(map);

	}

	// 전체 렉갯수
	@Override
	public int all_lack_count(int wh_id) {
	  System.out.println("DAO - all_lack_count()");

	   DHDao dao = sqlSession.getMapper(DHDao.class);
       return dao.all_lack_count(wh_id);
	}
	
	// 사용렉갯수
	@Override
	public int use_lack_count(int wh_id) {
	  System.out.println("DAO - use_lack_count()");

	   DHDao dao = sqlSession.getMapper(DHDao.class);
       return dao.use_lack_count(wh_id);
	}
	
	// 창고 상세
	@Override
	public AssembleDTO getWarehouseDetail(int wh_id) {
		System.out.println("DAO - getWarehouseDetail()");
		DHDao dao = sqlSession.getMapper(DHDao.class);
	      return dao.getWarehouseDetail(wh_id);

	}

	// 창고 등록
	@Override
	public int warehouse_insert(AssembleDTO assembleDTO) {
		System.out.println("DAO - warehouse_insert");

		DHDao dao = sqlSession.getMapper(DHDao.class);
	     return dao.warehouse_insert(assembleDTO);

	}

//	// 가용용적
//	@Override
//	public int progresssBar(int wh_id) {
//		System.out.println("DAO - progresssBar");
//
//		DHDao dao = sqlSession.getMapper(DHDao.class);
//	      return dao.progresssBar(wh_id);
//	}

	// 랙생성
	@Override
	public int warehouse_lackInsert(Map<String, Object> map) {
		System.out.println("DAO - warehouse_lackInsert");

		DHDao dao = sqlSession.getMapper(DHDao.class);
		return dao.warehouse_lackInsert(map);
	}

	// ----------------------------------------- [재고] ---------------------------------------
	// 재고 현황
	@Override
	public List<AssembleDTO> getStockList(Map<String, Object> map) {
	  System.out.println("DAO - getStockList()");

	   DHDao dao = sqlSession.getMapper(DHDao.class);
       return dao.getStockList(map);
	}

	// 재고상세
	@Override
	public AssembleDTO getStockDetail(int product_id) {
		System.out.println("DAO - getStockDetail()");
		DHDao dao = sqlSession.getMapper(DHDao.class);
	      return dao.getStockDetail(product_id);

	}

	// 재고조정_기존랙에서 물품제거
	@Override
	public int stock_Update_Action(int old_lack_code) {
		System.out.println("DAO - stockUpdateAction()");

		return sqlSession.update("com.spring.team_one.dao.DHDao.stock_Update_Action",old_lack_code);

	}

	// 재고조정_새로운랙에 물품추가
	@Override
	public int stock_Update_Action2(AssembleDTO dto) {
		System.out.println("DAO - stockUpdateAction2()");

		return sqlSession.update("com.spring.team_one.dao.DHDao.stock_Update_Action2",dto);

	}
// ----------------------------------------- [입하] ---------------------------------------
	//입하지시 현황
	@Override
	public List<AssembleDTO> getArrivalList(Map<String, Object> map) {
		System.out.println("DAO - getArrivalList()");
		DHDao dao = sqlSession.getMapper(DHDao.class);
	      return dao.getArrivalList(map);

	}

	// 입하지시 상세
	@Override
    public AssembleDTO arrival_Indicate(int request_id) {
		System.out.println("DAO - arrival_Indicate()");
		DHDao dao = sqlSession.getMapper(DHDao.class);
	      return dao.arrival_Indicate(request_id);
   }

	@Override
	public List<AssembleDTO> arrival_Indicate_product(int request_id) {
		System.out.println("DAO - arrival_Indicate_product()");
		DHDao dao = sqlSession.getMapper(DHDao.class);
	    return dao.arrival_Indicate_product(request_id);
	}

	// 입하지시 처리
	@Override
	public int arrival_indicate_action(int request_id) {

		return sqlSession.update("com.spring.team_one.dao.DHDao.arrival_indicate_action",request_id);
	}

	// 입하내역
	@Override
	public List<AssembleDTO> arrival_history_list(Map<String, Object> map) {
	   System.out.println("DAO - arrival_history_list()");
	   DHDao dao = sqlSession.getMapper(DHDao.class);
       return dao.arrival_history_list(map);

    }
// ----------------------------------------- [입고] ---------------------------------------
	// 입고요청 목록
	@Override
	public List<AssembleDTO> warehousing_Request_List() {

		return sqlSession.selectList("com.spring.team_one.dao.DHDao.warehousing_Request_list");
	}

	// 입고요청 물품
	@Override
	public List<AssembleDTO> warehousing_indicate(int request_id) {

		return sqlSession.selectList("com.spring.team_one.dao.DHDao.arrival_Indicate_product",request_id);
	}

	// 랙리스트
	@Override
	public List<AssembleDTO> lack_list(int wh_id) {

		return sqlSession.selectList("com.spring.team_one.dao.DHDao.lack_list", wh_id);
	}

	// 입고처리

	@Override
	public int warehousing_indicate_action_request(int request_id) {

		return sqlSession.update("com.spring.team_one.dao.DHDao.warehousing_indicate_action_request",request_id);
	}

	@Override
	public int warehousing_indicate_action_inbound(int inbound_id) {

		return sqlSession.update("com.spring.team_one.dao.DHDao.warehousing_indicate_action_inbound",inbound_id);
	}

	@Override
	public int warehousing_indicate_action_lack(Map<String,Object> map) {

		return sqlSession.update("com.spring.team_one.dao.DHDao.warehousing_indicate_action_lack",map);
	}

	// 입고내역
	@Override
	public List<AssembleDTO> warehousing_list() {

		return sqlSession.selectList("com.spring.team_one.dao.DHDao.warehousing_list");
	}

// ----------------------------------------- [출하] ---------------------------------------
	// 출하지시현황
	@Override
	public List<AssembleDTO> getDeliver_indicate_list(Map<String, Object> map) {
		 System.out.println("DAO - getDeliver_indicate_list()");

		   DHDao dao = sqlSession.getMapper(DHDao.class);
	       return dao.getDeliver_indicate_list(map);
	}
	// 출하지시 상세
	@Override
    public AssembleDTO deliver_indicate(int request_id) {
		System.out.println("DAO - deliver_Indicate()");

		DHDao dao = sqlSession.getMapper(DHDao.class);
	      return dao.deliver_indicate(request_id);
	}

	@Override
	public List<AssembleDTO> deliver_indicate_product(int request_id) {
		System.out.println("DAO - deliver_Indicate_product()");

		DHDao dao = sqlSession.getMapper(DHDao.class);
	    return dao.deliver_indicate_product(request_id);
	}

	// 출하지시 처리
	@Override
	public int deliver_indicate_action(int request_id) {
		System.out.println("DAO - deliver_indicate_action()");

		return sqlSession.update("com.spring.team_one.dao.DHDao.deliver_indicate_action",request_id);
	}

	// 출하 내역
	@Override
	public List<AssembleDTO> getDeliver_history_list(Map<String, Object> map) {
		System.out.println("DAO - getDeliver_history_list()");
		DHDao dao = sqlSession.getMapper(DHDao.class);
	      return dao.getDeliver_history_list(map);
	}

// ----------------------------------------- [출고] ---------------------------------------
	// 출고 요청 현황
	@Override
	public List<AssembleDTO> getRelease_Request_list(Map<String, Object> map) {
		System.out.println("DAO - release_Request_list()");
		DHDao dao = sqlSession.getMapper(DHDao.class);
	      return dao.getRelease_Request_list(map);
	}

	// 출고 요청 물품
	@Override
	public List<AssembleDTO> release_indicate(int request_id) {
		System.out.println("DAO - release_indicate");

		return sqlSession.selectList("com.spring.team_one.dao.DHDao.deliver_indicate_product", request_id);
	}


	 //출고 처리
	@Override
	public int release_indicate_action_request(int request_id) {
		System.out.println("DAO - release_indicate_action_request");

		return sqlSession.update("com.spring.team_one.dao.DHDao.release_indicate_action_request",request_id);
	}

	// 출고 지시 처리 - 출고
	@Override
	public int release_indicate_action_outbound(int outbound_id) {
		System.out.println("DAO - release_indicate_action_outbound");

		return sqlSession.update("com.spring.team_one.dao.DHDao.release_indicate_action_outbound",outbound_id);
	}

	// 출고 지시 처리 - 랙
	@Override
	public int release_indicate_action_lack(Map<String,Object> map) {
		System.out.println("DAO - release_indicate_action_lack");

		return sqlSession.update("com.spring.team_one.dao.DHDao.release_indicate_action_lack",map);
	}

	// 랙리스트
	@Override
	public List<LackDTO> release_lack_list(Map<String, Object> map) {
		System.out.println("DAO - lack_list");

		return sqlSession.selectList("com.spring.team_one.dao.DHDao.release_lack_list", map);
	}

	// 출고 내역
	@Override
	public List<AssembleDTO> release_history_list() {
		System.out.println("DAO - release_history_list");
		return sqlSession.selectList("com.spring.team_one.dao.DHDao.release_history_list");
	}


 }
