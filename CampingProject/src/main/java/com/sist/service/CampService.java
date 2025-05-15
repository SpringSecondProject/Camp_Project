package com.sist.service;
import java.util.*;

import com.sist.vo.*;
public interface CampService {
	public String campGetTitle(int cno);
	public CampVO campDetailData(int cno);
	public List<SiteVO> siteListData(int cno);
	public List<Integer> reserveListData(ReserveVO vo);
	public ReserveVO reserveDetailData(int rno);
	// 예약
	public Map reserveInsert(ReserveVO vo);
	public int reserveFindNewRno(String id);
	// 마이페이지-예약목록 출력
	public List<ReserveVO> myReserveListData(Map map);
	public int myReserveTotalPage(String id);
	// 마이페이지-예약 취소
	public String reserveCancel(int rno);
	// 마이페이지-예약 확정
	public String reserveConfirmedState(int rno);
}
