package com.spring.team_one.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.team_one.dto.AssembleDTO;

@Repository
public class JHDaoImpl implements JHDao {
	
	@Autowired
	SqlSession sqlSession;
	
	// --------------- 거래처 ---------------
	
	// 거래처 조회
	@Override
	public List<AssembleDTO> client_list(Map<String, Object> map) {
		System.out.println("Dao - client_list 거래처 조회");

		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		List<AssembleDTO> list = dao.client_list(map);
		return list;
	}
	
	// 거래처명 중복확인
	@Override
	public int client_check(String keyword) {
		System.out.println("Dao - client_check 거래처명 중복확인");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
	    return dao.client_check(keyword);
	}

	// 계좌번호 중복확인
	@Override
	public int bank_check(String keyword) {
		
		System.out.println("Dao - bank_check 계좌번호 중복확인");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
	    
		return dao.bank_check(keyword);
	}	

	// 거래처 등록 액션
	@Override
	public int client_insert_action(AssembleDTO dto) {
		System.out.println("Dao - client_insert_action 거래처 등록 액션");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int insertCnt = dao.client_insert_action(dto);
		return insertCnt;
	}
	
	// 계좌 등록 액션
	@Override
	public int bank_insert_action(Map<String, Object> map) {
		System.out.println("Dao - bank_insert_action 계좌 등록 액션");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int insertCnt = dao.bank_insert_action(map);
		return insertCnt;
	}	
	
	// 거래처 상세
	@Override
	public AssembleDTO client_detail(String client_id) {
		System.out.println("Dao - client_detail 거래처 상세");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		AssembleDTO dto = dao.client_detail(client_id);
		return dto;
	}
	
	// 거래처 내역보기
	@Override
	public List<AssembleDTO> request_list(String client_id) {
		System.out.println("Dao - request_list 거래처 내역보기");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		List<AssembleDTO> list = dao.request_list(client_id);
		return list;
	}	
	
	// 거래처 수정
	@Override
	public int client_update(AssembleDTO dto) {
		System.out.println("Dao - client_update 거래처 수정");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int updateCnt = dao.client_update(dto);
		return updateCnt;
	}

	// 거래처 수정 액션
	@Override
	public int client_update_action(AssembleDTO dto) {
		System.out.println("Dao - client_update_action 거래처 수정 액션 ");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int updateCnt = dao.client_update_action(dto);
		return updateCnt;
	}
	
	// 거래처 삭제
	@Override
	public int client_delete(String client_id) {
		System.out.println("Dao-client_delete-거래처 삭제");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);

		int deleteCnt = dao.client_delete(client_id);
		return deleteCnt;
	}

	// --------------- 견적서 ---------------
	
	// 견적서 조회
	@Override
	public List<AssembleDTO> estimate_list(Map<String, Object> map) {
		System.out.println("Dao - estimate_list 견적서 조회");

		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		List<AssembleDTO> list = dao.estimate_list(map);
		return list;		
	}
	
	// 견적서 등록
	@Override
	public AssembleDTO estimate_insert(String employee_id) {
		System.out.println("Dao - estimate_insert 견적서 등록");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		AssembleDTO dto = dao.estimate_insert(employee_id);
		return dto;
	}
	
	// 거래처 상품 목록
	@Override
	public List<AssembleDTO> client_product_list(String client_id) {
		System.out.println("Dao - client_product_list 거래처 상품 목록");

		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		List<AssembleDTO> list = dao.client_product_list(client_id);
		return list;
	}	
	
	// 상품 목록
	@Override
	public List<AssembleDTO> product_list(Map<String, Object> map) {
		System.out.println("Dao - product_list 상품 목록");

		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		List<AssembleDTO> list = dao.product_list(map);
		return list;	
	}
	
	// 견적서 등록 액션
	@Override
	public int estimate_insert_action(AssembleDTO dto) {
		System.out.println("Dao - estimate_insert_action 견적서 등록 액션");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int insertCnt = dao.estimate_insert_action(dto);
		return insertCnt;
	}
	
	// 견적서 디테일 등록 액션
	@Override
	public int request_detail_insert_action(Map<String, Object> map) {
		System.out.println("Dao - request_detail_insert_action 견적서 디테일 등록 액션");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int insertCnt = dao.request_detail_insert_action(map);
		return insertCnt;
	}
	
	// 상품 판매가 수정
	@Override
	public int product_update(Map<String, Object> map) {
		System.out.println("Dao - product_update 상품 판매가 수정");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int updateCnt = dao.product_update(map);
		return updateCnt;
	}
	
	// 주문서 등록 액션
	@Override
	public int order_insert_action(AssembleDTO dto) {
		System.out.println("Dao - order_insert_action 주문서 등록 액션");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int insertCnt = dao.order_insert_action(dto);
		return insertCnt;
	}
	
	// 일반전표
	@Override
	public int slip_insert_action() {
		System.out.println("Dao - slip_insert_action 일반전표 등록 액션");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int insertCnt = dao.slip_insert_action();
		return insertCnt;
	}

	// 매입/매출 전표
	@Override
	public int sales_slip_insert_action(Map<String, Object> map) {
		System.out.println("Dao - sales_slip_insert_action 매입/매출 등록 액션");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int insertCnt = dao.sales_slip_insert_action(map);
		return insertCnt;
	}	

	// 견적서 상세
	@Override
	public AssembleDTO request_detail(String request_id) {
		System.out.println("Dao - request_detail 견적서 상세");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		AssembleDTO dto = dao.request_detail(request_id);
		return dto;
	}

	// 견적서 상세 상품
	@Override
	public List<AssembleDTO> request_product(String request_id) {
		System.out.println("Dao - request_product 견적서 상세 상품");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		List<AssembleDTO> list = dao.request_product(request_id);
		return list;
	}

	// --------------- 주문서 ---------------
	
	// 주문서 조회
	@Override
	public List<AssembleDTO> order_list(Map<String, Object> map) {
		System.out.println("Dao - order_list 주문서 조회");

		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		List<AssembleDTO> list = dao.order_list(map);
		return list;	
	}
	
	// 전표 승인
	@Override
	public int slip_update(String request_id) {
		System.out.println("Dao - slip_update 전표 승인");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int updateCnt = dao.slip_update(request_id);
		return updateCnt;
	}

	// 적요 추가
	@Override
	public int sales_slip_update(Map<String, Object> map) {
		System.out.println("Dao - sales_slip_update 적요 추가");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int updateCnt = dao.sales_slip_update(map);
		return updateCnt;
	}

	// 창고 목록
	@Override
	public AssembleDTO warehouse_list(int product_id) {
		System.out.println("Dao - warehouse_list 창고 목록");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		AssembleDTO list = dao.warehouse_list(product_id);
		return list;	
	}

	// 주문서 출고 요청
	@Override
	public int request_update(String request_id) {
		System.out.println("Dao - request_update 주문서 출고 요청");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int updateCnt = dao.request_update(request_id);
		return updateCnt;
	}

	// 출고 대기
	@Override
	public int outbound_insert(Map<String, Object> map) {
		System.out.println("Dao - outbound_insert 출고 대기");
		
		JHDao dao = sqlSession.getMapper(JHDao.class);
		
		int insertCnt = dao.outbound_insert(map);
		return insertCnt;
	}

}
