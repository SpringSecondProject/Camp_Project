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
	public List<ReviewVO> commonsReviewList(Map map){
		return cDao.commonsReviewList(map);
	}
	public int commonsReviewCount(Map map) {
		return cDao.commonsReviewCount(map);
	}
	public void commonsReviewInsert(ReviewVO vo) {
		cDao.commonsReviewInsert(vo);
	}
	public void commonsReviewUpdate(ReviewVO vo) {
		cDao.commonsReviewUpdate(vo);
	}
	public void commonsReviewDelete(Map map) {
		cDao.commonsReviewDelete(map);
	}
}
