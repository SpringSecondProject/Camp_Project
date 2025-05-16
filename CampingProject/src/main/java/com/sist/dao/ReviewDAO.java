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
	public int reviewTotalPage(int no,int type)
	{
		return mapper.reviewTotalPage(no, type);
	}
	public void reviewInsert(ReviewVO vo)
	{
		mapper.reviewInsert(vo);
	}
	public void reviewUpdate(String msg,int no)
	{
		mapper.reviewUpdate(msg, no);
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
	public void reviewDelete(int no)
	{
		ReviewVO vo=mapper.reviewParentInfoData(no);
		Map map=new HashMap();
		map.put("no", no);
		map.put("group_id", vo.getGroup_id());
		map.put("group_step", vo.getGroup_step());
		
		mapper.reviewDelete(map);
	}
}
