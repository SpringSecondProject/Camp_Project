package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import com.sist.vo.*;
import java.util.*;

@Repository
public class CamplistDAO {
	@Autowired
	private CamplistMapper mapper;
	
	public List<CampVO> campListData(Map map){
		return mapper.campListData(map);
	}
	
	public int campTotalPage() {
		return mapper.campTotalPage();
	}
	public List<CampVO> campFilter(Map map){
		return mapper.campFilter(map);
	}
	public int campFilterTotalPage(Map map) {
		return mapper.campFilterTotalPage(map);
	}
	public List<CampVO> campLocationCount(){
		return mapper.campLocationCount();
	}
	public List<String> campIndutyList(){
		return mapper.campIndutyList();
	}
	public List<String> campLctclList(){
		return mapper.campLctclList();
	}
	
	// Aspect 조회수 증가
	public void HitIncrement(int cno) {
		mapper.HitIncrement(cno);
	}
	// 쿠키용 조회
	public CampVO CampCookie(int cno) {
		return mapper.CampCookie(cno);
	}
}
