package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Service
public class CommonsServiceImpl implements CommonsService{
	@Autowired
	private CommonsDAO cDao;
	@Override
	public List<ReviewVO> commonsReviewList(Map map){
		return cDao.commonsReviewList(map);
	}
	@Override
	public int commonsReviewCount(Map map) {
		return cDao.commonsReviewCount(map);
	}
	@Override
	public void commonsReviewInsert(ReviewVO vo) {
		if(vo.getGroup_step()==1) {
			cDao.commonsReviewGroupStepIncrement(vo);
		}
		cDao.commonsReviewInsert(vo);
	}
	@Override
	public void commonsReviewUpdate(ReviewVO vo) {
		cDao.commonsReviewUpdate(vo);
	}
	@Override
	public void commonsReviewDelete(ReviewVO vo) {
		cDao.commonsReviewDelete(vo);
	}
	// 마이페이지 - 리뷰 조회
	@Override
	public List<ReviewVO> myReviewList(Map map) {
		return cDao.myReviewList(map);
	}
	@Override
	public int myReviewCount(Map map) {
		return cDao.myReviewCount(map);
	}
}
