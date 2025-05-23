package com.sist.service;
import com.sist.mapper.BoardMapper;
import com.sist.vo.BoardVO;
import java.util.*;

public interface BoardService {
	public List<BoardVO> getNoticeList(int start,int end);
	public int BOARDTotalPage();
	public BoardVO getNoticeDetail(int bno);
	public void insertNotice(BoardVO vo);
	public void updateNotice(BoardVO vo);
	public void deleteNotice(int bno);
	public void hitIncrement(int bno);
	public List<BoardVO> mainNoticeList();
}
