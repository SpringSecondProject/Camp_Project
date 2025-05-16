package com.sist.service;

import java.util.*;

import com.sist.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewListData(Map map);
	public int reviewTotalPage(int no,int type);
	public void reviewInsert(ReviewVO vo);
	public void reviewUpdate(String msg,int no);
	public void reviewReplyReplyInsert(int pno,ReviewVO vo);
	public void reviewDelete(int no);
}
