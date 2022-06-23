package com.spring.team_one.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.team_one.dto.OneDto;

//테스트 Dao
@Repository
public class OneDaoImpl implements OneDao{

	@Autowired
	SqlSession sqlSession;

	@Override
	public int addAccount(OneDto dto) {
		System.out.println(dto);
		OneDao dao = sqlSession.getMapper(OneDao.class);
		return dao.addAccount(dto);
	}
}
