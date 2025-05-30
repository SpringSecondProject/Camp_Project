package com.sist.service;

import java.util.*;

import com.sist.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewListData(Map map);
	public int reviewTotalPage(Map map);
	public void reviewInsert(ReviewVO vo);
	public void reviewUpdate(String msg,int rno);
	public void reviewReplyReplyInsert(int pno,ReviewVO vo);
	public void reviewDelete(int rno);
}
