package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class ReviewDAO {
	@Autowired
	private ReviewMapper mapper;
	
	public List<ReviewVO> reviewListData(Map map)
	{
		return mapper.reviewListData(map);
	}
	public int reviewTotalPage(Map map)
	{
		return mapper.reviewTotalPage(map);
	}
	public void reviewInsert(ReviewVO vo)
	{
		mapper.reviewInsert(vo);
	}
	public void reviewUpdate(String msg,int rno)
	{
		mapper.reviewUpdate(msg, rno);
	}
	@Transactional
	public void reviewReplyReplyInsert(int pno,ReviewVO vo)
	{
		ReviewVO pvo=mapper.reviewParentInfoData(pno);
		mapper.reviewGroupStepIncrement(pvo);
		vo.setGroup_id(pvo.getGroup_id());
		vo.setGroup_step(pvo.getGroup_step()+1);
		mapper.reviewReplyReplyInsert(vo);
	}
	public void reviewDelete(int rno)
	{
		ReviewVO vo=mapper.reviewParentInfoData(rno);
		Map map=new HashMap();
		map.put("rno", rno);
		map.put("group_id", vo.getGroup_id());
		map.put("group_step", vo.getGroup_step());
		
		mapper.reviewDelete(map);
	}
}
