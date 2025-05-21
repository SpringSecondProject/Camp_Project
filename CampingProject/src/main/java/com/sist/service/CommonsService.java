package com.sist.service;
import java.util.*;

import com.sist.vo.*;
public interface CommonsService {
	public List<ReviewVO> commonsReviewList(Map map);
	public int commonsReviewCount(Map map);
	public void commonsReviewInsert(ReviewVO vo);
	public void commonsReviewUpdate(ReviewVO vo);
	public void commonsReviewDelete(ReviewVO vo);
	// 마이페이지 - 리뷰 조회
	public List<ReviewVO> myReviewList(Map map);
	public int myReviewCount(Map map);
}
