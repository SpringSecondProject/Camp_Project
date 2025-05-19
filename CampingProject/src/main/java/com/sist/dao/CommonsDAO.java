package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class CommonsDAO {
	@Autowired
	private CommonsMapper mapper;
	public List<ReviewVO> commonsReviewList(Map map){
		return mapper.commonsReviewList(map);
	}
	public int commonsReviewCount(Map map) {
		return mapper.commonsReviewCount(map);
	}
	public void commonsReviewInsert(ReviewVO vo) {
		mapper.commonsReviewInsert(vo);
	}
	public void commonsReviewUpdate(ReviewVO vo) {
		mapper.commonsReviewUpdate(vo);
	}
	public void commonsReviewDelete(Map map) {
		mapper.commonsReviewDelete(map);
	}
}
