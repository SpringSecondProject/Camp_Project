package com.sist.service;
import com.sist.vo.BoardVO;
import com.sist.dao.BoardDAO;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO bDao;

	@Override
	public List<BoardVO> getNoticeList(int start,int end) {
		// TODO Auto-generated method stub
		return bDao.getNoticeList(start,end);
	}

	@Override
	public int BOARDTotalPage() {
		// TODO Auto-generated method stub
		return bDao.BOARDTotalPage();
	}
	
	@Override
	public BoardVO getNoticeDetail(int bno) {
		// TODO Auto-generated method stub
		return bDao.getNoticeDetail(bno);
	}

	@Override
	public void insertNotice(BoardVO vo) {
		// TODO Auto-generated method stub
		bDao.insertNotice(vo);
	}

	@Override
	public void updateNotice(BoardVO vo) {
		// TODO Auto-generated method stub
		bDao.updateNotice(vo);
	}

	@Override
	public void deleteNotice(int bno) {
		// TODO Auto-generated method stub
		bDao.deleteNotice(bno);
	}

	@Override
	public void hitIncrement(int bno) {
		// TODO Auto-generated method stub
		bDao.hitIncrement(bno);
	}
}
