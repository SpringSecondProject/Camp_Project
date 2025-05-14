package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;
@Repository
public class ReserveDAO {
	@Autowired
	private ReserveMapper mapper;
	
	public List<SiteVO> siteListData(int cno){
		return mapper.siteListData(cno);
	}
	public List<Integer> reserveListData(ReserveVO vo) {
		return mapper.reserveListData(vo);
	}
	public void reserveInsert(ReserveVO vo) {
		mapper.reserveInsert(vo);
	}
	public int reserveFindRno(String id) {
		return mapper.reserveFindRno(id);
	}
	public int siteFindSno(ReserveVO vo) {
		return mapper.siteFindSno(vo);
	}
	public int reserveCheck(ReserveDetailVO vo) {
		return mapper.reserveCheck(vo);
	}
	public ReserveVO reserveDetailData(int rno) {
		ReserveVO vo=new ReserveVO();
		try {
			vo= mapper.reserveDetailData(rno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	public void reserveDetailInsert(ReserveDetailVO vo) {
		mapper.reserveDetailInsert(vo);
	}
}
