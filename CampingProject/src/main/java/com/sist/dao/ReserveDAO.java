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
	public int reserveFindNewRno(String id) {
		return mapper.reserveFindNewRno(id);
	}
	public int siteFindSno(ReserveVO vo) {
		return mapper.siteFindSno(vo);
	}
	public int reserveCheck(ReserveDetailVO vo) {
		return mapper.reserveCheck(vo);
	}
	public ReserveVO reserveDetailData(int rno) {
		return mapper.reserveDetailData(rno);
	}
	public void reserveDetailInsert(ReserveDetailVO vo) {
		mapper.reserveDetailInsert(vo);
	}
	public List<ReserveVO> myReserveListData(Map map) {
		return mapper.myReserveListData(map);
	}
	public int myReserveTotalPage(String id) {
		return mapper.myReserveTotalPage(id);
	}
	public void reserveDetailDelete(int rno) {
		mapper.reserveDetailDelete(rno);
	}
	public void reserveCancelState(int rno) {
		mapper.reserveCancelState(rno);
	}
	public void reserveConfirmedState(int rno) {
		mapper.reserveConfirmedState(rno);
	}
	public String reserveGetId(int rno) {
		return mapper.reserveGetId(rno);
	}
	public List<ReserveVO> reserveConfirmedList(){
		return mapper.reserveConfirmedList();
	}
}
