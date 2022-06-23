package com.spring.team_one.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.team_one.dto.AssembleDTO;

@Repository
public class SCDaoImpl implements SCDao {

	@Autowired
	SqlSession sqlSession;

	// 거래처 등록
	@Override
	public int client_insert_action(AssembleDTO dto) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.client_insert_action(dto);
	}

	// 거래처 목록
	@Override
	public List<AssembleDTO> client_list() {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.client_list();

	}

	// 거래처 상세
	@Override
	public AssembleDTO client_detail(int num) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.client_detail(num);
	}

	// 거래처 상품 등록
	@Override
	public void client_product_insert(Map<String, Object> map) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		dao.client_product_insert(map);
	}

	// 거래처 상품 목록
	@Override
	public List<AssembleDTO> client_product_list(int num) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.client_product_list(num);
	}

	// 거래처 삭제
	@Override
	public int client_delete(int num) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.client_delete(num);
	}

	// 거래처 수정
	@Override
	public int client_update(AssembleDTO dto) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.client_update(dto);
	}

	// 거래처 상품 수정
	@Override
	public int client_product_update(Map<String, Object> map) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.client_product_update(map);
	}

	// 사원 정보
	@Override
	public AssembleDTO employeeInfo(String id) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.employeeInfo(id);
	}

	// 견적 신청서 등록
	@Override
	public int estimate_application_insert(AssembleDTO dto) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_application_insert(dto);
	}

	// 견적 신청서 상품 등록
	@Override
	public int estimate_application_detail_insert(Map<String, Object> map) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_application_detail_insert(map);
	}

	// 견적 신청서 목록 불러오기
	@Override
	public List<AssembleDTO> estimate_application_list() {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_application_list();
	}

	// 견적 신청서 상세정보
	@Override
	public AssembleDTO estimate_application_detail(String id) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_application_detail(id);
	}

	// 견적 신청서 상세정보의 상품 리스트
	@Override
	public List<AssembleDTO> estimate_application_detail_list(String id) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_application_detail_list(id);
	}

	// 견적서 등록
	@Override
	public int estimate_insert(AssembleDTO dto) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_insert(dto);
	}

	// 견적서 상세 등록
	@Override
	public int estimate_detail_insert(Map<String,Object> map) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_detail_insert(map);
	}

	// 견적서 목록 불러오기
	@Override
	public List<AssembleDTO> estimate_list() {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_list();
	}

	// 견적서 상세정보
	@Override
	public AssembleDTO estimate_detail(String id) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_detail(id);
	}

	// 견적서 상세정보의 상품 리스트
	@Override
	public List<AssembleDTO> estimate_detail_list(String id) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_detail_list(id);
	}

	// 견적서 목록 팝업
	@Override
	public List<AssembleDTO> estimate_list_select(String id) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_list_select(id);
	}

	// 견적서 상품 목록 팝업
	@Override
	public List<AssembleDTO> estimate_product_list_select() {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.estimate_product_list_select();
	}

	// 주문서 등록
	@Override
	public int order_insert(AssembleDTO dto) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.order_insert(dto);
	}

	// 전표 등록
	@Override
	public int slip_insert() {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.slip_insert();
	}

	// 매입 매출 전표 등록
	@Override
	public int sales_slip_insert(Map<String,Object> map) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.sales_slip_insert(map);
	}

	// 입하 요청
	@Override
	public int inbound_insert(Map<String,Object> map) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.inbound_insert(map);
	}
	
	// 주문서 목록
	@Override
	public List<AssembleDTO> order_list() {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.order_list();
	}

	@Override
	public int slip_update(String id) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.slip_update(id);
	}

	@Override
	public int sales_slip_update(Map<String, Object> map) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.sales_slip_update(map);
	}

	@Override
	public List<AssembleDTO> warehouse_list() {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.warehouse_list();
	}

	@Override
	public int bank_insert_action(AssembleDTO dto) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.bank_insert_action(dto);
	}

	@Override
	public int request_update(String request_id) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.request_update(request_id);
	}

	// 거래처명 중복확인
	@Override
	public int client_check(String keyword) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.client_check(keyword);
	}

	@Override
	public int bank_check(String keyword) {
		SCDao dao = sqlSession.getMapper(SCDao.class);
		return dao.bank_check(keyword);
	}

   @Override
   public List<AssembleDTO> request_list(String client_id) {
      System.out.println("Dao - request_list 거래처 내역보기");
      
      SCDao dao = sqlSession.getMapper(SCDao.class);
      
      List<AssembleDTO> list = dao.request_list(client_id);
      return list;
   }
}
