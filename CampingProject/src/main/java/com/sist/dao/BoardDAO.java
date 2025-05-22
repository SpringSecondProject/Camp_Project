package com.sist.dao;
import com.sist.vo.BoardVO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BoardMapper;

@Repository
public class BoardDAO {
	@Autowired
	private BoardMapper mapper;
	
	public List<BoardVO> getNoticeList(int start,int end)
	{
		return mapper.getNoticeList(start,end);
	}

	public int BOARDTotalPage()
	{
		return mapper.BOARDTotalPage();
	}
	public BoardVO getNoticeDetail(int bno)
	{
		return mapper.getNoticeDetail(bno);
	}
	
	public void insertNotice(BoardVO vo)
	{
		mapper.insertNotice(vo);
	}
	
	public void updateNotice(BoardVO vo)
	{
		mapper.updateNotice(vo);
	}
	
	public void deleteNotice(int bno)
	{
		mapper.deleteNotice(bno);
	}
	
	public void hitIncrement(int bno)
	{
		mapper.hitIncrement(bno);
	}
}
