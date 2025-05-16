package com.sist.service;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.*;
import com.sist.dao.*;
@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO wDao;

	@Override
	public List<ReviewVO> reviewListData(Map map) {
		// TODO Auto-generated method stub
		return wDao.reviewListData(map);
	}

	@Override
	public int reviewTotalPage(int no, int type) {
		// TODO Auto-generated method stub
		return wDao.reviewTotalPage(no, type);
	}

	@Override
	public void reviewInsert(ReviewVO vo) {
		// TODO Auto-generated method stub
		wDao.reviewInsert(vo);
	}
	/*
	 * 	Spring
	 * 	1. Container : 클래스 관리자
	 *  2. DI => 클래스와 클래스의 연관 관계 설정
	 *  		 의존성이 낮은 프로그램
	 *  		 => 인터페이스
	 *  3. AOP => 공통모듈
	 *  4. ORM => 데이터베이스 관련 라이브러리
	 *  		  MyBatis / JPA
	 *  5. MVC 동작 과정
	 *  6. Spring Security : 권한 / 로그인 
	 *  7. RestFul
	 *  =======================================
	 */
	@Override
	public void reviewUpdate(String msg, int no) {
		// TODO Auto-generated method stub
		wDao.reviewUpdate(msg, no);
	}

	@Override
	public void reviewReplyReplyInsert(int pno, ReviewVO vo) {
		// TODO Auto-generated method stub
		wDao.reviewReplyReplyInsert(pno, vo);
	}

	@Override
	public void reviewDelete(int no) {
		// TODO Auto-generated method stub
		wDao.reviewDelete(no);
	}
}
