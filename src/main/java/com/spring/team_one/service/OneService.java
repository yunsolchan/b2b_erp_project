package com.spring.team_one.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

// 테스트 Service 인터페이스
public interface OneService {

	// 암호화된 계정 추가
	public void addAccount(MultipartHttpServletRequest req, Model model);
}
