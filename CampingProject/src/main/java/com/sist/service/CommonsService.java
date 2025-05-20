package com.sist.service;
import java.util.*;

import com.sist.vo.*;
public interface CommonsService {
	public List<ReviewVO> commonsReviewList(Map map);
	public int commonsReviewCount(Map map);
	public void commonsReviewInsert(ReviewVO vo);
	public void commonsReviewUpdate(ReviewVO vo);
	public void commonsReviewDelete(ReviewVO vo);
}
