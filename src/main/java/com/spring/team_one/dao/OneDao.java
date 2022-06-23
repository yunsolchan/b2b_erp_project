package com.spring.team_one.dao;

import com.spring.team_one.dto.OneDto;

//테스트 Dao 인터페이스
public interface OneDao {

	// 암호화된 회원추가 처리
	public int addAccount(OneDto dto);
}
