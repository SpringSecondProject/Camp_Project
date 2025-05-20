package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sist.vo.CampVO;


public interface CamplistService {
	public List<CampVO> campListData(Map map);
	public int campTotalPage();
	public List<CampVO> campFilter(Map map); 
	public int campFilterTotalPage(Map map);
	public List<CampVO> campLocationCount();
	public List<String> campIndutyList();
	public List<String> campLctclList();
	public void HitIncrement(int cno);
	public CampVO CampCookie(int cno); //쿠키용
	public List<CampVO> campMainList();// 메인 12개 조회수순
	public CampVO CampCctv(int cno); // CCtv용도
}
